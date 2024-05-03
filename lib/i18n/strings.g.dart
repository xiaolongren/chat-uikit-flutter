
/*
 * Generated file. Do not edit.
 *
 * Locales: 3
 * Strings: 1400 (466.7 per locale)
 *
 * Built on 2024-05-03 at 15:25 UTC
 */

import 'package:flutter/widgets.dart';

const AppLocale _baseLocale = AppLocale.en;
AppLocale _currLocale = _baseLocale;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale {
	en, // 'en' (base locale, fallback)
	zhHans, // 'zh-Hans'
	zhHant, // 'zh-Hant'
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn _t = _currLocale.translations;
_StringsEn get t => _t;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget.translations;
	}
}

class LocaleSettings {
	LocaleSettings._(); // no constructor

	/// Uses locale of the device, fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale useDeviceLocale() {
		final locale = AppLocaleUtils.findDeviceLocale();
		return setLocale(locale);
	}

	/// Sets locale
	/// Returns the locale which has been set.
	static AppLocale setLocale(AppLocale locale) {
		_currLocale = locale;
		_t = _currLocale.translations;

		// force rebuild if TranslationProvider is used
		_translationProviderKey.currentState?.setLocale(_currLocale);

		return _currLocale;
	}

	/// Sets locale using string tag (e.g. en_US, de-DE, fr)
	/// Fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale setLocaleRaw(String rawLocale) {
		final locale = AppLocaleUtils.parse(rawLocale);
		return setLocale(locale);
	}

	/// Gets current locale.
	static AppLocale get currentLocale {
		return _currLocale;
	}

	/// Gets base locale.
	static AppLocale get baseLocale {
		return _baseLocale;
	}

	/// Gets supported locales in string format.
	static List<String> get supportedLocalesRaw {
		return AppLocale.values
			.map((locale) => locale.languageTag)
			.toList();
	}

	/// Gets supported locales (as Locale objects) with base locale sorted first.
	static List<Locale> get supportedLocales {
		return AppLocale.values
			.map((locale) => locale.flutterLocale)
			.toList();
	}
}

/// Provides utility functions without any side effects.
class AppLocaleUtils {
	AppLocaleUtils._(); // no constructor

	/// Returns the locale of the device as the enum type.
	/// Fallbacks to base locale.
	static AppLocale findDeviceLocale() {
		final String? deviceLocale = WidgetsBinding.instance.window.locale.toLanguageTag();
		if (deviceLocale != null) {
			final typedLocale = _selectLocale(deviceLocale);
			if (typedLocale != null) {
				return typedLocale;
			}
		}
		return _baseLocale;
	}

	/// Returns the enum type of the raw locale.
	/// Fallbacks to base locale.
	static AppLocale parse(String rawLocale) {
		return _selectLocale(rawLocale) ?? _baseLocale;
	}
}

// context enums

// interfaces generated as mixins

// translation instances

late _StringsEn _translationsEn = _StringsEn.build();
late _StringsZhHans _translationsZhHans = _StringsZhHans.build();
late _StringsZhHant _translationsZhHant = _StringsZhHant.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {

	/// Gets the translation instance managed by this library.
	/// [TranslationProvider] is using this instance.
	/// The plural resolvers are set via [LocaleSettings].
	_StringsEn get translations {
		switch (this) {
			case AppLocale.en: return _translationsEn;
			case AppLocale.zhHans: return _translationsZhHans;
			case AppLocale.zhHant: return _translationsZhHant;
		}
	}

	/// Gets a new translation instance.
	/// [LocaleSettings] has no effect here.
	/// Suitable for dependency injection and unit tests.
	///
	/// Usage:
	/// final t = AppLocale.en.build(); // build
	/// String a = t.my.path; // access
	_StringsEn build() {
		switch (this) {
			case AppLocale.en: return _StringsEn.build();
			case AppLocale.zhHans: return _StringsZhHans.build();
			case AppLocale.zhHant: return _StringsZhHant.build();
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.en: return 'en';
			case AppLocale.zhHans: return 'zh-Hans';
			case AppLocale.zhHant: return 'zh-Hant';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.en: return const Locale.fromSubtags(languageCode: 'en');
			case AppLocale.zhHans: return const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans', );
			case AppLocale.zhHant: return const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant', );
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'en': return AppLocale.en;
			case 'zh-Hans': return AppLocale.zhHans;
			case 'zh-Hant': return AppLocale.zhHant;
			default: return null;
		}
	}
}

// wrappers

GlobalKey<_TranslationProviderState> _translationProviderKey = GlobalKey<_TranslationProviderState>();

class TranslationProvider extends StatefulWidget {
	TranslationProvider({required this.child}) : super(key: _translationProviderKey);

	final Widget child;

	@override
	_TranslationProviderState createState() => _TranslationProviderState();

	static _InheritedLocaleData of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget;
	}
}

class _TranslationProviderState extends State<TranslationProvider> {
	AppLocale locale = _currLocale;

	void setLocale(AppLocale newLocale) {
		setState(() {
			locale = newLocale;
		});
	}

	@override
	Widget build(BuildContext context) {
		return _InheritedLocaleData(
			locale: locale,
			child: widget.child,
		);
	}
}

class _InheritedLocaleData extends InheritedWidget {
	final AppLocale locale;
	Locale get flutterLocale => locale.flutterLocale; // shortcut
	final _StringsEn translations; // store translations to avoid switch call

	_InheritedLocaleData({required this.locale, required Widget child})
		: translations = locale.translations, super(child: child);

	@override
	bool updateShouldNotify(_InheritedLocaleData oldWidget) {
		return oldWidget.locale != locale;
	}
}

// pluralization feature not used

// helpers

final _localeRegex = RegExp(r'^([a-z]{2,8})?([_-]([A-Za-z]{4}))?([_-]?([A-Z]{2}|[0-9]{3}))?$');
AppLocale? _selectLocale(String localeRaw) {
	final match = _localeRegex.firstMatch(localeRaw);
	AppLocale? selected;
	if (match != null) {
		final language = match.group(1);
		final country = match.group(5);

		// match exactly
		selected = AppLocale.values
			.cast<AppLocale?>()
			.firstWhere((supported) => supported?.languageTag == localeRaw.replaceAll('_', '-'), orElse: () => null);

		if (selected == null && language != null) {
			// match language
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.startsWith(language) == true, orElse: () => null);
		}

		if (selected == null && country != null) {
			// match country
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.contains(country) == true, orElse: () => null);
		}
	}
	return selected;
}

// translations

