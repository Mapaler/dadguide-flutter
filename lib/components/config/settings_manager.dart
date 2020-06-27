import 'dart:ui' as ui;

import 'package:dadguide2/components/models/enums.dart';
import 'package:dadguide2/data/tables.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:preferences/preferences.dart';
import 'package:tuple/tuple.dart';

/// List of keys for preferences.
class PrefKeys {
  static const changelogSeenVersion = 'changelog_seen_version';
  static const currentDbVersion = 'current_db_version';
  static const iconsDownloaded = 'icons_downloaded';
  static const lastUpdateExecution = 'last_update_execution';

  static const uiLanguage = 'ui_language';
  static const infoLanguage = 'info_language';
  static const gameCountry = 'game_country';
  static const eventCountry = 'event_country';

  static const eventsHideClosed = 'events_hide_closed';
  static const eventsShowRed = 'events_show_red';
  static const eventsShowBlue = 'events_show_blue';
  static const eventsShowGreen = 'events_show_green';
  static const notificationsAlertsEnabled = 'notifications_alerts_enabled';

  static const uiTheme = 'ui_theme';
  static const uiDarkMode = 'ui_dark_mode';

  static const hideUnreleasedMonsters = 'hide_unreleased_monsters';

  static const tsLastDeleted = 'tsLastDeleted';

  static const trackedDungeons = 'tracked_dungeons';

  static const mediaWarningDisplayed = 'media_warning_displayed';

  static const favoriteMonsters = 'favorite_monsters';
  static const lastComparedMonster = 'last_compared_monster';

  static const adsEnabled = 'ads_enabled';

  static const monsterSearchArgs = 'monster_search_args';

  static const purchaseDetails = 'purchase_details';

  static const monsterListPictureMode = 'monster_list_picture_mode';
  static const monsterListAwakeningMode = 'monster_list_awakening_mode';

  static const dungeonOverviewColumns = 'dungeon_overview_columns';
  static const dungeonOverviewType = 'dungeon_overview_type';
  static const dungeonOverviewShowType = 'dungeon_overview_show_type';
  static const dungeonOverviewShowAbilities = 'dungeon_overview_show_abilities';
}

/// Wrapper for reading and writing preferences.
class Prefs {
  /// The currently selected event country.
  static Country get eventCountry => Country.byId(PrefService.getInt(PrefKeys.eventCountry));
  static set eventCountry(Country country) => PrefService.setInt(PrefKeys.eventCountry, country.id);

  /// A list of the event starters and their selected status.
  static List<StarterDragon> get eventStarters {
    return [
      if (PrefService.getBool(PrefKeys.eventsShowRed)) StarterDragon.red,
      if (PrefService.getBool(PrefKeys.eventsShowBlue)) StarterDragon.blue,
      if (PrefService.getBool(PrefKeys.eventsShowGreen)) StarterDragon.green,
    ];
  }

  /// Should we display events that are closed.
  static bool get eventHideClosed => PrefService.getBool(PrefKeys.eventsHideClosed);

  /// Initialize the pref repo and make sure every preference has a sane default at first launch.
  static Future<void> init() async {
    var windowBrightness = ui.window.platformBrightness;
    var defaultTheme =
        windowBrightness == ui.Brightness.light ? UiTheme.lightBlue : UiTheme.darkBlue;

    // Initialize the deleted timestamp to yesterday, since the zip file can be at most a few
    // hours old we don't need to pull the full deleted row history.
    var defaultDeletedTs =
        DateTime.now().subtract(Duration(days: 1)).millisecondsSinceEpoch ~/ 1000;

    await PrefService.init();
    Prefs.dungeonOverviewType = DungeonOverviewType.floors;
    PrefService.setDefaultValues(<String, dynamic>{
      PrefKeys.changelogSeenVersion: '',
      PrefKeys.currentDbVersion: 0,
      PrefKeys.iconsDownloaded: false,
      PrefKeys.lastUpdateExecution: 0,
      PrefKeys.uiLanguage: defaultUiLanguageValue,
      PrefKeys.infoLanguage: defaultInfoLanguageValue,
      PrefKeys.gameCountry: defaultGameCountryValue,
      PrefKeys.eventCountry: defaultEventCountryValue,
      PrefKeys.eventsHideClosed: true,
      PrefKeys.eventsShowRed: true,
      PrefKeys.eventsShowBlue: true,
      PrefKeys.eventsShowGreen: true,
      PrefKeys.notificationsAlertsEnabled: true,
      PrefKeys.uiTheme: defaultTheme.id,
      PrefKeys.uiDarkMode: defaultTheme.isDark(),
      PrefKeys.hideUnreleasedMonsters: false,
      PrefKeys.tsLastDeleted: defaultDeletedTs,
      PrefKeys.trackedDungeons: <String>[],
      PrefKeys.mediaWarningDisplayed: false,
      PrefKeys.favoriteMonsters: '',
      PrefKeys.lastComparedMonster: 1,
      PrefKeys.adsEnabled: true,
      PrefKeys.monsterSearchArgs: MonsterSearchArgs.defaults().toJsonString(),
      PrefKeys.purchaseDetails: <String>[],
      PrefKeys.monsterListPictureMode: false,
      PrefKeys.monsterListAwakeningMode: false,
      PrefKeys.dungeonOverviewColumns: 1,
      PrefKeys.dungeonOverviewType: DungeonOverviewType.floors.id,
      PrefKeys.dungeonOverviewShowType: true,
      PrefKeys.dungeonOverviewShowAbilities: true,
    });
  }

