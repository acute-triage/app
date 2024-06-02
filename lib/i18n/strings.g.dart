/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 30 (15 per locale)
///
/// Built on 2024-06-02 at 19:45 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	da(languageCode: 'da', build: _StringsDa.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

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
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get app_name => 'Flutter Project';
	late final _StringsHomePageEn home_page = _StringsHomePageEn._(_root);
	late final _StringsChooseEn choose = _StringsChooseEn._(_root);
	late final _StringsCommonEn common = _StringsCommonEn._(_root);
	late final _StringsErrorHandlerEn error_handler = _StringsErrorHandlerEn._(_root);
}

// Path: home_page
class _StringsHomePageEn {
	_StringsHomePageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String title({required Object whateverYouNameIt}) => 'Flutter ${whateverYouNameIt}';
	String pushed_button({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		zero: 'Press the button, if you dare',
		one: 'You have pushed the button one time',
		two: 'You have pushed the button two times',
		other: 'You have pushed the button ${n} times',
	);
}

// Path: choose
class _StringsChooseEn {
	_StringsChooseEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'hasdasd';
}

// Path: common
class _StringsCommonEn {
	_StringsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get something_went_wrong => 'Ooups! Something went wrong';
	String get retry => 'Try again';
	String get contact_support => 'Contact Support';
	String get are_you_sure => 'Are you sure?';
	String get ok => 'Okay';
	String get cancel => 'Cancel';
}

// Path: error_handler
class _StringsErrorHandlerEn {
	_StringsErrorHandlerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Something went wrong';
	String get content => 'Pleasr try again, or contacts support';
}

// Path: <root>
class _StringsDa implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsDa.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.da,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <da>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsDa _root = this; // ignore: unused_field

	// Translations
	@override String get app_name => 'Flutter Projekt';
	@override late final _StringsHomePageDa home_page = _StringsHomePageDa._(_root);
	@override late final _StringsChooseDa choose = _StringsChooseDa._(_root);
	@override late final _StringsCommonDa common = _StringsCommonDa._(_root);
	@override late final _StringsErrorHandlerDa error_handler = _StringsErrorHandlerDa._(_root);
}

// Path: home_page
class _StringsHomePageDa implements _StringsHomePageEn {
	_StringsHomePageDa._(this._root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String title({required Object whateverYouNameIt}) => 'Flutter ${whateverYouNameIt}';
	@override String pushed_button({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('da'))(n,
		zero: 'Tryk på knappen, hvis du tør',
		one: 'Du har trykket på knappen en gang',
		two: 'Du har trykket på knappen to gange',
		other: 'Du har trykket på knappen ${n} gange',
	);
}

// Path: choose
class _StringsChooseDa implements _StringsChooseEn {
	_StringsChooseDa._(this._root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'hasdasd';
}

// Path: common
class _StringsCommonDa implements _StringsCommonEn {
	_StringsCommonDa._(this._root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get something_went_wrong => 'Uups! Noget gik galt';
	@override String get retry => 'Prøv igen';
	@override String get contact_support => 'Kontakt support';
	@override String get are_you_sure => 'Er du sikker?';
	@override String get ok => 'Okay';
	@override String get cancel => 'Fortryd';
}

// Path: error_handler
class _StringsErrorHandlerDa implements _StringsErrorHandlerEn {
	_StringsErrorHandlerDa._(this._root);

	@override final _StringsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Something went wrong';
	@override String get content => 'Pleasr try again, or contacts support';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'app_name': return 'Flutter Project';
			case 'home_page.title': return ({required Object whateverYouNameIt}) => 'Flutter ${whateverYouNameIt}';
			case 'home_page.pushed_button': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				zero: 'Press the button, if you dare',
				one: 'You have pushed the button one time',
				two: 'You have pushed the button two times',
				other: 'You have pushed the button ${n} times',
			);
			case 'choose.title': return 'hasdasd';
			case 'common.something_went_wrong': return 'Ooups! Something went wrong';
			case 'common.retry': return 'Try again';
			case 'common.contact_support': return 'Contact Support';
			case 'common.are_you_sure': return 'Are you sure?';
			case 'common.ok': return 'Okay';
			case 'common.cancel': return 'Cancel';
			case 'error_handler.title': return 'Something went wrong';
			case 'error_handler.content': return 'Pleasr try again, or contacts support';
			default: return null;
		}
	}
}

extension on _StringsDa {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'app_name': return 'Flutter Projekt';
			case 'home_page.title': return ({required Object whateverYouNameIt}) => 'Flutter ${whateverYouNameIt}';
			case 'home_page.pushed_button': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('da'))(n,
				zero: 'Tryk på knappen, hvis du tør',
				one: 'Du har trykket på knappen en gang',
				two: 'Du har trykket på knappen to gange',
				other: 'Du har trykket på knappen ${n} gange',
			);
			case 'choose.title': return 'hasdasd';
			case 'common.something_went_wrong': return 'Uups! Noget gik galt';
			case 'common.retry': return 'Prøv igen';
			case 'common.contact_support': return 'Kontakt support';
			case 'common.are_you_sure': return 'Er du sikker?';
			case 'common.ok': return 'Okay';
			case 'common.cancel': return 'Fortryd';
			case 'error_handler.title': return 'Something went wrong';
			case 'error_handler.content': return 'Pleasr try again, or contacts support';
			default: return null;
		}
	}
}