// Path: <root>
class _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build();

	/// Access flat map
	dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	String get k_1fdhj9g => 'This version does not support the message';
	String get k_06pujtm => 'Accept all friend requests';
	String get k_0gyhkp5 => 'Require approval for friend requests';
	String get k_121ruco => 'Reject all friend requests';
	String get k_05nspni => 'Custom field';
	String get k_03fchyy => 'Group profile photo';
	String get k_03i9mfe => 'Group introduction';
	String get k_03agq58 => 'Group name';
	String get k_039xqny => 'Group notification';
	String get k_003tr0a => 'Group owner';
	String get k_002wddw => 'Mute';
	String get k_0got6f7 => 'Unmute';
	String get k_1uaqed6 => '[Custom]';
	String get k_0z2z7rx => '[Voice]';
	String get k_0y39ngu => '[Emoji]';
	String get k_0y1a2my => '[Image]';
	String get k_0z4fib8 => '[Video]';
	String get k_0y24mcg => '[Location]';
	String get k_0pewpd1 => '[Chat history]';
	String get k_13s8d9p => 'Unknown message';
	String get k_003qkx2 => 'Calendar';
	String get k_003n2pz => 'Camera';
	String get k_03idjo0 => 'Contact';
	String get k_003ltgm => 'Location';
	String get k_02k3k86 => 'Mic';
	String get k_003pm7l => 'Album';
	String get k_15ao57x => 'Album write';
	String get k_164m3jd => 'Local storage';
	String get k_03r6qyx => 'We need your approval to get information.';
	String get k_02noktt => 'Reject';
	String get k_00043x4 => 'Agree';
	String get k_003qzac => 'Yesterday';
	String get k_003r39d => '2 days ago';
	String get k_03fqp9o => 'Sun';
	String get k_03ibg5h => 'Mon';
	String get k_03i7hu1 => 'Tue';
	String get k_03iaiks => 'Wed';
	String get k_03el9pa => 'Thu';
	String get k_03i7ok1 => 'Fri';
	String get k_03efxyg => 'Sat';
	String get k_003q7ba => 'Afternoon';
	String get k_003q7bb => 'Morning';
	String get k_003pu3h => 'Now';
	String get k_002rflt => 'Delete';
	String get k_1don84v => 'Failed to locate the original message';
	String get k_003q5fi => 'Copy';
	String get k_003prq0 => 'Forward';
	String get k_002r1h2 => 'Multiple-choice';
	String get k_003j708 => 'Reference';
	String get k_003pqpr => 'Recall';
	String get k_03ezhho => 'Copied';
	String get k_11ctfsz => 'Not implemented';
	String get k_1hbjg5g => '[Group system message]';
	String get k_03tvswb => '[Unknown message]';
	String get k_155cj23 => 'You\'ve recalled a message.';
	String get k_0gapun3 => 'Edit it again';
	String get k_0003z7x => 'You';
	String get k_002wfe4 => 'Read';
	String get k_002wjlg => 'Unread';
	String get k_003nevv => 'Cancel';
	String get k_001nmhu => 'Open with another app';
	String get k_105682d => 'Failed to load the image';
	String get k_0pytyeu => 'Image saved successfully';
	String get k_0akceel => 'Failed to save the image';
	String get k_003rk1s => 'Save';
	String get k_04a0awq => '[Voice message]';
	String get k_105c3y3 => 'Failed to load the video';
	String get k_176rzr7 => 'Chat history';
	String get k_002r305 => 'Send';
	String get k_003n8b0 => 'Shoot';
	String get k_003tnp0 => 'File';
	String get k_0ylosxn => 'Custom message';
	String get k_0jhdhtp => 'Sending failed. The video cannot exceed 100 MB.';
	String get k_0am7r68 => 'Slide up to cancel';
	String get k_13dsw4l => 'Release to cancel';
	String get k_15jl6qw => 'Too short';
	String get k_0gx7vl6 => 'Press and hold to talk';
	String get k_15dlafd => 'One-by-one forward';
	String get k_15dryxy => 'Combine and forward';
	String get k_1eyhieh => 'Are you sure you want to delete the selected message?';
	String get k_118prbn => 'Search globally';
	String get k_003kv3v => 'Search';
	String get k_17fmlyf => 'Clear chat';
	String get k_0dhesoz => 'Unpin from top';
	String get k_002sk7x => 'Pin to top';
	String get k_003ll77 => 'Draft';
	String get k_003kfai => 'Unknown';
	String get k_13dq4an => 'Automatic approval';
	String get k_0l13cde => 'Admin approval';
	String get k_11y8c6a => 'Disallow group joining';
	String get k_1kvyskd => 'Modification failed due to network disconnection';
	String get k_16payqf => 'Group joining mode';
	String get k_0vzvn8r => 'Modify group name';
	String get k_003rzap => 'OK';
	String get k_038lh6u => 'Group management';
	String get k_0k5wyiy => 'Set admin';
	String get k_0goiuwk => 'Mute all';
	String get k_1g889xx => 'If you mute all, only the group owner and admin can speak.';
	String get k_0wlrefq => 'Add group members to mute';
	String get k_0goox5g => 'Mute';
	String get k_08daijh => 'Admin role canceled successfully';
	String get k_0k5u935 => 'Add admin';
	String get k_003ngex => 'Complete';
	String get k_03enyx5 => 'Group member';
	String get k_03erpei => 'Admin';
	String get k_0qi9tno => 'Group owner and admin';
	String get k_0uj7208 => 'Failed to view the group members due to network disconnection';
	String get k_0ef2a12 => 'Modify my nickname in group';
	String get k_1aajych => '2–20 characters, including digits, letters, and underscores';
	String get k_137pab5 => 'My nickname in group';
	String get k_0ivim6d => 'No group notice';
	String get k_03eq6cn => 'Group notice';
	String get k_002vxya => 'Modify';
	String get k_03gu05e => 'Chat room';
	String get k_03b4f3p => 'Meeting group';
	String get k_03avj1p => 'Public group';
	String get k_03asq2g => 'Work group';
	String get k_03b3hbi => 'Unknown group';
	String get k_03es1ox => 'Group type';
	String get k_003mz1i => 'Agree';
	String get k_003lpre => 'Reject';
	String get k_003qk66 => 'Profile photo';
	String get k_003lhvk => 'Nickname';
	String get k_003ps50 => 'Account';
	String get k_15lx52z => 'Status';
	String get k_003qgkp => 'Gender';
	String get k_003m6hr => 'Date of birth';
	String get k_0003v6a => 'Male';
	String get k_00043x2 => 'Female';
	String get k_03bcjkv => 'Not set';
	String get k_11s0gdz => 'Modify nickname';
	String get k_0p3j4sd => 'Allows only letters, digits, and underscores';
	String get k_15lyvdt => 'Modify status';
	String get k_0vylzjp => 'None';
	String get k_1hs7ese => 'Modify it later';
	String get k_03exjk7 => 'Remarks';
	String get k_0s3skfd => 'Add to blocklist';
	String get k_17fpl3y => 'Pin chat to top';
	String get k_0p3b31s => 'Modify remarks';
	String get k_0003y9x => 'None';
	String get k_11zgnfs => 'Profile';
	String get k_1tez2xl => 'No status';
	String get k_0vjj2kp => 'Group chat history';
	String get k_003n2rp => 'Select';
	String get k_1m9exwh => 'Recent contacts';
	String get k_119nwqr => 'The input cannot be empty';
	String get k_0pzwbmg => 'Video saved successfully';
	String get k_0aktupv => 'Failed to save the video';
	String get k_1yemzyd => 'Received a message';
	String get k_13sajrj => 'Emoji message';
	String get k_13sjeb7 => 'File message';
	String get k_0yd2ft8 => 'Group notification';
	String get k_13s7mxn => 'Image message';
	String get k_13satlt => 'Location message';
	String get k_00bbtsx => 'Combined message';
	String get k_13sqwu4 => 'Voice message';
	String get k_13sqjjp => 'Video message';
	String k_03iqsh4({required Object s}) => ' $s to ';
	String k_191t5n4({required Object opUserNickName}) => '$opUserNickName changed ';
	String k_1pg6aoj({required Object opUserNickName}) => '$opUserNickName quit group chat';
	String k_1f6zt3v({required Object invitedMemberString}) => 'Invite $invitedMemberString to the group';
	String k_0y7zd07({required Object invitedMemberString}) => 'Remove $invitedMemberString from the group';
	String k_1d5mshh({required Object joinedMemberString}) => 'User $joinedMemberString joined the group';
	String k_0yenqf0({required Object userName}) => '$userName was';
	String k_0spotql({required Object adminMember}) => 'Set $adminMember as admin';
	String k_0pg5zzj({required Object operationType}) => 'System message: $operationType';
	String k_1c7z88n({required Object fileName}) => '[File] $fileName';
	String get k_1c3us5n => 'The current group does not support @all';
	String get k_11k579v => 'Invalid statements detected';
	String k_0qba4ns({required Object yoursItem}) => ' attempted to access your $yoursItem';
	String k_0oozw9x({required Object diffMinutes}) => '$diffMinutes minutes ago';
	String k_13hzn00({required Object yesterday}) => '$yesterday, yesterday';
	String get k_0n9pyxz => 'The user does not exist';
	String get k_1bjwemh => 'Search by user ID';
	String k_02owlq8({required Object userID}) => 'My user ID: $userID';
	String k_1wu8h4x({required Object showName}) => 'Me: $showName';
	String get k_16758qw => 'Add friend';
	String k_1shx4d9({required Object selfSignature}) => 'Status: $selfSignature';
	String get k_0i553x0 => 'Enter verification information';
	String get k_031ocwx => 'Enter remarks and list';
	String get k_003ojje => 'Remarks';
	String get k_003lsav => 'List';
	String get k_167bdvq => 'My friends';
	String get k_156b4ut => 'Friend request sent';
	String k_1loix7s({required Object groupType}) => 'Group type: $groupType';
	String get k_1lqbsib => 'The group chat does not exist';
	String get k_03h153m => 'Search by group ID';
	String get k_0oxak3r => 'Group request sent';
	String k_1uh417q({required Object displayName}) => '$displayName recalled a message';
	String get k_1aszp2k => 'Are you sure you want to send the message again?';
	String get k_0h1ygf8 => 'Call initiated';
	String get k_0h169j0 => 'Call canceled';
	String get k_0h13jjk => 'Call accepted';
	String get k_0h19hfx => 'Call rejected';
	String get k_0obi9lh => 'No answer';
	String k_0ohzb9l({required Object callTime}) => 'Call duration: $callTime';
	String k_0y9u662({required Object appName}) => '$appName currently does not support this file type. You can use another app to open and preview the file.';
	String get k_1ht1b80 => 'Receiving';
	String get k_0d5z4m5 => 'Select reminder receiver';
	String get k_1665ltg => 'Initiate call';
	String get k_003kthh => 'Photo';
	String get k_119ucng => 'The image cannot be empty';
	String k_0w9x8gw({required Object successPath}) => 'Selected successfully: $successPath';
	String k_1np495n({required Object messageString}) => '$messageString[Someone@me]';
	String k_1m797yi({required Object messageString}) => '$messageString[@all]';
	String get k_1uaov41 => 'Search for chat content';
	String k_0bxm97s({required Object adminNum}) => 'Admin ($adminNum/10)';
	String k_0jayw3z({required Object groupMemberNum}) => 'Group members ($groupMemberNum members)';
	String get k_0h1svv1 => 'Delete group member';
	String get k_0h1g636 => 'Add group member';
	String k_01yfa4o({required Object memberCount}) => '$memberCount members';
	String get k_0hpukyx => 'View more group members';
	String get k_0qtsar0 => 'Mute notifications';
	String k_03xd79d({required Object signature}) => 'Status: $signature';
	String get k_1m9dftc => 'All contacts';
	String get k_0em4gyz => 'All group chats';
	String get k_002twmj => 'Group chat';
	String get k_09kga0d => 'More chat history';
	String k_1ui5lzi({required Object count}) => '$count messages are found';
	String get k_09khmso => 'Related chat records';
	String k_1kevf4k({required Object receiver}) => 'Chat history with $receiver';
	String get k_03ignw6 => 'All';
	String get k_03icaxo => 'Custom';
	String k_1969986({required Object callingLastMsgShow}) => '[Voice Call]：$callingLastMsgShow';
	String k_1960dlr({required Object callingLastMsgShow}) => '[Video Call]：$callingLastMsgShow';
	String k_1qbg9xc({required Object option8}) => '$option8 to ';
	String k_1wq5ubm({required Object option7}) => '$option7 changed ';
	String k_0y5pu80({required Object option6}) => '$option6 quit group chat';
	String k_0nl7cmd({required Object option5}) => 'Invite $option5 to the group';
	String k_1ju5iqw({required Object option4}) => 'Remove $option4 from the group';
	String k_1ovt677({required Object option3}) => 'User $option3 joined the group';
	String k_0k05b8b({required Object option2}) => '$option2 was ';
	String k_0wm4xeb({required Object option2}) => 'System message: $option2';
	String k_0nbq9v3({required Object option2}) => 'Call duration: $option2';
	String k_0i1kf53({required Object option2}) => '[File] $option2';
	String k_1gnnby6({required Object option2}) => ' attempted to access your $option2';
	String k_1wh4atg({required Object option2}) => '$option2 minutes ago';
	String k_07sh7g1({required Object option2}) => '$option2, yesterday';
	String k_1pj8xzh({required Object option2}) => 'My user ID: $option2';
	String k_0py1evo({required Object option2}) => 'Status: $option2';
	String k_1kvj4i2({required Object option2}) => '$option2 recalled a message';
	String k_1v0lbpp({required Object option2}) => '$option2 currently does not support this file type. You can use another app to open and preview the file.';
	String k_0torwfz({required Object option2}) => 'Selected successfully: $option2';
	String k_0i1bjah({required Object option1}) => '$option1 recalled a message';
	String k_1qzxh9q({required Object option3}) => 'Call duration: $option3';
	String k_0wrgmom({required Object option1}) => '[Voice Call]：$option1';
	String k_06ix2f0({required Object option2}) => '[Video Call]：$option2';
	String k_08o3z5w({required Object option1}) => '[File] $option1';
	String k_0ezbepg({required Object option2}) => '$option2[Someone@me]';
	String k_1ccnht1({required Object option2}) => '$option2[@all]';
	String k_1k3arsw({required Object option2}) => 'Admin ($option2/10)';
	String k_1d4golg({required Object option1}) => 'Group members ($option1 members)';
	String k_1bg69nt({required Object option1}) => '$option1 members';
	String k_00gjqxj({required Object option1}) => 'Status: $option1';
	String k_0c29cxr({required Object option1}) => '$option1 messages are found';
	String k_1twk5rz({required Object option1}) => 'Chat history with $option1';
	String get k_18o68ro => 'Allow ';
	String get k_1onpf8u => ' to access your camera to take photos, record videos, and make video calls.';
	String get k_17irga5 => ' to access your microphone to send voice messages, record videos, and make voice/video calls.';
	String get k_0572kc4 => ' to access your photos to send images and videos.';
	String get k_0slykws => ' to access your album to save images and videos.';
	String get k_119pkcd => ' to access your files to view, select and send files in a chat.';
	String get k_03c49qt => 'Authorize now';
	String get k_0nt2uyg => 'Back to the bottom';
	String k_04l16at({required Object option1}) => '$option1 new messages';
	String get k_13p3w93 => 'Someone @ me';
	String get k_18w5uk6 => '@ all';
	String get k_0jmujgh => 'You are receiving other files';
	String get k_12s5ept => 'Message details';
	String k_0mxa4f4({required Object option1}) => '$option1 read';
	String k_061tue3({required Object option2}) => '$option2 unread';
	String k_1vn4xq1({required Object adminMember}) => 'remove $adminMember from admin';
	String get k_0e35hsw => 'Please allow us to use your camera to capture photos and videos sending to your friends and make video calls.';
	String get k_0dj6yr7 => 'Please allow us to use your microphone for sending voice message, make video/audio calls.';
	String get k_003qnsl => 'Save';
	String get k_0s3rtpw => 'Please allow us to access the media and files on your devices, in order to select and send to your friend, or save from them.';
	String k_0tezv85({required Object option2}) => ' Would like to access $option2';
	String get k_002rety => ' permission. ';
	String get k_0gqewd3 => 'Later';
	String get k_03eq4s1 => 'Authorize Now';
	String get k_18qjstb => 'Transfer Group';
	String k_0on1aj2({required Object option2}) => '$option2 messages @ me';
	String get k_09j4izl => '[Someone @ me] ';
	String get k_1oqtjw0 => '[@ all] ';
	String k_1x5a9vb({required Object option1}) => 'This is: $option1';
	String get k_14n31e7 => 'Add Group';
	String k_08nc5j1({required Object option1}) => 'Group type: $option1';
	String k_1josu12({required Object option1}) => '$option1 group joining request(s)';
	String k_0n2x5s0({required Object option2}) => 'Verification message: $option2';
	String get k_03c1nx0 => 'Agreed';
	String get k_03aw9w8 => 'Rejected';
	String get k_038ryos => 'Handle now';
	String get k_0gw8pum => 'Add Group';
	String get k_1gcvfrj => 'Please fill in the remarks';
	String get k_002v9zj => '确认';
	String get k_10oqrki => '轻触拍照';
	String get k_0f8b3ws => '加载失败';
	String get k_11cm5lm => '手动聚焦';
	String get k_002uzrd => '预览';
	String get k_003qkn3 => '录像';
	String get k_003k6a7 => '拍照';
	String get k_0bqpqco => '拍照按钮';
	String get k_1626ozl => '停止录像';
	String get k_003lvmu => '前置';
	String get k_003lued => '后置';
	String get k_003lwzh => '外置';
	String get k_002qzi3 => '关闭';
	String get k_003pufb => '自动';
	String get k_0apm0ze => '拍照时闪光';
	String get k_157zog5 => '始终闪光';
	String k_0cfyqhy({required Object option1}) => '$option1 画面预览';
	String k_0phctlz({required Object option2}) => '闪光模式: $option2';
	String k_02vfqe0({required Object option3}) => '切换至 $option3 摄像头';
	String get k_0f0y9ex => '说话时间太短';
	String get k_0ln70tk => '无法打开URL';
	String get k_11a3jdv => '轻触拍照，长按摄像';
	String get k_1k18miv => '请传入离开群组生命周期函数，提供返回首页或其他页面的导航方法。';
	String get k_1fu9ahv => '全员禁言状态';
	String get k_0gmwbnd => '全员禁言中';
	String get k_0got2zr => '您被禁言';
	String get k_0y9jck8 => '你必须自定义search bar，并处理点击跳转';
	String get k_0yum3tv => '如使用自定义区域，请在profileWidgetBuilder传入对应组件';
	String get k_09kalj0 => '清空聊天记录';
	String get k_14j5iul => '删除并退出';
	String get k_125ru1w => '解散该群';
	String get k_0jtutmw => '退出后不会接收到此群聊消息';
	String get k_0jtzmqa => '解散后不会接收到此群聊消息';
	String get k_0r8fi93 => '好友添加成功';
	String get k_02qw14e => '好友申请已发出';
	String get k_0n3md5x => '当前用户在黑名单';
	String get k_094phq4 => '好友添加失败';
	String get k_129scag => '好友删除成功';
	String get k_129uzfn => '好友删除失败';
	String get k_1666isy => '清除好友';
	String get k_1679vrd => '加为好友';
	String get k_1ualc52 => '看看对方带来的数据是啥';
	String get k_0szluvp => '设置对方在线状态';
	String get k_0f4rnf8 => '该用户已是好友';
	String get k_1tdkom4 => '您已是群成员';
	String get k_1p2lyuz => '对方正在输入中...';
	String k_1g8wfpy({required Object option1}) => '...共$option1人';
	String get k_12rv9vw => '回应详情';
	String k_0havgi0({required Object linkMessage}) => '[查看详情 >>](${linkMessage.link})';
	String get k_0n9p7g8 => '群组不存在';
	String get k_1tdh5vn => '您不是群成员';
	String get k_0h1q57v => '暂无群成员';
	String k_0y5drq1({required Object option1}) => '[查看详情 >>]($option1)';
	String get k_03pjp61 => '[表情消息]';
	String get k_1jpvzul => '[自定义消息]';
	String get k_03u3bh1 => '[文件消息]';
	String get k_1odsnsw => '[群消息]';
	String get k_03sel4t => '[图片消息]';
	String get k_03sfw3r => '[位置消息]';
	String get k_03xpuwq => '[合并消息]';
	String get k_07ycxwo => '[没有元素]';
	String get k_03rc9vz => '[文本消息]';
	String get k_046uopf => '[视频消息]';
	String get k_0ehmsun => '设备存储空间不足，建议清理，以获得更好使用体验';
	String get k_003kmos => '图片';
	String get k_002s86q => '视频';
	String get k_06bk5ei => '视频消息仅限 mp4 格式';
	String get k_13opfxf => 'Web网页端不支持搜索';
	String get k_1i0o0y2 => '暂时仅限 Android/iOS 端';
	String k_045dtzl({required Object option1}) => '$option1的聊天记录';
	String get k_0t0131u => '群资料信息';
	String get k_18ok8xz => '消息接收方式';
	String get k_03ax3ks => '群资料';
	String k_0sqvoqo({required Object option1}) => '将 $option1 设置为管理员';
	String k_1gbg1v8({required Object option1}) => '将 $option1 取消管理员';
	String get k_17k64g4 => '群聊创建成功！';
	String get k_05mn217 => '暂未安装表情包插件，如需使用表情相关功能，请根据本文档安装：https://cloud.tencent.com/document/product/269/70746';
	String get k_14j17nz => '暂无表情包';
	String get k_0fvjexh => '正在下载中';
	String get k_1cdagzz => '已加入待下载队列，其他文件下载中';
	String get k_0g4vojc => '开始下载';
	String get k_1g32es3 => '[调皮]@2x.png';
	String get k_1g8qorz => '[爱你]@2x.png';
	String get k_1g4hmx6 => '[爱情]@2x.png';
	String get k_1g6b558 => '[爱心]@2x.png';
	String get k_1g3m4su => '[傲慢]@2x.png';
	String get k_1g2jym7 => '[白眼]@2x.png';
	String get k_0cgkxuw => '[棒棒糖]@2x.png';
	String get k_1g48br2 => '[抱抱]@2x.png';
	String get k_1g49ol8 => '[抱拳]@2x.png';
	String get k_1g0ras3 => '[爆筋]@2x.png';
	String get k_1ghy881 => '[鄙视]@2x.png';
	String get k_1g86bmv => '[闭嘴]@2x.png';
	String get k_1g1xs1p => '[鞭炮]@2x.png';
	String get k_1g8i6ri => '[便便]@2x.png';
	String get k_1g2u5kf => '[擦汗]@2x.png';
	String get k_1g60uwh => '[彩带]@2x.png';
	String get k_1g1o0d0 => '[彩球]@2x.png';
	String get k_1g6a6yq => '[菜刀]@2x.png';
	String get k_1g6vqo2 => '[差劲]@2x.png';
	String get k_1g0kvjc => '[钞票]@2x.png';
	String get k_1g65x7e => '[车厢]@2x.png';
	String get k_0e1tjol => '[打哈欠]@2x.png';
	String get k_1g65n58 => '[大兵]@2x.png';
	String get k_1g7se7o => '[大哭]@2x.png';
	String get k_1g03868 => '[蛋糕]@2x.png';
	String get k_1h8nm66 => '[刀]@2x.png';
	String get k_1g3dlpi => '[得意]@2x.png';
	String get k_1g3u434 => '[灯泡]@2x.png';
	String get k_1giuqs7 => '[凋谢]@2x.png';
	String get k_1g8r0r9 => '[多云]@2x.png';
	String get k_1g7k6i1 => '[发呆]@2x.png';
	String get k_1g44zsp => '[发抖]@2x.png';
	String get k_1g5l96i => '[飞机]@2x.png';
	String get k_1g7wsqj => '[飞吻]@2x.png';
	String get k_1g49luq => '[奋斗]@2x.png';
	String get k_1gixbsm => '[风车]@2x.png';
	String get k_1g6cqbq => '[尴尬]@2x.png';
	String get k_1g6jbw5 => '[勾引]@2x.png';
	String get k_1g3lwo1 => '[鼓掌]@2x.png';
	String get k_1g13nkj => '[害羞]@2x.png';
	String get k_1g0mt47 => '[憨笑]@2x.png';
	String get k_0bxujkf => '[红灯笼]@2x.png';
	String get k_0hhaeh8 => '[红双喜]@2x.png';
	String get k_1g0jnts => '[坏笑]@2x.png';
	String get k_1g46g9c => '[挥手]@2x.png';
	String get k_1g4vi9g => '[回头]@2x.png';
	String get k_1gf7hes => '[饥饿]@2x.png';
	String get k_1g6mvsm => '[激动]@2x.png';
	String get k_1gku5mf => '[街舞]@2x.png';
	String get k_1g4hidg => '[惊恐]@2x.png';
	String get k_1gjbrtu => '[惊讶]@2x.png';
	String get k_1g6sand => '[咖啡]@2x.png';
	String get k_1g4s8rj => '[磕头]@2x.png';
	String get k_1g1wn34 => '[可爱]@2x.png';
	String get k_1g3l0wd => '[可怜]@2x.png';
	String get k_1ggaon9 => '[抠鼻]@2x.png';
	String get k_1ggvcb0 => '[骷髅]@2x.png';
	String get k_1h8yqjt => '[酷]@2x.png';
	String get k_0jac97i => '[快哭了]@2x.png';
	String get k_1h8oiby => '[困]@2x.png';
	String get k_1g0s5hg => '[蜡烛]@2x.png';
	String get k_1g1iuer => '[篮球]@2x.png';
	String get k_1g2xjfi => '[冷汗]@2x.png';
	String get k_0s5oyqw => '[礼品袋]@2x.png';
	String get k_1g1qqvf => '[礼物]@2x.png';
	String get k_1g2slew => '[流汗]@2x.png';
	String get k_1g3z9xx => '[流泪]@2x.png';
	String get k_1g6pabn => '[麻将]@2x.png';
	String get k_0pkaxul => '[麦克风]@2x.png';
	String get k_1g7m0zj => '[猫咪]@2x.png';
	String get k_0ibvtpo => '[么么哒]@2x.png';
	String get k_1g1hoh1 => '[玫瑰]@2x.png';
	String get k_1gfzeow => '[米饭]@2x.png';
	String get k_1g5l15p => '[面条]@2x.png';
	String get k_1g2hfa6 => '[奶瓶]@2x.png';
	String get k_1gix9pj => '[难过]@2x.png';
	String get k_1giqn6g => '[闹钟]@2x.png';
	String get k_1h8kd64 => '[怒]@2x.png';
	String get k_1g0vui9 => '[怄火]@2x.png';
	String get k_1g1jsj7 => '[皮球]@2x.png';
	String get k_1ghdluw => '[啤酒]@2x.png';
	String get k_1gl6ec7 => '[瓢虫]@2x.png';
	String get k_1g7gg5p => '[撇嘴]@2x.png';
	String get k_1g8psin => '[乒乓]@2x.png';
	String get k_1gjzu3p => '[汽车]@2x.png';
	String get k_1h8mr0k => '[强]@2x.png';
	String get k_1g45y2n => '[敲打]@2x.png';
	String get k_1gkaxsl => '[青蛙]@2x.png';
	String get k_0jcfnoo => '[糗大了]@2x.png';
	String get k_1g4njy1 => '[拳头]@2x.png';
	String get k_1h8mqr3 => '[弱]@2x.png';
	String get k_1h926fg => '[色]@2x.png';
	String get k_1g6rtbq => '[沙发]@2x.png';
	String get k_1giirh6 => '[删除]@2x.png';
	String get k_1g14ny9 => '[闪电]@2x.png';
	String get k_1g6bmsr => '[胜利]@2x.png';
	String get k_1g1rytx => '[示爱]@2x.png';
	String get k_1g52fbz => '[手枪]@2x.png';
	String get k_1h90dam => '[衰]@2x.png';
	String get k_1gigiae => '[睡觉]@2x.png';
	String get k_1gijchz => '[太阳]@2x.png';
	String get k_1g1sgji => '[跳绳]@2x.png';
	String get k_1gjwuri => '[跳跳]@2x.png';
	String get k_1g0juhk => '[偷笑]@2x.png';
	String get k_1h8nzla => '[吐]@2x.png';
	String get k_1g6cv0i => '[委屈]@2x.png';
	String get k_1g46l5g => '[握手]@2x.png';
	String get k_1g2pgkd => '[西瓜]@2x.png';
	String get k_1ging9p => '[下雨]@2x.png';
	String get k_1h8nzil => '[吓]@2x.png';
	String get k_1g7q7wr => '[献吻]@2x.png';
	String get k_1gl6uum => '[香蕉]@2x.png';
	String get k_1g23fys => '[象棋]@2x.png';
	String get k_0j75rdh => '[心碎了]@2x.png';
	String get k_1g6ajj2 => '[信封]@2x.png';
	String get k_1g21prz => '[熊猫]@2x.png';
	String get k_1h8octi => '[嘘]@2x.png';
	String get k_1h91zox => '[药]@2x.png';
	String get k_1ghttfl => '[疑问]@2x.png';
	String get k_1ghk7sz => '[阴险]@2x.png';
	String get k_0gl37zz => '[右车头]@2x.png';
	String get k_0ifkj1p => '[右哼哼]@2x.png';
	String get k_0g1yh2e => '[右太极]@2x.png';
	String get k_1g9dkfc => '[雨伞]@2x.png';
	String get k_1g8jl88 => '[月亮]@2x.png';
	String get k_1h8lhqj => '[晕]@2x.png';
	String get k_1gi9x2q => '[再见]@2x.png';
	String get k_1g6dwwv => '[炸弹]@2x.png';
	String get k_1fzmkfi => '[折磨]@2x.png';
	String get k_1g6jbiw => '[纸巾]@2x.png';
	String get k_1ggjnwu => '[咒骂]@2x.png';
	String get k_1g4qlq8 => '[猪头]@2x.png';
	String get k_1g1lqzz => '[抓狂]@2x.png';
	String get k_1g80j3u => '[转圈]@2x.png';
	String get k_1g0z55s => '[龇牙]@2x.png';
	String get k_1g3ju6v => '[钻戒]@2x.png';
	String get k_0gl51l6 => '[左车头]@2x.png';
	String get k_0iflllk => '[左哼哼]@2x.png';
	String get k_0g1y3ir => '[左太极]@2x.png';
	String get k_026hiq5 => '消息列表加载中';
	String get k_003tu8k => '爱你';
	String get k_003myvp => '傲慢';
	String get k_003kddw => '白眼';
	String get k_039yfhv => '棒棒糖';
	String get k_003nu3p => '抱抱';
	String get k_003nijr => '抱拳';
	String get k_003mg88 => '爆筋';
	String get k_002v17e => '鄙视';
	String get k_003qhy4 => '闭嘴';
	String get k_003l5fq => '鞭炮';
	String get k_003uacl => '便便';
	String get k_003oq1g => '擦汗';
	String get k_003qvey => '彩带';
	String get k_003jci7 => '彩球';
	String get k_003pyu1 => '菜刀';
	String get k_003q97d => '差劲';
	String get k_003po5d => '车厢';
	String get k_03eadb2 => '打哈欠';
	String get k_003pnuf => '大兵';
	String get k_003kg57 => '蛋糕';
	String get k_003mxkt => '得意';
	String get k_003onu3 => '灯泡';
	String get k_002uv8s => '凋谢';
	String get k_003kqy0 => '调皮';
	String get k_003tyum => '多云';
	String get k_003pv9u => '发呆';
	String get k_036o6mu => '发抖t';
	String get k_003nogx => '飞机';
	String get k_003q7wg => '飞吻';
	String get k_003m0jd => '奋斗';
	String get k_002ult9 => '风车';
	String get k_003r8gt => '尴尬';
	String get k_003qy4u => '勾引';
	String get k_003mnoa => '鼓掌';
	String get k_003lmw8 => '害羞';
	String get k_003mb30 => '憨笑';
	String get k_03bj41g => '红灯笼';
	String get k_03dxw2f => '红双喜';
	String get k_003mk57 => '坏笑';
	String get k_003nmvf => '挥手';
	String get k_003r2i7 => '回头';
	String get k_002s6f3 => '饥饿';
	String get k_003qd0t => '激动';
	String get k_002vgi4 => '街舞';
	String get k_003nz33 => '惊恐';
	String get k_002wh4p => '惊讶';
	String get k_003ozpu => '咖啡';
	String get k_003qvs4 => '磕头';
	String get k_003l3wb => '可爱';
	String get k_003nuwm => '可怜';
	String get k_002rw1q => '抠鼻';
	String get k_002tujb => '骷髅';
	String get k_00030eq => '酷';
	String get k_03i8ath => '快哭了';
	String get k_000421h => '困';
	String get k_003l5i7 => '蜡烛';
	String get k_003j72g => '篮球';
	String get k_003ofwl => '冷汗';
	String get k_02mw65v => '礼品袋';
	String get k_003ku40 => '礼物';
	String get k_003ookz => '流汗';
	String get k_003on72 => '流泪';
	String get k_003rjy0 => '麻将';
	String get k_003q2f8 => '猫咪';
	String get k_03et393 => '么么哒';
	String get k_003j7j2 => '玫瑰';
	String get k_002sr0b => '米饭';
	String get k_003nnza => '面条';
	String get k_003jef9 => '奶瓶';
	String get k_002umn0 => '难过';
	String get k_002rjib => '闹钟';
	String get k_0003zcn => '怒';
	String get k_003jzwq => '怄火';
	String get k_003j4js => '皮球';
	String get k_002r5ir => '啤酒';
	String get k_002ubu4 => '瓢虫';
	String get k_003ppo6 => '撇嘴';
	String get k_003ty3o => '乒乓';
	String get k_002vxwe => '汽车';
	String get k_00043hb => '强';
	String get k_003nmbo => '敲打';
	String get k_002tfhq => '青蛙';
	String get k_03i7lrn => '糗大了';
	String get k_003r03m => '拳头';
	String get k_00043h0 => '弱';
	String get k_000345z => '色';
	String get k_003qmp9 => '沙发';
	String get k_003it8a => '闪电';
	String get k_003pxow => '胜利';
	String get k_003kw8e => '示爱';
	String get k_003n99g => '手枪';
	String get k_00035cl => '衰';
	String get k_002vl3h => '睡觉';
	String get k_002rgqk => '太阳';
	String get k_003m9d1 => '跳绳';
	String get k_002vobp => '跳跳';
	String get k_003mkoz => '偷笑';
	String get k_00041px => '吐';
	String get k_003rjh5 => '委屈';
	String get k_003j36u => '西瓜';
	String get k_002re92 => '下雨';
	String get k_00041py => '吓';
	String get k_003q06o => '献吻';
	String get k_002ubjp => '香蕉';
	String get k_003o2tr => '象棋';
	String get k_03ie6pa => '心碎了';
	String get k_003rao5 => '信封';
	String get k_003l3us => '熊猫';
	String get k_000424d => '嘘';
	String get k_00033yi => '药';
	String get k_002qtyy => '疑问';
	String get k_002qe0o => '阴险';
	String get k_03gu7us => '右车头';
	String get k_03ere8m => '右哼哼';
	String get k_003uqk3 => '雨伞';
	String get k_003tzdv => '月亮';
	String get k_0003z00 => '晕';
	String get k_002vdrd => '再见';
	String get k_003ra1w => '炸弹';
	String get k_003lcad => '折磨';
	String get k_003q7sz => '纸巾';
	String get k_002thn9 => '咒骂';
	String get k_003qx7f => '猪头';
	String get k_003l044 => '抓狂';
	String get k_003qg4h => '转圈';
	String get k_003kb97 => '龇牙';
	String get k_03gu53l => '左车头';
	String get k_03erd1f => '左哼哼';
	String get k_003nyvl => '爱情';
	String get k_003r85z => '爱心';
	String get k_003mk8j => '钞票';
	String get k_003pwfj => '大哭';
	String get k_00042w5 => '刀';
	String get k_003nmtr => '握手';
	String get k_03c529p => '右太极';
	String get k_003n4mk => '钻戒';
	String get k_03c5488 => '左太极';
	String get k_1llp7tu => '该用户不存在';
	String get k_0tbyqyb => '加载中…';
	String get k_0td1p3f => '保存中…';
	String get k_1klqdh1 => '仅限汉字、英文、数字和下划线';
	String get k_03el5lp => '未填写';
	String get k_1ui0gai => '搜索指定内容';
	String get k_003nvk2 => '消息';
	String get k_03agld7 => '群提示';
	String get k_0elt0kw => '添加群聊';
	String get k_0s3sgel => '移出黑名单';
	String k_1qqgjra({required Object option3}) => '$option3条未读消息';
	String get k_0uubyjr => '以下为未读消息';
	String get k_16as7eq => '表情回应';
	String get k_003s12u => '回复';
	String get k_003s38r => '更多';
	String get k_002wkr3 => '翻译';
	String get k_13g4hxv => '翻译完成';
	String get k_003molk => '表情';
	String get k_165bbw6 => '消息历史';
	String get k_13sqc0z => '清除消息';
	String get k_0glns86 => '删除会话';
	String get k_13s99rx => '清空消息';
	String get k_11vsa3j => '退出群组';
	String get k_11vvszp => '解散群组';
	String get k_15i9w72 => '群管理员';
	String get k_0p3espj => '设置备注名';
	String get k_118sw9v => '立即搜索';
	String get k_0h20hg5 => '视频通话';
	String get k_0h22snw => '语音通话';
	String get k_003lz6t => '对方';
	String k_1xf4yre({required Object option1}) => '发送给$option1';
	String get k_003por5 => '截图';
	String get k_1rw7s82 => ' 访问相册中视频权限，以正常使用发送视频等功能。';
	String get k_003rcwm => '打开';
	String get k_1698c42 => '在访达中打开';
	String get k_066fxsz => '查看文件夹';
	String get k_0k432y2 => '无法发送，包含文件夹';
	String get k_002wb4y => '会话';
	String get k_0od4qyh => '视频文件异常';
	String get k_1bfkxg9 => '不支持 0KB 文件的传输';
	String get k_0vvsw7g => '文件处理异常';
	String get k_06e224q => '[消息被管理员撤回]';
	String get k_1u1mjcl => '[消息被撤回]';
	String get k_1qcqxea => '选择多个会话';
	String get k_1qgmc20 => '选择一个会话';
	String get k_1d8nx6f => '在新窗口中打开';
	String get k_1hz05ax => '正在下载原始资源，请稍候...';
	String get k_002robo => '清除';
}