  /// Try to determine which country/language to use for the current locale.
  static Tuple2<Language, Country> get _defaultLanguageCountry {
    var locale = ui.window.locale;
    var languageCode = locale?.languageCode ?? 'xx';

    if (locale == null) {
      Fimber.e('Locale was null, defaulting to english/na');
      return Tuple2(Language.en, Country.na);
    } else if (['ja', 'jpx'].contains(languageCode)) {
      return Tuple2(Language.ja, Country.jp);
    } else if (languageCode.startsWith('zh')) {
      return Tuple2(Language.ja, Country.jp);
    } else if (['ko'].contains(languageCode)) {
      return Tuple2(Language.ko, Country.kr);
    } else {
      return Tuple2(Language.en, Country.na);
    }
  }

  static int get defaultUiLanguageValue => _defaultLanguageCountry.item1.id;
  static int get defaultInfoLanguageValue => _defaultLanguageCountry.item1.id;
  static int get defaultGameCountryValue => _defaultLanguageCountry.item2.id;
  static int get defaultEventCountryValue => _defaultLanguageCountry.item2.id;

  static List<int> get languageValues => Language.all.map((l) => l.id).toList();
  static List<String> get languageDisplayValues =>
      Language.all.map((l) => l.languageName()).toList();

  static List<int> get countryValues => Country.all.map((l) => l.id).toList();
  static List<String> get countryDisplayValues => Country.all.map((l) => l.countryName()).toList();

  static Language get infoLanguage => Language.byId(PrefService.getInt(PrefKeys.infoLanguage));
  static set infoLanguage(Language language) =>
      PrefService.setInt(PrefKeys.infoLanguage, language.id);

  static Language get uiLanguage => Language.byId(PrefService.getInt(PrefKeys.uiLanguage));
  static set uiLanguage(Language language) => PrefService.setInt(PrefKeys.uiLanguage, language.id);

  static UiTheme get uiTheme => UiTheme.byId(PrefService.getInt(PrefKeys.uiTheme));
  static set uiTheme(UiTheme theme) => PrefService.setInt(PrefKeys.uiTheme, theme.id);

  static bool get uiDarkMode => PrefService.getBool(PrefKeys.uiDarkMode);
  static set uiDarkMode(bool darkMode) {
    PrefService.setBool(PrefKeys.uiTheme, darkMode);
    // Temporary propagation of the saved actual theme
    Prefs.uiTheme = darkMode ? UiTheme.darkBlue : UiTheme.lightBlue;
  }

  static int get currentDbVersion => PrefService.getInt(PrefKeys.currentDbVersion);
  static set currentDbVersion(int version) =>
      PrefService.setInt(PrefKeys.currentDbVersion, version);

  static bool get iconsDownloaded => PrefService.getBool(PrefKeys.iconsDownloaded);
  static void setIconsDownloaded(bool val) {
    PrefService.setBool(PrefKeys.iconsDownloaded, val);
  }

  static void setAllLanguage(int val) {
    infoLanguage = Language.byId(val);
    uiLanguage = Language.byId(val);
  }

  static void setAllCountry(int val) {
    PrefService.setInt(PrefKeys.eventCountry, val);
    PrefService.setInt(PrefKeys.gameCountry, val);
  }

  static Country get gameCountry => Country.byId(PrefService.getInt(PrefKeys.gameCountry));

  /// Sorted by insert order. Consider sorting?
  /// Note the app and database uses dungeonId as an int, but shared_preferences only has a list of strings for storage.
  static List<int> addTrackedDungeon(int dungeonId) {
    final trackedDungeons = Prefs.trackedDungeons;
    trackedDungeons.add(dungeonId);
    setTrackedDungeons(trackedDungeons);
    return trackedDungeons;
  }

  static List<int> removeTrackedDungeon(int dungeonId) {
    final trackedDungeons = Prefs.trackedDungeons;
    trackedDungeons.remove(dungeonId);
    setTrackedDungeons(trackedDungeons);
    return trackedDungeons;
  }

