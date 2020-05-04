// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(floor) => "Floor ${floor}";

  static m1(floors) => "Floors: ${floors}";

  static m2(coinPerStam) => "Coin/Stam:${coinPerStam}";

  static m3(expPerStam) => "Exp/Stam:${expPerStam}";

  static m4(stamina) => "Stamina: ${stamina}";

  static m5(hits, damage) => "Attack ${hits} times for ${damage} damage";

  static m6(turnText) => "always on ${turnText}";

  static m7(threshold) => "HP < ${threshold}";

  static m8(threshold) => "HP <= ${threshold}";

  static m9(number) => "At most ${number} times";

  static m10(number) => "When <=${number} enemies";

  static m11(total) => "Repeats every ${total} turns";

  static m12(start, total) => "Repeating, turns ${start} of ${total}";

  static m13(start, end, total) => "Repeating, turns ${start}-${end} of ${total}";

  static m14(skillName) => "Always use after ${skillName}";

  static m15(number) => "When ${number} combos last turn";

  static m16(monsters) => "When [${monsters}] on team";

  static m17(start) => "turn ${start}";

  static m18(start, end) => "turns ${start}-${end}";

  static m19(number) => "${number}% chance";

  static m20(turnText, alwaysTriggerAbove) => "${turnText} while above ${alwaysTriggerAbove} HP";

  static m21(days) => "${days} Days";

  static m22(requiredCount) => "${requiredCount} of";

  static m23(requiredCount) => "Requires ${requiredCount} for trade";

  static m24(compareRarity) => "Stats (vs > ${compareRarity}⭐)";

  static m25(number) => "Cost ${number}";

  static m26(number) => "ATK ${number}";

  static m27(number) => "HP ${number}";

  static m28(number) => "RCV ${number}";

  static m29(date) => "[${date}] Added";

  static m30(number) => "No. ${number}";

  static m31(seriesName) => "Series - ${seriesName}";

  static m32(max) => "Lv.MAX Turn : ${max}";

  static m33(max, min, levels) => "Lv.1 Turn : ${max} (Lv.${levels} Turn: ${min})";

  static m34(number) => "ATK ${number}";

  static m35(number) => "HP ${number}";

  static m36(number) => "Lv. ${number}";

  static m37(number) => "Limit Break: ${number}%";

  static m38(number) => "MP ${number}";

  static m39(number) => "No. ${number}";

  static m40(number) => "RCV ${number}";

  static m41(number) => "WT ${number}";

  static m42(mp, mpPerStam) => "${mp} (${mpPerStam} / Stamina)";

  static m43(index, taskCount) => "Executing task (${index}/${taskCount})";

  static m44(index, taskCount) => "Task ${index} of ${taskCount} failed";

  static m45(percent) => "${percent}%";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "avg" : MessageLookupByLibrary.simpleMessage("Avg"),
    "avgPerStam" : MessageLookupByLibrary.simpleMessage("Avg/Stam"),
    "battleCommon" : MessageLookupByLibrary.simpleMessage("Common Monsters"),
    "battleDrop" : MessageLookupByLibrary.simpleMessage("Drop"),
    "battleFloor" : m0,
    "battleInvades" : MessageLookupByLibrary.simpleMessage("Invades"),
    "changelogButton" : MessageLookupByLibrary.simpleMessage("Continue"),
    "changelogTitle" : MessageLookupByLibrary.simpleMessage("What\'s New"),
    "close" : MessageLookupByLibrary.simpleMessage("Close"),
    "coin" : MessageLookupByLibrary.simpleMessage("Coins"),
    "countryJp" : MessageLookupByLibrary.simpleMessage("Japan"),
    "countryKr" : MessageLookupByLibrary.simpleMessage("Korea"),
    "countryNa" : MessageLookupByLibrary.simpleMessage("North America"),
    "dataSync" : MessageLookupByLibrary.simpleMessage("Data Sync"),
    "dungeonFloors" : m1,
    "dungeonListCoinPerStam" : m2,
    "dungeonListExpPerStam" : m3,
    "dungeonSearchHint" : MessageLookupByLibrary.simpleMessage("Search: Dungeon name"),
    "dungeonStamina" : m4,
    "dungeonTabMultiRank" : MessageLookupByLibrary.simpleMessage("Multi/Rank"),
    "dungeonTabNormal" : MessageLookupByLibrary.simpleMessage("Normal"),
    "dungeonTabSpecial" : MessageLookupByLibrary.simpleMessage("Special"),
    "dungeonTabTechnical" : MessageLookupByLibrary.simpleMessage("Technical"),
    "eggMachineNoInfo" : MessageLookupByLibrary.simpleMessage("Rates and monsters only available after the machine opens"),
    "esAttackText" : m5,
    "esCondAlwaysOnTurn" : m6,
    "esCondAttributesAvailable" : MessageLookupByLibrary.simpleMessage("Requires specific attributes"),
    "esCondDefeated" : MessageLookupByLibrary.simpleMessage("When defeated"),
    "esCondHpFull" : MessageLookupByLibrary.simpleMessage("When HP is full"),
    "esCondHpLt" : m7,
    "esCondHpLtEq" : m8,
    "esCondLimitedExecution" : m9,
    "esCondMultipleEnemiesRemaining" : m10,
    "esCondNothingMatched" : MessageLookupByLibrary.simpleMessage("If no other skills matched"),
    "esCondOneEnemiesRemaining" : MessageLookupByLibrary.simpleMessage("When alone"),
    "esCondOneTimeOnly" : MessageLookupByLibrary.simpleMessage("One time only"),
    "esCondPartJoin" : MessageLookupByLibrary.simpleMessage(", "),
    "esCondRepeating1" : m11,
    "esCondRepeating2" : m12,
    "esCondRepeating3" : m13,
    "esCondTriggerAfter" : m14,
    "esCondTriggerCombos" : m15,
    "esCondTriggerMonsters" : m16,
    "esCondTurnsExact" : m17,
    "esCondTurnsRange" : m18,
    "esCondUseChance" : m19,
    "esCondWhileAboveHp" : m20,
    "esGroupAbilities" : MessageLookupByLibrary.simpleMessage("Abilities"),
    "esGroupEnemyDebuff" : MessageLookupByLibrary.simpleMessage("When monster delayed/poisoned"),
    "esGroupError" : MessageLookupByLibrary.simpleMessage("<error>"),
    "esGroupOnDeath" : MessageLookupByLibrary.simpleMessage("On death"),
    "esGroupPlayerBuff" : MessageLookupByLibrary.simpleMessage("When player has buff"),
    "esGroupPreemptive" : MessageLookupByLibrary.simpleMessage("Preemptive"),
    "esGroupStandard" : MessageLookupByLibrary.simpleMessage("Standard"),
    "esGroupUnknown" : MessageLookupByLibrary.simpleMessage("Unknown"),
    "esGroupUnknownUse" : MessageLookupByLibrary.simpleMessage("Unknown usage"),
    "esNotReviewedWarning" : MessageLookupByLibrary.simpleMessage("This monster\'s behavior not yet reviewed. Rely on it at your own risk."),
    "eventClosed" : MessageLookupByLibrary.simpleMessage("Closed"),
    "eventDays" : m21,
    "eventTabAll" : MessageLookupByLibrary.simpleMessage("All"),
    "eventTabGuerrilla" : MessageLookupByLibrary.simpleMessage("Guerrilla"),
    "eventTabNews" : MessageLookupByLibrary.simpleMessage("News"),
    "eventTabSpecial" : MessageLookupByLibrary.simpleMessage("Special"),
    "exampleYtVideos" : MessageLookupByLibrary.simpleMessage("Example team compositions and dungeon clears"),
    "exchangeNumberOf" : m22,
    "exchangeRequires" : m23,
    "exp" : MessageLookupByLibrary.simpleMessage("Exp"),
    "iapAdsRemoved" : MessageLookupByLibrary.simpleMessage("Ads removed"),
    "iapAdsRemovedSubtitle" : MessageLookupByLibrary.simpleMessage("Thanks for supporting DadGuide!"),
    "iapLaunchFailed" : MessageLookupByLibrary.simpleMessage("Failed to start purchase"),
    "iapSubtitle" : MessageLookupByLibrary.simpleMessage("Click below to purchase permanent ad removal"),
    "iapTitle" : MessageLookupByLibrary.simpleMessage("Purchases"),
    "languageEn" : MessageLookupByLibrary.simpleMessage("English"),
    "languageJa" : MessageLookupByLibrary.simpleMessage("Japanese"),
    "languageKo" : MessageLookupByLibrary.simpleMessage("Korean"),
    "max" : MessageLookupByLibrary.simpleMessage("Max"),
    "min" : MessageLookupByLibrary.simpleMessage("Min"),
    "monsterCompareActiveSectionTitle" : MessageLookupByLibrary.simpleMessage("Active Skill"),
    "monsterCompareAwokenSectionTitle" : MessageLookupByLibrary.simpleMessage("Awoken Skills"),
    "monsterCompareLeaderSectionTitle" : MessageLookupByLibrary.simpleMessage("Leader Skill"),
    "monsterCompareSelectLeft" : MessageLookupByLibrary.simpleMessage("Select left"),
    "monsterCompareSelectRight" : MessageLookupByLibrary.simpleMessage("Select right"),
    "monsterCompareStatsSectionTitle" : m24,
    "monsterCompareTitle" : MessageLookupByLibrary.simpleMessage("Compare Monster"),
    "monsterFilterModalActiveSkills" : MessageLookupByLibrary.simpleMessage("Active Skills"),
    "monsterFilterModalAwokens" : MessageLookupByLibrary.simpleMessage("Awoken Skills"),
    "monsterFilterModalClose" : MessageLookupByLibrary.simpleMessage("Close"),
    "monsterFilterModalCost" : MessageLookupByLibrary.simpleMessage("Cost"),
    "monsterFilterModalLeaderSkills" : MessageLookupByLibrary.simpleMessage("Leader Skills"),
    "monsterFilterModalMainAttr" : MessageLookupByLibrary.simpleMessage("Main Attr"),
    "monsterFilterModalRarity" : MessageLookupByLibrary.simpleMessage("Rarity"),
    "monsterFilterModalReset" : MessageLookupByLibrary.simpleMessage("Reset"),
    "monsterFilterModalSeries" : MessageLookupByLibrary.simpleMessage("Series"),
    "monsterFilterModalSubAttr" : MessageLookupByLibrary.simpleMessage("Sub Attr"),
    "monsterFilterModalTitle" : MessageLookupByLibrary.simpleMessage("Advanced Search"),
    "monsterFilterModalType" : MessageLookupByLibrary.simpleMessage("Type"),
    "monsterInfo297Awoken" : MessageLookupByLibrary.simpleMessage("+297 & fully awoken"),
    "monsterInfoActiveSkillTitle" : MessageLookupByLibrary.simpleMessage("Skill:"),
    "monsterInfoAtk" : MessageLookupByLibrary.simpleMessage("ATK"),
    "monsterInfoAvailableKillers" : MessageLookupByLibrary.simpleMessage("Available Killer Awoken"),
    "monsterInfoAwokenSkillSection" : MessageLookupByLibrary.simpleMessage("Awoken Skills"),
    "monsterInfoCost" : m25,
    "monsterInfoDropsTitle" : MessageLookupByLibrary.simpleMessage("Drop Dungeons"),
    "monsterInfoDropsTitleNone" : MessageLookupByLibrary.simpleMessage("Drop Dungeons: None"),
    "monsterInfoEvoDiffAtk" : m26,
    "monsterInfoEvoDiffHp" : m27,
    "monsterInfoEvoDiffRcv" : m28,
    "monsterInfoEvolution" : MessageLookupByLibrary.simpleMessage("Evolution"),
    "monsterInfoExp" : MessageLookupByLibrary.simpleMessage("EXP"),
    "monsterInfoHistoryAdded" : m29,
    "monsterInfoHistoryTitle" : MessageLookupByLibrary.simpleMessage("History"),
    "monsterInfoHp" : MessageLookupByLibrary.simpleMessage("HP"),
    "monsterInfoLeaderSkillTitle" : MessageLookupByLibrary.simpleMessage("Leader skill:"),
    "monsterInfoLevel" : MessageLookupByLibrary.simpleMessage("Lv."),
    "monsterInfoMaterialForHeader" : MessageLookupByLibrary.simpleMessage("Material for"),
    "monsterInfoNo" : m30,
    "monsterInfoNonReversableEvolution" : MessageLookupByLibrary.simpleMessage("Non-Reversable Evolution"),
    "monsterInfoRcv" : MessageLookupByLibrary.simpleMessage("RCV"),
    "monsterInfoReversableEvolution" : MessageLookupByLibrary.simpleMessage("Reversable Evolution"),
    "monsterInfoSeriesHeader" : m31,
    "monsterInfoShield" : MessageLookupByLibrary.simpleMessage("Reduce Dmg."),
    "monsterInfoSkillMaxed" : m32,
    "monsterInfoSkillTurns" : m33,
    "monsterInfoSkillupDungeonTitleNone" : MessageLookupByLibrary.simpleMessage("Skill Up - Dungeon: None"),
    "monsterInfoSkillupDungeonsTitle" : MessageLookupByLibrary.simpleMessage("Skill Up - Dungeon"),
    "monsterInfoSkillupTitle" : MessageLookupByLibrary.simpleMessage("Skill Up - Monster"),
    "monsterInfoStatBonus" : MessageLookupByLibrary.simpleMessage("Stat bonus when assisting (+297)"),
    "monsterInfoSuperAwokenSkillSection" : MessageLookupByLibrary.simpleMessage("Super Awoken Skills"),
    "monsterInfoTableBuyMp" : MessageLookupByLibrary.simpleMessage("Buy MP"),
    "monsterInfoTableFeedXp" : MessageLookupByLibrary.simpleMessage("Feed XP"),
    "monsterInfoTableFeedXpOnColor" : MessageLookupByLibrary.simpleMessage("Feed XP\n(on color)"),
    "monsterInfoTableInfoMaxLevel" : MessageLookupByLibrary.simpleMessage("At max level"),
    "monsterInfoTableSellGold" : MessageLookupByLibrary.simpleMessage("Sell Gold"),
    "monsterInfoTableSellMp" : MessageLookupByLibrary.simpleMessage("Sell MP"),
    "monsterInfoTransformationEvolution" : MessageLookupByLibrary.simpleMessage("Transformations"),
    "monsterInfoWeighted" : MessageLookupByLibrary.simpleMessage("Weighted"),
    "monsterListAtk" : m34,
    "monsterListHp" : m35,
    "monsterListLevel" : m36,
    "monsterListLimitBreak" : m37,
    "monsterListMp" : m38,
    "monsterListNo" : m39,
    "monsterListRcv" : m40,
    "monsterListWeighted" : m41,
    "monsterMediaImage" : MessageLookupByLibrary.simpleMessage("Image"),
    "monsterMediaJPVoice" : MessageLookupByLibrary.simpleMessage("JP Voice"),
    "monsterMediaNAVoice" : MessageLookupByLibrary.simpleMessage("NA Voice"),
    "monsterMediaOrbs" : MessageLookupByLibrary.simpleMessage("Orbs"),
    "monsterMediaVideo" : MessageLookupByLibrary.simpleMessage("Video"),
    "monsterMediaWarningBody" : MessageLookupByLibrary.simpleMessage("Animations are large (> 5MB). Viewing 10 animations takes more data than the rest of the app combined. If you are concerned about data usage, make sure you are on WiFi."),
    "monsterSortAsc" : MessageLookupByLibrary.simpleMessage("Ascending ▲"),
    "monsterSortDesc" : MessageLookupByLibrary.simpleMessage("Descending ▼"),
    "monsterSortModalTitle" : MessageLookupByLibrary.simpleMessage("Change Sort Order"),
    "monsterSortTypeAtk" : MessageLookupByLibrary.simpleMessage("ATK"),
    "monsterSortTypeAttr" : MessageLookupByLibrary.simpleMessage("Attribute"),
    "monsterSortTypeCost" : MessageLookupByLibrary.simpleMessage("Cost"),
    "monsterSortTypeHp" : MessageLookupByLibrary.simpleMessage("HP"),
    "monsterSortTypeLeaderSkillAttack" : MessageLookupByLibrary.simpleMessage("LS Atk"),
    "monsterSortTypeLeaderSkillHp" : MessageLookupByLibrary.simpleMessage("LS Hp"),
    "monsterSortTypeLeaderSkillRcv" : MessageLookupByLibrary.simpleMessage("LS Rcv"),
    "monsterSortTypeLeaderSkillShield" : MessageLookupByLibrary.simpleMessage("LS Shield"),
    "monsterSortTypeLimitBrokenWeighted" : MessageLookupByLibrary.simpleMessage("LB Total"),
    "monsterSortTypeMp" : MessageLookupByLibrary.simpleMessage("MP"),
    "monsterSortTypeNumber" : MessageLookupByLibrary.simpleMessage("No."),
    "monsterSortTypeRarity" : MessageLookupByLibrary.simpleMessage("Rarity"),
    "monsterSortTypeRcv" : MessageLookupByLibrary.simpleMessage("RCV"),
    "monsterSortTypeSkillTurn" : MessageLookupByLibrary.simpleMessage("Skill Turn"),
    "monsterSortTypeSubAttr" : MessageLookupByLibrary.simpleMessage("Sub Att."),
    "monsterSortTypeType" : MessageLookupByLibrary.simpleMessage("Type"),
    "monsterSortTypeWeighted" : MessageLookupByLibrary.simpleMessage("Total"),
    "mpAndMpPerStam" : m42,
    "noData" : MessageLookupByLibrary.simpleMessage("No Data"),
    "onboardingDisplayLanguage" : MessageLookupByLibrary.simpleMessage("Display Language"),
    "onboardingDisplayLanguageDesc" : MessageLookupByLibrary.simpleMessage("Applies to UI elements and PAD data"),
    "onboardingDownloadDb" : MessageLookupByLibrary.simpleMessage("Downloading initial data"),
    "onboardingDownloadImages" : MessageLookupByLibrary.simpleMessage("Downloading icon set"),
    "onboardingGameCountry" : MessageLookupByLibrary.simpleMessage("Game Country"),
    "onboardingGameCountryDesc" : MessageLookupByLibrary.simpleMessage("Sets your default events, news, and data alerts"),
    "onboardingTitle" : MessageLookupByLibrary.simpleMessage("First-launch setup"),
    "onboardingUnpackDb" : MessageLookupByLibrary.simpleMessage("Unpacking initial data"),
    "onboardingUnpackImages" : MessageLookupByLibrary.simpleMessage("Unpacking icon set"),
    "onboardingWaitingSubTitle" : MessageLookupByLibrary.simpleMessage("You can change these values later in the settings tab"),
    "onboardingWaitingTitle" : MessageLookupByLibrary.simpleMessage("While you\'re waiting..."),
    "reportBadInfo" : MessageLookupByLibrary.simpleMessage("Report incorrect information"),
    "screenshotFailed" : MessageLookupByLibrary.simpleMessage("Failed to save (access denied?)"),
    "screenshotFinished" : MessageLookupByLibrary.simpleMessage("Screenshot saved to gallery"),
    "serverModalTitle" : MessageLookupByLibrary.simpleMessage("Server"),
    "settingsAbout" : MessageLookupByLibrary.simpleMessage("About"),
    "settingsContactUs" : MessageLookupByLibrary.simpleMessage("Contact us"),
    "settingsCopyright" : MessageLookupByLibrary.simpleMessage("Copyright"),
    "settingsDarkMode" : MessageLookupByLibrary.simpleMessage("Dark Mode"),
    "settingsEventCountry" : MessageLookupByLibrary.simpleMessage("Event Country"),
    "settingsEventCountryDesc" : MessageLookupByLibrary.simpleMessage("Server to display guerrilla events for"),
    "settingsEventsHideClosed" : MessageLookupByLibrary.simpleMessage("Hide closed events"),
    "settingsEventsSection" : MessageLookupByLibrary.simpleMessage("Events"),
    "settingsEventsStarterBlue" : MessageLookupByLibrary.simpleMessage("Show blue starter"),
    "settingsEventsStarterGreen" : MessageLookupByLibrary.simpleMessage("Show green starter"),
    "settingsEventsStarterRed" : MessageLookupByLibrary.simpleMessage("Show red starter"),
    "settingsGameCountry" : MessageLookupByLibrary.simpleMessage("Game Country"),
    "settingsGameCountryDesc" : MessageLookupByLibrary.simpleMessage("Controls some other region-specific settings"),
    "settingsGeneralSection" : MessageLookupByLibrary.simpleMessage("General"),
    "settingsHideUnreleasedMonsters" : MessageLookupByLibrary.simpleMessage("Hide unreleased monsters"),
    "settingsHideUnreleasedMonstersDesc" : MessageLookupByLibrary.simpleMessage("Hides monsters that are not released for the selected Game Country"),
    "settingsInfoLanguage" : MessageLookupByLibrary.simpleMessage("Info Language"),
    "settingsInfoLanguageDesc" : MessageLookupByLibrary.simpleMessage("Used for monster/dungeon names, skill text, etc"),
    "settingsInfoSection" : MessageLookupByLibrary.simpleMessage("Info"),
    "settingsNotificationsDesc" : MessageLookupByLibrary.simpleMessage("Alert when a dungeon opens. Long-press on an event or dungeon to toggle tracking."),
    "settingsNotificationsEnabled" : MessageLookupByLibrary.simpleMessage("Enable alerts"),
    "settingsNotificationsSection" : MessageLookupByLibrary.simpleMessage("Notifications"),
    "settingsTitle" : MessageLookupByLibrary.simpleMessage("Settings"),
    "settingsUiLanguage" : MessageLookupByLibrary.simpleMessage("UI Langauge"),
    "settingsUiLanguageDesc" : MessageLookupByLibrary.simpleMessage("Overwrites your device locale"),
    "subDungeonSelectionTitle" : MessageLookupByLibrary.simpleMessage("Select Difficulty"),
    "tabDungeon" : MessageLookupByLibrary.simpleMessage("Dungeons"),
    "tabEvent" : MessageLookupByLibrary.simpleMessage("Events"),
    "tabMonster" : MessageLookupByLibrary.simpleMessage("Monsters"),
    "tabSetting" : MessageLookupByLibrary.simpleMessage("Settings"),
    "taskExecuting" : MessageLookupByLibrary.simpleMessage("Executing task"),
    "taskExecutingWithCount" : m43,
    "taskFailedWithCount" : m44,
    "taskFatalError" : MessageLookupByLibrary.simpleMessage("Fatal error occurred; try restarting the app"),
    "taskFinished" : MessageLookupByLibrary.simpleMessage("All tasks complete"),
    "taskProgress" : m45,
    "taskRestarting" : MessageLookupByLibrary.simpleMessage("Check your internet connection.\nAutomatically restarting"),
    "taskWaiting" : MessageLookupByLibrary.simpleMessage("Waiting to start tasks"),
    "title" : MessageLookupByLibrary.simpleMessage("DadGuide"),
    "trackingPopupStartTrackingText" : MessageLookupByLibrary.simpleMessage("Alert when dungeon is available."),
    "trackingPopupStopTrackingText" : MessageLookupByLibrary.simpleMessage("Stop tracking this dungeon"),
    "trackingTrackedItemText" : MessageLookupByLibrary.simpleMessage("Tracking"),
    "typeAttacker" : MessageLookupByLibrary.simpleMessage("Attacker"),
    "typeAwoken" : MessageLookupByLibrary.simpleMessage("Awoken"),
    "typeBalanced" : MessageLookupByLibrary.simpleMessage("Balanced"),
    "typeDevil" : MessageLookupByLibrary.simpleMessage("Devil"),
    "typeDragon" : MessageLookupByLibrary.simpleMessage("Dragon"),
    "typeEnhance" : MessageLookupByLibrary.simpleMessage("Enhance"),
    "typeEvoMat" : MessageLookupByLibrary.simpleMessage("Evo Material"),
    "typeGod" : MessageLookupByLibrary.simpleMessage("God"),
    "typeHealer" : MessageLookupByLibrary.simpleMessage("Healer"),
    "typeMachine" : MessageLookupByLibrary.simpleMessage("Machine"),
    "typePhysical" : MessageLookupByLibrary.simpleMessage("Physical"),
    "typeVendor" : MessageLookupByLibrary.simpleMessage("Vendor"),
    "updateComplete" : MessageLookupByLibrary.simpleMessage("Update complete"),
    "updateFailed" : MessageLookupByLibrary.simpleMessage("Update failed"),
    "updateFailedTooOld" : MessageLookupByLibrary.simpleMessage("DadGuide needs to update"),
    "updateModalTitle" : MessageLookupByLibrary.simpleMessage("Updating DadGuide data"),
    "upgradingDbTitle" : MessageLookupByLibrary.simpleMessage("Database upgrade"),
    "upgradingInfoText" : MessageLookupByLibrary.simpleMessage("Some updates introduce incompatible database changes. When this occurs, you need to download a replacement with the new data. This contains about 20MB of data; sorry for the inconvenience."),
    "upgradingInfoTitle" : MessageLookupByLibrary.simpleMessage("Downloading and installing a database update"),
    "warning" : MessageLookupByLibrary.simpleMessage("Warning"),
    "ytLaunchError" : MessageLookupByLibrary.simpleMessage("Failed to launch YouTube")
  };
}