// Path: <root>
class _StringsZhHans implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsZhHans.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsZhHans _root = this; // ignore: unused_field

	// Translations
}

// Path: <root>
class _StringsZhHant implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsZhHant.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsZhHant _root = this; // ignore: unused_field

	// Translations
	@override String get k_1yemzyd => '收到一條訊息';
	@override String get k_0ylosxn => '自定義訊息';
	@override String get k_13sajrj => '貼圖訊息';
	@override String get k_13sjeb7 => '檔案訊息';
	@override String get k_0yd2ft8 => '群提示訊息';
	@override String get k_13s7mxn => '圖片訊息';
	@override String get k_13satlt => '位置訊息';
	@override String get k_00bbtsx => '合並轉發訊息';
	@override String get k_13sqwu4 => '語音訊息';
	@override String get k_13sqjjp => '影片';
	@override String get k_1fdhj9g => '該版本不支持此訊息';
	@override String get k_06pujtm => '同意任何用戶添加好友';
	@override String get k_0gyhkp5 => '需要驗證';
	@override String get k_121ruco => '拒絕任何人加好友';
	@override String get k_05nspni => '自定義字段';
	@override String get k_03fchyy => '群頭像';
	@override String get k_03i9mfe => '群簡介';
	@override String get k_03agq58 => '群名稱';
	@override String get k_039xqny => '群通知';
	@override String get k_003tr0a => '群主';
	@override String k_03iqsh4({required Object s}) => '$s為 ';
	@override String k_191t5n4({required Object opUserNickName}) => '$opUserNickName修改';
	@override String k_1pg6aoj({required Object opUserNickName}) => '$opUserNickName退出群組';
	@override String k_1f6zt3v({required Object invitedMemberString}) => '邀請$invitedMemberString加入群組';
	@override String k_0y7zd07({required Object invitedMemberString}) => '將$invitedMemberString踢出群組';
	@override String get k_03c49qt => '去授權';
	@override String k_1d5mshh({required Object joinedMemberString}) => '用戶$joinedMemberString加入了群組';
	@override String get k_002wddw => '禁言';
	@override String get k_0got6f7 => '解除禁言';
	@override String k_0yenqf0({required Object userName}) => '$userName 被';
	@override String k_0spotql({required Object adminMember}) => '將 $adminMember 設置為管理員';
	@override String k_0pg5zzj({required Object operationType}) => '系統訊息 $operationType';
	@override String k_0ohzb9l({required Object callTime}) => '通話時間：$callTime';
	@override String get k_1uaqed6 => '[自定義]';
	@override String get k_0z2z7rx => '[語音]';
	@override String get k_0y39ngu => '[貼圖]';
	@override String k_1c7z88n({required Object fileName}) => '[檔案] $fileName';
	@override String get k_0y1a2my => '[圖片]';
	@override String get k_0z4fib8 => '[影片]';
	@override String get k_0y24mcg => '[位置]';
	@override String get k_0pewpd1 => '[聊天記錄]';
	@override String get k_13s8d9p => '未知訊息';
	@override String get k_1c3us5n => '當前群組不支持@全體成員';
	@override String get k_11k579v => '發言中有非法語句';
	@override String get k_003qkx2 => '日歷';
	@override String get k_003n2pz => '相機';
	@override String get k_03idjo0 => '聯絡人';
	@override String get k_003ltgm => '位置';
	@override String get k_02k3k86 => '咪高風';
	@override String get k_003pm7l => '相冊';
	@override String get k_15ao57x => '相冊寫入';
	@override String get k_164m3jd => '本地存儲';
	@override String k_0qba4ns({required Object yoursItem}) => '想訪問您的$yoursItem';
	@override String get k_03r6qyx => '我們需要您的同意才能獲取信息';
	@override String get k_02noktt => '不允許';
	@override String get k_00043x4 => '好';
	@override String get k_003qzac => '昨天';
	@override String get k_003r39d => '前天';
	@override String get k_03fqp9o => '星期天';
	@override String get k_03ibg5h => '星期一';
	@override String get k_03i7hu1 => '星期二';
	@override String get k_03iaiks => '星期三';
	@override String get k_03el9pa => '星期四';
	@override String get k_03i7ok1 => '星期五';
	@override String get k_03efxyg => '星期六';
	@override String k_0oozw9x({required Object diffMinutes}) => '$diffMinutes 分鐘前';
	@override String get k_003q7ba => '下午';
	@override String get k_003q7bb => '上午';
	@override String get k_003pu3h => '現在';
	@override String k_13hzn00({required Object yesterday}) => '昨天 $yesterday';
	@override String get k_0n9pyxz => '用戶不存在';
	@override String get k_1bjwemh => '搜尋用戶 ID';
	@override String get k_003kv3v => '搜尋';
	@override String k_02owlq8({required Object userID}) => '我的用戶ID: $userID';
	@override String k_1wu8h4x({required Object showName}) => '我是: $showName';
	@override String get k_16758qw => '添加好友';
	@override String k_1shx4d9({required Object selfSignature}) => '個性簽名: $selfSignature';
	@override String get k_0i553x0 => '填寫驗證信息';
	@override String get k_031ocwx => '請填寫備註和分組';
	@override String get k_003ojje => '備註';
	@override String get k_003lsav => '分組';
	@override String get k_167bdvq => '我的好友';
	@override String get k_156b4ut => '好友申請已發送';
	@override String get k_002r305 => '發送';
	@override String get k_03gu05e => '聊天室';
	@override String get k_03b4f3p => '會議群';
	@override String get k_03avj1p => '公開群';
	@override String get k_03asq2g => '工作群';
	@override String get k_03b3hbi => '未知群';
	@override String k_1loix7s({required Object groupType}) => '群類型: $groupType';
	@override String get k_1lqbsib => '該群組不存在';
	@override String get k_03h153m => '搜尋群ID';
	@override String get k_0oxak3r => '群申請已發送';
	@override String get k_002rflt => '刪除';
	@override String get k_1don84v => '無法定位到原訊息';
	@override String get k_003q5fi => '復製';
	@override String get k_003prq0 => '轉發';
	@override String get k_002r1h2 => '多選';
	@override String get k_003j708 => '引用';
	@override String get k_003pqpr => '回收';
	@override String get k_03ezhho => '已復製';
	@override String get k_11ctfsz => '暫未實現';
	@override String get k_1hbjg5g => '[群系統訊息]';
	@override String get k_03tvswb => '[未知訊息]';
	@override String get k_155cj23 => '您回收了一條訊息，';
	@override String get k_0gapun3 => '重新編輯';
	@override String k_1uh417q({required Object displayName}) => '$displayName回收了一條訊息';
	@override String get k_1aszp2k => '您確定要重發這條訊息麽？';
	@override String get k_003rzap => '確定';
	@override String get k_003nevv => '取消';
	@override String get k_0003z7x => '您';
	@override String get k_002wfe4 => '已讀';
	@override String get k_002wjlg => '未讀';
	@override String get k_0h1ygf8 => '發起通話';
	@override String get k_0h169j0 => '取消通話';
	@override String get k_0h13jjk => '接受通話';
	@override String get k_0h19hfx => '拒絕通話';
	@override String get k_0obi9lh => '超時未接聽';
	@override String k_0y9u662({required Object appName}) => '「$appName」暫不可以開啟此類檔案，你可以使用其他應用開啟並預覽';
	@override String get k_001nmhu => '用其他應用開啟';
	@override String get k_1ht1b80 => '正在接收中';
	@override String get k_105682d => '圖片載入失敗';
	@override String get k_0pytyeu => '圖片保存成功';
	@override String get k_0akceel => '圖片保存失敗';
	@override String get k_003rk1s => '保存';
	@override String get k_04a0awq => '[語音訊息]';
	@override String get k_105c3y3 => '影片載入失敗';
	@override String get k_176rzr7 => '聊天記錄';
	@override String get k_0d5z4m5 => '選擇提醒人';
	@override String get k_003ngex => '完成';
	@override String get k_1665ltg => '發起呼叫';
	@override String get k_003n8b0 => '拍攝';
	@override String get k_003kthh => '照片';
	@override String get k_003tnp0 => '檔案';
	@override String get k_0jhdhtp => '發送失敗,影片不能大於100MB';
	@override String get k_119ucng => '圖片不能為空';
	@override String k_0w9x8gw({required Object successPath}) => '選擇成功$successPath';
	@override String get k_13dsw4l => '松開取消';
	@override String get k_0am7r68 => '手指上滑，取消發送';
	@override String get k_15jl6qw => '說話時間太短!';
	@override String get k_0gx7vl6 => '按住說話';
	@override String get k_15dlafd => '逐條轉發';
	@override String get k_15dryxy => '合並轉發';
	@override String get k_1eyhieh => '確定刪除已選訊息';
	@override String get k_17fmlyf => '清除聊天';
	@override String get k_0dhesoz => '取消置頂';
	@override String get k_002sk7x => '置頂';
	@override String get k_003ll77 => '草稿';
	@override String get k_03icaxo => '自定義';
	@override String k_1969986({required Object callingLastMsgShow}) => '[語音通話]：$callingLastMsgShow';
	@override String k_1960dlr({required Object callingLastMsgShow}) => '[視訊通話]：$callingLastMsgShow';
	@override String k_1np495n({required Object messageString}) => '$messageString[有人@我]';
	@override String k_1m797yi({required Object messageString}) => '$messageString[@所有人]';
	@override String get k_1uaov41 => '查找聊天內容';
	@override String get k_003kfai => '未知';
	@override String get k_13dq4an => '自動審批';
	@override String get k_0l13cde => '管理員審批';
	@override String get k_11y8c6a => '禁止加群';
	@override String get k_1kvyskd => '無網絡連接，無法修改';
	@override String get k_16payqf => '加群方式';
	@override String get k_0vzvn8r => '修改群名稱';
	@override String get k_038lh6u => '群管理';
	@override String get k_0k5wyiy => '設置管理員';
	@override String get k_0goiuwk => '全員禁言';
	@override String get k_1g889xx => '全員禁言開啟後，只允許群主和管理員發言。';
	@override String get k_0wlrefq => '添加需要禁言的群成員';
	@override String get k_0goox5g => '設置禁言';
	@override String get k_08daijh => '成功取消管理員身份';
	@override String k_0bxm97s({required Object adminNum}) => '管理員 ($adminNum/10)';
	@override String get k_0k5u935 => '添加管理員';
	@override String get k_03enyx5 => '群成員';
	@override String k_0jayw3z({required Object groupMemberNum}) => '群成員($groupMemberNum人)';
	@override String get k_0h1svv1 => '刪除群成員';
	@override String get k_0h1g636 => '添加群成員';
	@override String get k_0uj7208 => '無網絡連接，無法查看群成員';
	@override String k_01yfa4o({required Object memberCount}) => '$memberCount人';
	@override String get k_0hpukyx => '查看更多群成員';
	@override String get k_0qtsar0 => '訊息免打擾';
	@override String get k_0ef2a12 => '修改我的群昵稱';
	@override String get k_1aajych => '僅限中文、字母、數字和下劃線，2-20個字';
	@override String get k_137pab5 => '我的群昵稱';
	@override String get k_0ivim6d => '暫無群公告';
	@override String get k_03eq6cn => '群公告';
	@override String get k_002vxya => '編輯';
	@override String get k_17fpl3y => '置頂聊天';
	@override String get k_03es1ox => '群類型';
	@override String get k_003mz1i => '同意';
	@override String get k_003lpre => '拒絕';
	@override String get k_003qk66 => '頭像';
	@override String get k_003lhvk => '昵稱';
	@override String get k_003ps50 => '賬號';
	@override String get k_15lx52z => '個性簽名';
	@override String get k_003qgkp => '性別';
	@override String get k_003m6hr => '生日';
	@override String get k_0003v6a => '男';
	@override String get k_00043x2 => '女';
	@override String get k_03bcjkv => '未設置';
	@override String get k_11s0gdz => '修改昵稱';
	@override String get k_0p3j4sd => '僅限中字、字母、數字和下劃線';
	@override String get k_15lyvdt => '修改簽名';
	@override String get k_0vylzjp => '這個人很懶，什麽也沒寫';
	@override String get k_1hs7ese => '等上線再改這個';
	@override String get k_03exjk7 => '備註名';
	@override String get k_0s3skfd => '加入黑名單';
	@override String get k_0p3b31s => '修改備註名';
	@override String get k_0003y9x => '無';
	@override String get k_11zgnfs => '個人資料';
	@override String k_03xd79d({required Object signature}) => '個性簽名: $signature';
	@override String get k_1tez2xl => '暫無個性簽名';
	@override String get k_118prbn => '全局搜尋';
	@override String get k_1m9dftc => '全部聯絡人';
	@override String get k_0em4gyz => '全部群組';
	@override String get k_002twmj => '群組';
	@override String get k_09kga0d => '更多聊天記錄';
	@override String k_1ui5lzi({required Object count}) => '$count條相關聊天記錄';
	@override String get k_09khmso => '相關聊天記錄';
	@override String k_1kevf4k({required Object receiver}) => '與$receiver的聊天記錄';
	@override String get k_0vjj2kp => '群組的聊天記錄';
	@override String get k_003n2rp => '選擇';
	@override String get k_03ignw6 => '所有人';
	@override String get k_03erpei => '管理員';
	@override String get k_0qi9tno => '群主、管理員';
	@override String get k_1m9exwh => '最近聯絡人';
	@override String get k_119nwqr => '輸入不能為空';
	@override String get k_0pzwbmg => '影片保存成功';
	@override String get k_0aktupv => '影片保存失敗';
	@override String k_1qbg9xc({required Object option8}) => '$option8為 ';
	@override String k_1wq5ubm({required Object option7}) => '$option7修改';
	@override String k_0y5pu80({required Object option6}) => '$option6退出群組';
	@override String k_0nl7cmd({required Object option5}) => '邀請$option5加入群組';
	@override String k_1ju5iqw({required Object option4}) => '將$option4踢出群組';
	@override String k_1ovt677({required Object option3}) => '用戶$option3加入了群組';
	@override String k_0k05b8b({required Object option2}) => '$option2 被';
	@override String k_0wm4xeb({required Object option2}) => '系統訊息 $option2';
	@override String k_0nbq9v3({required Object option2}) => '通話時間：$option2';
	@override String k_0i1kf53({required Object option2}) => '[檔案] $option2';
	@override String k_1gnnby6({required Object option2}) => '想訪問您的$option2';
	@override String k_1wh4atg({required Object option2}) => '$option2 分鐘前';
	@override String k_07sh7g1({required Object option2}) => '昨天 $option2';
	@override String k_1pj8xzh({required Object option2}) => '我的用戶ID: $option2';
	@override String k_0py1evo({required Object option2}) => '個性簽名: $option2';
	@override String k_1kvj4i2({required Object option2}) => '$option2回收了一條訊息';
	@override String k_1v0lbpp({required Object option2}) => '「$option2」暫不可以開啟此類檔案，你可以使用其他應用開啟並預覽';
	@override String k_0torwfz({required Object option2}) => '選擇成功$option2';
	@override String k_0i1bjah({required Object option1}) => '$option1回收了一條訊息';
	@override String k_1qzxh9q({required Object option3}) => '通話時間：$option3';
	@override String k_0wrgmom({required Object option1}) => '[語音通話]：$option1';
	@override String k_06ix2f0({required Object option2}) => '[視訊通話]：$option2';
	@override String k_08o3z5w({required Object option1}) => '[檔案] $option1';
	@override String k_0ezbepg({required Object option2}) => '$option2[有人@我]';
	@override String k_1ccnht1({required Object option2}) => '$option2[@所有人]';
	@override String k_1k3arsw({required Object option2}) => '管理員 ($option2/10)';
	@override String k_1d4golg({required Object option1}) => '群成員($option1人)';
	@override String k_1bg69nt({required Object option1}) => '$option1人';
	@override String k_00gjqxj({required Object option1}) => '個性簽名: $option1';
	@override String k_0c29cxr({required Object option1}) => '$option1條相關聊天記錄';
	@override String k_1twk5rz({required Object option1}) => '與$option1的聊天記錄';
	@override String k_1vn4xq1({required Object adminMember}) => '將 $adminMember 取消管理員';
	@override String get k_0e35hsw => '為方便您將所拍攝的照片或影片發送給朋友，以及進行視訊通話，請允許我們訪問攝像頭進行拍攝照片和影片。';
	@override String get k_0dj6yr7 => '為方便您發送語音訊息、拍攝影片以及音視訊通話，請允許我們使用咪高風進行錄音。';
	@override String get k_003qnsl => '存儲';
	@override String get k_0s3rtpw => '為方便您查看和選擇相冊裏的圖片影片發送給朋友，以及保存內容到設備，請允許我們訪問您設備上的照片、媒體內容。';
	@override String k_0tezv85({required Object option2}) => ' 申請獲取$option2';
	@override String get k_002rety => '權限';
	@override String get k_18o68ro => '需要授予';
	@override String get k_1onpf8u => ' 相機權限，以正常使用拍攝圖片/影片、視訊通話等功能。';
	@override String get k_17irga5 => ' 咪高風權限，以正常使用發送語音訊息、拍攝影片、音視訊通話等功能。';
	@override String get k_0572kc4 => ' 訪問照片權限，以正常使用發送圖片、影片等功能。';
	@override String get k_0slykws => ' 訪問相冊寫入權限，以正常使用存儲圖片、影片等功能。';
	@override String get k_119pkcd => ' 檔案讀寫權限，以正常使用在聊天功能中的圖片查看、選擇能力和發送檔案的能力。';
	@override String get k_0gqewd3 => '以後再說';
	@override String get k_03eq4s1 => '去開啟';
	@override String get k_0nt2uyg => '回到最新位置';
	@override String k_04l16at({required Object option1}) => '$option1條新訊息';
	@override String get k_13p3w93 => '有人@我';
	@override String get k_18w5uk6 => '@所有人';
	@override String get k_0jmujgh => '其他檔案正在接收中';
	@override String get k_12s5ept => '訊息詳情';
	@override String k_0mxa4f4({required Object option1}) => '$option1人已讀';
	@override String k_061tue3({required Object option2}) => '$option2人未讀';
	@override String get k_18qjstb => '轉讓群主';
	@override String k_0on1aj2({required Object option2}) => '有$option2條@我訊息';
	@override String get k_09j4izl => '[有人@我] ';
	@override String get k_1oqtjw0 => '[@所有人] ';
	@override String k_1x5a9vb({required Object option1}) => '我是: $option1';
	@override String get k_14n31e7 => '進群請求';
	@override String k_08nc5j1({required Object option1}) => '群類型: $option1';
	@override String k_1josu12({required Object option1}) => '$option1 條入群請求';
	@override String k_0n2x5s0({required Object option2}) => '驗證消息: $option2';
	@override String get k_03c1nx0 => '已同意';
	@override String get k_03aw9w8 => '已拒絕';
	@override String get k_038ryos => '去處理';
	@override String get k_0gw8pum => '進群申請';
	@override String get k_1gcvfrj => '請填寫備註名';
	@override String get k_002v9zj => '确认';
	@override String get k_10oqrki => '轻触拍照';
	@override String get k_0f8b3ws => '加载失败';
	@override String get k_11cm5lm => '手动聚焦';
	@override String get k_002uzrd => '预览';
	@override String get k_003qkn3 => '录像';
	@override String get k_003k6a7 => '拍照';
	@override String get k_0bqpqco => '拍照按钮';
	@override String get k_1626ozl => '停止录像';
	@override String get k_003lvmu => '前置';
	@override String get k_003lued => '后置';
	@override String get k_003lwzh => '外置';
	@override String get k_002qzi3 => '关闭';
	@override String get k_003pufb => '自动';
	@override String get k_0apm0ze => '拍照时闪光';
	@override String get k_157zog5 => '始终闪光';
	@override String k_0cfyqhy({required Object option1}) => '$option1 画面预览';
	@override String k_0phctlz({required Object option2}) => '闪光模式: $option2';
	@override String k_02vfqe0({required Object option3}) => '切换至 $option3 摄像头';
	@override String get k_0f0y9ex => '说话时间太短';
	@override String get k_0ln70tk => '无法打开URL';
	@override String get k_11a3jdv => '轻触拍照，长按摄像';
	@override String get k_1k18miv => '请传入离开群组生命周期函数，提供返回首页或其他页面的导航方法。';
	@override String get k_1fu9ahv => '全员禁言状态';
	@override String get k_0gmwbnd => '全员禁言中';
	@override String get k_0got2zr => '您被禁言';
	@override String get k_0y9jck8 => '你必须自定义search bar，并处理点击跳转';
	@override String get k_0yum3tv => '如使用自定义区域，请在profileWidgetBuilder传入对应组件';
	@override String get k_09kalj0 => '清空聊天记录';
	@override String get k_14j5iul => '删除并退出';
	@override String get k_125ru1w => '解散该群';
	@override String get k_0jtutmw => '退出后不会接收到此群聊消息';
	@override String get k_0jtzmqa => '解散后不会接收到此群聊消息';
	@override String get k_0r8fi93 => '好友添加成功';
	@override String get k_02qw14e => '好友申请已发出';
	@override String get k_0n3md5x => '当前用户在黑名单';
	@override String get k_094phq4 => '好友添加失败';
	@override String get k_129scag => '好友删除成功';
	@override String get k_129uzfn => '好友删除失败';
	@override String get k_1666isy => '清除好友';
	@override String get k_1679vrd => '加为好友';
	@override String get k_1ualc52 => '看看对方带来的数据是啥';
	@override String get k_0szluvp => '设置对方在线状态';
	@override String get k_0f4rnf8 => '该用户已是好友';
	@override String get k_1tdkom4 => '您已是群成员';
	@override String get k_1p2lyuz => '对方正在输入中...';
	@override String k_1g8wfpy({required Object option1}) => '...共$option1人';
	@override String get k_12rv9vw => '回应详情';
	@override String k_0havgi0({required Object linkMessage}) => '[查看详情 >>](${linkMessage.link})';
	@override String get k_0n9p7g8 => '群组不存在';
	@override String get k_1tdh5vn => '您不是群成员';
	@override String get k_0h1q57v => '暂无群成员';
	@override String k_0y5drq1({required Object option1}) => '[查看详情 >>]($option1)';
	@override String get k_03pjp61 => '[表情消息]';
	@override String get k_1jpvzul => '[自定义消息]';
	@override String get k_03u3bh1 => '[文件消息]';
	@override String get k_1odsnsw => '[群消息]';
	@override String get k_03sel4t => '[图片消息]';
	@override String get k_03sfw3r => '[位置消息]';
	@override String get k_03xpuwq => '[合并消息]';
	@override String get k_07ycxwo => '[没有元素]';
	@override String get k_03rc9vz => '[文本消息]';
	@override String get k_046uopf => '[视频消息]';
	@override String get k_0ehmsun => '设备存储空间不足，建议清理，以获得更好使用体验';
	@override String get k_003kmos => '图片';
	@override String get k_002s86q => '视频';
	@override String get k_06bk5ei => '视频消息仅限 mp4 格式';
	@override String get k_13opfxf => 'Web网页端不支持搜索';
	@override String get k_1i0o0y2 => '暂时仅限 Android/iOS 端';
	@override String k_045dtzl({required Object option1}) => '$option1的聊天记录';
	@override String get k_0t0131u => '群资料信息';
	@override String get k_18ok8xz => '消息接收方式';
	@override String get k_03ax3ks => '群资料';
	@override String k_0sqvoqo({required Object option1}) => '将 $option1 设置为管理员';
	@override String k_1gbg1v8({required Object option1}) => '将 $option1 取消管理员';
	@override String get k_17k64g4 => '群聊创建成功！';
	@override String get k_05mn217 => '暂未安装表情包插件，如需使用表情相关功能，请根据本文档安装：https://cloud.tencent.com/document/product/269/70746';
	@override String get k_14j17nz => '暂无表情包';
	@override String get k_0fvjexh => '正在下载中';
	@override String get k_1cdagzz => '已加入待下载队列，其他文件下载中';
	@override String get k_0g4vojc => '开始下载';
	@override String get k_1g32es3 => '[调皮]@2x.png';
	@override String get k_1g8qorz => '[爱你]@2x.png';
	@override String get k_1g4hmx6 => '[爱情]@2x.png';
	@override String get k_1g6b558 => '[爱心]@2x.png';
	@override String get k_1g3m4su => '[傲慢]@2x.png';
	@override String get k_1g2jym7 => '[白眼]@2x.png';
	@override String get k_0cgkxuw => '[棒棒糖]@2x.png';
	@override String get k_1g48br2 => '[抱抱]@2x.png';
	@override String get k_1g49ol8 => '[抱拳]@2x.png';
	@override String get k_1g0ras3 => '[爆筋]@2x.png';
	@override String get k_1ghy881 => '[鄙视]@2x.png';
	@override String get k_1g86bmv => '[闭嘴]@2x.png';
	@override String get k_1g1xs1p => '[鞭炮]@2x.png';
	@override String get k_1g8i6ri => '[便便]@2x.png';
	@override String get k_1g2u5kf => '[擦汗]@2x.png';
	@override String get k_1g60uwh => '[彩带]@2x.png';
	@override String get k_1g1o0d0 => '[彩球]@2x.png';
	@override String get k_1g6a6yq => '[菜刀]@2x.png';
	@override String get k_1g6vqo2 => '[差劲]@2x.png';
	@override String get k_1g0kvjc => '[钞票]@2x.png';
	@override String get k_1g65x7e => '[车厢]@2x.png';
	@override String get k_0e1tjol => '[打哈欠]@2x.png';
	@override String get k_1g65n58 => '[大兵]@2x.png';
	@override String get k_1g7se7o => '[大哭]@2x.png';
	@override String get k_1g03868 => '[蛋糕]@2x.png';
	@override String get k_1h8nm66 => '[刀]@2x.png';
	@override String get k_1g3dlpi => '[得意]@2x.png';
	@override String get k_1g3u434 => '[灯泡]@2x.png';
	@override String get k_1giuqs7 => '[凋谢]@2x.png';
	@override String get k_1g8r0r9 => '[多云]@2x.png';
	@override String get k_1g7k6i1 => '[发呆]@2x.png';
	@override String get k_1g44zsp => '[发抖]@2x.png';
	@override String get k_1g5l96i => '[飞机]@2x.png';
	@override String get k_1g7wsqj => '[飞吻]@2x.png';
	@override String get k_1g49luq => '[奋斗]@2x.png';
	@override String get k_1gixbsm => '[风车]@2x.png';
	@override String get k_1g6cqbq => '[尴尬]@2x.png';
	@override String get k_1g6jbw5 => '[勾引]@2x.png';
	@override String get k_1g3lwo1 => '[鼓掌]@2x.png';
	@override String get k_1g13nkj => '[害羞]@2x.png';
	@override String get k_1g0mt47 => '[憨笑]@2x.png';
	@override String get k_0bxujkf => '[红灯笼]@2x.png';
	@override String get k_0hhaeh8 => '[红双喜]@2x.png';
	@override String get k_1g0jnts => '[坏笑]@2x.png';
	@override String get k_1g46g9c => '[挥手]@2x.png';
	@override String get k_1g4vi9g => '[回头]@2x.png';
	@override String get k_1gf7hes => '[饥饿]@2x.png';
	@override String get k_1g6mvsm => '[激动]@2x.png';
	@override String get k_1gku5mf => '[街舞]@2x.png';
	@override String get k_1g4hidg => '[惊恐]@2x.png';
	@override String get k_1gjbrtu => '[惊讶]@2x.png';
	@override String get k_1g6sand => '[咖啡]@2x.png';
	@override String get k_1g4s8rj => '[磕头]@2x.png';
	@override String get k_1g1wn34 => '[可爱]@2x.png';
	@override String get k_1g3l0wd => '[可怜]@2x.png';
	@override String get k_1ggaon9 => '[抠鼻]@2x.png';
	@override String get k_1ggvcb0 => '[骷髅]@2x.png';
	@override String get k_1h8yqjt => '[酷]@2x.png';
	@override String get k_0jac97i => '[快哭了]@2x.png';
	@override String get k_1h8oiby => '[困]@2x.png';
	@override String get k_1g0s5hg => '[蜡烛]@2x.png';
	@override String get k_1g1iuer => '[篮球]@2x.png';
	@override String get k_1g2xjfi => '[冷汗]@2x.png';
	@override String get k_0s5oyqw => '[礼品袋]@2x.png';
	@override String get k_1g1qqvf => '[礼物]@2x.png';
	@override String get k_1g2slew => '[流汗]@2x.png';
	@override String get k_1g3z9xx => '[流泪]@2x.png';
	@override String get k_1g6pabn => '[麻将]@2x.png';
	@override String get k_0pkaxul => '[麦克风]@2x.png';
	@override String get k_1g7m0zj => '[猫咪]@2x.png';
	@override String get k_0ibvtpo => '[么么哒]@2x.png';
	@override String get k_1g1hoh1 => '[玫瑰]@2x.png';
	@override String get k_1gfzeow => '[米饭]@2x.png';
	@override String get k_1g5l15p => '[面条]@2x.png';
	@override String get k_1g2hfa6 => '[奶瓶]@2x.png';
	@override String get k_1gix9pj => '[难过]@2x.png';
	@override String get k_1giqn6g => '[闹钟]@2x.png';
	@override String get k_1h8kd64 => '[怒]@2x.png';
	@override String get k_1g0vui9 => '[怄火]@2x.png';
	@override String get k_1g1jsj7 => '[皮球]@2x.png';
	@override String get k_1ghdluw => '[啤酒]@2x.png';
	@override String get k_1gl6ec7 => '[瓢虫]@2x.png';
	@override String get k_1g7gg5p => '[撇嘴]@2x.png';
	@override String get k_1g8psin => '[乒乓]@2x.png';
	@override String get k_1gjzu3p => '[汽车]@2x.png';
	@override String get k_1h8mr0k => '[强]@2x.png';
	@override String get k_1g45y2n => '[敲打]@2x.png';
	@override String get k_1gkaxsl => '[青蛙]@2x.png';
	@override String get k_0jcfnoo => '[糗大了]@2x.png';
	@override String get k_1g4njy1 => '[拳头]@2x.png';
	@override String get k_1h8mqr3 => '[弱]@2x.png';
	@override String get k_1h926fg => '[色]@2x.png';
	@override String get k_1g6rtbq => '[沙发]@2x.png';
	@override String get k_1giirh6 => '[删除]@2x.png';
	@override String get k_1g14ny9 => '[闪电]@2x.png';
	@override String get k_1g6bmsr => '[胜利]@2x.png';
	@override String get k_1g1rytx => '[示爱]@2x.png';
	@override String get k_1g52fbz => '[手枪]@2x.png';
	@override String get k_1h90dam => '[衰]@2x.png';
	@override String get k_1gigiae => '[睡觉]@2x.png';
	@override String get k_1gijchz => '[太阳]@2x.png';
	@override String get k_1g1sgji => '[跳绳]@2x.png';
	@override String get k_1gjwuri => '[跳跳]@2x.png';
	@override String get k_1g0juhk => '[偷笑]@2x.png';
	@override String get k_1h8nzla => '[吐]@2x.png';
	@override String get k_1g6cv0i => '[委屈]@2x.png';
	@override String get k_1g46l5g => '[握手]@2x.png';
	@override String get k_1g2pgkd => '[西瓜]@2x.png';
	@override String get k_1ging9p => '[下雨]@2x.png';
	@override String get k_1h8nzil => '[吓]@2x.png';
	@override String get k_1g7q7wr => '[献吻]@2x.png';
	@override String get k_1gl6uum => '[香蕉]@2x.png';
	@override String get k_1g23fys => '[象棋]@2x.png';
	@override String get k_0j75rdh => '[心碎了]@2x.png';
	@override String get k_1g6ajj2 => '[信封]@2x.png';
	@override String get k_1g21prz => '[熊猫]@2x.png';
	@override String get k_1h8octi => '[嘘]@2x.png';
	@override String get k_1h91zox => '[药]@2x.png';
	@override String get k_1ghttfl => '[疑问]@2x.png';
	@override String get k_1ghk7sz => '[阴险]@2x.png';
	@override String get k_0gl37zz => '[右车头]@2x.png';
	@override String get k_0ifkj1p => '[右哼哼]@2x.png';
	@override String get k_0g1yh2e => '[右太极]@2x.png';
	@override String get k_1g9dkfc => '[雨伞]@2x.png';
	@override String get k_1g8jl88 => '[月亮]@2x.png';
	@override String get k_1h8lhqj => '[晕]@2x.png';
	@override String get k_1gi9x2q => '[再见]@2x.png';
	@override String get k_1g6dwwv => '[炸弹]@2x.png';
	@override String get k_1fzmkfi => '[折磨]@2x.png';
	@override String get k_1g6jbiw => '[纸巾]@2x.png';
	@override String get k_1ggjnwu => '[咒骂]@2x.png';
	@override String get k_1g4qlq8 => '[猪头]@2x.png';
	@override String get k_1g1lqzz => '[抓狂]@2x.png';
	@override String get k_1g80j3u => '[转圈]@2x.png';
	@override String get k_1g0z55s => '[龇牙]@2x.png';
	@override String get k_1g3ju6v => '[钻戒]@2x.png';
	@override String get k_0gl51l6 => '[左车头]@2x.png';
	@override String get k_0iflllk => '[左哼哼]@2x.png';
	@override String get k_0g1y3ir => '[左太极]@2x.png';
	@override String get k_026hiq5 => '消息列表加载中';
	@override String get k_003tu8k => '爱你';
	@override String get k_003myvp => '傲慢';
	@override String get k_003kddw => '白眼';
	@override String get k_039yfhv => '棒棒糖';
	@override String get k_003nu3p => '抱抱';
	@override String get k_003nijr => '抱拳';
	@override String get k_003mg88 => '爆筋';
	@override String get k_002v17e => '鄙视';
	@override String get k_003qhy4 => '闭嘴';
	@override String get k_003l5fq => '鞭炮';
	@override String get k_003uacl => '便便';
	@override String get k_003oq1g => '擦汗';
	@override String get k_003qvey => '彩带';
	@override String get k_003jci7 => '彩球';
	@override String get k_003pyu1 => '菜刀';
	@override String get k_003q97d => '差劲';
	@override String get k_003po5d => '车厢';
	@override String get k_03eadb2 => '打哈欠';
	@override String get k_003pnuf => '大兵';
	@override String get k_003kg57 => '蛋糕';
	@override String get k_003mxkt => '得意';
	@override String get k_003onu3 => '灯泡';
	@override String get k_002uv8s => '凋谢';
	@override String get k_003kqy0 => '调皮';
	@override String get k_003tyum => '多云';
	@override String get k_003pv9u => '发呆';
	@override String get k_036o6mu => '发抖t';
	@override String get k_003nogx => '飞机';
	@override String get k_003q7wg => '飞吻';
	@override String get k_003m0jd => '奋斗';
	@override String get k_002ult9 => '风车';
	@override String get k_003r8gt => '尴尬';
	@override String get k_003qy4u => '勾引';
	@override String get k_003mnoa => '鼓掌';
	@override String get k_003lmw8 => '害羞';
	@override String get k_003mb30 => '憨笑';
	@override String get k_03bj41g => '红灯笼';
	@override String get k_03dxw2f => '红双喜';
	@override String get k_003mk57 => '坏笑';
	@override String get k_003nmvf => '挥手';
	@override String get k_003r2i7 => '回头';
	@override String get k_002s6f3 => '饥饿';
	@override String get k_003qd0t => '激动';
	@override String get k_002vgi4 => '街舞';
	@override String get k_003nz33 => '惊恐';
	@override String get k_002wh4p => '惊讶';
	@override String get k_003ozpu => '咖啡';
	@override String get k_003qvs4 => '磕头';
	@override String get k_003l3wb => '可爱';
	@override String get k_003nuwm => '可怜';
	@override String get k_002rw1q => '抠鼻';
	@override String get k_002tujb => '骷髅';
	@override String get k_00030eq => '酷';
	@override String get k_03i8ath => '快哭了';
	@override String get k_000421h => '困';
	@override String get k_003l5i7 => '蜡烛';
	@override String get k_003j72g => '篮球';
	@override String get k_003ofwl => '冷汗';
	@override String get k_02mw65v => '礼品袋';
	@override String get k_003ku40 => '礼物';
	@override String get k_003ookz => '流汗';
	@override String get k_003on72 => '流泪';
	@override String get k_003rjy0 => '麻将';
	@override String get k_003q2f8 => '猫咪';
	@override String get k_03et393 => '么么哒';
	@override String get k_003j7j2 => '玫瑰';
	@override String get k_002sr0b => '米饭';
	@override String get k_003nnza => '面条';
	@override String get k_003jef9 => '奶瓶';
	@override String get k_002umn0 => '难过';
	@override String get k_002rjib => '闹钟';
	@override String get k_0003zcn => '怒';
	@override String get k_003jzwq => '怄火';
	@override String get k_003j4js => '皮球';
	@override String get k_002r5ir => '啤酒';
	@override String get k_002ubu4 => '瓢虫';
	@override String get k_003ppo6 => '撇嘴';
	@override String get k_003ty3o => '乒乓';
	@override String get k_002vxwe => '汽车';
	@override String get k_00043hb => '强';
	@override String get k_003nmbo => '敲打';
	@override String get k_002tfhq => '青蛙';
	@override String get k_03i7lrn => '糗大了';
	@override String get k_003r03m => '拳头';
	@override String get k_00043h0 => '弱';
	@override String get k_000345z => '色';
	@override String get k_003qmp9 => '沙发';
	@override String get k_003it8a => '闪电';
	@override String get k_003pxow => '胜利';
	@override String get k_003kw8e => '示爱';
	@override String get k_003n99g => '手枪';
	@override String get k_00035cl => '衰';
	@override String get k_002vl3h => '睡觉';
	@override String get k_002rgqk => '太阳';
	@override String get k_003m9d1 => '跳绳';
	@override String get k_002vobp => '跳跳';
	@override String get k_003mkoz => '偷笑';
	@override String get k_00041px => '吐';
	@override String get k_003rjh5 => '委屈';
	@override String get k_003j36u => '西瓜';
	@override String get k_002re92 => '下雨';
	@override String get k_00041py => '吓';
	@override String get k_003q06o => '献吻';
	@override String get k_002ubjp => '香蕉';
	@override String get k_003o2tr => '象棋';
	@override String get k_03ie6pa => '心碎了';
	@override String get k_003rao5 => '信封';
	@override String get k_003l3us => '熊猫';
	@override String get k_000424d => '嘘';
	@override String get k_00033yi => '药';
	@override String get k_002qtyy => '疑问';
	@override String get k_002qe0o => '阴险';
	@override String get k_03gu7us => '右车头';
	@override String get k_03ere8m => '右哼哼';
	@override String get k_003uqk3 => '雨伞';
	@override String get k_003tzdv => '月亮';
	@override String get k_0003z00 => '晕';
	@override String get k_002vdrd => '再见';
	@override String get k_003ra1w => '炸弹';
	@override String get k_003lcad => '折磨';
	@override String get k_003q7sz => '纸巾';
	@override String get k_002thn9 => '咒骂';
	@override String get k_003qx7f => '猪头';
	@override String get k_003l044 => '抓狂';
	@override String get k_003qg4h => '转圈';
	@override String get k_003kb97 => '龇牙';
	@override String get k_03gu53l => '左车头';
	@override String get k_03erd1f => '左哼哼';
	@override String get k_003nyvl => '爱情';
	@override String get k_003r85z => '爱心';
	@override String get k_003mk8j => '钞票';
	@override String get k_003pwfj => '大哭';
	@override String get k_00042w5 => '刀';
	@override String get k_003nmtr => '握手';
	@override String get k_03c529p => '右太极';
	@override String get k_003n4mk => '钻戒';
	@override String get k_03c5488 => '左太极';
	@override String get k_1llp7tu => '该用户不存在';
	@override String get k_0tbyqyb => '加载中…';
	@override String get k_0td1p3f => '保存中…';
	@override String get k_1klqdh1 => '仅限汉字、英文、数字和下划线';
	@override String get k_03el5lp => '未填写';
	@override String get k_1ui0gai => '搜索指定内容';
	@override String get k_003nvk2 => '消息';
	@override String get k_03agld7 => '群提示';
	@override String get k_0elt0kw => '添加群聊';
	@override String get k_0s3sgel => '移出黑名单';
	@override String k_1qqgjra({required Object option3}) => '$option3条未读消息';
	@override String get k_0uubyjr => '以下为未读消息';
	@override String get k_16as7eq => '表情回应';
	@override String get k_003s12u => '回复';
	@override String get k_003s38r => '更多';
	@override String get k_002wkr3 => '翻译';
	@override String get k_13g4hxv => '翻译完成';
	@override String get k_003molk => '表情';
	@override String get k_165bbw6 => '消息历史';
	@override String get k_13sqc0z => '清除消息';
	@override String get k_0glns86 => '删除会话';
	@override String get k_13s99rx => '清空消息';
	@override String get k_11vsa3j => '退出群组';
	@override String get k_11vvszp => '解散群组';
	@override String get k_15i9w72 => '群管理员';
	@override String get k_0p3espj => '设置备注名';
	@override String get k_118sw9v => '立即搜索';
	@override String get k_0h20hg5 => '视频通话';
	@override String get k_0h22snw => '语音通话';
	@override String get k_003lz6t => '对方';
	@override String k_1xf4yre({required Object option1}) => '发送给$option1';
	@override String get k_003por5 => '截图';
	@override String get k_1rw7s82 => ' 访问相册中视频权限，以正常使用发送视频等功能。';
	@override String get k_003rcwm => '打开';
	@override String get k_1698c42 => '在访达中打开';
	@override String get k_066fxsz => '查看文件夹';
	@override String get k_0k432y2 => '无法发送，包含文件夹';
	@override String get k_002wb4y => '会话';
	@override String get k_0od4qyh => '视频文件异常';
	@override String get k_1bfkxg9 => '不支持 0KB 文件的传输';
	@override String get k_0vvsw7g => '文件处理异常';
	@override String get k_06e224q => '[消息被管理员撤回]';
	@override String get k_1u1mjcl => '[消息被撤回]';
	@override String get k_1qcqxea => '选择多个会话';
	@override String get k_1qgmc20 => '选择一个会话';
	@override String get k_1d8nx6f => '在新窗口中打开';
	@override String get k_1hz05ax => '正在下载原始资源，请稍候...';
	@override String get k_002robo => '清除';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'k_1fdhj9g': 'This version does not support the message',
			'k_06pujtm': 'Accept all friend requests',
			'k_0gyhkp5': 'Require approval for friend requests',
			'k_121ruco': 'Reject all friend requests',
			'k_05nspni': 'Custom field',
			'k_03fchyy': 'Group profile photo',
			'k_03i9mfe': 'Group introduction',
			'k_03agq58': 'Group name',
			'k_039xqny': 'Group notification',
			'k_003tr0a': 'Group owner',
			'k_002wddw': 'Mute',
			'k_0got6f7': 'Unmute',
			'k_1uaqed6': '[Custom]',
			'k_0z2z7rx': '[Voice]',
			'k_0y39ngu': '[Emoji]',
			'k_0y1a2my': '[Image]',
			'k_0z4fib8': '[Video]',
			'k_0y24mcg': '[Location]',
			'k_0pewpd1': '[Chat history]',
			'k_13s8d9p': 'Unknown message',
			'k_003qkx2': 'Calendar',
			'k_003n2pz': 'Camera',
			'k_03idjo0': 'Contact',
			'k_003ltgm': 'Location',
			'k_02k3k86': 'Mic',
			'k_003pm7l': 'Album',
			'k_15ao57x': 'Album write',
			'k_164m3jd': 'Local storage',
			'k_03r6qyx': 'We need your approval to get information.',
			'k_02noktt': 'Reject',
			'k_00043x4': 'Agree',
			'k_003qzac': 'Yesterday',
			'k_003r39d': '2 days ago',
			'k_03fqp9o': 'Sun',
			'k_03ibg5h': 'Mon',
			'k_03i7hu1': 'Tue',
			'k_03iaiks': 'Wed',
			'k_03el9pa': 'Thu',
			'k_03i7ok1': 'Fri',
			'k_03efxyg': 'Sat',
			'k_003q7ba': 'Afternoon',
			'k_003q7bb': 'Morning',
			'k_003pu3h': 'Now',
			'k_002rflt': 'Delete',
			'k_1don84v': 'Failed to locate the original message',
			'k_003q5fi': 'Copy',
			'k_003prq0': 'Forward',
			'k_002r1h2': 'Multiple-choice',
			'k_003j708': 'Reference',
			'k_003pqpr': 'Recall',
			'k_03ezhho': 'Copied',
			'k_11ctfsz': 'Not implemented',
			'k_1hbjg5g': '[Group system message]',
			'k_03tvswb': '[Unknown message]',
			'k_155cj23': 'You\'ve recalled a message.',
			'k_0gapun3': 'Edit it again',
			'k_0003z7x': 'You',
			'k_002wfe4': 'Read',
			'k_002wjlg': 'Unread',
			'k_003nevv': 'Cancel',
			'k_001nmhu': 'Open with another app',
			'k_105682d': 'Failed to load the image',
			'k_0pytyeu': 'Image saved successfully',
			'k_0akceel': 'Failed to save the image',
			'k_003rk1s': 'Save',
			'k_04a0awq': '[Voice message]',
			'k_105c3y3': 'Failed to load the video',
			'k_176rzr7': 'Chat history',
			'k_002r305': 'Send',
			'k_003n8b0': 'Shoot',
			'k_003tnp0': 'File',
			'k_0ylosxn': 'Custom message',
			'k_0jhdhtp': 'Sending failed. The video cannot exceed 100 MB.',
			'k_0am7r68': 'Slide up to cancel',
			'k_13dsw4l': 'Release to cancel',
			'k_15jl6qw': 'Too short',
			'k_0gx7vl6': 'Press and hold to talk',
			'k_15dlafd': 'One-by-one forward',
			'k_15dryxy': 'Combine and forward',
			'k_1eyhieh': 'Are you sure you want to delete the selected message?',
			'k_118prbn': 'Search globally',
			'k_003kv3v': 'Search',
			'k_17fmlyf': 'Clear chat',
			'k_0dhesoz': 'Unpin from top',
			'k_002sk7x': 'Pin to top',
			'k_003ll77': 'Draft',
			'k_003kfai': 'Unknown',
			'k_13dq4an': 'Automatic approval',
			'k_0l13cde': 'Admin approval',
			'k_11y8c6a': 'Disallow group joining',
			'k_1kvyskd': 'Modification failed due to network disconnection',
			'k_16payqf': 'Group joining mode',
			'k_0vzvn8r': 'Modify group name',
			'k_003rzap': 'OK',
			'k_038lh6u': 'Group management',
			'k_0k5wyiy': 'Set admin',
			'k_0goiuwk': 'Mute all',
			'k_1g889xx': 'If you mute all, only the group owner and admin can speak.',
			'k_0wlrefq': 'Add group members to mute',
			'k_0goox5g': 'Mute',
			'k_08daijh': 'Admin role canceled successfully',
			'k_0k5u935': 'Add admin',
			'k_003ngex': 'Complete',
			'k_03enyx5': 'Group member',
			'k_03erpei': 'Admin',
			'k_0qi9tno': 'Group owner and admin',
			'k_0uj7208': 'Failed to view the group members due to network disconnection',
			'k_0ef2a12': 'Modify my nickname in group',
			'k_1aajych': '2–20 characters, including digits, letters, and underscores',
			'k_137pab5': 'My nickname in group',
			'k_0ivim6d': 'No group notice',
			'k_03eq6cn': 'Group notice',
			'k_002vxya': 'Modify',
			'k_03gu05e': 'Chat room',
			'k_03b4f3p': 'Meeting group',
			'k_03avj1p': 'Public group',
			'k_03asq2g': 'Work group',
			'k_03b3hbi': 'Unknown group',
			'k_03es1ox': 'Group type',
			'k_003mz1i': 'Agree',
			'k_003lpre': 'Reject',
			'k_003qk66': 'Profile photo',
			'k_003lhvk': 'Nickname',
			'k_003ps50': 'Account',
			'k_15lx52z': 'Status',
			'k_003qgkp': 'Gender',
			'k_003m6hr': 'Date of birth',
			'k_0003v6a': 'Male',
			'k_00043x2': 'Female',
			'k_03bcjkv': 'Not set',
			'k_11s0gdz': 'Modify nickname',
			'k_0p3j4sd': 'Allows only letters, digits, and underscores',
			'k_15lyvdt': 'Modify status',
			'k_0vylzjp': 'None',
			'k_1hs7ese': 'Modify it later',
			'k_03exjk7': 'Remarks',
			'k_0s3skfd': 'Add to blocklist',
			'k_17fpl3y': 'Pin chat to top',
			'k_0p3b31s': 'Modify remarks',
			'k_0003y9x': 'None',
			'k_11zgnfs': 'Profile',
			'k_1tez2xl': 'No status',
			'k_0vjj2kp': 'Group chat history',
			'k_003n2rp': 'Select',
			'k_1m9exwh': 'Recent contacts',
			'k_119nwqr': 'The input cannot be empty',
			'k_0pzwbmg': 'Video saved successfully',
			'k_0aktupv': 'Failed to save the video',
			'k_1yemzyd': 'Received a message',
			'k_13sajrj': 'Emoji message',
			'k_13sjeb7': 'File message',
			'k_0yd2ft8': 'Group notification',
			'k_13s7mxn': 'Image message',
			'k_13satlt': 'Location message',
			'k_00bbtsx': 'Combined message',
			'k_13sqwu4': 'Voice message',
			'k_13sqjjp': 'Video message',
			'k_03iqsh4': ({required Object s}) => ' $s to ',
			'k_191t5n4': ({required Object opUserNickName}) => '$opUserNickName changed ',
			'k_1pg6aoj': ({required Object opUserNickName}) => '$opUserNickName quit group chat',
			'k_1f6zt3v': ({required Object invitedMemberString}) => 'Invite $invitedMemberString to the group',
			'k_0y7zd07': ({required Object invitedMemberString}) => 'Remove $invitedMemberString from the group',
			'k_1d5mshh': ({required Object joinedMemberString}) => 'User $joinedMemberString joined the group',
			'k_0yenqf0': ({required Object userName}) => '$userName was',
			'k_0spotql': ({required Object adminMember}) => 'Set $adminMember as admin',
			'k_0pg5zzj': ({required Object operationType}) => 'System message: $operationType',
			'k_1c7z88n': ({required Object fileName}) => '[File] $fileName',
			'k_1c3us5n': 'The current group does not support @all',
			'k_11k579v': 'Invalid statements detected',
			'k_0qba4ns': ({required Object yoursItem}) => ' attempted to access your $yoursItem',
			'k_0oozw9x': ({required Object diffMinutes}) => '$diffMinutes minutes ago',
			'k_13hzn00': ({required Object yesterday}) => '$yesterday, yesterday',
			'k_0n9pyxz': 'The user does not exist',
			'k_1bjwemh': 'Search by user ID',
			'k_02owlq8': ({required Object userID}) => 'My user ID: $userID',
			'k_1wu8h4x': ({required Object showName}) => 'Me: $showName',
			'k_16758qw': 'Add friend',
			'k_1shx4d9': ({required Object selfSignature}) => 'Status: $selfSignature',
			'k_0i553x0': 'Enter verification information',
			'k_031ocwx': 'Enter remarks and list',
			'k_003ojje': 'Remarks',
			'k_003lsav': 'List',
			'k_167bdvq': 'My friends',
			'k_156b4ut': 'Friend request sent',
			'k_1loix7s': ({required Object groupType}) => 'Group type: $groupType',
			'k_1lqbsib': 'The group chat does not exist',
			'k_03h153m': 'Search by group ID',
			'k_0oxak3r': 'Group request sent',
			'k_1uh417q': ({required Object displayName}) => '$displayName recalled a message',
			'k_1aszp2k': 'Are you sure you want to send the message again?',
			'k_0h1ygf8': 'Call initiated',
			'k_0h169j0': 'Call canceled',
			'k_0h13jjk': 'Call accepted',
			'k_0h19hfx': 'Call rejected',
			'k_0obi9lh': 'No answer',
			'k_0ohzb9l': ({required Object callTime}) => 'Call duration: $callTime',
			'k_0y9u662': ({required Object appName}) => '$appName currently does not support this file type. You can use another app to open and preview the file.',
			'k_1ht1b80': 'Receiving',
			'k_0d5z4m5': 'Select reminder receiver',
			'k_1665ltg': 'Initiate call',
			'k_003kthh': 'Photo',
			'k_119ucng': 'The image cannot be empty',
			'k_0w9x8gw': ({required Object successPath}) => 'Selected successfully: $successPath',
			'k_1np495n': ({required Object messageString}) => '$messageString[Someone@me]',
			'k_1m797yi': ({required Object messageString}) => '$messageString[@all]',
			'k_1uaov41': 'Search for chat content',
			'k_0bxm97s': ({required Object adminNum}) => 'Admin ($adminNum/10)',
			'k_0jayw3z': ({required Object groupMemberNum}) => 'Group members ($groupMemberNum members)',
			'k_0h1svv1': 'Delete group member',
			'k_0h1g636': 'Add group member',
			'k_01yfa4o': ({required Object memberCount}) => '$memberCount members',
			'k_0hpukyx': 'View more group members',
			'k_0qtsar0': 'Mute notifications',
			'k_03xd79d': ({required Object signature}) => 'Status: $signature',
			'k_1m9dftc': 'All contacts',
			'k_0em4gyz': 'All group chats',
			'k_002twmj': 'Group chat',
			'k_09kga0d': 'More chat history',
			'k_1ui5lzi': ({required Object count}) => '$count messages are found',
			'k_09khmso': 'Related chat records',
			'k_1kevf4k': ({required Object receiver}) => 'Chat history with $receiver',
			'k_03ignw6': 'All',
			'k_03icaxo': 'Custom',
			'k_1969986': ({required Object callingLastMsgShow}) => '[Voice Call]：$callingLastMsgShow',
			'k_1960dlr': ({required Object callingLastMsgShow}) => '[Video Call]：$callingLastMsgShow',
			'k_1qbg9xc': ({required Object option8}) => '$option8 to ',
			'k_1wq5ubm': ({required Object option7}) => '$option7 changed ',
			'k_0y5pu80': ({required Object option6}) => '$option6 quit group chat',
			'k_0nl7cmd': ({required Object option5}) => 'Invite $option5 to the group',
			'k_1ju5iqw': ({required Object option4}) => 'Remove $option4 from the group',
			'k_1ovt677': ({required Object option3}) => 'User $option3 joined the group',
			'k_0k05b8b': ({required Object option2}) => '$option2 was ',
			'k_0wm4xeb': ({required Object option2}) => 'System message: $option2',
			'k_0nbq9v3': ({required Object option2}) => 'Call duration: $option2',
			'k_0i1kf53': ({required Object option2}) => '[File] $option2',
			'k_1gnnby6': ({required Object option2}) => ' attempted to access your $option2',
			'k_1wh4atg': ({required Object option2}) => '$option2 minutes ago',
			'k_07sh7g1': ({required Object option2}) => '$option2, yesterday',
			'k_1pj8xzh': ({required Object option2}) => 'My user ID: $option2',
			'k_0py1evo': ({required Object option2}) => 'Status: $option2',
			'k_1kvj4i2': ({required Object option2}) => '$option2 recalled a message',
			'k_1v0lbpp': ({required Object option2}) => '$option2 currently does not support this file type. You can use another app to open and preview the file.',
			'k_0torwfz': ({required Object option2}) => 'Selected successfully: $option2',
			'k_0i1bjah': ({required Object option1}) => '$option1 recalled a message',
			'k_1qzxh9q': ({required Object option3}) => 'Call duration: $option3',
			'k_0wrgmom': ({required Object option1}) => '[Voice Call]：$option1',
			'k_06ix2f0': ({required Object option2}) => '[Video Call]：$option2',
			'k_08o3z5w': ({required Object option1}) => '[File] $option1',
			'k_0ezbepg': ({required Object option2}) => '$option2[Someone@me]',
			'k_1ccnht1': ({required Object option2}) => '$option2[@all]',
			'k_1k3arsw': ({required Object option2}) => 'Admin ($option2/10)',
			'k_1d4golg': ({required Object option1}) => 'Group members ($option1 members)',
			'k_1bg69nt': ({required Object option1}) => '$option1 members',
			'k_00gjqxj': ({required Object option1}) => 'Status: $option1',
			'k_0c29cxr': ({required Object option1}) => '$option1 messages are found',
			'k_1twk5rz': ({required Object option1}) => 'Chat history with $option1',
			'k_18o68ro': 'Allow ',
			'k_1onpf8u': ' to access your camera to take photos, record videos, and make video calls.',
			'k_17irga5': ' to access your microphone to send voice messages, record videos, and make voice/video calls.',
			'k_0572kc4': ' to access your photos to send images and videos.',
			'k_0slykws': ' to access your album to save images and videos.',
			'k_119pkcd': ' to access your files to view, select and send files in a chat.',
			'k_03c49qt': 'Authorize now',
			'k_0nt2uyg': 'Back to the bottom',
			'k_04l16at': ({required Object option1}) => '$option1 new messages',
			'k_13p3w93': 'Someone @ me',
			'k_18w5uk6': '@ all',
			'k_0jmujgh': 'You are receiving other files',
			'k_12s5ept': 'Message details',
			'k_0mxa4f4': ({required Object option1}) => '$option1 read',
			'k_061tue3': ({required Object option2}) => '$option2 unread',
			'k_1vn4xq1': ({required Object adminMember}) => 'remove $adminMember from admin',
			'k_0e35hsw': 'Please allow us to use your camera to capture photos and videos sending to your friends and make video calls.',
			'k_0dj6yr7': 'Please allow us to use your microphone for sending voice message, make video/audio calls.',
			'k_003qnsl': 'Save',
			'k_0s3rtpw': 'Please allow us to access the media and files on your devices, in order to select and send to your friend, or save from them.',
			'k_0tezv85': ({required Object option2}) => ' Would like to access $option2',
			'k_002rety': ' permission. ',
			'k_0gqewd3': 'Later',
			'k_03eq4s1': 'Authorize Now',
			'k_18qjstb': 'Transfer Group',
			'k_0on1aj2': ({required Object option2}) => '$option2 messages @ me',
			'k_09j4izl': '[Someone @ me] ',
			'k_1oqtjw0': '[@ all] ',
			'k_1x5a9vb': ({required Object option1}) => 'This is: $option1',
			'k_14n31e7': 'Add Group',
			'k_08nc5j1': ({required Object option1}) => 'Group type: $option1',
			'k_1josu12': ({required Object option1}) => '$option1 group joining request(s)',
			'k_0n2x5s0': ({required Object option2}) => 'Verification message: $option2',
			'k_03c1nx0': 'Agreed',
			'k_03aw9w8': 'Rejected',
			'k_038ryos': 'Handle now',
			'k_0gw8pum': 'Add Group',
			'k_1gcvfrj': 'Please fill in the remarks',
			'k_002v9zj': '确认',
			'k_10oqrki': '轻触拍照',
			'k_0f8b3ws': '加载失败',
			'k_11cm5lm': '手动聚焦',
			'k_002uzrd': '预览',
			'k_003qkn3': '录像',
			'k_003k6a7': '拍照',
			'k_0bqpqco': '拍照按钮',
			'k_1626ozl': '停止录像',
			'k_003lvmu': '前置',
			'k_003lued': '后置',
			'k_003lwzh': '外置',
			'k_002qzi3': '关闭',
			'k_003pufb': '自动',
			'k_0apm0ze': '拍照时闪光',
			'k_157zog5': '始终闪光',
			'k_0cfyqhy': ({required Object option1}) => '$option1 画面预览',
			'k_0phctlz': ({required Object option2}) => '闪光模式: $option2',
			'k_02vfqe0': ({required Object option3}) => '切换至 $option3 摄像头',
			'k_0f0y9ex': '说话时间太短',
			'k_0ln70tk': '无法打开URL',
			'k_11a3jdv': '轻触拍照，长按摄像',
			'k_1k18miv': '请传入离开群组生命周期函数，提供返回首页或其他页面的导航方法。',
			'k_1fu9ahv': '全员禁言状态',
			'k_0gmwbnd': '全员禁言中',
			'k_0got2zr': '您被禁言',
			'k_0y9jck8': '你必须自定义search bar，并处理点击跳转',
			'k_0yum3tv': '如使用自定义区域，请在profileWidgetBuilder传入对应组件',
			'k_09kalj0': '清空聊天记录',
			'k_14j5iul': '删除并退出',
			'k_125ru1w': '解散该群',
			'k_0jtutmw': '退出后不会接收到此群聊消息',
			'k_0jtzmqa': '解散后不会接收到此群聊消息',
			'k_0r8fi93': '好友添加成功',
			'k_02qw14e': '好友申请已发出',
			'k_0n3md5x': '当前用户在黑名单',
			'k_094phq4': '好友添加失败',
			'k_129scag': '好友删除成功',
			'k_129uzfn': '好友删除失败',
			'k_1666isy': '清除好友',
			'k_1679vrd': '加为好友',
			'k_1ualc52': '看看对方带来的数据是啥',
			'k_0szluvp': '设置对方在线状态',
			'k_0f4rnf8': '该用户已是好友',
			'k_1tdkom4': '您已是群成员',
			'k_1p2lyuz': '对方正在输入中...',
			'k_1g8wfpy': ({required Object option1}) => '...共$option1人',
			'k_12rv9vw': '回应详情',
			'k_0havgi0': ({required Object linkMessage}) => '[查看详情 >>](${linkMessage.link})',
			'k_0n9p7g8': '群组不存在',
			'k_1tdh5vn': '您不是群成员',
			'k_0h1q57v': '暂无群成员',
			'k_0y5drq1': ({required Object option1}) => '[查看详情 >>]($option1)',
			'k_03pjp61': '[表情消息]',
			'k_1jpvzul': '[自定义消息]',
			'k_03u3bh1': '[文件消息]',
			'k_1odsnsw': '[群消息]',
			'k_03sel4t': '[图片消息]',
			'k_03sfw3r': '[位置消息]',
			'k_03xpuwq': '[合并消息]',
			'k_07ycxwo': '[没有元素]',
			'k_03rc9vz': '[文本消息]',
			'k_046uopf': '[视频消息]',
			'k_0ehmsun': '设备存储空间不足，建议清理，以获得更好使用体验',
			'k_003kmos': '图片',
			'k_002s86q': '视频',
			'k_06bk5ei': '视频消息仅限 mp4 格式',
			'k_13opfxf': 'Web网页端不支持搜索',
			'k_1i0o0y2': '暂时仅限 Android/iOS 端',
			'k_045dtzl': ({required Object option1}) => '$option1的聊天记录',
			'k_0t0131u': '群资料信息',
			'k_18ok8xz': '消息接收方式',
			'k_03ax3ks': '群资料',
			'k_0sqvoqo': ({required Object option1}) => '将 $option1 设置为管理员',
			'k_1gbg1v8': ({required Object option1}) => '将 $option1 取消管理员',
			'k_17k64g4': '群聊创建成功！',
			'k_05mn217': '暂未安装表情包插件，如需使用表情相关功能，请根据本文档安装：https://cloud.tencent.com/document/product/269/70746',
			'k_14j17nz': '暂无表情包',
			'k_0fvjexh': '正在下载中',
			'k_1cdagzz': '已加入待下载队列，其他文件下载中',
			'k_0g4vojc': '开始下载',
			'k_1g32es3': '[调皮]@2x.png',
			'k_1g8qorz': '[爱你]@2x.png',
			'k_1g4hmx6': '[爱情]@2x.png',
			'k_1g6b558': '[爱心]@2x.png',
			'k_1g3m4su': '[傲慢]@2x.png',
			'k_1g2jym7': '[白眼]@2x.png',
			'k_0cgkxuw': '[棒棒糖]@2x.png',
			'k_1g48br2': '[抱抱]@2x.png',
			'k_1g49ol8': '[抱拳]@2x.png',
			'k_1g0ras3': '[爆筋]@2x.png',
			'k_1ghy881': '[鄙视]@2x.png',
			'k_1g86bmv': '[闭嘴]@2x.png',
			'k_1g1xs1p': '[鞭炮]@2x.png',
			'k_1g8i6ri': '[便便]@2x.png',
			'k_1g2u5kf': '[擦汗]@2x.png',
			'k_1g60uwh': '[彩带]@2x.png',
			'k_1g1o0d0': '[彩球]@2x.png',
			'k_1g6a6yq': '[菜刀]@2x.png',
			'k_1g6vqo2': '[差劲]@2x.png',
			'k_1g0kvjc': '[钞票]@2x.png',
			'k_1g65x7e': '[车厢]@2x.png',
			'k_0e1tjol': '[打哈欠]@2x.png',
			'k_1g65n58': '[大兵]@2x.png',
			'k_1g7se7o': '[大哭]@2x.png',
			'k_1g03868': '[蛋糕]@2x.png',
			'k_1h8nm66': '[刀]@2x.png',
			'k_1g3dlpi': '[得意]@2x.png',
			'k_1g3u434': '[灯泡]@2x.png',
			'k_1giuqs7': '[凋谢]@2x.png',
			'k_1g8r0r9': '[多云]@2x.png',
			'k_1g7k6i1': '[发呆]@2x.png',
			'k_1g44zsp': '[发抖]@2x.png',
			'k_1g5l96i': '[飞机]@2x.png',
			'k_1g7wsqj': '[飞吻]@2x.png',
			'k_1g49luq': '[奋斗]@2x.png',
			'k_1gixbsm': '[风车]@2x.png',
			'k_1g6cqbq': '[尴尬]@2x.png',
			'k_1g6jbw5': '[勾引]@2x.png',
			'k_1g3lwo1': '[鼓掌]@2x.png',
			'k_1g13nkj': '[害羞]@2x.png',
			'k_1g0mt47': '[憨笑]@2x.png',
			'k_0bxujkf': '[红灯笼]@2x.png',
			'k_0hhaeh8': '[红双喜]@2x.png',
			'k_1g0jnts': '[坏笑]@2x.png',
			'k_1g46g9c': '[挥手]@2x.png',
			'k_1g4vi9g': '[回头]@2x.png',
			'k_1gf7hes': '[饥饿]@2x.png',
			'k_1g6mvsm': '[激动]@2x.png',
			'k_1gku5mf': '[街舞]@2x.png',
			'k_1g4hidg': '[惊恐]@2x.png',
			'k_1gjbrtu': '[惊讶]@2x.png',
			'k_1g6sand': '[咖啡]@2x.png',
			'k_1g4s8rj': '[磕头]@2x.png',
			'k_1g1wn34': '[可爱]@2x.png',
			'k_1g3l0wd': '[可怜]@2x.png',
			'k_1ggaon9': '[抠鼻]@2x.png',
			'k_1ggvcb0': '[骷髅]@2x.png',
			'k_1h8yqjt': '[酷]@2x.png',
			'k_0jac97i': '[快哭了]@2x.png',
			'k_1h8oiby': '[困]@2x.png',
			'k_1g0s5hg': '[蜡烛]@2x.png',
			'k_1g1iuer': '[篮球]@2x.png',
			'k_1g2xjfi': '[冷汗]@2x.png',
			'k_0s5oyqw': '[礼品袋]@2x.png',
			'k_1g1qqvf': '[礼物]@2x.png',
			'k_1g2slew': '[流汗]@2x.png',
			'k_1g3z9xx': '[流泪]@2x.png',
			'k_1g6pabn': '[麻将]@2x.png',
			'k_0pkaxul': '[麦克风]@2x.png',
			'k_1g7m0zj': '[猫咪]@2x.png',
			'k_0ibvtpo': '[么么哒]@2x.png',
			'k_1g1hoh1': '[玫瑰]@2x.png',
			'k_1gfzeow': '[米饭]@2x.png',
			'k_1g5l15p': '[面条]@2x.png',
			'k_1g2hfa6': '[奶瓶]@2x.png',
			'k_1gix9pj': '[难过]@2x.png',
			'k_1giqn6g': '[闹钟]@2x.png',
			'k_1h8kd64': '[怒]@2x.png',
			'k_1g0vui9': '[怄火]@2x.png',
			'k_1g1jsj7': '[皮球]@2x.png',
			'k_1ghdluw': '[啤酒]@2x.png',
			'k_1gl6ec7': '[瓢虫]@2x.png',
			'k_1g7gg5p': '[撇嘴]@2x.png',
			'k_1g8psin': '[乒乓]@2x.png',
			'k_1gjzu3p': '[汽车]@2x.png',
			'k_1h8mr0k': '[强]@2x.png',
			'k_1g45y2n': '[敲打]@2x.png',
			'k_1gkaxsl': '[青蛙]@2x.png',
			'k_0jcfnoo': '[糗大了]@2x.png',
			'k_1g4njy1': '[拳头]@2x.png',
			'k_1h8mqr3': '[弱]@2x.png',
			'k_1h926fg': '[色]@2x.png',
			'k_1g6rtbq': '[沙发]@2x.png',
			'k_1giirh6': '[删除]@2x.png',
			'k_1g14ny9': '[闪电]@2x.png',
			'k_1g6bmsr': '[胜利]@2x.png',
			'k_1g1rytx': '[示爱]@2x.png',
			'k_1g52fbz': '[手枪]@2x.png',
			'k_1h90dam': '[衰]@2x.png',
			'k_1gigiae': '[睡觉]@2x.png',
			'k_1gijchz': '[太阳]@2x.png',
			'k_1g1sgji': '[跳绳]@2x.png',
			'k_1gjwuri': '[跳跳]@2x.png',
			'k_1g0juhk': '[偷笑]@2x.png',
			'k_1h8nzla': '[吐]@2x.png',
			'k_1g6cv0i': '[委屈]@2x.png',
			'k_1g46l5g': '[握手]@2x.png',
			'k_1g2pgkd': '[西瓜]@2x.png',
			'k_1ging9p': '[下雨]@2x.png',
			'k_1h8nzil': '[吓]@2x.png',
			'k_1g7q7wr': '[献吻]@2x.png',
			'k_1gl6uum': '[香蕉]@2x.png',
			'k_1g23fys': '[象棋]@2x.png',
			'k_0j75rdh': '[心碎了]@2x.png',
			'k_1g6ajj2': '[信封]@2x.png',
			'k_1g21prz': '[熊猫]@2x.png',
			'k_1h8octi': '[嘘]@2x.png',
			'k_1h91zox': '[药]@2x.png',
			'k_1ghttfl': '[疑问]@2x.png',
			'k_1ghk7sz': '[阴险]@2x.png',
			'k_0gl37zz': '[右车头]@2x.png',
			'k_0ifkj1p': '[右哼哼]@2x.png',
			'k_0g1yh2e': '[右太极]@2x.png',
			'k_1g9dkfc': '[雨伞]@2x.png',
			'k_1g8jl88': '[月亮]@2x.png',
			'k_1h8lhqj': '[晕]@2x.png',
			'k_1gi9x2q': '[再见]@2x.png',
			'k_1g6dwwv': '[炸弹]@2x.png',
			'k_1fzmkfi': '[折磨]@2x.png',
			'k_1g6jbiw': '[纸巾]@2x.png',
			'k_1ggjnwu': '[咒骂]@2x.png',
			'k_1g4qlq8': '[猪头]@2x.png',
			'k_1g1lqzz': '[抓狂]@2x.png',
			'k_1g80j3u': '[转圈]@2x.png',
			'k_1g0z55s': '[龇牙]@2x.png',
			'k_1g3ju6v': '[钻戒]@2x.png',
			'k_0gl51l6': '[左车头]@2x.png',
			'k_0iflllk': '[左哼哼]@2x.png',
			'k_0g1y3ir': '[左太极]@2x.png',
			'k_026hiq5': '消息列表加载中',
			'k_003tu8k': '爱你',
			'k_003myvp': '傲慢',
			'k_003kddw': '白眼',
			'k_039yfhv': '棒棒糖',
			'k_003nu3p': '抱抱',
			'k_003nijr': '抱拳',
			'k_003mg88': '爆筋',
			'k_002v17e': '鄙视',
			'k_003qhy4': '闭嘴',
			'k_003l5fq': '鞭炮',
			'k_003uacl': '便便',
			'k_003oq1g': '擦汗',
			'k_003qvey': '彩带',
			'k_003jci7': '彩球',
			'k_003pyu1': '菜刀',
			'k_003q97d': '差劲',
			'k_003po5d': '车厢',
			'k_03eadb2': '打哈欠',
			'k_003pnuf': '大兵',
			'k_003kg57': '蛋糕',
			'k_003mxkt': '得意',
			'k_003onu3': '灯泡',
			'k_002uv8s': '凋谢',
			'k_003kqy0': '调皮',
			'k_003tyum': '多云',
			'k_003pv9u': '发呆',
			'k_036o6mu': '发抖t',
			'k_003nogx': '飞机',
			'k_003q7wg': '飞吻',
			'k_003m0jd': '奋斗',
			'k_002ult9': '风车',
			'k_003r8gt': '尴尬',
			'k_003qy4u': '勾引',
			'k_003mnoa': '鼓掌',
			'k_003lmw8': '害羞',
			'k_003mb30': '憨笑',
			'k_03bj41g': '红灯笼',
			'k_03dxw2f': '红双喜',
			'k_003mk57': '坏笑',
			'k_003nmvf': '挥手',
			'k_003r2i7': '回头',
			'k_002s6f3': '饥饿',
			'k_003qd0t': '激动',
			'k_002vgi4': '街舞',
			'k_003nz33': '惊恐',
			'k_002wh4p': '惊讶',
			'k_003ozpu': '咖啡',
			'k_003qvs4': '磕头',
			'k_003l3wb': '可爱',
			'k_003nuwm': '可怜',
			'k_002rw1q': '抠鼻',
			'k_002tujb': '骷髅',
			'k_00030eq': '酷',
			'k_03i8ath': '快哭了',
			'k_000421h': '困',
			'k_003l5i7': '蜡烛',
			'k_003j72g': '篮球',
			'k_003ofwl': '冷汗',
			'k_02mw65v': '礼品袋',
			'k_003ku40': '礼物',
			'k_003ookz': '流汗',
			'k_003on72': '流泪',
			'k_003rjy0': '麻将',
			'k_003q2f8': '猫咪',
			'k_03et393': '么么哒',
			'k_003j7j2': '玫瑰',
			'k_002sr0b': '米饭',
			'k_003nnza': '面条',
			'k_003jef9': '奶瓶',
			'k_002umn0': '难过',
			'k_002rjib': '闹钟',
			'k_0003zcn': '怒',
			'k_003jzwq': '怄火',
			'k_003j4js': '皮球',
			'k_002r5ir': '啤酒',
			'k_002ubu4': '瓢虫',
			'k_003ppo6': '撇嘴',
			'k_003ty3o': '乒乓',
			'k_002vxwe': '汽车',
			'k_00043hb': '强',
			'k_003nmbo': '敲打',
			'k_002tfhq': '青蛙',
			'k_03i7lrn': '糗大了',
			'k_003r03m': '拳头',
			'k_00043h0': '弱',
			'k_000345z': '色',
			'k_003qmp9': '沙发',
			'k_003it8a': '闪电',
			'k_003pxow': '胜利',
			'k_003kw8e': '示爱',
			'k_003n99g': '手枪',
			'k_00035cl': '衰',
			'k_002vl3h': '睡觉',
			'k_002rgqk': '太阳',
			'k_003m9d1': '跳绳',
			'k_002vobp': '跳跳',
			'k_003mkoz': '偷笑',
			'k_00041px': '吐',
			'k_003rjh5': '委屈',
			'k_003j36u': '西瓜',
			'k_002re92': '下雨',
			'k_00041py': '吓',
			'k_003q06o': '献吻',
			'k_002ubjp': '香蕉',
			'k_003o2tr': '象棋',
			'k_03ie6pa': '心碎了',
			'k_003rao5': '信封',
			'k_003l3us': '熊猫',
			'k_000424d': '嘘',
			'k_00033yi': '药',
			'k_002qtyy': '疑问',
			'k_002qe0o': '阴险',
			'k_03gu7us': '右车头',
			'k_03ere8m': '右哼哼',
			'k_003uqk3': '雨伞',
			'k_003tzdv': '月亮',
			'k_0003z00': '晕',
			'k_002vdrd': '再见',
			'k_003ra1w': '炸弹',
			'k_003lcad': '折磨',
			'k_003q7sz': '纸巾',
			'k_002thn9': '咒骂',
			'k_003qx7f': '猪头',
			'k_003l044': '抓狂',
			'k_003qg4h': '转圈',
			'k_003kb97': '龇牙',
			'k_03gu53l': '左车头',
			'k_03erd1f': '左哼哼',
			'k_003nyvl': '爱情',
			'k_003r85z': '爱心',
			'k_003mk8j': '钞票',
			'k_003pwfj': '大哭',
			'k_00042w5': '刀',
			'k_003nmtr': '握手',
			'k_03c529p': '右太极',
			'k_003n4mk': '钻戒',
			'k_03c5488': '左太极',
			'k_1llp7tu': '该用户不存在',
			'k_0tbyqyb': '加载中…',
			'k_0td1p3f': '保存中…',
			'k_1klqdh1': '仅限汉字、英文、数字和下划线',
			'k_03el5lp': '未填写',
			'k_1ui0gai': '搜索指定内容',
			'k_003nvk2': '消息',
			'k_03agld7': '群提示',
			'k_0elt0kw': '添加群聊',
			'k_0s3sgel': '移出黑名单',
			'k_1qqgjra': ({required Object option3}) => '$option3条未读消息',
			'k_0uubyjr': '以下为未读消息',
			'k_16as7eq': '表情回应',
			'k_003s12u': '回复',
			'k_003s38r': '更多',
			'k_002wkr3': '翻译',
			'k_13g4hxv': '翻译完成',
			'k_003molk': '表情',
			'k_165bbw6': '消息历史',
			'k_13sqc0z': '清除消息',
			'k_0glns86': '删除会话',
			'k_13s99rx': '清空消息',
			'k_11vsa3j': '退出群组',
			'k_11vvszp': '解散群组',
			'k_15i9w72': '群管理员',
			'k_0p3espj': '设置备注名',
			'k_118sw9v': '立即搜索',
			'k_0h20hg5': '视频通话',
			'k_0h22snw': '语音通话',
			'k_003lz6t': '对方',
			'k_1xf4yre': ({required Object option1}) => '发送给$option1',
			'k_003por5': '截图',
			'k_1rw7s82': ' 访问相册中视频权限，以正常使用发送视频等功能。',
			'k_003rcwm': '打开',
			'k_1698c42': '在访达中打开',
			'k_066fxsz': '查看文件夹',
			'k_0k432y2': '无法发送，包含文件夹',
			'k_002wb4y': '会话',
			'k_0od4qyh': '视频文件异常',
			'k_1bfkxg9': '不支持 0KB 文件的传输',
			'k_0vvsw7g': '文件处理异常',
			'k_06e224q': '[消息被管理员撤回]',
			'k_1u1mjcl': '[消息被撤回]',
			'k_1qcqxea': '选择多个会话',
			'k_1qgmc20': '选择一个会话',
			'k_1d8nx6f': '在新窗口中打开',
			'k_1hz05ax': '正在下载原始资源，请稍候...',
			'k_002robo': '清除',
		};
	}
}