  static void setTrackedDungeons(List<int> dungeonIds) {
    PrefService.setStringList(
        PrefKeys.trackedDungeons, dungeonIds.map((int x) => x.toString()).toList());
  }

  static List<int> get trackedDungeons {
    return PrefService.getStringList(PrefKeys.trackedDungeons)
        .map<int>((s) => int.parse(s))
        .toList();
  }

  /// Store the current time as the last update time.
  static void updateRan() {
    PrefService.setInt(PrefKeys.lastUpdateExecution, DateTime.now().millisecondsSinceEpoch);
  }

  /// Determine if the update needs to run by comparing the current time against the last run time.
  static bool updateRequired() {
    final lastUpdate =
        DateTime.fromMillisecondsSinceEpoch(PrefService.getInt(PrefKeys.lastUpdateExecution));
    return DateTime.now().difference(lastUpdate).inMinutes > 10;
  }

  static int get tsLastDeleted => PrefService.getInt(PrefKeys.tsLastDeleted);
  static set tsLastDeleted(int ts) => PrefService.setInt(PrefKeys.tsLastDeleted, ts);

  static bool get hideUnreleasedMonsters => PrefService.getBool(PrefKeys.hideUnreleasedMonsters);
  static set hideUnreleasedMonsters(bool val) =>
      PrefService.setBool(PrefKeys.hideUnreleasedMonsters, val);

  // Should alerts be displayed for tracked dungeons.
  static bool get alertsEnabled => PrefService.getBool(PrefKeys.notificationsAlertsEnabled);

  // If we've displayed the media size warning at least once.
  static bool get mediaWarningDisplayed => PrefService.getBool(PrefKeys.mediaWarningDisplayed);
  static set mediaWarningDisplayed(bool value) =>
      PrefService.setBool(PrefKeys.mediaWarningDisplayed, value);

  static set lastComparedMonster(int monsterId) =>
      PrefService.setInt(PrefKeys.lastComparedMonster, monsterId);
  static int get lastComparedMonster => PrefService.getInt(PrefKeys.lastComparedMonster);

  /// Should not be called except by the AdManager. Value needs to be kept in sync with the ad
  /// enabled status.
  static set adsEnabled(bool enabled) => PrefService.setBool(PrefKeys.adsEnabled, enabled);
  static bool get adsEnabled => PrefService.getBool(PrefKeys.adsEnabled);

  static MonsterSearchArgs get monsterSearchArgs =>
      MonsterSearchArgs.fromJsonString(PrefService.getString(PrefKeys.monsterSearchArgs));
  static set monsterSearchArgs(MonsterSearchArgs args) =>
      PrefService.setString(PrefKeys.monsterSearchArgs, args.toJsonString());

  static List<String> get purchaseDetails => PrefService.getStringList(PrefKeys.purchaseDetails);
  static set purchaseDetails(List<String> details) =>
      PrefService.setStringList(PrefKeys.purchaseDetails, details);

  /// Keep the 10 most recent details in case there's a bug.
  static void addPurchaseDetails(String details) =>
      purchaseDetails = purchaseDetails.reversed.take(9).toList().reversed.toList()..add(details);

  static set changelogSeenVersion(String v) =>
      PrefService.setString(PrefKeys.changelogSeenVersion, v);
  static String get changelogSeenVersion => PrefService.getString(PrefKeys.changelogSeenVersion);

  static set monsterListAwakeningMode(bool v) =>
      PrefService.setBool(PrefKeys.monsterListAwakeningMode, v);
  static bool get monsterListAwakeningMode =>
      PrefService.getBool(PrefKeys.monsterListAwakeningMode);

  static set monsterListPictureMode(bool v) =>
      PrefService.setBool(PrefKeys.monsterListPictureMode, v);
  static bool get monsterListPictureMode => PrefService.getBool(PrefKeys.monsterListPictureMode);

  static int get dungeonOverviewColumns => PrefService.getInt(PrefKeys.dungeonOverviewColumns);
  static DungeonOverviewType get dungeonOverviewType =>
      DungeonOverviewType.byId(PrefService.getInt(PrefKeys.dungeonOverviewType));
  static set dungeonOverviewType(DungeonOverviewType v) =>
      PrefService.setInt(PrefKeys.dungeonOverviewType, v.id);
  static bool get dungeonOverviewShowType => PrefService.getBool(PrefKeys.dungeonOverviewShowType);
  static bool get dungeonOverviewShowAbilities =>
      PrefService.getBool(PrefKeys.dungeonOverviewShowAbilities);
}

List<int> stringToIntList(String s) {
  s ??= '';
  return s.split(',').map(int.tryParse).where((i) => i != null).toList();
}
