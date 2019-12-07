import 'package:dadguide2/components/formatting.dart';
import 'package:dadguide2/data/data_objects.dart';
import 'package:dadguide2/data/tables.dart';
import 'package:dadguide2/proto/enemy_skills/enemy_skills.pb.dart';
import 'package:dadguide2/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

String convertGroup(BehaviorGroup_GroupType groupType, Condition cond) {
  switch (groupType) {
    case BehaviorGroup_GroupType.DEATH:
      return 'On Death';
    case BehaviorGroup_GroupType.DISPEL_PLAYER:
      return 'When player has buff';
    case BehaviorGroup_GroupType.MONSTER_STATUS:
      return 'When monster delayed/poisoned';
    case BehaviorGroup_GroupType.PASSIVE:
      return 'Base abilities';
    case BehaviorGroup_GroupType.PREEMPT:
      return 'Preemptive';
    case BehaviorGroup_GroupType.REMAINING:
      return 'When ${cond.triggerEnemiesRemaining} enemies remain';
    case BehaviorGroup_GroupType.STANDARD:
      return 'Standard';
  }
  return 'Unknown';
}

String formatCondition(Condition cond) {
  var parts = <String>[];

  if (![0, 100].contains(cond.useChance)) {
    parts.add('${cond.useChance}% chance');
  }

  if (cond.hasRepeatsEvery()) {
    if (cond.hasTriggerTurn()) {
      parts.add('Execute repeatedly, turn ${cond.triggerTurn} of ${cond.repeatsEvery}');
    } else {
      parts.add('Repeats every ${cond.repeatsEvery} turns');
    }
  } else if (cond.hasTriggerTurnEnd()) {
    parts.add('Turns ${cond.triggerTurn}-${cond.triggerTurnEnd}');
  } else if (cond.hasTriggerTurn()) {
    parts.add('Turn ${cond.triggerTurn}');
  }

  if (cond.globalOneTime) {
    parts.add('One time only');
  }

  if (cond.hasTriggerEnemiesRemaining()) {
    parts.add('When ${cond.triggerEnemiesRemaining} enemies remain');
  }

  if (cond.ifDefeated) {
    parts.add('When defeated');
  }

  if (cond.ifAttributesAvailable) {
    parts.add('When required attributes on board');
  }

  if (cond.triggerMonsters.isNotEmpty) {
    var monsterStr = cond.triggerMonsters.map((m) => m.toString()).join(', ');
    parts.add('When [$monsterStr] on team');
  }

  if (cond.hasTriggerCombos()) {
    parts.add('When ${cond.triggerCombos} combos last turn');
  }

  if (cond.ifNothingMatched) {
    parts.add('If no other skills matched');
  }

  if (cond.hpThreshold == 101) {
    parts.add('When HP is full');
  } else if (cond.hpThreshold > 0) {
    parts.add('HP <= ${cond.hpThreshold}');
  }

  return parts.join(', ');
}

String formatAttack(EnemySkill skill, Encounter encounter, SubDungeon subDungeon) {
  var atk = encounter.atk * subDungeon.atkMult;
  var damage = skill.atkMult * atk / 100;
  var minDamage = (damage * skill.minHits).round();
  var maxDamage = (damage * skill.maxHits).round();

  var hitsStr =
      skill.minHits == skill.maxHits ? '${skill.minHits}' : '${skill.minHits}-${skill.maxHits}';
  var damageStr = skill.minHits == skill.maxHits
      ? commaFormat(minDamage)
      : commaFormat(minDamage) + '-' + commaFormat(maxDamage);

  return 'Attack $hitsStr times for $damageStr damage';
}

/// Top-level container for monster behavior. Displays a red warning sign if monster data has not
/// been reviewed yet, then a list of BehaviorGroups.
///
/// TODO: Top level groups should probably be encased in an outline with the group type called out.
/// TODO: Make the warning link to an explanation.
class EncounterBehavior extends StatelessWidget {
  final bool approved;
  final List<BehaviorGroup> groups;

  EncounterBehavior(this.approved, this.groups);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!approved)
            Container(
              padding: EdgeInsets.all(4),
              decoration: ShapeDecoration(
                color: Colors.red,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(
                  'Monster data has not been reviewed and approved yet. Rely on this at your own risk.'),
            ),
          for (var group in groups) BehaviorGroupWidget(true, group),
        ],
      ),
    );
  }
}

/// A group of behavior, containing a list of child groups or individual behaviors.
class BehaviorGroupWidget extends StatelessWidget {
  final bool forceType;
  final BehaviorGroup group;

  BehaviorGroupWidget(this.forceType, this.group);

  @override
  Widget build(BuildContext context) {
    var contents = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var child in group.children)
          Padding(padding: EdgeInsets.only(left: 4, right: 4), child: BehaviorItemWidget(child)),
      ],
    );

    var showType = forceType ||
        [BehaviorGroup_GroupType.MONSTER_STATUS, BehaviorGroup_GroupType.DISPEL_PLAYER]
            .contains(group.groupType);
    var conditionText = formatCondition(group.condition);

    if (showType) {
      return TextBorder(text: convertGroup(group.groupType, group.condition), child: contents);
    } else if (conditionText.isNotEmpty) {
      return TextBorder(text: conditionText, child: contents);
    } else {
      return contents;
    }
  }
}

/// An individual child, containing either a nested group or a single behavior.
class BehaviorItemWidget extends StatelessWidget {
  final BehaviorItem child;

  BehaviorItemWidget(this.child);

  @override
  Widget build(BuildContext context) {
    if (child.hasGroup()) {
      return BehaviorGroupWidget(false, child.group);
    } else {
      return BehaviorWidget(child.behavior);
    }
  }
}

/// An individual behavior.
class BehaviorWidget extends StatelessWidget {
  final Behavior behavior;

  BehaviorWidget(this.behavior);

  @override
  Widget build(BuildContext context) {
    var dungeon = Provider.of<FullDungeon>(context);
    var subDungeon = dungeon.selectedSubDungeon;
    var library = subDungeon.esLibrary;
    var encounter = Provider.of<FullEncounter>(context);
    var skill = library[behavior.enemySkillId];

    var descText = skill.descNa;
    var conditionText = formatCondition(behavior.condition);
    if (conditionText.isNotEmpty) {
      descText = '$descText ($conditionText)';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(skill.nameNa, style: subtitle(context)),
        if (descText.isNotEmpty) Text(descText, style: secondary(context)),
        if (skill.minHits > 0)
          Text(formatAttack(skill, encounter.encounter, subDungeon.subDungeon),
              style: secondary(context)),
      ],
    );
  }
}

class TextBorder extends StatelessWidget {
  final String text;
  final Widget child;

  const TextBorder({@required this.text, @required this.child, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          child: child,
          // This margin forces the border down so the text can overlay it.
          margin: EdgeInsets.only(top: 10),
          // Force the contents down so the title doesn't overlap it. Pad the bottom by the same
          // amount to make it symmetric.
          padding: EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor.withOpacity(.4), width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        Positioned(
            left: 20,
            top: 0,
            child: Container(
              // This padding enforces a slight gap left and right of the text
              padding: EdgeInsets.only(left: 10, right: 10),
              // Make the text container hide the border.
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Text(text),
            )),
      ],
    );
  }
}