extension on _StringsZhHans {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
		};
	}
}

extension on _StringsZhHant {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'k_1yemzyd': '收到一條訊息',
			'k_0ylosxn': '自定義訊息',
			'k_13sajrj': '貼圖訊息',
			'k_13sjeb7': '檔案訊息',
			'k_0yd2ft8': '群提示訊息',
			'k_13s7mxn': '圖片訊息',
			'k_13satlt': '位置訊息',
			'k_00bbtsx': '合並轉發訊息',
			'k_13sqwu4': '語音訊息',
			'k_13sqjjp': '影片',
			'k_1fdhj9g': '該版本不支持此訊息',
			'k_06pujtm': '同意任何用戶添加好友',
			'k_0gyhkp5': '需要驗證',
			'k_121ruco': '拒絕任何人加好友',
			'k_05nspni': '自定義字段',
			'k_03fchyy': '群頭像',
			'k_03i9mfe': '群簡介',
			'k_03agq58': '群名稱',
			'k_039xqny': '群通知',
			'k_003tr0a': '群主',
			'k_03iqsh4': ({required Object s}) => '$s為 ',
			'k_191t5n4': ({required Object opUserNickName}) => '$opUserNickName修改',
			'k_1pg6aoj': ({required Object opUserNickName}) => '$opUserNickName退出群組',
			'k_1f6zt3v': ({required Object invitedMemberString}) => '邀請$invitedMemberString加入群組',
			'k_0y7zd07': ({required Object invitedMemberString}) => '將$invitedMemberString踢出群組',
			'k_03c49qt': '去授權',
			'k_1d5mshh': ({required Object joinedMemberString}) => '用戶$joinedMemberString加入了群組',
			'k_002wddw': '禁言',
			'k_0got6f7': '解除禁言',
			'k_0yenqf0': ({required Object userName}) => '$userName 被',
			'k_0spotql': ({required Object adminMember}) => '將 $adminMember 設置為管理員',
			'k_0pg5zzj': ({required Object operationType}) => '系統訊息 $operationType',
			'k_0ohzb9l': ({required Object callTime}) => '通話時間：$callTime',
			'k_1uaqed6': '[自定義]',
			'k_0z2z7rx': '[語音]',
			'k_0y39ngu': '[貼圖]',
			'k_1c7z88n': ({required Object fileName}) => '[檔案] $fileName',
			'k_0y1a2my': '[圖片]',
			'k_0z4fib8': '[影片]',
			'k_0y24mcg': '[位置]',
			'k_0pewpd1': '[聊天記錄]',
			'k_13s8d9p': '未知訊息',
			'k_1c3us5n': '當前群組不支持@全體成員',
			'k_11k579v': '發言中有非法語句',
			'k_003qkx2': '日歷',
			'k_003n2pz': '相機',
			'k_03idjo0': '聯絡人',
			'k_003ltgm': '位置',
			'k_02k3k86': '咪高風',
			'k_003pm7l': '相冊',
			'k_15ao57x': '相冊寫入',
			'k_164m3jd': '本地存儲',
			'k_0qba4ns': ({required Object yoursItem}) => '想訪問您的$yoursItem',
			'k_03r6qyx': '我們需要您的同意才能獲取信息',
			'k_02noktt': '不允許',
			'k_00043x4': '好',
			'k_003qzac': '昨天',
			'k_003r39d': '前天',
			'k_03fqp9o': '星期天',
			'k_03ibg5h': '星期一',
			'k_03i7hu1': '星期二',
			'k_03iaiks': '星期三',
			'k_03el9pa': '星期四',
			'k_03i7ok1': '星期五',
			'k_03efxyg': '星期六',
			'k_0oozw9x': ({required Object diffMinutes}) => '$diffMinutes 分鐘前',
			'k_003q7ba': '下午',
			'k_003q7bb': '上午',
			'k_003pu3h': '現在',
			'k_13hzn00': ({required Object yesterday}) => '昨天 $yesterday',
			'k_0n9pyxz': '用戶不存在',
			'k_1bjwemh': '搜尋用戶 ID',
			'k_003kv3v': '搜尋',
			'k_02owlq8': ({required Object userID}) => '我的用戶ID: $userID',
			'k_1wu8h4x': ({required Object showName}) => '我是: $showName',
			'k_16758qw': '添加好友',
			'k_1shx4d9': ({required Object selfSignature}) => '個性簽名: $selfSignature',
			'k_0i553x0': '填寫驗證信息',
			'k_031ocwx': '請填寫備註和分組',
			'k_003ojje': '備註',
			'k_003lsav': '分組',
			'k_167bdvq': '我的好友',
			'k_156b4ut': '好友申請已發送',
			'k_002r305': '發送',
			'k_03gu05e': '聊天室',
			'k_03b4f3p': '會議群',
			'k_03avj1p': '公開群',
			'k_03asq2g': '工作群',
			'k_03b3hbi': '未知群',
			'k_1loix7s': ({required Object groupType}) => '群類型: $groupType',
			'k_1lqbsib': '該群組不存在',
			'k_03h153m': '搜尋群ID',
			'k_0oxak3r': '群申請已發送',
			'k_002rflt': '刪除',
			'k_1don84v': '無法定位到原訊息',
			'k_003q5fi': '復製',
			'k_003prq0': '轉發',
			'k_002r1h2': '多選',
			'k_003j708': '引用',
			'k_003pqpr': '回收',
			'k_03ezhho': '已復製',
			'k_11ctfsz': '暫未實現',
			'k_1hbjg5g': '[群系統訊息]',
			'k_03tvswb': '[未知訊息]',
			'k_155cj23': '您回收了一條訊息，',
			'k_0gapun3': '重新編輯',
			'k_1uh417q': ({required Object displayName}) => '$displayName回收了一條訊息',
			'k_1aszp2k': '您確定要重發這條訊息麽？',
			'k_003rzap': '確定',
			'k_003nevv': '取消',
			'k_0003z7x': '您',
			'k_002wfe4': '已讀',
			'k_002wjlg': '未讀',
			'k_0h1ygf8': '發起通話',
			'k_0h169j0': '取消通話',
			'k_0h13jjk': '接受通話',
			'k_0h19hfx': '拒絕通話',
			'k_0obi9lh': '超時未接聽',
			'k_0y9u662': ({required Object appName}) => '「$appName」暫不可以開啟此類檔案，你可以使用其他應用開啟並預覽',
			'k_001nmhu': '用其他應用開啟',
			'k_1ht1b80': '正在接收中',
			'k_105682d': '圖片載入失敗',
			'k_0pytyeu': '圖片保存成功',
			'k_0akceel': '圖片保存失敗',
			'k_003rk1s': '保存',
			'k_04a0awq': '[語音訊息]',
			'k_105c3y3': '影片載入失敗',
			'k_176rzr7': '聊天記錄',
			'k_0d5z4m5': '選擇提醒人',
			'k_003ngex': '完成',
			'k_1665ltg': '發起呼叫',
			'k_003n8b0': '拍攝',
			'k_003kthh': '照片',
			'k_003tnp0': '檔案',
			'k_0jhdhtp': '發送失敗,影片不能大於100MB',
			'k_119ucng': '圖片不能為空',
			'k_0w9x8gw': ({required Object successPath}) => '選擇成功$successPath',
			'k_13dsw4l': '松開取消',
			'k_0am7r68': '手指上滑，取消發送',
			'k_15jl6qw': '說話時間太短!',
			'k_0gx7vl6': '按住說話',
			'k_15dlafd': '逐條轉發',
			'k_15dryxy': '合並轉發',
			'k_1eyhieh': '確定刪除已選訊息',
			'k_17fmlyf': '清除聊天',
			'k_0dhesoz': '取消置頂',
			'k_002sk7x': '置頂',
			'k_003ll77': '草稿',
			'k_03icaxo': '自定義',
			'k_1969986': ({required Object callingLastMsgShow}) => '[語音通話]：$callingLastMsgShow',
			'k_1960dlr': ({required Object callingLastMsgShow}) => '[視訊通話]：$callingLastMsgShow',
			'k_1np495n': ({required Object messageString}) => '$messageString[有人@我]',
			'k_1m797yi': ({required Object messageString}) => '$messageString[@所有人]',
			'k_1uaov41': '查找聊天內容',
			'k_003kfai': '未知',
			'k_13dq4an': '自動審批',
			'k_0l13cde': '管理員審批',
			'k_11y8c6a': '禁止加群',
			'k_1kvyskd': '無網絡連接，無法修改',
			'k_16payqf': '加群方式',
			'k_0vzvn8r': '修改群名稱',
			'k_038lh6u': '群管理',
			'k_0k5wyiy': '設置管理員',
			'k_0goiuwk': '全員禁言',
			'k_1g889xx': '全員禁言開啟後，只允許群主和管理員發言。',
			'k_0wlrefq': '添加需要禁言的群成員',
			'k_0goox5g': '設置禁言',
			'k_08daijh': '成功取消管理員身份',
			'k_0bxm97s': ({required Object adminNum}) => '管理員 ($adminNum/10)',
			'k_0k5u935': '添加管理員',
			'k_03enyx5': '群成員',
			'k_0jayw3z': ({required Object groupMemberNum}) => '群成員($groupMemberNum人)',
			'k_0h1svv1': '刪除群成員',
			'k_0h1g636': '添加群成員',
			'k_0uj7208': '無網絡連接，無法查看群成員',
			'k_01yfa4o': ({required Object memberCount}) => '$memberCount人',
			'k_0hpukyx': '查看更多群成員',
			'k_0qtsar0': '訊息免打擾',
			'k_0ef2a12': '修改我的群昵稱',
			'k_1aajych': '僅限中文、字母、數字和下劃線，2-20個字',
			'k_137pab5': '我的群昵稱',
			'k_0ivim6d': '暫無群公告',
			'k_03eq6cn': '群公告',
			'k_002vxya': '編輯',
			'k_17fpl3y': '置頂聊天',
			'k_03es1ox': '群類型',
			'k_003mz1i': '同意',
			'k_003lpre': '拒絕',
			'k_003qk66': '頭像',
			'k_003lhvk': '昵稱',
			'k_003ps50': '賬號',
			'k_15lx52z': '個性簽名',
			'k_003qgkp': '性別',
			'k_003m6hr': '生日',
			'k_0003v6a': '男',
			'k_00043x2': '女',
			'k_03bcjkv': '未設置',
			'k_11s0gdz': '修改昵稱',
			'k_0p3j4sd': '僅限中字、字母、數字和下劃線',
			'k_15lyvdt': '修改簽名',
			'k_0vylzjp': '這個人很懶，什麽也沒寫',
			'k_1hs7ese': '等上線再改這個',
			'k_03exjk7': '備註名',
			'k_0s3skfd': '加入黑名單',
			'k_0p3b31s': '修改備註名',
			'k_0003y9x': '無',
			'k_11zgnfs': '個人資料',
			'k_03xd79d': ({required Object signature}) => '個性簽名: $signature',
			'k_1tez2xl': '暫無個性簽名',
			'k_118prbn': '全局搜尋',
			'k_1m9dftc': '全部聯絡人',
			'k_0em4gyz': '全部群組',
			'k_002twmj': '群組',
			'k_09kga0d': '更多聊天記錄',
			'k_1ui5lzi': ({required Object count}) => '$count條相關聊天記錄',
			'k_09khmso': '相關聊天記錄',
			'k_1kevf4k': ({required Object receiver}) => '與$receiver的聊天記錄',
			'k_0vjj2kp': '群組的聊天記錄',
			'k_003n2rp': '選擇',
			'k_03ignw6': '所有人',
			'k_03erpei': '管理員',
			'k_0qi9tno': '群主、管理員',
			'k_1m9exwh': '最近聯絡人',
			'k_119nwqr': '輸入不能為空',
			'k_0pzwbmg': '影片保存成功',
			'k_0aktupv': '影片保存失敗',
			'k_1qbg9xc': ({required Object option8}) => '$option8為 ',
			'k_1wq5ubm': ({required Object option7}) => '$option7修改',
			'k_0y5pu80': ({required Object option6}) => '$option6退出群組',
			'k_0nl7cmd': ({required Object option5}) => '邀請$option5加入群組',
			'k_1ju5iqw': ({required Object option4}) => '將$option4踢出群組',
			'k_1ovt677': ({required Object option3}) => '用戶$option3加入了群組',
			'k_0k05b8b': ({required Object option2}) => '$option2 被',
			'k_0wm4xeb': ({required Object option2}) => '系統訊息 $option2',
			'k_0nbq9v3': ({required Object option2}) => '通話時間：$option2',
			'k_0i1kf53': ({required Object option2}) => '[檔案] $option2',
			'k_1gnnby6': ({required Object option2}) => '想訪問您的$option2',
			'k_1wh4atg': ({required Object option2}) => '$option2 分鐘前',
			'k_07sh7g1': ({required Object option2}) => '昨天 $option2',
			'k_1pj8xzh': ({required Object option2}) => '我的用戶ID: $option2',
			'k_0py1evo': ({required Object option2}) => '個性簽名: $option2',
			'k_1kvj4i2': ({required Object option2}) => '$option2回收了一條訊息',
			'k_1v0lbpp': ({required Object option2}) => '「$option2」暫不可以開啟此類檔案，你可以使用其他應用開啟並預覽',
			'k_0torwfz': ({required Object option2}) => '選擇成功$option2',
			'k_0i1bjah': ({required Object option1}) => '$option1回收了一條訊息',
			'k_1qzxh9q': ({required Object option3}) => '通話時間：$option3',
			'k_0wrgmom': ({required Object option1}) => '[語音通話]：$option1',
			'k_06ix2f0': ({required Object option2}) => '[視訊通話]：$option2',
			'k_08o3z5w': ({required Object option1}) => '[檔案] $option1',
			'k_0ezbepg': ({required Object option2}) => '$option2[有人@我]',
			'k_1ccnht1': ({required Object option2}) => '$option2[@所有人]',
			'k_1k3arsw': ({required Object option2}) => '管理員 ($option2/10)',
			'k_1d4golg': ({required Object option1}) => '群成員($option1人)',
			'k_1bg69nt': ({required Object option1}) => '$option1人',
			'k_00gjqxj': ({required Object option1}) => '個性簽名: $option1',
			'k_0c29cxr': ({required Object option1}) => '$option1條相關聊天記錄',
			'k_1twk5rz': ({required Object option1}) => '與$option1的聊天記錄',
			'k_1vn4xq1': ({required Object adminMember}) => '將 $adminMember 取消管理員',
			'k_0e35hsw': '為方便您將所拍攝的照片或影片發送給朋友，以及進行視訊通話，請允許我們訪問攝像頭進行拍攝照片和影片。',
			'k_0dj6yr7': '為方便您發送語音訊息、拍攝影片以及音視訊通話，請允許我們使用咪高風進行錄音。',
			'k_003qnsl': '存儲',
			'k_0s3rtpw': '為方便您查看和選擇相冊裏的圖片影片發送給朋友，以及保存內容到設備，請允許我們訪問您設備上的照片、媒體內容。',
			'k_0tezv85': ({required Object option2}) => ' 申請獲取$option2',
			'k_002rety': '權限',
			'k_18o68ro': '需要授予',
			'k_1onpf8u': ' 相機權限，以正常使用拍攝圖片/影片、視訊通話等功能。',
			'k_17irga5': ' 咪高風權限，以正常使用發送語音訊息、拍攝影片、音視訊通話等功能。',
			'k_0572kc4': ' 訪問照片權限，以正常使用發送圖片、影片等功能。',
			'k_0slykws': ' 訪問相冊寫入權限，以正常使用存儲圖片、影片等功能。',
			'k_119pkcd': ' 檔案讀寫權限，以正常使用在聊天功能中的圖片查看、選擇能力和發送檔案的能力。',
			'k_0gqewd3': '以後再說',
			'k_03eq4s1': '去開啟',
			'k_0nt2uyg': '回到最新位置',
			'k_04l16at': ({required Object option1}) => '$option1條新訊息',
			'k_13p3w93': '有人@我',
			'k_18w5uk6': '@所有人',
			'k_0jmujgh': '其他檔案正在接收中',
			'k_12s5ept': '訊息詳情',
			'k_0mxa4f4': ({required Object option1}) => '$option1人已讀',
			'k_061tue3': ({required Object option2}) => '$option2人未讀',
			'k_18qjstb': '轉讓群主',
			'k_0on1aj2': ({required Object option2}) => '有$option2條@我訊息',
			'k_09j4izl': '[有人@我] ',
			'k_1oqtjw0': '[@所有人] ',
			'k_1x5a9vb': ({required Object option1}) => '我是: $option1',
			'k_14n31e7': '進群請求',
			'k_08nc5j1': ({required Object option1}) => '群類型: $option1',
			'k_1josu12': ({required Object option1}) => '$option1 條入群請求',
			'k_0n2x5s0': ({required Object option2}) => '驗證消息: $option2',
			'k_03c1nx0': '已同意',
			'k_03aw9w8': '已拒絕',
			'k_038ryos': '去處理',
			'k_0gw8pum': '進群申請',
			'k_1gcvfrj': '請填寫備註名',
			'k_002v9zj': '确认',
			'k_10oqrki': '轻触拍照',
			'k_0f8b3ws': '加载失败',
			'k_11cm5lm': '手动聚焦',
			'k_002uzrd': '预览',
			'k_003qkn3': '录像',
			'k_003k6a7': '拍照',
			'k_0bqpqco': '拍照按钮',
			'k_1626ozl': '停止录像',
			'k_003lvmu': '前置',
			'k_003lued': '后置',
			'k_003lwzh': '外置',
			'k_002qzi3': '关闭',
			'k_003pufb': '自动',
			'k_0apm0ze': '拍照时闪光',
			'k_157zog5': '始终闪光',
			'k_0cfyqhy': ({required Object option1}) => '$option1 画面预览',
			'k_0phctlz': ({required Object option2}) => '闪光模式: $option2',
			'k_02vfqe0': ({required Object option3}) => '切换至 $option3 摄像头',
			'k_0f0y9ex': '说话时间太短',
			'k_0ln70tk': '无法打开URL',
			'k_11a3jdv': '轻触拍照，长按摄像',
			'k_1k18miv': '请传入离开群组生命周期函数，提供返回首页或其他页面的导航方法。',
			'k_1fu9ahv': '全员禁言状态',
			'k_0gmwbnd': '全员禁言中',
			'k_0got2zr': '您被禁言',
			'k_0y9jck8': '你必须自定义search bar，并处理点击跳转',
			'k_0yum3tv': '如使用自定义区域，请在profileWidgetBuilder传入对应组件',
			'k_09kalj0': '清空聊天记录',
			'k_14j5iul': '删除并退出',
			'k_125ru1w': '解散该群',
			'k_0jtutmw': '退出后不会接收到此群聊消息',
			'k_0jtzmqa': '解散后不会接收到此群聊消息',
			'k_0r8fi93': '好友添加成功',
			'k_02qw14e': '好友申请已发出',
			'k_0n3md5x': '当前用户在黑名单',
			'k_094phq4': '好友添加失败',
			'k_129scag': '好友删除成功',
			'k_129uzfn': '好友删除失败',
			'k_1666isy': '清除好友',
			'k_1679vrd': '加为好友',
			'k_1ualc52': '看看对方带来的数据是啥',
			'k_0szluvp': '设置对方在线状态',
			'k_0f4rnf8': '该用户已是好友',
			'k_1tdkom4': '您已是群成员',
			'k_1p2lyuz': '对方正在输入中...',
			'k_1g8wfpy': ({required Object option1}) => '...共$option1人',
			'k_12rv9vw': '回应详情',
			'k_0havgi0': ({required Object linkMessage}) => '[查看详情 >>](${linkMessage.link})',
			'k_0n9p7g8': '群组不存在',
			'k_1tdh5vn': '您不是群成员',
			'k_0h1q57v': '暂无群成员',
			'k_0y5drq1': ({required Object option1}) => '[查看详情 >>]($option1)',
			'k_03pjp61': '[表情消息]',
			'k_1jpvzul': '[自定义消息]',
			'k_03u3bh1': '[文件消息]',
			'k_1odsnsw': '[群消息]',
			'k_03sel4t': '[图片消息]',
			'k_03sfw3r': '[位置消息]',
			'k_03xpuwq': '[合并消息]',
			'k_07ycxwo': '[没有元素]',
			'k_03rc9vz': '[文本消息]',
			'k_046uopf': '[视频消息]',
			'k_0ehmsun': '设备存储空间不足，建议清理，以获得更好使用体验',
			'k_003kmos': '图片',
			'k_002s86q': '视频',
			'k_06bk5ei': '视频消息仅限 mp4 格式',
			'k_13opfxf': 'Web网页端不支持搜索',
			'k_1i0o0y2': '暂时仅限 Android/iOS 端',
			'k_045dtzl': ({required Object option1}) => '$option1的聊天记录',
			'k_0t0131u': '群资料信息',
			'k_18ok8xz': '消息接收方式',
			'k_03ax3ks': '群资料',
			'k_0sqvoqo': ({required Object option1}) => '将 $option1 设置为管理员',
			'k_1gbg1v8': ({required Object option1}) => '将 $option1 取消管理员',
			'k_17k64g4': '群聊创建成功！',
			'k_05mn217': '暂未安装表情包插件，如需使用表情相关功能，请根据本文档安装：https://cloud.tencent.com/document/product/269/70746',
			'k_14j17nz': '暂无表情包',
			'k_0fvjexh': '正在下载中',
			'k_1cdagzz': '已加入待下载队列，其他文件下载中',
			'k_0g4vojc': '开始下载',
			'k_1g32es3': '[调皮]@2x.png',
			'k_1g8qorz': '[爱你]@2x.png',
			'k_1g4hmx6': '[爱情]@2x.png',
			'k_1g6b558': '[爱心]@2x.png',
			'k_1g3m4su': '[傲慢]@2x.png',
			'k_1g2jym7': '[白眼]@2x.png',
			'k_0cgkxuw': '[棒棒糖]@2x.png',
			'k_1g48br2': '[抱抱]@2x.png',
			'k_1g49ol8': '[抱拳]@2x.png',
			'k_1g0ras3': '[爆筋]@2x.png',
			'k_1ghy881': '[鄙视]@2x.png',
			'k_1g86bmv': '[闭嘴]@2x.png',
			'k_1g1xs1p': '[鞭炮]@2x.png',
			'k_1g8i6ri': '[便便]@2x.png',
			'k_1g2u5kf': '[擦汗]@2x.png',
			'k_1g60uwh': '[彩带]@2x.png',
			'k_1g1o0d0': '[彩球]@2x.png',
			'k_1g6a6yq': '[菜刀]@2x.png',
			'k_1g6vqo2': '[差劲]@2x.png',
			'k_1g0kvjc': '[钞票]@2x.png',
			'k_1g65x7e': '[车厢]@2x.png',
			'k_0e1tjol': '[打哈欠]@2x.png',
			'k_1g65n58': '[大兵]@2x.png',
			'k_1g7se7o': '[大哭]@2x.png',
			'k_1g03868': '[蛋糕]@2x.png',
			'k_1h8nm66': '[刀]@2x.png',
			'k_1g3dlpi': '[得意]@2x.png',
			'k_1g3u434': '[灯泡]@2x.png',
			'k_1giuqs7': '[凋谢]@2x.png',
			'k_1g8r0r9': '[多云]@2x.png',
			'k_1g7k6i1': '[发呆]@2x.png',
			'k_1g44zsp': '[发抖]@2x.png',
			'k_1g5l96i': '[飞机]@2x.png',
			'k_1g7wsqj': '[飞吻]@2x.png',
			'k_1g49luq': '[奋斗]@2x.png',
			'k_1gixbsm': '[风车]@2x.png',
			'k_1g6cqbq': '[尴尬]@2x.png',
			'k_1g6jbw5': '[勾引]@2x.png',
			'k_1g3lwo1': '[鼓掌]@2x.png',
			'k_1g13nkj': '[害羞]@2x.png',
			'k_1g0mt47': '[憨笑]@2x.png',
			'k_0bxujkf': '[红灯笼]@2x.png',
			'k_0hhaeh8': '[红双喜]@2x.png',
			'k_1g0jnts': '[坏笑]@2x.png',
			'k_1g46g9c': '[挥手]@2x.png',
			'k_1g4vi9g': '[回头]@2x.png',
			'k_1gf7hes': '[饥饿]@2x.png',
			'k_1g6mvsm': '[激动]@2x.png',
			'k_1gku5mf': '[街舞]@2x.png',
			'k_1g4hidg': '[惊恐]@2x.png',
			'k_1gjbrtu': '[惊讶]@2x.png',
			'k_1g6sand': '[咖啡]@2x.png',
			'k_1g4s8rj': '[磕头]@2x.png',
			'k_1g1wn34': '[可爱]@2x.png',
			'k_1g3l0wd': '[可怜]@2x.png',
			'k_1ggaon9': '[抠鼻]@2x.png',
			'k_1ggvcb0': '[骷髅]@2x.png',
			'k_1h8yqjt': '[酷]@2x.png',
			'k_0jac97i': '[快哭了]@2x.png',
			'k_1h8oiby': '[困]@2x.png',
			'k_1g0s5hg': '[蜡烛]@2x.png',
			'k_1g1iuer': '[篮球]@2x.png',
			'k_1g2xjfi': '[冷汗]@2x.png',
			'k_0s5oyqw': '[礼品袋]@2x.png',
			'k_1g1qqvf': '[礼物]@2x.png',
			'k_1g2slew': '[流汗]@2x.png',
			'k_1g3z9xx': '[流泪]@2x.png',
			'k_1g6pabn': '[麻将]@2x.png',
			'k_0pkaxul': '[麦克风]@2x.png',
			'k_1g7m0zj': '[猫咪]@2x.png',
			'k_0ibvtpo': '[么么哒]@2x.png',
			'k_1g1hoh1': '[玫瑰]@2x.png',
			'k_1gfzeow': '[米饭]@2x.png',
			'k_1g5l15p': '[面条]@2x.png',
			'k_1g2hfa6': '[奶瓶]@2x.png',
			'k_1gix9pj': '[难过]@2x.png',
			'k_1giqn6g': '[闹钟]@2x.png',
			'k_1h8kd64': '[怒]@2x.png',
			'k_1g0vui9': '[怄火]@2x.png',
			'k_1g1jsj7': '[皮球]@2x.png',
			'k_1ghdluw': '[啤酒]@2x.png',
			'k_1gl6ec7': '[瓢虫]@2x.png',
			'k_1g7gg5p': '[撇嘴]@2x.png',
			'k_1g8psin': '[乒乓]@2x.png',
			'k_1gjzu3p': '[汽车]@2x.png',
			'k_1h8mr0k': '[强]@2x.png',
			'k_1g45y2n': '[敲打]@2x.png',
			'k_1gkaxsl': '[青蛙]@2x.png',
			'k_0jcfnoo': '[糗大了]@2x.png',
			'k_1g4njy1': '[拳头]@2x.png',
			'k_1h8mqr3': '[弱]@2x.png',
			'k_1h926fg': '[色]@2x.png',
			'k_1g6rtbq': '[沙发]@2x.png',
			'k_1giirh6': '[删除]@2x.png',
			'k_1g14ny9': '[闪电]@2x.png',
			'k_1g6bmsr': '[胜利]@2x.png',
			'k_1g1rytx': '[示爱]@2x.png',
			'k_1g52fbz': '[手枪]@2x.png',
			'k_1h90dam': '[衰]@2x.png',
			'k_1gigiae': '[睡觉]@2x.png',
			'k_1gijchz': '[太阳]@2x.png',
			'k_1g1sgji': '[跳绳]@2x.png',
			'k_1gjwuri': '[跳跳]@2x.png',
			'k_1g0juhk': '[偷笑]@2x.png',
			'k_1h8nzla': '[吐]@2x.png',
			'k_1g6cv0i': '[委屈]@2x.png',
			'k_1g46l5g': '[握手]@2x.png',
			'k_1g2pgkd': '[西瓜]@2x.png',
			'k_1ging9p': '[下雨]@2x.png',
			'k_1h8nzil': '[吓]@2x.png',
			'k_1g7q7wr': '[献吻]@2x.png',
			'k_1gl6uum': '[香蕉]@2x.png',
			'k_1g23fys': '[象棋]@2x.png',
			'k_0j75rdh': '[心碎了]@2x.png',
			'k_1g6ajj2': '[信封]@2x.png',
			'k_1g21prz': '[熊猫]@2x.png',
			'k_1h8octi': '[嘘]@2x.png',
			'k_1h91zox': '[药]@2x.png',
			'k_1ghttfl': '[疑问]@2x.png',
			'k_1ghk7sz': '[阴险]@2x.png',
			'k_0gl37zz': '[右车头]@2x.png',
			'k_0ifkj1p': '[右哼哼]@2x.png',
			'k_0g1yh2e': '[右太极]@2x.png',
			'k_1g9dkfc': '[雨伞]@2x.png',
			'k_1g8jl88': '[月亮]@2x.png',
			'k_1h8lhqj': '[晕]@2x.png',
			'k_1gi9x2q': '[再见]@2x.png',
			'k_1g6dwwv': '[炸弹]@2x.png',
			'k_1fzmkfi': '[折磨]@2x.png',
			'k_1g6jbiw': '[纸巾]@2x.png',
			'k_1ggjnwu': '[咒骂]@2x.png',
			'k_1g4qlq8': '[猪头]@2x.png',
			'k_1g1lqzz': '[抓狂]@2x.png',
			'k_1g80j3u': '[转圈]@2x.png',
			'k_1g0z55s': '[龇牙]@2x.png',
			'k_1g3ju6v': '[钻戒]@2x.png',
			'k_0gl51l6': '[左车头]@2x.png',
			'k_0iflllk': '[左哼哼]@2x.png',
			'k_0g1y3ir': '[左太极]@2x.png',
			'k_026hiq5': '消息列表加载中',
			'k_003tu8k': '爱你',
			'k_003myvp': '傲慢',
			'k_003kddw': '白眼',
			'k_039yfhv': '棒棒糖',
			'k_003nu3p': '抱抱',
			'k_003nijr': '抱拳',
			'k_003mg88': '爆筋',
			'k_002v17e': '鄙视',
			'k_003qhy4': '闭嘴',
			'k_003l5fq': '鞭炮',
			'k_003uacl': '便便',
			'k_003oq1g': '擦汗',
			'k_003qvey': '彩带',
			'k_003jci7': '彩球',
			'k_003pyu1': '菜刀',
			'k_003q97d': '差劲',
			'k_003po5d': '车厢',
			'k_03eadb2': '打哈欠',
			'k_003pnuf': '大兵',
			'k_003kg57': '蛋糕',
			'k_003mxkt': '得意',
			'k_003onu3': '灯泡',
			'k_002uv8s': '凋谢',
			'k_003kqy0': '调皮',
			'k_003tyum': '多云',
			'k_003pv9u': '发呆',
			'k_036o6mu': '发抖t',
			'k_003nogx': '飞机',
			'k_003q7wg': '飞吻',
			'k_003m0jd': '奋斗',
			'k_002ult9': '风车',
			'k_003r8gt': '尴尬',
			'k_003qy4u': '勾引',
			'k_003mnoa': '鼓掌',
			'k_003lmw8': '害羞',
			'k_003mb30': '憨笑',
			'k_03bj41g': '红灯笼',
			'k_03dxw2f': '红双喜',
			'k_003mk57': '坏笑',
			'k_003nmvf': '挥手',
			'k_003r2i7': '回头',
			'k_002s6f3': '饥饿',
			'k_003qd0t': '激动',
			'k_002vgi4': '街舞',
			'k_003nz33': '惊恐',
			'k_002wh4p': '惊讶',
			'k_003ozpu': '咖啡',
			'k_003qvs4': '磕头',
			'k_003l3wb': '可爱',
			'k_003nuwm': '可怜',
			'k_002rw1q': '抠鼻',
			'k_002tujb': '骷髅',
			'k_00030eq': '酷',
			'k_03i8ath': '快哭了',
			'k_000421h': '困',
			'k_003l5i7': '蜡烛',
			'k_003j72g': '篮球',
			'k_003ofwl': '冷汗',
			'k_02mw65v': '礼品袋',
			'k_003ku40': '礼物',
			'k_003ookz': '流汗',
			'k_003on72': '流泪',
			'k_003rjy0': '麻将',
			'k_003q2f8': '猫咪',
			'k_03et393': '么么哒',
			'k_003j7j2': '玫瑰',
			'k_002sr0b': '米饭',
			'k_003nnza': '面条',
			'k_003jef9': '奶瓶',
			'k_002umn0': '难过',
			'k_002rjib': '闹钟',
			'k_0003zcn': '怒',
			'k_003jzwq': '怄火',
			'k_003j4js': '皮球',
			'k_002r5ir': '啤酒',
			'k_002ubu4': '瓢虫',
			'k_003ppo6': '撇嘴',
			'k_003ty3o': '乒乓',
			'k_002vxwe': '汽车',
			'k_00043hb': '强',
			'k_003nmbo': '敲打',
			'k_002tfhq': '青蛙',
			'k_03i7lrn': '糗大了',
			'k_003r03m': '拳头',
			'k_00043h0': '弱',
			'k_000345z': '色',
			'k_003qmp9': '沙发',
			'k_003it8a': '闪电',
			'k_003pxow': '胜利',
			'k_003kw8e': '示爱',
			'k_003n99g': '手枪',
			'k_00035cl': '衰',
			'k_002vl3h': '睡觉',
			'k_002rgqk': '太阳',
			'k_003m9d1': '跳绳',
			'k_002vobp': '跳跳',
			'k_003mkoz': '偷笑',
			'k_00041px': '吐',
			'k_003rjh5': '委屈',
			'k_003j36u': '西瓜',
			'k_002re92': '下雨',
			'k_00041py': '吓',
			'k_003q06o': '献吻',
			'k_002ubjp': '香蕉',
			'k_003o2tr': '象棋',
			'k_03ie6pa': '心碎了',
			'k_003rao5': '信封',
			'k_003l3us': '熊猫',
			'k_000424d': '嘘',
			'k_00033yi': '药',
			'k_002qtyy': '疑问',
			'k_002qe0o': '阴险',
			'k_03gu7us': '右车头',
			'k_03ere8m': '右哼哼',
			'k_003uqk3': '雨伞',
			'k_003tzdv': '月亮',
			'k_0003z00': '晕',
			'k_002vdrd': '再见',
			'k_003ra1w': '炸弹',
			'k_003lcad': '折磨',
			'k_003q7sz': '纸巾',
			'k_002thn9': '咒骂',
			'k_003qx7f': '猪头',
			'k_003l044': '抓狂',
			'k_003qg4h': '转圈',
			'k_003kb97': '龇牙',
			'k_03gu53l': '左车头',
			'k_03erd1f': '左哼哼',
			'k_003nyvl': '爱情',
			'k_003r85z': '爱心',
			'k_003mk8j': '钞票',
			'k_003pwfj': '大哭',
			'k_00042w5': '刀',
			'k_003nmtr': '握手',
			'k_03c529p': '右太极',
			'k_003n4mk': '钻戒',
			'k_03c5488': '左太极',
			'k_1llp7tu': '该用户不存在',
			'k_0tbyqyb': '加载中…',
			'k_0td1p3f': '保存中…',
			'k_1klqdh1': '仅限汉字、英文、数字和下划线',
			'k_03el5lp': '未填写',
			'k_1ui0gai': '搜索指定内容',
			'k_003nvk2': '消息',
			'k_03agld7': '群提示',
			'k_0elt0kw': '添加群聊',
			'k_0s3sgel': '移出黑名单',
			'k_1qqgjra': ({required Object option3}) => '$option3条未读消息',
			'k_0uubyjr': '以下为未读消息',
			'k_16as7eq': '表情回应',
			'k_003s12u': '回复',
			'k_003s38r': '更多',
			'k_002wkr3': '翻译',
			'k_13g4hxv': '翻译完成',
			'k_003molk': '表情',
			'k_165bbw6': '消息历史',
			'k_13sqc0z': '清除消息',
			'k_0glns86': '删除会话',
			'k_13s99rx': '清空消息',
			'k_11vsa3j': '退出群组',
			'k_11vvszp': '解散群组',
			'k_15i9w72': '群管理员',
			'k_0p3espj': '设置备注名',
			'k_118sw9v': '立即搜索',
			'k_0h20hg5': '视频通话',
			'k_0h22snw': '语音通话',
			'k_003lz6t': '对方',
			'k_1xf4yre': ({required Object option1}) => '发送给$option1',
			'k_003por5': '截图',
			'k_1rw7s82': ' 访问相册中视频权限，以正常使用发送视频等功能。',
			'k_003rcwm': '打开',
			'k_1698c42': '在访达中打开',
			'k_066fxsz': '查看文件夹',
			'k_0k432y2': '无法发送，包含文件夹',
			'k_002wb4y': '会话',
			'k_0od4qyh': '视频文件异常',
			'k_1bfkxg9': '不支持 0KB 文件的传输',
			'k_0vvsw7g': '文件处理异常',
			'k_06e224q': '[消息被管理员撤回]',
			'k_1u1mjcl': '[消息被撤回]',
			'k_1qcqxea': '选择多个会话',
			'k_1qgmc20': '选择一个会话',
			'k_1d8nx6f': '在新窗口中打开',
			'k_1hz05ax': '正在下载原始资源，请稍候...',
			'k_002robo': '清除',
		};
	}
}
