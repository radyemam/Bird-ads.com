// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Settings`
  String get title {
    return Intl.message(
      'Settings',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Please choose a language`
  String get choose_language {
    return Intl.message(
      'Please choose a language',
      name: 'choose_language',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Language saved successfully`
  String get language_saved {
    return Intl.message(
      'Language saved successfully',
      name: 'language_saved',
      desc: '',
      args: [],
    );
  }

  /// `My Accounts`
  String get account_balance_wallet {
    return Intl.message(
      'My Accounts',
      name: 'account_balance_wallet',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get edit_profile {
    return Intl.message(
      'Edit Profile',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `FAQ`
  String get faq {
    return Intl.message(
      'FAQ',
      name: 'faq',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message(
      'Support',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get change_language {
    return Intl.message(
      'Change Language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `UID copied to clipboard`
  String get uid_copied {
    return Intl.message(
      'UID copied to clipboard',
      name: 'uid_copied',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout?`
  String get logout_confirmation {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'logout_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Wallet Balance`
  String get wallet_balance {
    return Intl.message(
      'Wallet Balance',
      name: 'wallet_balance',
      desc: '',
      args: [],
    );
  }

  /// `Refund Request`
  String get refund_request {
    return Intl.message(
      'Refund Request',
      name: 'refund_request',
      desc: '',
      args: [],
    );
  }

  /// `Add Coupon`
  String get add_coupon {
    return Intl.message(
      'Add Coupon',
      name: 'add_coupon',
      desc: '',
      args: [],
    );
  }

  /// `Add Balance`
  String get add_balance {
    return Intl.message(
      'Add Balance',
      name: 'add_balance',
      desc: '',
      args: [],
    );
  }

  /// `Detailed Account Statement`
  String get detailed_account_statement {
    return Intl.message(
      'Detailed Account Statement',
      name: 'detailed_account_statement',
      desc: '',
      args: [],
    );
  }

  /// `Create Ad with Experts`
  String get create_ad_with_experts {
    return Intl.message(
      'Create Ad with Experts',
      name: 'create_ad_with_experts',
      desc: '',
      args: [],
    );
  }

  /// `Enter Ad Name`
  String get enter_ad_name {
    return Intl.message(
      'Enter Ad Name',
      name: 'enter_ad_name',
      desc: '',
      args: [],
    );
  }

  /// `Type the ad name here`
  String get ad_name_placeholder {
    return Intl.message(
      'Type the ad name here',
      name: 'ad_name_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Select Platform`
  String get select_platform {
    return Intl.message(
      'Select Platform',
      name: 'select_platform',
      desc: '',
      args: [],
    );
  }

  /// `Ad Goal`
  String get ad_goal {
    return Intl.message(
      'Ad Goal',
      name: 'ad_goal',
      desc: '',
      args: [],
    );
  }

  /// `Target Audience`
  String get target_audience {
    return Intl.message(
      'Target Audience',
      name: 'target_audience',
      desc: '',
      args: [],
    );
  }

  /// `Gender and Age`
  String get gender_and_age {
    return Intl.message(
      'Gender and Age',
      name: 'gender_and_age',
      desc: '',
      args: [],
    );
  }

  /// `Location Selection`
  String get location_selection {
    return Intl.message(
      'Location Selection',
      name: 'location_selection',
      desc: '',
      args: [],
    );
  }

  /// `Duration and Budget`
  String get duration_and_budget {
    return Intl.message(
      'Duration and Budget',
      name: 'duration_and_budget',
      desc: '',
      args: [],
    );
  }

  /// `Post Content`
  String get post_content {
    return Intl.message(
      'Post Content',
      name: 'post_content',
      desc: '',
      args: [],
    );
  }

  /// `Permissions`
  String get permissions {
    return Intl.message(
      'Permissions',
      name: 'permissions',
      desc: '',
      args: [],
    );
  }

  /// `Submit Ad`
  String get submit_ad {
    return Intl.message(
      'Submit Ad',
      name: 'submit_ad',
      desc: '',
      args: [],
    );
  }

  /// `Ad has been submitted and will be processed within 2 working hours. Please check notifications.`
  String get ad_sent_success {
    return Intl.message(
      'Ad has been submitted and will be processed within 2 working hours. Please check notifications.',
      name: 'ad_sent_success',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Website Link`
  String get website_link {
    return Intl.message(
      'Website Link',
      name: 'website_link',
      desc: '',
      args: [],
    );
  }

  /// `App Link`
  String get app_link {
    return Intl.message(
      'App Link',
      name: 'app_link',
      desc: '',
      args: [],
    );
  }

  /// `Details Form`
  String get details_form {
    return Intl.message(
      'Details Form',
      name: 'details_form',
      desc: '',
      args: [],
    );
  }

  /// `Please specify the budget and number of days`
  String get budget_days_error {
    return Intl.message(
      'Please specify the budget and number of days',
      name: 'budget_days_error',
      desc: '',
      args: [],
    );
  }

  /// `Please specify the post selection`
  String get post_selection_error {
    return Intl.message(
      'Please specify the post selection',
      name: 'post_selection_error',
      desc: '',
      args: [],
    );
  }

  /// `Choose your ad platform`
  String get choose_ad_platform {
    return Intl.message(
      'Choose your ad platform',
      name: 'choose_ad_platform',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get facebook {
    return Intl.message(
      'Facebook',
      name: 'facebook',
      desc: '',
      args: [],
    );
  }

  /// `Instagram`
  String get instagram {
    return Intl.message(
      'Instagram',
      name: 'instagram',
      desc: '',
      args: [],
    );
  }

  /// `Facebook & Instagram`
  String get facebook_instagram {
    return Intl.message(
      'Facebook & Instagram',
      name: 'facebook_instagram',
      desc: '',
      args: [],
    );
  }

  /// `TikTok`
  String get tiktok {
    return Intl.message(
      'TikTok',
      name: 'tiktok',
      desc: '',
      args: [],
    );
  }

  /// `Google`
  String get google {
    return Intl.message(
      'Google',
      name: 'google',
      desc: '',
      args: [],
    );
  }

  /// `YouTube`
  String get youtube {
    return Intl.message(
      'YouTube',
      name: 'youtube',
      desc: '',
      args: [],
    );
  }

  /// `Create ad with company experts`
  String get create_ad_with_company_experts {
    return Intl.message(
      'Create ad with company experts',
      name: 'create_ad_with_company_experts',
      desc: '',
      args: [],
    );
  }

  /// `Please choose`
  String get please_choose {
    return Intl.message(
      'Please choose',
      name: 'please_choose',
      desc: '',
      args: [],
    );
  }

  /// `Choose one of the following options:`
  String get choose_one_of_the_following {
    return Intl.message(
      'Choose one of the following options:',
      name: 'choose_one_of_the_following',
      desc: '',
      args: [],
    );
  }

  /// `Continue your previous ad`
  String get continue_previous_ad {
    return Intl.message(
      'Continue your previous ad',
      name: 'continue_previous_ad',
      desc: '',
      args: [],
    );
  }

  /// `Choose Ad Platform`
  String get choose_ad_platform_title {
    return Intl.message(
      'Choose Ad Platform',
      name: 'choose_ad_platform_title',
      desc: '',
      args: [],
    );
  }

  /// `Start a new ad`
  String get start_new_ad {
    return Intl.message(
      'Start a new ad',
      name: 'start_new_ad',
      desc: '',
      args: [],
    );
  }

  /// `Choose Ad Goal`
  String get choose_ad_goal_title {
    return Intl.message(
      'Choose Ad Goal',
      name: 'choose_ad_goal_title',
      desc: '',
      args: [],
    );
  }

  /// `Choose your ad goal`
  String get choose_ad_goal {
    return Intl.message(
      'Choose your ad goal',
      name: 'choose_ad_goal',
      desc: '',
      args: [],
    );
  }

  /// `Messenger Messages`
  String get messenger_messages {
    return Intl.message(
      'Messenger Messages',
      name: 'messenger_messages',
      desc: '',
      args: [],
    );
  }

  /// `WhatsApp Messages`
  String get whatsapp_messages {
    return Intl.message(
      'WhatsApp Messages',
      name: 'whatsapp_messages',
      desc: '',
      args: [],
    );
  }

  /// `Instagram Direct Messages`
  String get instagram_direct_messages {
    return Intl.message(
      'Instagram Direct Messages',
      name: 'instagram_direct_messages',
      desc: '',
      args: [],
    );
  }

  /// `Post Engagement`
  String get post_engagement {
    return Intl.message(
      'Post Engagement',
      name: 'post_engagement',
      desc: '',
      args: [],
    );
  }

  /// `Increase Followers`
  String get increase_followers {
    return Intl.message(
      'Increase Followers',
      name: 'increase_followers',
      desc: '',
      args: [],
    );
  }

  /// `Website Visits`
  String get website_visits {
    return Intl.message(
      'Website Visits',
      name: 'website_visits',
      desc: '',
      args: [],
    );
  }

  /// `Instant Forms`
  String get instant_forms {
    return Intl.message(
      'Instant Forms',
      name: 'instant_forms',
      desc: '',
      args: [],
    );
  }

  /// `App Downloads`
  String get app_downloads {
    return Intl.message(
      'App Downloads',
      name: 'app_downloads',
      desc: '',
      args: [],
    );
  }

  /// `(best and cheapest)`
  String get messenger_note {
    return Intl.message(
      '(best and cheapest)',
      name: 'messenger_note',
      desc: '',
      args: [],
    );
  }

  /// `(make sure the page is linked to WhatsApp)`
  String get whatsapp_note {
    return Intl.message(
      '(make sure the page is linked to WhatsApp)',
      name: 'whatsapp_note',
      desc: '',
      args: [],
    );
  }

  /// `(for Instagram campaigns only)`
  String get instagram_note {
    return Intl.message(
      '(for Instagram campaigns only)',
      name: 'instagram_note',
      desc: '',
      args: [],
    );
  }

  /// `(to increase likes and comments on the post)`
  String get post_engagement_note {
    return Intl.message(
      '(to increase likes and comments on the post)',
      name: 'post_engagement_note',
      desc: '',
      args: [],
    );
  }

  /// `(to increase page followers)`
  String get increase_followers_note {
    return Intl.message(
      '(to increase page followers)',
      name: 'increase_followers_note',
      desc: '',
      args: [],
    );
  }

  /// `(please provide the website link)`
  String get website_note {
    return Intl.message(
      '(please provide the website link)',
      name: 'website_note',
      desc: '',
      args: [],
    );
  }

  /// `(more expensive - lead generation)`
  String get instant_forms_note {
    return Intl.message(
      '(more expensive - lead generation)',
      name: 'instant_forms_note',
      desc: '',
      args: [],
    );
  }

  /// `(Android or iPhone)`
  String get app_downloads_note {
    return Intl.message(
      '(Android or iPhone)',
      name: 'app_downloads_note',
      desc: '',
      args: [],
    );
  }

  /// `Instant Form Details`
  String get instant_form_details {
    return Intl.message(
      'Instant Form Details',
      name: 'instant_form_details',
      desc: '',
      args: [],
    );
  }

  /// `Saved link:`
  String get saved_link {
    return Intl.message(
      'Saved link:',
      name: 'saved_link',
      desc: '',
      args: [],
    );
  }

  /// `Saved app link:`
  String get saved_app_link {
    return Intl.message(
      'Saved app link:',
      name: 'saved_app_link',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Men`
  String get men {
    return Intl.message(
      'Men',
      name: 'men',
      desc: '',
      args: [],
    );
  }

  /// `Women`
  String get women {
    return Intl.message(
      'Women',
      name: 'women',
      desc: '',
      args: [],
    );
  }

  /// `Men and Women`
  String get men_and_women {
    return Intl.message(
      'Men and Women',
      name: 'men_and_women',
      desc: '',
      args: [],
    );
  }

  /// `Choose Gender`
  String get choose_gender {
    return Intl.message(
      'Choose Gender',
      name: 'choose_gender',
      desc: '',
      args: [],
    );
  }

  /// `Choose Age`
  String get choose_age {
    return Intl.message(
      'Choose Age',
      name: 'choose_age',
      desc: '',
      args: [],
    );
  }

  /// `Keywords and Titles`
  String get keywords_and_titles {
    return Intl.message(
      'Keywords and Titles',
      name: 'keywords_and_titles',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the keywords and titles you prefer:`
  String get enter_keywords_and_titles {
    return Intl.message(
      'Please enter the keywords and titles you prefer:',
      name: 'enter_keywords_and_titles',
      desc: '',
      args: [],
    );
  }

  /// `Type the keywords and titles here...`
  String get hint_keywords_and_titles {
    return Intl.message(
      'Type the keywords and titles here...',
      name: 'hint_keywords_and_titles',
      desc: '',
      args: [],
    );
  }

  /// `Saved instant form details:`
  String get saved_instant_form_details {
    return Intl.message(
      'Saved instant form details:',
      name: 'saved_instant_form_details',
      desc: '',
      args: [],
    );
  }

  /// `Select Locations for Your Ad`
  String get location_selection_page_title {
    return Intl.message(
      'Select Locations for Your Ad',
      name: 'location_selection_page_title',
      desc: '',
      args: [],
    );
  }

  /// `Select Locations`
  String get select_countries {
    return Intl.message(
      'Select Locations',
      name: 'select_countries',
      desc: '',
      args: [],
    );
  }

  /// `Select Country`
  String get select_country_hint {
    return Intl.message(
      'Select Country',
      name: 'select_country_hint',
      desc: '',
      args: [],
    );
  }

  /// `Select State/City`
  String get select_region_hint {
    return Intl.message(
      'Select State/City',
      name: 'select_region_hint',
      desc: '',
      args: [],
    );
  }

  /// `Selected Countries and Regions`
  String get selected_locations_title {
    return Intl.message(
      'Selected Countries and Regions',
      name: 'selected_locations_title',
      desc: '',
      args: [],
    );
  }

  /// `Clear All`
  String get clear_all {
    return Intl.message(
      'Clear All',
      name: 'clear_all',
      desc: '',
      args: [],
    );
  }

  /// `Egypt`
  String get egypt {
    return Intl.message(
      'Egypt',
      name: 'egypt',
      desc: '',
      args: [],
    );
  }

  /// `Saudi Arabia`
  String get saudi_arabia {
    return Intl.message(
      'Saudi Arabia',
      name: 'saudi_arabia',
      desc: '',
      args: [],
    );
  }

  /// `Kuwait`
  String get kuwait {
    return Intl.message(
      'Kuwait',
      name: 'kuwait',
      desc: '',
      args: [],
    );
  }

  /// `UAE`
  String get uae {
    return Intl.message(
      'UAE',
      name: 'uae',
      desc: '',
      args: [],
    );
  }

  /// `Qatar`
  String get qatar {
    return Intl.message(
      'Qatar',
      name: 'qatar',
      desc: '',
      args: [],
    );
  }

  /// `Bahrain`
  String get bahrain {
    return Intl.message(
      'Bahrain',
      name: 'bahrain',
      desc: '',
      args: [],
    );
  }

  /// `Oman`
  String get oman {
    return Intl.message(
      'Oman',
      name: 'oman',
      desc: '',
      args: [],
    );
  }

  /// `USA`
  String get usa {
    return Intl.message(
      'USA',
      name: 'usa',
      desc: '',
      args: [],
    );
  }

  /// `Canada`
  String get canada {
    return Intl.message(
      'Canada',
      name: 'canada',
      desc: '',
      args: [],
    );
  }

  /// `Libya`
  String get libya {
    return Intl.message(
      'Libya',
      name: 'libya',
      desc: '',
      args: [],
    );
  }

  /// `Algeria`
  String get algeria {
    return Intl.message(
      'Algeria',
      name: 'algeria',
      desc: '',
      args: [],
    );
  }

  /// `Morocco`
  String get morocco {
    return Intl.message(
      'Morocco',
      name: 'morocco',
      desc: '',
      args: [],
    );
  }

  /// `All Egypt`
  String get egypt_all {
    return Intl.message(
      'All Egypt',
      name: 'egypt_all',
      desc: '',
      args: [],
    );
  }

  /// `Cairo`
  String get cairo {
    return Intl.message(
      'Cairo',
      name: 'cairo',
      desc: '',
      args: [],
    );
  }

  /// `Giza`
  String get giza {
    return Intl.message(
      'Giza',
      name: 'giza',
      desc: '',
      args: [],
    );
  }

  /// `Alexandria`
  String get alexandria {
    return Intl.message(
      'Alexandria',
      name: 'alexandria',
      desc: '',
      args: [],
    );
  }

  /// `Luxor`
  String get luxor {
    return Intl.message(
      'Luxor',
      name: 'luxor',
      desc: '',
      args: [],
    );
  }

  /// `Aswan`
  String get aswan {
    return Intl.message(
      'Aswan',
      name: 'aswan',
      desc: '',
      args: [],
    );
  }

  /// `Faiyum`
  String get faiyum {
    return Intl.message(
      'Faiyum',
      name: 'faiyum',
      desc: '',
      args: [],
    );
  }

  /// `Gharbia`
  String get gharbia {
    return Intl.message(
      'Gharbia',
      name: 'gharbia',
      desc: '',
      args: [],
    );
  }

  /// `Sharqia`
  String get sharqia {
    return Intl.message(
      'Sharqia',
      name: 'sharqia',
      desc: '',
      args: [],
    );
  }

  /// `Dakahlia`
  String get dakahlia {
    return Intl.message(
      'Dakahlia',
      name: 'dakahlia',
      desc: '',
      args: [],
    );
  }

  /// `Qalyubia`
  String get qalyubia {
    return Intl.message(
      'Qalyubia',
      name: 'qalyubia',
      desc: '',
      args: [],
    );
  }

  /// `Monufia`
  String get monufia {
    return Intl.message(
      'Monufia',
      name: 'monufia',
      desc: '',
      args: [],
    );
  }

  /// `Kafr El Sheikh`
  String get kafr_el_sheikh {
    return Intl.message(
      'Kafr El Sheikh',
      name: 'kafr_el_sheikh',
      desc: '',
      args: [],
    );
  }

  /// `Beheira`
  String get beheira {
    return Intl.message(
      'Beheira',
      name: 'beheira',
      desc: '',
      args: [],
    );
  }

  /// `Matruh`
  String get matruh {
    return Intl.message(
      'Matruh',
      name: 'matruh',
      desc: '',
      args: [],
    );
  }

  /// `North Sinai`
  String get north_sinai {
    return Intl.message(
      'North Sinai',
      name: 'north_sinai',
      desc: '',
      args: [],
    );
  }

  /// `South Sinai`
  String get south_sinai {
    return Intl.message(
      'South Sinai',
      name: 'south_sinai',
      desc: '',
      args: [],
    );
  }

  /// `Red Sea`
  String get red_sea {
    return Intl.message(
      'Red Sea',
      name: 'red_sea',
      desc: '',
      args: [],
    );
  }

  /// `Suez`
  String get suez {
    return Intl.message(
      'Suez',
      name: 'suez',
      desc: '',
      args: [],
    );
  }

  /// `Port Said`
  String get port_said {
    return Intl.message(
      'Port Said',
      name: 'port_said',
      desc: '',
      args: [],
    );
  }

  /// `Ismailia`
  String get ismailia {
    return Intl.message(
      'Ismailia',
      name: 'ismailia',
      desc: '',
      args: [],
    );
  }

  /// `Minya`
  String get minya {
    return Intl.message(
      'Minya',
      name: 'minya',
      desc: '',
      args: [],
    );
  }

  /// `Asyut`
  String get asyut {
    return Intl.message(
      'Asyut',
      name: 'asyut',
      desc: '',
      args: [],
    );
  }

  /// `Sohag`
  String get sohag {
    return Intl.message(
      'Sohag',
      name: 'sohag',
      desc: '',
      args: [],
    );
  }

  /// `Qena`
  String get qena {
    return Intl.message(
      'Qena',
      name: 'qena',
      desc: '',
      args: [],
    );
  }

  /// `Bani Suef`
  String get bani_suef {
    return Intl.message(
      'Bani Suef',
      name: 'bani_suef',
      desc: '',
      args: [],
    );
  }

  /// `New Valley`
  String get new_valley {
    return Intl.message(
      'New Valley',
      name: 'new_valley',
      desc: '',
      args: [],
    );
  }

  /// `Damietta`
  String get damietta {
    return Intl.message(
      'Damietta',
      name: 'damietta',
      desc: '',
      args: [],
    );
  }

  /// `All Saudi Arabia`
  String get saudi_all {
    return Intl.message(
      'All Saudi Arabia',
      name: 'saudi_all',
      desc: '',
      args: [],
    );
  }

  /// `Riyadh`
  String get riyadh {
    return Intl.message(
      'Riyadh',
      name: 'riyadh',
      desc: '',
      args: [],
    );
  }

  /// `Jeddah`
  String get jeddah {
    return Intl.message(
      'Jeddah',
      name: 'jeddah',
      desc: '',
      args: [],
    );
  }

  /// `Mecca`
  String get mecca {
    return Intl.message(
      'Mecca',
      name: 'mecca',
      desc: '',
      args: [],
    );
  }

  /// `Medina`
  String get medina {
    return Intl.message(
      'Medina',
      name: 'medina',
      desc: '',
      args: [],
    );
  }

  /// `Dammam`
  String get dammam {
    return Intl.message(
      'Dammam',
      name: 'dammam',
      desc: '',
      args: [],
    );
  }

  /// `Khobar`
  String get khobar {
    return Intl.message(
      'Khobar',
      name: 'khobar',
      desc: '',
      args: [],
    );
  }

  /// `Taif`
  String get taif {
    return Intl.message(
      'Taif',
      name: 'taif',
      desc: '',
      args: [],
    );
  }

  /// `Buraidah`
  String get buraidah {
    return Intl.message(
      'Buraidah',
      name: 'buraidah',
      desc: '',
      args: [],
    );
  }

  /// `Abha`
  String get abha {
    return Intl.message(
      'Abha',
      name: 'abha',
      desc: '',
      args: [],
    );
  }

  /// `Khamis Mushait`
  String get khamis_mushait {
    return Intl.message(
      'Khamis Mushait',
      name: 'khamis_mushait',
      desc: '',
      args: [],
    );
  }

  /// `Hail`
  String get hail {
    return Intl.message(
      'Hail',
      name: 'hail',
      desc: '',
      args: [],
    );
  }

  /// `Arar`
  String get arar {
    return Intl.message(
      'Arar',
      name: 'arar',
      desc: '',
      args: [],
    );
  }

  /// `Jazan`
  String get jazan {
    return Intl.message(
      'Jazan',
      name: 'jazan',
      desc: '',
      args: [],
    );
  }

  /// `Najran`
  String get najran {
    return Intl.message(
      'Najran',
      name: 'najran',
      desc: '',
      args: [],
    );
  }

  /// `Tabuk`
  String get tabuk {
    return Intl.message(
      'Tabuk',
      name: 'tabuk',
      desc: '',
      args: [],
    );
  }

  /// `Al Bahah`
  String get al_bahah {
    return Intl.message(
      'Al Bahah',
      name: 'al_bahah',
      desc: '',
      args: [],
    );
  }

  /// `Sakaka`
  String get sakaka {
    return Intl.message(
      'Sakaka',
      name: 'sakaka',
      desc: '',
      args: [],
    );
  }

  /// `Dhahran`
  String get dhahran {
    return Intl.message(
      'Dhahran',
      name: 'dhahran',
      desc: '',
      args: [],
    );
  }

  /// `All Kuwait`
  String get kuwait_all {
    return Intl.message(
      'All Kuwait',
      name: 'kuwait_all',
      desc: '',
      args: [],
    );
  }

  /// `Capital`
  String get capital {
    return Intl.message(
      'Capital',
      name: 'capital',
      desc: '',
      args: [],
    );
  }

  /// `Farwaniya`
  String get farwaniya {
    return Intl.message(
      'Farwaniya',
      name: 'farwaniya',
      desc: '',
      args: [],
    );
  }

  /// `Jahra`
  String get jahra {
    return Intl.message(
      'Jahra',
      name: 'jahra',
      desc: '',
      args: [],
    );
  }

  /// `Hawalli`
  String get hawalli {
    return Intl.message(
      'Hawalli',
      name: 'hawalli',
      desc: '',
      args: [],
    );
  }

  /// `Ahmadi`
  String get ahmadi {
    return Intl.message(
      'Ahmadi',
      name: 'ahmadi',
      desc: '',
      args: [],
    );
  }

  /// `Mubarak Al Kabeer`
  String get mubarak_al_kabeer {
    return Intl.message(
      'Mubarak Al Kabeer',
      name: 'mubarak_al_kabeer',
      desc: '',
      args: [],
    );
  }

  /// `All UAE`
  String get uae_all {
    return Intl.message(
      'All UAE',
      name: 'uae_all',
      desc: '',
      args: [],
    );
  }

  /// `Abu Dhabi`
  String get abu_dhabi {
    return Intl.message(
      'Abu Dhabi',
      name: 'abu_dhabi',
      desc: '',
      args: [],
    );
  }

  /// `Dubai`
  String get dubai {
    return Intl.message(
      'Dubai',
      name: 'dubai',
      desc: '',
      args: [],
    );
  }

  /// `Sharjah`
  String get sharjah {
    return Intl.message(
      'Sharjah',
      name: 'sharjah',
      desc: '',
      args: [],
    );
  }

  /// `Ajman`
  String get ajman {
    return Intl.message(
      'Ajman',
      name: 'ajman',
      desc: '',
      args: [],
    );
  }

  /// `Ras Al Khaimah`
  String get ras_al_khaimah {
    return Intl.message(
      'Ras Al Khaimah',
      name: 'ras_al_khaimah',
      desc: '',
      args: [],
    );
  }

  /// `Fujairah`
  String get fujairah {
    return Intl.message(
      'Fujairah',
      name: 'fujairah',
      desc: '',
      args: [],
    );
  }

  /// `Umm Al Quwain`
  String get umm_al_quwain {
    return Intl.message(
      'Umm Al Quwain',
      name: 'umm_al_quwain',
      desc: '',
      args: [],
    );
  }

  /// `All Qatar`
  String get qatar_all {
    return Intl.message(
      'All Qatar',
      name: 'qatar_all',
      desc: '',
      args: [],
    );
  }

  /// `Doha`
  String get doha {
    return Intl.message(
      'Doha',
      name: 'doha',
      desc: '',
      args: [],
    );
  }

  /// `Rayyan`
  String get rayyan {
    return Intl.message(
      'Rayyan',
      name: 'rayyan',
      desc: '',
      args: [],
    );
  }

  /// `Wakra`
  String get wakra {
    return Intl.message(
      'Wakra',
      name: 'wakra',
      desc: '',
      args: [],
    );
  }

  /// `Khor`
  String get khor {
    return Intl.message(
      'Khor',
      name: 'khor',
      desc: '',
      args: [],
    );
  }

  /// `Shamal`
  String get shamal {
    return Intl.message(
      'Shamal',
      name: 'shamal',
      desc: '',
      args: [],
    );
  }

  /// `Um Said`
  String get um_said {
    return Intl.message(
      'Um Said',
      name: 'um_said',
      desc: '',
      args: [],
    );
  }

  /// `Shayhaniya`
  String get shayhaniya {
    return Intl.message(
      'Shayhaniya',
      name: 'shayhaniya',
      desc: '',
      args: [],
    );
  }

  /// `All Bahrain`
  String get bahrain_all {
    return Intl.message(
      'All Bahrain',
      name: 'bahrain_all',
      desc: '',
      args: [],
    );
  }

  /// `Manama`
  String get manama {
    return Intl.message(
      'Manama',
      name: 'manama',
      desc: '',
      args: [],
    );
  }

  /// `Muharraq`
  String get muharraq {
    return Intl.message(
      'Muharraq',
      name: 'muharraq',
      desc: '',
      args: [],
    );
  }

  /// `Riffa`
  String get riffa {
    return Intl.message(
      'Riffa',
      name: 'riffa',
      desc: '',
      args: [],
    );
  }

  /// `Isa Town`
  String get isa_town {
    return Intl.message(
      'Isa Town',
      name: 'isa_town',
      desc: '',
      args: [],
    );
  }

  /// `Hamad Town`
  String get hamad_town {
    return Intl.message(
      'Hamad Town',
      name: 'hamad_town',
      desc: '',
      args: [],
    );
  }

  /// `Jidhafs`
  String get jidhafs {
    return Intl.message(
      'Jidhafs',
      name: 'jidhafs',
      desc: '',
      args: [],
    );
  }

  /// `Sitra`
  String get sitra {
    return Intl.message(
      'Sitra',
      name: 'sitra',
      desc: '',
      args: [],
    );
  }

  /// `Budiya`
  String get budiya {
    return Intl.message(
      'Budiya',
      name: 'budiya',
      desc: '',
      args: [],
    );
  }

  /// `All Oman`
  String get oman_all {
    return Intl.message(
      'All Oman',
      name: 'oman_all',
      desc: '',
      args: [],
    );
  }

  /// `Muscat`
  String get muscat {
    return Intl.message(
      'Muscat',
      name: 'muscat',
      desc: '',
      args: [],
    );
  }

  /// `Salalah`
  String get salalah {
    return Intl.message(
      'Salalah',
      name: 'salalah',
      desc: '',
      args: [],
    );
  }

  /// `Sohar`
  String get sohar {
    return Intl.message(
      'Sohar',
      name: 'sohar',
      desc: '',
      args: [],
    );
  }

  /// `Nizwa`
  String get nizwa {
    return Intl.message(
      'Nizwa',
      name: 'nizwa',
      desc: '',
      args: [],
    );
  }

  /// `Rustaq`
  String get rustaq {
    return Intl.message(
      'Rustaq',
      name: 'rustaq',
      desc: '',
      args: [],
    );
  }

  /// `Ibri`
  String get ibri {
    return Intl.message(
      'Ibri',
      name: 'ibri',
      desc: '',
      args: [],
    );
  }

  /// `Buraimi`
  String get buraimi {
    return Intl.message(
      'Buraimi',
      name: 'buraimi',
      desc: '',
      args: [],
    );
  }

  /// `Sur`
  String get sur {
    return Intl.message(
      'Sur',
      name: 'sur',
      desc: '',
      args: [],
    );
  }

  /// `Khasab`
  String get khasab {
    return Intl.message(
      'Khasab',
      name: 'khasab',
      desc: '',
      args: [],
    );
  }

  /// `All USA`
  String get usa_all {
    return Intl.message(
      'All USA',
      name: 'usa_all',
      desc: '',
      args: [],
    );
  }

  /// `New York`
  String get new_york {
    return Intl.message(
      'New York',
      name: 'new_york',
      desc: '',
      args: [],
    );
  }

  /// `Los Angeles`
  String get los_angeles {
    return Intl.message(
      'Los Angeles',
      name: 'los_angeles',
      desc: '',
      args: [],
    );
  }

  /// `Chicago`
  String get chicago {
    return Intl.message(
      'Chicago',
      name: 'chicago',
      desc: '',
      args: [],
    );
  }

  /// `Houston`
  String get houston {
    return Intl.message(
      'Houston',
      name: 'houston',
      desc: '',
      args: [],
    );
  }

  /// `Phoenix`
  String get phoenix {
    return Intl.message(
      'Phoenix',
      name: 'phoenix',
      desc: '',
      args: [],
    );
  }

  /// `Philadelphia`
  String get philadelphia {
    return Intl.message(
      'Philadelphia',
      name: 'philadelphia',
      desc: '',
      args: [],
    );
  }

  /// `San Antonio`
  String get san_antonio {
    return Intl.message(
      'San Antonio',
      name: 'san_antonio',
      desc: '',
      args: [],
    );
  }

  /// `San Diego`
  String get san_diego {
    return Intl.message(
      'San Diego',
      name: 'san_diego',
      desc: '',
      args: [],
    );
  }

  /// `Dallas`
  String get dallas {
    return Intl.message(
      'Dallas',
      name: 'dallas',
      desc: '',
      args: [],
    );
  }

  /// `San Jose`
  String get san_jose {
    return Intl.message(
      'San Jose',
      name: 'san_jose',
      desc: '',
      args: [],
    );
  }

  /// `All Canada`
  String get canada_all {
    return Intl.message(
      'All Canada',
      name: 'canada_all',
      desc: '',
      args: [],
    );
  }

  /// `Toronto`
  String get toronto {
    return Intl.message(
      'Toronto',
      name: 'toronto',
      desc: '',
      args: [],
    );
  }

  /// `Vancouver`
  String get vancouver {
    return Intl.message(
      'Vancouver',
      name: 'vancouver',
      desc: '',
      args: [],
    );
  }

  /// `Montreal`
  String get montreal {
    return Intl.message(
      'Montreal',
      name: 'montreal',
      desc: '',
      args: [],
    );
  }

  /// `Calgary`
  String get calgary {
    return Intl.message(
      'Calgary',
      name: 'calgary',
      desc: '',
      args: [],
    );
  }

  /// `Ottawa`
  String get ottawa {
    return Intl.message(
      'Ottawa',
      name: 'ottawa',
      desc: '',
      args: [],
    );
  }

  /// `Edmonton`
  String get edmonton {
    return Intl.message(
      'Edmonton',
      name: 'edmonton',
      desc: '',
      args: [],
    );
  }

  /// `Winnipeg`
  String get winnipeg {
    return Intl.message(
      'Winnipeg',
      name: 'winnipeg',
      desc: '',
      args: [],
    );
  }

  /// `Quebec`
  String get quebec {
    return Intl.message(
      'Quebec',
      name: 'quebec',
      desc: '',
      args: [],
    );
  }

  /// `Halifax`
  String get halifax {
    return Intl.message(
      'Halifax',
      name: 'halifax',
      desc: '',
      args: [],
    );
  }

  /// `Victoria`
  String get victoria {
    return Intl.message(
      'Victoria',
      name: 'victoria',
      desc: '',
      args: [],
    );
  }

  /// `All Libya`
  String get libya_all {
    return Intl.message(
      'All Libya',
      name: 'libya_all',
      desc: '',
      args: [],
    );
  }

  /// `Tripoli`
  String get tripoli {
    return Intl.message(
      'Tripoli',
      name: 'tripoli',
      desc: '',
      args: [],
    );
  }

  /// `Benghazi`
  String get benghazi {
    return Intl.message(
      'Benghazi',
      name: 'benghazi',
      desc: '',
      args: [],
    );
  }

  /// `Misrata`
  String get misrata {
    return Intl.message(
      'Misrata',
      name: 'misrata',
      desc: '',
      args: [],
    );
  }

  /// `Zawiya`
  String get zawiya {
    return Intl.message(
      'Zawiya',
      name: 'zawiya',
      desc: '',
      args: [],
    );
  }

  /// `Beida`
  String get beida {
    return Intl.message(
      'Beida',
      name: 'beida',
      desc: '',
      args: [],
    );
  }

  /// `Sebha`
  String get sebha {
    return Intl.message(
      'Sebha',
      name: 'sebha',
      desc: '',
      args: [],
    );
  }

  /// `Sert`
  String get sert {
    return Intl.message(
      'Sert',
      name: 'sert',
      desc: '',
      args: [],
    );
  }

  /// `Tobruk`
  String get tobruk {
    return Intl.message(
      'Tobruk',
      name: 'tobruk',
      desc: '',
      args: [],
    );
  }

  /// `Ajdabiya`
  String get ajdabiya {
    return Intl.message(
      'Ajdabiya',
      name: 'ajdabiya',
      desc: '',
      args: [],
    );
  }

  /// `Gharyan`
  String get gharyan {
    return Intl.message(
      'Gharyan',
      name: 'gharyan',
      desc: '',
      args: [],
    );
  }

  /// `All Algeria`
  String get algeria_all {
    return Intl.message(
      'All Algeria',
      name: 'algeria_all',
      desc: '',
      args: [],
    );
  }

  /// `Algiers`
  String get algiers {
    return Intl.message(
      'Algiers',
      name: 'algiers',
      desc: '',
      args: [],
    );
  }

  /// `Oran`
  String get oran {
    return Intl.message(
      'Oran',
      name: 'oran',
      desc: '',
      args: [],
    );
  }

  /// `Constantine`
  String get constantine {
    return Intl.message(
      'Constantine',
      name: 'constantine',
      desc: '',
      args: [],
    );
  }

  /// `Annaba`
  String get annaba {
    return Intl.message(
      'Annaba',
      name: 'annaba',
      desc: '',
      args: [],
    );
  }

  /// `Blida`
  String get blida {
    return Intl.message(
      'Blida',
      name: 'blida',
      desc: '',
      args: [],
    );
  }

  /// `Batna`
  String get batna {
    return Intl.message(
      'Batna',
      name: 'batna',
      desc: '',
      args: [],
    );
  }

  /// `Sidi Bel Abbes`
  String get sidi_bel_abbes {
    return Intl.message(
      'Sidi Bel Abbes',
      name: 'sidi_bel_abbes',
      desc: '',
      args: [],
    );
  }

  /// `Bejaia`
  String get bejaia {
    return Intl.message(
      'Bejaia',
      name: 'bejaia',
      desc: '',
      args: [],
    );
  }

  /// `Tiaret`
  String get tiaret {
    return Intl.message(
      'Tiaret',
      name: 'tiaret',
      desc: '',
      args: [],
    );
  }

  /// `Tlemcen`
  String get tlemcen {
    return Intl.message(
      'Tlemcen',
      name: 'tlemcen',
      desc: '',
      args: [],
    );
  }

  /// `All Morocco`
  String get morocco_all {
    return Intl.message(
      'All Morocco',
      name: 'morocco_all',
      desc: '',
      args: [],
    );
  }

  /// `Rabat`
  String get rabat {
    return Intl.message(
      'Rabat',
      name: 'rabat',
      desc: '',
      args: [],
    );
  }

  /// `Casablanca`
  String get casablanca {
    return Intl.message(
      'Casablanca',
      name: 'casablanca',
      desc: '',
      args: [],
    );
  }

  /// `Marrakesh`
  String get marrakesh {
    return Intl.message(
      'Marrakesh',
      name: 'marrakesh',
      desc: '',
      args: [],
    );
  }

  /// `Fes`
  String get fes {
    return Intl.message(
      'Fes',
      name: 'fes',
      desc: '',
      args: [],
    );
  }

  /// `Tangier`
  String get tangier {
    return Intl.message(
      'Tangier',
      name: 'tangier',
      desc: '',
      args: [],
    );
  }

  /// `Agadir`
  String get agadir {
    return Intl.message(
      'Agadir',
      name: 'agadir',
      desc: '',
      args: [],
    );
  }

  /// `Oujda`
  String get oujda {
    return Intl.message(
      'Oujda',
      name: 'oujda',
      desc: '',
      args: [],
    );
  }

  /// `Kenitra`
  String get kenitra {
    return Intl.message(
      'Kenitra',
      name: 'kenitra',
      desc: '',
      args: [],
    );
  }

  /// `Tetouan`
  String get tetouan {
    return Intl.message(
      'Tetouan',
      name: 'tetouan',
      desc: '',
      args: [],
    );
  }

  /// `Posts`
  String get posts_page_title {
    return Intl.message(
      'Posts',
      name: 'posts_page_title',
      desc: '',
      args: [],
    );
  }

  /// `Current post link:`
  String get current_post_link {
    return Intl.message(
      'Current post link:',
      name: 'current_post_link',
      desc: '',
      args: [],
    );
  }

  /// `Current site link:`
  String get current_site_link {
    return Intl.message(
      'Current site link:',
      name: 'current_site_link',
      desc: '',
      args: [],
    );
  }

  /// `Current video link:`
  String get current_video_link {
    return Intl.message(
      'Current video link:',
      name: 'current_video_link',
      desc: '',
      args: [],
    );
  }

  /// `Current ad code:`
  String get current_ad_code {
    return Intl.message(
      'Current ad code:',
      name: 'current_ad_code',
      desc: '',
      args: [],
    );
  }

  /// `Content`
  String get hint_post_content {
    return Intl.message(
      'Content',
      name: 'hint_post_content',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clear {
    return Intl.message(
      'Clear',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `Uploading files...`
  String get uploading_files {
    return Intl.message(
      'Uploading files...',
      name: 'uploading_files',
      desc: '',
      args: [],
    );
  }

  /// `Files uploaded`
  String get files_uploaded {
    return Intl.message(
      'Files uploaded',
      name: 'files_uploaded',
      desc: '',
      args: [],
    );
  }

  /// `Select post images (You can choose one or more up to 10 images)`
  String get select_post_images {
    return Intl.message(
      'Select post images (You can choose one or more up to 10 images)',
      name: 'select_post_images',
      desc: '',
      args: [],
    );
  }

  /// `Error: user is null`
  String get error_user_is_null {
    return Intl.message(
      'Error: user is null',
      name: 'error_user_is_null',
      desc: '',
      args: [],
    );
  }

  /// `Error: currentAdId not found in user document`
  String get error_current_ad_id_not_found {
    return Intl.message(
      'Error: currentAdId not found in user document',
      name: 'error_current_ad_id_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Safi`
  String get safi {
    return Intl.message(
      'Safi',
      name: 'safi',
      desc: '',
      args: [],
    );
  }

  /// `Click to edit keywords and titles`
  String get click_to_edit_keywords_and_titles {
    return Intl.message(
      'Click to edit keywords and titles',
      name: 'click_to_edit_keywords_and_titles',
      desc: '',
      args: [],
    );
  }

  /// `Empty page currently`
  String get empty_page {
    return Intl.message(
      'Empty page currently',
      name: 'empty_page',
      desc: '',
      args: [],
    );
  }

  /// `Create new post`
  String get create_new_post {
    return Intl.message(
      'Create new post',
      name: 'create_new_post',
      desc: '',
      args: [],
    );
  }

  /// `Permissions`
  String get permissions_page_title {
    return Intl.message(
      'Permissions',
      name: 'permissions_page_title',
      desc: '',
      args: [],
    );
  }

  /// `Please assign the company account as an admin or editor to be able to create the ad`
  String get assign_account_admin {
    return Intl.message(
      'Please assign the company account as an admin or editor to be able to create the ad',
      name: 'assign_account_admin',
      desc: '',
      args: [],
    );
  }

  /// `How to assign admin`
  String get how_to_assign_admin {
    return Intl.message(
      'How to assign admin',
      name: 'how_to_assign_admin',
      desc: '',
      args: [],
    );
  }

  /// `Account link:`
  String get account_link {
    return Intl.message(
      'Account link:',
      name: 'account_link',
      desc: '',
      args: [],
    );
  }

  /// `Account name:`
  String get account_name {
    return Intl.message(
      'Account name:',
      name: 'account_name',
      desc: '',
      args: [],
    );
  }

  /// `Account picture: Company logo`
  String get account_logo {
    return Intl.message(
      'Account picture: Company logo',
      name: 'account_logo',
      desc: '',
      args: [],
    );
  }

  /// `I have already assigned as admin or editor`
  String get option_admin_or_editor {
    return Intl.message(
      'I have already assigned as admin or editor',
      name: 'option_admin_or_editor',
      desc: '',
      args: [],
    );
  }

  /// `I couldn't see the account and sent a friend request`
  String get option_sent_friend_request {
    return Intl.message(
      'I couldn\'t see the account and sent a friend request',
      name: 'option_sent_friend_request',
      desc: '',
      args: [],
    );
  }

  /// `Note: If you couldn't assign the admin, please see the admin assignment method`
  String get note_how_to_assign_admin {
    return Intl.message(
      'Note: If you couldn\'t assign the admin, please see the admin assignment method',
      name: 'note_how_to_assign_admin',
      desc: '',
      args: [],
    );
  }

  /// `If the admin or editor is not assigned, we will not be able to create the ad`
  String get cannot_create_ad {
    return Intl.message(
      'If the admin or editor is not assigned, we will not be able to create the ad',
      name: 'cannot_create_ad',
      desc: '',
      args: [],
    );
  }

  /// `{text} copied`
  String copied_text(Object text) {
    return Intl.message(
      '$text copied',
      name: 'copied_text',
      desc: '',
      args: [text],
    );
  }

  /// `Please confirm assigning the admin or sending a friend request`
  String get confirm_admin_or_friend_request {
    return Intl.message(
      'Please confirm assigning the admin or sending a friend request',
      name: 'confirm_admin_or_friend_request',
      desc: '',
      args: [],
    );
  }

  /// `Search Behavior`
  String get search_behavior {
    return Intl.message(
      'Search Behavior',
      name: 'search_behavior',
      desc: '',
      args: [],
    );
  }

  /// `Search for behavior`
  String get search_behavior_hint {
    return Intl.message(
      'Search for behavior',
      name: 'search_behavior_hint',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save_behaviors {
    return Intl.message(
      'Save',
      name: 'save_behaviors',
      desc: '',
      args: [],
    );
  }

  /// `Selected Behaviors`
  String get selected_behaviors {
    return Intl.message(
      'Selected Behaviors',
      name: 'selected_behaviors',
      desc: '',
      args: [],
    );
  }

  /// `All Behaviors`
  String get all_behaviors {
    return Intl.message(
      'All Behaviors',
      name: 'all_behaviors',
      desc: '',
      args: [],
    );
  }

  /// `Engaged Shoppers`
  String get engaged_shoppers {
    return Intl.message(
      'Engaged Shoppers',
      name: 'engaged_shoppers',
      desc: '',
      args: [],
    );
  }

  /// `Soccer Fans (Moderate Content)`
  String get soccer_fans_moderate {
    return Intl.message(
      'Soccer Fans (Moderate Content)',
      name: 'soccer_fans_moderate',
      desc: '',
      args: [],
    );
  }

  /// `Soccer Fans (High Content)`
  String get soccer_fans_high {
    return Intl.message(
      'Soccer Fans (High Content)',
      name: 'soccer_fans_high',
      desc: '',
      args: [],
    );
  }

  /// `Friends of Soccer Fans`
  String get friends_of_soccer_fans {
    return Intl.message(
      'Friends of Soccer Fans',
      name: 'friends_of_soccer_fans',
      desc: '',
      args: [],
    );
  }

  /// `Facebook Access (Mobile): All Mobile Devices`
  String get facebook_access_mobile_all_devices {
    return Intl.message(
      'Facebook Access (Mobile): All Mobile Devices',
      name: 'facebook_access_mobile_all_devices',
      desc: '',
      args: [],
    );
  }

  /// `Facebook Access (Mobile): Smartphones and Tablets`
  String get facebook_access_mobile_smartphones_tablets {
    return Intl.message(
      'Facebook Access (Mobile): Smartphones and Tablets',
      name: 'facebook_access_mobile_smartphones_tablets',
      desc: '',
      args: [],
    );
  }

  /// `Facebook Access (Mobile): Feature Phones`
  String get facebook_access_mobile_feature_phones {
    return Intl.message(
      'Facebook Access (Mobile): Feature Phones',
      name: 'facebook_access_mobile_feature_phones',
      desc: '',
      args: [],
    );
  }

  /// `All Mobile Devices by Brand`
  String get all_mobile_devices_by_brand {
    return Intl.message(
      'All Mobile Devices by Brand',
      name: 'all_mobile_devices_by_brand',
      desc: '',
      args: [],
    );
  }

  /// `All Mobile Devices by OS`
  String get all_mobile_devices_by_os {
    return Intl.message(
      'All Mobile Devices by OS',
      name: 'all_mobile_devices_by_os',
      desc: '',
      args: [],
    );
  }

  /// `New Smartphone and Tablet Users`
  String get new_smartphone_tablet_users {
    return Intl.message(
      'New Smartphone and Tablet Users',
      name: 'new_smartphone_tablet_users',
      desc: '',
      args: [],
    );
  }

  /// `Network Connection`
  String get network_connection {
    return Intl.message(
      'Network Connection',
      name: 'network_connection',
      desc: '',
      args: [],
    );
  }

  /// `Android: 360 Media Supported`
  String get android_360_media_supported {
    return Intl.message(
      'Android: 360 Media Supported',
      name: 'android_360_media_supported',
      desc: '',
      args: [],
    );
  }

  /// `Android: 360 Media Not Supported`
  String get android_360_media_not_supported {
    return Intl.message(
      'Android: 360 Media Not Supported',
      name: 'android_360_media_not_supported',
      desc: '',
      args: [],
    );
  }

  /// `Owns: OnePlus`
  String get owns_oneplus {
    return Intl.message(
      'Owns: OnePlus',
      name: 'owns_oneplus',
      desc: '',
      args: [],
    );
  }

  /// `Small Business Owners`
  String get small_business_owners {
    return Intl.message(
      'Small Business Owners',
      name: 'small_business_owners',
      desc: '',
      args: [],
    );
  }

  /// `Facebook Payment Users (90 Days)`
  String get facebook_payment_users_90_days {
    return Intl.message(
      'Facebook Payment Users (90 Days)',
      name: 'facebook_payment_users_90_days',
      desc: '',
      args: [],
    );
  }

  /// `Technology Early Adopters`
  String get technology_early_adopters {
    return Intl.message(
      'Technology Early Adopters',
      name: 'technology_early_adopters',
      desc: '',
      args: [],
    );
  }

  /// `OS Used`
  String get os_used {
    return Intl.message(
      'OS Used',
      name: 'os_used',
      desc: '',
      args: [],
    );
  }

  /// `Facebook Access: Old Devices and OS`
  String get facebook_access_old_devices_os {
    return Intl.message(
      'Facebook Access: Old Devices and OS',
      name: 'facebook_access_old_devices_os',
      desc: '',
      args: [],
    );
  }

  /// `Facebook Payment Users (30 Days)`
  String get facebook_payment_users_30_days {
    return Intl.message(
      'Facebook Payment Users (30 Days)',
      name: 'facebook_payment_users_30_days',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Gamers`
  String get mobile_gamers {
    return Intl.message(
      'Mobile Gamers',
      name: 'mobile_gamers',
      desc: '',
      args: [],
    );
  }

  /// `Browser Used`
  String get browser_used {
    return Intl.message(
      'Browser Used',
      name: 'browser_used',
      desc: '',
      args: [],
    );
  }

  /// `Facebook Page Admins`
  String get facebook_page_admins {
    return Intl.message(
      'Facebook Page Admins',
      name: 'facebook_page_admins',
      desc: '',
      args: [],
    );
  }

  /// `Canvas Games`
  String get canvas_games {
    return Intl.message(
      'Canvas Games',
      name: 'canvas_games',
      desc: '',
      args: [],
    );
  }

  /// `People Who Visited Facebook Gaming`
  String get people_visited_facebook_gaming {
    return Intl.message(
      'People Who Visited Facebook Gaming',
      name: 'people_visited_facebook_gaming',
      desc: '',
      args: [],
    );
  }

  /// `New Active Business (> 6 Months)`
  String get new_active_business_6_months {
    return Intl.message(
      'New Active Business (> 6 Months)',
      name: 'new_active_business_6_months',
      desc: '',
      args: [],
    );
  }

  /// `New Active Business (> 24 Months)`
  String get new_active_business_24_months {
    return Intl.message(
      'New Active Business (> 24 Months)',
      name: 'new_active_business_24_months',
      desc: '',
      args: [],
    );
  }

  /// `New Active Business (> 12 Months)`
  String get new_active_business_12_months {
    return Intl.message(
      'New Active Business (> 12 Months)',
      name: 'new_active_business_12_months',
      desc: '',
      args: [],
    );
  }

  /// `Instagram Business Profile Admins`
  String get instagram_business_profile_admins {
    return Intl.message(
      'Instagram Business Profile Admins',
      name: 'instagram_business_profile_admins',
      desc: '',
      args: [],
    );
  }

  /// `Frequent Travelers`
  String get frequent_travelers {
    return Intl.message(
      'Frequent Travelers',
      name: 'frequent_travelers',
      desc: '',
      args: [],
    );
  }

  /// `Returned from Travel (1 Week)`
  String get returned_from_travel_week {
    return Intl.message(
      'Returned from Travel (1 Week)',
      name: 'returned_from_travel_week',
      desc: '',
      args: [],
    );
  }

  /// `Returned from Travel (2 Weeks)`
  String get returned_from_travel_two_weeks {
    return Intl.message(
      'Returned from Travel (2 Weeks)',
      name: 'returned_from_travel_two_weeks',
      desc: '',
      args: [],
    );
  }

  /// `Daily Commuters`
  String get daily_commuters {
    return Intl.message(
      'Daily Commuters',
      name: 'daily_commuters',
      desc: '',
      args: [],
    );
  }

  /// `Frequent International Travelers`
  String get frequent_international_travelers {
    return Intl.message(
      'Frequent International Travelers',
      name: 'frequent_international_travelers',
      desc: '',
      args: [],
    );
  }

  /// `Facebook Lite Users`
  String get facebook_lite_users {
    return Intl.message(
      'Facebook Lite Users',
      name: 'facebook_lite_users',
      desc: '',
      args: [],
    );
  }

  /// `Store Admins`
  String get store_admins {
    return Intl.message(
      'Store Admins',
      name: 'store_admins',
      desc: '',
      args: [],
    );
  }

  /// `Travel and Outdoor Enthusiasts`
  String get travel_outdoor_enthusiasts {
    return Intl.message(
      'Travel and Outdoor Enthusiasts',
      name: 'travel_outdoor_enthusiasts',
      desc: '',
      args: [],
    );
  }

  /// `Food and Drink Creators`
  String get food_drink_creators {
    return Intl.message(
      'Food and Drink Creators',
      name: 'food_drink_creators',
      desc: '',
      args: [],
    );
  }

  /// `Health and Wellness Creators`
  String get health_wellness_creators {
    return Intl.message(
      'Health and Wellness Creators',
      name: 'health_wellness_creators',
      desc: '',
      args: [],
    );
  }

  /// `All Creators`
  String get all_creators {
    return Intl.message(
      'All Creators',
      name: 'all_creators',
      desc: '',
      args: [],
    );
  }

  /// `Internet Personality Creators`
  String get internet_personality_creators {
    return Intl.message(
      'Internet Personality Creators',
      name: 'internet_personality_creators',
      desc: '',
      args: [],
    );
  }

  /// `Travel`
  String get travel {
    return Intl.message(
      'Travel',
      name: 'travel',
      desc: '',
      args: [],
    );
  }

  /// `Digital Activities`
  String get digital_activities {
    return Intl.message(
      'Digital Activities',
      name: 'digital_activities',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Device User`
  String get mobile_device_user {
    return Intl.message(
      'Mobile Device User',
      name: 'mobile_device_user',
      desc: '',
      args: [],
    );
  }

  /// `Expats`
  String get expats {
    return Intl.message(
      'Expats',
      name: 'expats',
      desc: '',
      args: [],
    );
  }

  /// `Anniversary`
  String get anniversary {
    return Intl.message(
      'Anniversary',
      name: 'anniversary',
      desc: '',
      args: [],
    );
  }

  /// `Consumer Classification`
  String get consumer_classification {
    return Intl.message(
      'Consumer Classification',
      name: 'consumer_classification',
      desc: '',
      args: [],
    );
  }

  /// `Purchase Behavior`
  String get purchase_behavior {
    return Intl.message(
      'Purchase Behavior',
      name: 'purchase_behavior',
      desc: '',
      args: [],
    );
  }

  /// `Soccer`
  String get soccer {
    return Intl.message(
      'Soccer',
      name: 'soccer',
      desc: '',
      args: [],
    );
  }

  /// `More Categories`
  String get more_categories {
    return Intl.message(
      'More Categories',
      name: 'more_categories',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Device User / Device Usage Time`
  String get mobile_device_user_device_usage_time {
    return Intl.message(
      'Mobile Device User / Device Usage Time',
      name: 'mobile_device_user_device_usage_time',
      desc: '',
      args: [],
    );
  }

  /// `Behaviors`
  String get behaviors {
    return Intl.message(
      'Behaviors',
      name: 'behaviors',
      desc: '',
      args: [],
    );
  }

  /// `Digital Activities Team`
  String get digital_activities_team {
    return Intl.message(
      'Digital Activities Team',
      name: 'digital_activities_team',
      desc: '',
      args: [],
    );
  }

  /// `Demographic Status`
  String get demographic_status_page_title {
    return Intl.message(
      'Demographic Status',
      name: 'demographic_status_page_title',
      desc: '',
      args: [],
    );
  }

  /// `Search for demographic status`
  String get search_demographic_status {
    return Intl.message(
      'Search for demographic status',
      name: 'search_demographic_status',
      desc: '',
      args: [],
    );
  }

  /// `Parents (up to 12 months)`
  String get status_1 {
    return Intl.message(
      'Parents (up to 12 months)',
      name: 'status_1',
      desc: '',
      args: [],
    );
  }

  /// `Parents with infants (1 to 2 years)`
  String get status_2 {
    return Intl.message(
      'Parents with infants (1 to 2 years)',
      name: 'status_2',
      desc: '',
      args: [],
    );
  }

  /// `Parents with preschoolers (3 to 5 years)`
  String get status_3 {
    return Intl.message(
      'Parents with preschoolers (3 to 5 years)',
      name: 'status_3',
      desc: '',
      args: [],
    );
  }

  /// `Parents with young school-age children (6 to 8 years)`
  String get status_4 {
    return Intl.message(
      'Parents with young school-age children (6 to 8 years)',
      name: 'status_4',
      desc: '',
      args: [],
    );
  }

  /// `Parents with teenagers (13 to 17 years)`
  String get status_5 {
    return Intl.message(
      'Parents with teenagers (13 to 17 years)',
      name: 'status_5',
      desc: '',
      args: [],
    );
  }

  /// `Parents with adult children (18 to 26 years)`
  String get status_6 {
    return Intl.message(
      'Parents with adult children (18 to 26 years)',
      name: 'status_6',
      desc: '',
      args: [],
    );
  }

  /// `Parents with preteens (9 to 12 years)`
  String get status_7 {
    return Intl.message(
      'Parents with preteens (9 to 12 years)',
      name: 'status_7',
      desc: '',
      args: [],
    );
  }

  /// `Veterans (US)`
  String get status_8 {
    return Intl.message(
      'Veterans (US)',
      name: 'status_8',
      desc: '',
      args: [],
    );
  }

  /// `Government employees (global)`
  String get status_9 {
    return Intl.message(
      'Government employees (global)',
      name: 'status_9',
      desc: '',
      args: [],
    );
  }

  /// `Employees of large businesses dealing with other businesses (500+ employees)`
  String get status_10 {
    return Intl.message(
      'Employees of large businesses dealing with other businesses (500+ employees)',
      name: 'status_10',
      desc: '',
      args: [],
    );
  }

  /// `Employees of medium-sized businesses dealing with other businesses (200 to 500 employees)`
  String get status_11 {
    return Intl.message(
      'Employees of medium-sized businesses dealing with other businesses (200 to 500 employees)',
      name: 'status_11',
      desc: '',
      args: [],
    );
  }

  /// `Employees of small businesses dealing with other businesses (10 to 200 employees)`
  String get status_12 {
    return Intl.message(
      'Employees of small businesses dealing with other businesses (10 to 200 employees)',
      name: 'status_12',
      desc: '',
      args: [],
    );
  }

  /// `Job titles and interests of business decision-makers`
  String get status_13 {
    return Intl.message(
      'Job titles and interests of business decision-makers',
      name: 'status_13',
      desc: '',
      args: [],
    );
  }

  /// `Business decision-makers`
  String get status_14 {
    return Intl.message(
      'Business decision-makers',
      name: 'status_14',
      desc: '',
      args: [],
    );
  }

  /// `IT decision-makers`
  String get status_15 {
    return Intl.message(
      'IT decision-makers',
      name: 'status_15',
      desc: '',
      args: [],
    );
  }

  /// `Company size: 11-100 employees`
  String get status_16 {
    return Intl.message(
      'Company size: 11-100 employees',
      name: 'status_16',
      desc: '',
      args: [],
    );
  }

  /// `Companies founded before 2000`
  String get status_17 {
    return Intl.message(
      'Companies founded before 2000',
      name: 'status_17',
      desc: '',
      args: [],
    );
  }

  /// `Companies founded between 2010 and now`
  String get status_18 {
    return Intl.message(
      'Companies founded between 2010 and now',
      name: 'status_18',
      desc: '',
      args: [],
    );
  }

  /// `Company revenue from 1 million to 10 million`
  String get status_19 {
    return Intl.message(
      'Company revenue from 1 million to 10 million',
      name: 'status_19',
      desc: '',
      args: [],
    );
  }

  /// `Company revenue less than 1 million`
  String get status_20 {
    return Intl.message(
      'Company revenue less than 1 million',
      name: 'status_20',
      desc: '',
      args: [],
    );
  }

  /// `Company size 101-150 employees`
  String get status_21 {
    return Intl.message(
      'Company size 101-150 employees',
      name: 'status_21',
      desc: '',
      args: [],
    );
  }

  /// `Company size 1-10 employees`
  String get status_22 {
    return Intl.message(
      'Company size 1-10 employees',
      name: 'status_22',
      desc: '',
      args: [],
    );
  }

  /// `Companies founded between 2000 and 2009`
  String get status_23 {
    return Intl.message(
      'Companies founded between 2000 and 2009',
      name: 'status_23',
      desc: '',
      args: [],
    );
  }

  /// `Company revenue more than 10 million`
  String get status_24 {
    return Intl.message(
      'Company revenue more than 10 million',
      name: 'status_24',
      desc: '',
      args: [],
    );
  }

  /// `Company size more than 500 employees`
  String get status_25 {
    return Intl.message(
      'Company size more than 500 employees',
      name: 'status_25',
      desc: '',
      args: [],
    );
  }

  /// `Transportation and mobility`
  String get status_26 {
    return Intl.message(
      'Transportation and mobility',
      name: 'status_26',
      desc: '',
      args: [],
    );
  }

  /// `Friends of people who recently moved`
  String get status_27 {
    return Intl.message(
      'Friends of people who recently moved',
      name: 'status_27',
      desc: '',
      args: [],
    );
  }

  /// `Friends of people with birthdays within a month`
  String get status_28 {
    return Intl.message(
      'Friends of people with birthdays within a month',
      name: 'status_28',
      desc: '',
      args: [],
    );
  }

  /// `Friends of women with birthdays within 7 to 30 days`
  String get status_29 {
    return Intl.message(
      'Friends of women with birthdays within 7 to 30 days',
      name: 'status_29',
      desc: '',
      args: [],
    );
  }

  /// `Friends of men with birthdays within 7 to 30 days`
  String get status_30 {
    return Intl.message(
      'Friends of men with birthdays within 7 to 30 days',
      name: 'status_30',
      desc: '',
      args: [],
    );
  }

  /// `Friends of people with birthdays within a week`
  String get status_31 {
    return Intl.message(
      'Friends of people with birthdays within a week',
      name: 'status_31',
      desc: '',
      args: [],
    );
  }

  /// `Friends of women with birthdays within 0 to 7 days`
  String get status_32 {
    return Intl.message(
      'Friends of women with birthdays within 0 to 7 days',
      name: 'status_32',
      desc: '',
      args: [],
    );
  }

  /// `Friends of men with birthdays within 0 to 7 days`
  String get status_33 {
    return Intl.message(
      'Friends of men with birthdays within 0 to 7 days',
      name: 'status_33',
      desc: '',
      args: [],
    );
  }

  /// `Away from family`
  String get status_34 {
    return Intl.message(
      'Away from family',
      name: 'status_34',
      desc: '',
      args: [],
    );
  }

  /// `Away from place of origin`
  String get status_35 {
    return Intl.message(
      'Away from place of origin',
      name: 'status_35',
      desc: '',
      args: [],
    );
  }

  /// `Long-distance relationship`
  String get status_36 {
    return Intl.message(
      'Long-distance relationship',
      name: 'status_36',
      desc: '',
      args: [],
    );
  }

  /// `People who recently moved`
  String get status_37 {
    return Intl.message(
      'People who recently moved',
      name: 'status_37',
      desc: '',
      args: [],
    );
  }

  /// `New job`
  String get status_38 {
    return Intl.message(
      'New job',
      name: 'status_38',
      desc: '',
      args: [],
    );
  }

  /// `New relationship`
  String get status_39 {
    return Intl.message(
      'New relationship',
      name: 'status_39',
      desc: '',
      args: [],
    );
  }

  /// `Recently engaged (3 months)`
  String get status_40 {
    return Intl.message(
      'Recently engaged (3 months)',
      name: 'status_40',
      desc: '',
      args: [],
    );
  }

  /// `Recently married (3 months)`
  String get status_41 {
    return Intl.message(
      'Recently married (3 months)',
      name: 'status_41',
      desc: '',
      args: [],
    );
  }

  /// `Life, physical, and social sciences`
  String get status_42 {
    return Intl.message(
      'Life, physical, and social sciences',
      name: 'status_42',
      desc: '',
      args: [],
    );
  }

  /// `Computing and mathematics`
  String get status_43 {
    return Intl.message(
      'Computing and mathematics',
      name: 'status_43',
      desc: '',
      args: [],
    );
  }

  /// `Community and social services`
  String get status_44 {
    return Intl.message(
      'Community and social services',
      name: 'status_44',
      desc: '',
      args: [],
    );
  }

  /// `Protective services`
  String get status_45 {
    return Intl.message(
      'Protective services',
      name: 'status_45',
      desc: '',
      args: [],
    );
  }

  /// `Agriculture, fishing, and forestry`
  String get status_46 {
    return Intl.message(
      'Agriculture, fishing, and forestry',
      name: 'status_46',
      desc: '',
      args: [],
    );
  }

  /// `Cleaning and maintenance services`
  String get status_47 {
    return Intl.message(
      'Cleaning and maintenance services',
      name: 'status_47',
      desc: '',
      args: [],
    );
  }

  /// `Military (global)`
  String get status_48 {
    return Intl.message(
      'Military (global)',
      name: 'status_48',
      desc: '',
      args: [],
    );
  }

  /// `Administrative services`
  String get status_49 {
    return Intl.message(
      'Administrative services',
      name: 'status_49',
      desc: '',
      args: [],
    );
  }

  /// `Technical and IT services`
  String get status_50 {
    return Intl.message(
      'Technical and IT services',
      name: 'status_50',
      desc: '',
      args: [],
    );
  }

  /// `Legal services`
  String get status_51 {
    return Intl.message(
      'Legal services',
      name: 'status_51',
      desc: '',
      args: [],
    );
  }

  /// `Sales`
  String get status_52 {
    return Intl.message(
      'Sales',
      name: 'status_52',
      desc: '',
      args: [],
    );
  }

  /// `Education and libraries`
  String get status_53 {
    return Intl.message(
      'Education and libraries',
      name: 'status_53',
      desc: '',
      args: [],
    );
  }

  /// `Business and finance`
  String get status_54 {
    return Intl.message(
      'Business and finance',
      name: 'status_54',
      desc: '',
      args: [],
    );
  }

  /// `Recently married (1 year)`
  String get status_55 {
    return Intl.message(
      'Recently married (1 year)',
      name: 'status_55',
      desc: '',
      args: [],
    );
  }

  /// `Recently engaged (6 months)`
  String get status_56 {
    return Intl.message(
      'Recently engaged (6 months)',
      name: 'status_56',
      desc: '',
      args: [],
    );
  }

  /// `Recently married (6 months)`
  String get status_57 {
    return Intl.message(
      'Recently married (6 months)',
      name: 'status_57',
      desc: '',
      args: [],
    );
  }

  /// `Recently engaged (1 year)`
  String get status_58 {
    return Intl.message(
      'Recently engaged (1 year)',
      name: 'status_58',
      desc: '',
      args: [],
    );
  }

  /// `Management`
  String get status_59 {
    return Intl.message(
      'Management',
      name: 'status_59',
      desc: '',
      args: [],
    );
  }

  /// `Arts, entertainment, sports, and media`
  String get status_60 {
    return Intl.message(
      'Arts, entertainment, sports, and media',
      name: 'status_60',
      desc: '',
      args: [],
    );
  }

  /// `Ad Targeting`
  String get ad_targeting {
    return Intl.message(
      'Ad Targeting',
      name: 'ad_targeting',
      desc: '',
      args: [],
    );
  }

  /// `Ad Targets`
  String get ad_targets {
    return Intl.message(
      'Ad Targets',
      name: 'ad_targets',
      desc: '',
      args: [],
    );
  }

  /// `Leave blank to add expert categories`
  String get leave_blank_to_add_expert_categories {
    return Intl.message(
      'Leave blank to add expert categories',
      name: 'leave_blank_to_add_expert_categories',
      desc: '',
      args: [],
    );
  }

  /// `Interests`
  String get interests {
    return Intl.message(
      'Interests',
      name: 'interests',
      desc: '',
      args: [],
    );
  }

  /// `No interests selected yet`
  String get no_interests_selected {
    return Intl.message(
      'No interests selected yet',
      name: 'no_interests_selected',
      desc: '',
      args: [],
    );
  }

  /// `Demographic Status`
  String get demographic_status {
    return Intl.message(
      'Demographic Status',
      name: 'demographic_status',
      desc: '',
      args: [],
    );
  }

  /// `No demographic status selected yet`
  String get no_demographic_status_selected {
    return Intl.message(
      'No demographic status selected yet',
      name: 'no_demographic_status_selected',
      desc: '',
      args: [],
    );
  }

  /// `Behavior`
  String get behavior {
    return Intl.message(
      'Behavior',
      name: 'behavior',
      desc: '',
      args: [],
    );
  }

  /// `No behavior selected yet`
  String get no_behavior_selected {
    return Intl.message(
      'No behavior selected yet',
      name: 'no_behavior_selected',
      desc: '',
      args: [],
    );
  }

  /// `Notes:`
  String get notes {
    return Intl.message(
      'Notes:',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `1- It is preferable that interests, behavior, and demographic status be from 5 to 7 selections total`
  String get note1 {
    return Intl.message(
      '1- It is preferable that interests, behavior, and demographic status be from 5 to 7 selections total',
      name: 'note1',
      desc: '',
      args: [],
    );
  }

  /// `2- If you do not know what to choose, leave it blank and it will be added by the experts in the administration`
  String get note2 {
    return Intl.message(
      '2- If you do not know what to choose, leave it blank and it will be added by the experts in the administration',
      name: 'note2',
      desc: '',
      args: [],
    );
  }

  /// `Soon`
  String get soon {
    return Intl.message(
      'Soon',
      name: 'soon',
      desc: '',
      args: [],
    );
  }

  /// `This feature will be available soon.`
  String get feature_coming_soon {
    return Intl.message(
      'This feature will be available soon.',
      name: 'feature_coming_soon',
      desc: '',
      args: [],
    );
  }

  /// `My Accounts`
  String get my_accounts {
    return Intl.message(
      'My Accounts',
      name: 'my_accounts',
      desc: '',
      args: [],
    );
  }

  /// `You can link your accounts to create professional ad campaigns`
  String get link_accounts {
    return Intl.message(
      'You can link your accounts to create professional ad campaigns',
      name: 'link_accounts',
      desc: '',
      args: [],
    );
  }

  /// `You cannot link Instagram until you select a Facebook page with Instagram`
  String get cannot_link_instagram {
    return Intl.message(
      'You cannot link Instagram until you select a Facebook page with Instagram',
      name: 'cannot_link_instagram',
      desc: '',
      args: [],
    );
  }

  /// `Connected`
  String get connected {
    return Intl.message(
      'Connected',
      name: 'connected',
      desc: '',
      args: [],
    );
  }

  /// `Not Connected`
  String get not_connected {
    return Intl.message(
      'Not Connected',
      name: 'not_connected',
      desc: '',
      args: [],
    );
  }

  /// `Unlink`
  String get unlink {
    return Intl.message(
      'Unlink',
      name: 'unlink',
      desc: '',
      args: [],
    );
  }

  /// `Link Account`
  String get link_account {
    return Intl.message(
      'Link Account',
      name: 'link_account',
      desc: '',
      args: [],
    );
  }

  /// `Search Interests`
  String get search_interests {
    return Intl.message(
      'Search Interests',
      name: 'search_interests',
      desc: '',
      args: [],
    );
  }

  /// `Enter your interests here...`
  String get enter_interests {
    return Intl.message(
      'Enter your interests here...',
      name: 'enter_interests',
      desc: '',
      args: [],
    );
  }

  /// `Clothes`
  String get clothes {
    return Intl.message(
      'Clothes',
      name: 'clothes',
      desc: '',
      args: [],
    );
  }

  /// `Belt (Clothes)`
  String get belt_clothes {
    return Intl.message(
      'Belt (Clothes)',
      name: 'belt_clothes',
      desc: '',
      args: [],
    );
  }

  /// `Sports Illustrated Swimwear Issue`
  String get sports_swimwear {
    return Intl.message(
      'Sports Illustrated Swimwear Issue',
      name: 'sports_swimwear',
      desc: '',
      args: [],
    );
  }

  /// `Republic Clothing Remix`
  String get republic_clothing_remix {
    return Intl.message(
      'Republic Clothing Remix',
      name: 'republic_clothing_remix',
      desc: '',
      args: [],
    );
  }

  /// `Organic Clothing`
  String get organic_clothing {
    return Intl.message(
      'Organic Clothing',
      name: 'organic_clothing',
      desc: '',
      args: [],
    );
  }

  /// `Work Clothes`
  String get work_clothes {
    return Intl.message(
      'Work Clothes',
      name: 'work_clothes',
      desc: '',
      args: [],
    );
  }

  /// `Fashion Picture`
  String get fashion_picture {
    return Intl.message(
      'Fashion Picture',
      name: 'fashion_picture',
      desc: '',
      args: [],
    );
  }

  /// `Castro (Clothes)`
  String get castro_clothes {
    return Intl.message(
      'Castro (Clothes)',
      name: 'castro_clothes',
      desc: '',
      args: [],
    );
  }

  /// `Pinup Channel Clothes`
  String get pinup_channel_clothes {
    return Intl.message(
      'Pinup Channel Clothes',
      name: 'pinup_channel_clothes',
      desc: '',
      args: [],
    );
  }

  /// `Charlotte Russe (Retailer)`
  String get charlotte_rousse_retailer {
    return Intl.message(
      'Charlotte Russe (Retailer)',
      name: 'charlotte_rousse_retailer',
      desc: '',
      args: [],
    );
  }

  /// `Underwear`
  String get underwear {
    return Intl.message(
      'Underwear',
      name: 'underwear',
      desc: '',
      args: [],
    );
  }

  /// `Hot Clothes`
  String get hot_clothes {
    return Intl.message(
      'Hot Clothes',
      name: 'hot_clothes',
      desc: '',
      args: [],
    );
  }

  /// `Exclusive Clothes`
  String get exclusive_clothes {
    return Intl.message(
      'Exclusive Clothes',
      name: 'exclusive_clothes',
      desc: '',
      args: [],
    );
  }

  /// `Garage (Retailer)`
  String get garage_retailer {
    return Intl.message(
      'Garage (Retailer)',
      name: 'garage_retailer',
      desc: '',
      args: [],
    );
  }

  /// `Fila (Sportswear)`
  String get fila_sportswear {
    return Intl.message(
      'Fila (Sportswear)',
      name: 'fila_sportswear',
      desc: '',
      args: [],
    );
  }

  /// `Strategy Games`
  String get strategy_games {
    return Intl.message(
      'Strategy Games',
      name: 'strategy_games',
      desc: '',
      args: [],
    );
  }

  /// `Property`
  String get property {
    return Intl.message(
      'Property',
      name: 'property',
      desc: '',
      args: [],
    );
  }

  /// `Hotels`
  String get hotels {
    return Intl.message(
      'Hotels',
      name: 'hotels',
      desc: '',
      args: [],
    );
  }

  /// `Writing`
  String get writing {
    return Intl.message(
      'Writing',
      name: 'writing',
      desc: '',
      args: [],
    );
  }

  /// `Advertising`
  String get advertising {
    return Intl.message(
      'Advertising',
      name: 'advertising',
      desc: '',
      args: [],
    );
  }

  /// `Loud Music`
  String get loud_music {
    return Intl.message(
      'Loud Music',
      name: 'loud_music',
      desc: '',
      args: [],
    );
  }

  /// `Anime Movies`
  String get anime_movies {
    return Intl.message(
      'Anime Movies',
      name: 'anime_movies',
      desc: '',
      args: [],
    );
  }

  /// `Coffee`
  String get coffee {
    return Intl.message(
      'Coffee',
      name: 'coffee',
      desc: '',
      args: [],
    );
  }

  /// `Heavy Metal Music`
  String get heavy_metal_music {
    return Intl.message(
      'Heavy Metal Music',
      name: 'heavy_metal_music',
      desc: '',
      args: [],
    );
  }

  /// `Hard Drives`
  String get hard_drives {
    return Intl.message(
      'Hard Drives',
      name: 'hard_drives',
      desc: '',
      args: [],
    );
  }

  /// `Card Games`
  String get card_games {
    return Intl.message(
      'Card Games',
      name: 'card_games',
      desc: '',
      args: [],
    );
  }

  /// `Vegetarian`
  String get vegetarian {
    return Intl.message(
      'Vegetarian',
      name: 'vegetarian',
      desc: '',
      args: [],
    );
  }

  /// `Bodybuilding`
  String get bodybuilding {
    return Intl.message(
      'Bodybuilding',
      name: 'bodybuilding',
      desc: '',
      args: [],
    );
  }

  /// `Economics`
  String get economics {
    return Intl.message(
      'Economics',
      name: 'economics',
      desc: '',
      args: [],
    );
  }

  /// `Politics`
  String get politics {
    return Intl.message(
      'Politics',
      name: 'politics',
      desc: '',
      args: [],
    );
  }

  /// `Design`
  String get design {
    return Intl.message(
      'Design',
      name: 'design',
      desc: '',
      args: [],
    );
  }

  /// `Cooking`
  String get cooking {
    return Intl.message(
      'Cooking',
      name: 'cooking',
      desc: '',
      args: [],
    );
  }

  /// `Horror Movies`
  String get horror_movies {
    return Intl.message(
      'Horror Movies',
      name: 'horror_movies',
      desc: '',
      args: [],
    );
  }

  /// `Network Storage`
  String get network_storage {
    return Intl.message(
      'Network Storage',
      name: 'network_storage',
      desc: '',
      args: [],
    );
  }

  /// `Law`
  String get law {
    return Intl.message(
      'Law',
      name: 'law',
      desc: '',
      args: [],
    );
  }

  /// `Puzzle Video Games`
  String get puzzle_video_games {
    return Intl.message(
      'Puzzle Video Games',
      name: 'puzzle_video_games',
      desc: '',
      args: [],
    );
  }

  /// `Pizza`
  String get pizza {
    return Intl.message(
      'Pizza',
      name: 'pizza',
      desc: '',
      args: [],
    );
  }

  /// `Sculpture`
  String get sculpture {
    return Intl.message(
      'Sculpture',
      name: 'sculpture',
      desc: '',
      args: [],
    );
  }

  /// `Consumer Electronics`
  String get consumer_electronics {
    return Intl.message(
      'Consumer Electronics',
      name: 'consumer_electronics',
      desc: '',
      args: [],
    );
  }

  /// `Juice`
  String get juice {
    return Intl.message(
      'Juice',
      name: 'juice',
      desc: '',
      args: [],
    );
  }

  /// `Dancing`
  String get dancing {
    return Intl.message(
      'Dancing',
      name: 'dancing',
      desc: '',
      args: [],
    );
  }

  /// `Free Software`
  String get free_software {
    return Intl.message(
      'Free Software',
      name: 'free_software',
      desc: '',
      args: [],
    );
  }

  /// `Marathon`
  String get marathon {
    return Intl.message(
      'Marathon',
      name: 'marathon',
      desc: '',
      args: [],
    );
  }

  /// `Beaches`
  String get beaches {
    return Intl.message(
      'Beaches',
      name: 'beaches',
      desc: '',
      args: [],
    );
  }

  /// `Tourism`
  String get tourism {
    return Intl.message(
      'Tourism',
      name: 'tourism',
      desc: '',
      args: [],
    );
  }

  /// `Lakes`
  String get lakes {
    return Intl.message(
      'Lakes',
      name: 'lakes',
      desc: '',
      args: [],
    );
  }

  /// `Browser Games`
  String get browser_games {
    return Intl.message(
      'Browser Games',
      name: 'browser_games',
      desc: '',
      args: [],
    );
  }

  /// `Barbecue`
  String get barbecue {
    return Intl.message(
      'Barbecue',
      name: 'barbecue',
      desc: '',
      args: [],
    );
  }

  /// `Scouts`
  String get scouts {
    return Intl.message(
      'Scouts',
      name: 'scouts',
      desc: '',
      args: [],
    );
  }

  /// `Marriage`
  String get marriage {
    return Intl.message(
      'Marriage',
      name: 'marriage',
      desc: '',
      args: [],
    );
  }

  /// `Perfumes`
  String get perfumes {
    return Intl.message(
      'Perfumes',
      name: 'perfumes',
      desc: '',
      args: [],
    );
  }

  /// `Hair Products`
  String get hair_products {
    return Intl.message(
      'Hair Products',
      name: 'hair_products',
      desc: '',
      args: [],
    );
  }

  /// `Books`
  String get books {
    return Intl.message(
      'Books',
      name: 'books',
      desc: '',
      args: [],
    );
  }

  /// `Pet Food`
  String get pet_food {
    return Intl.message(
      'Pet Food',
      name: 'pet_food',
      desc: '',
      args: [],
    );
  }

  /// `Online Banking`
  String get online_banking {
    return Intl.message(
      'Online Banking',
      name: 'online_banking',
      desc: '',
      args: [],
    );
  }

  /// `Weight Training`
  String get weight_training {
    return Intl.message(
      'Weight Training',
      name: 'weight_training',
      desc: '',
      args: [],
    );
  }

  /// `DIY`
  String get diy {
    return Intl.message(
      'DIY',
      name: 'diy',
      desc: '',
      args: [],
    );
  }

  /// `Tea`
  String get tea {
    return Intl.message(
      'Tea',
      name: 'tea',
      desc: '',
      args: [],
    );
  }

  /// `Family`
  String get family {
    return Intl.message(
      'Family',
      name: 'family',
      desc: '',
      args: [],
    );
  }

  /// `Indian Cuisine`
  String get indian_cuisine {
    return Intl.message(
      'Indian Cuisine',
      name: 'indian_cuisine',
      desc: '',
      args: [],
    );
  }

  /// `National Music`
  String get national_music {
    return Intl.message(
      'National Music',
      name: 'national_music',
      desc: '',
      args: [],
    );
  }

  /// `Ice Skating`
  String get ice_skating {
    return Intl.message(
      'Ice Skating',
      name: 'ice_skating',
      desc: '',
      args: [],
    );
  }

  /// `Golf`
  String get golf {
    return Intl.message(
      'Golf',
      name: 'golf',
      desc: '',
      args: [],
    );
  }

  /// `Sports Games`
  String get sports_games {
    return Intl.message(
      'Sports Games',
      name: 'sports_games',
      desc: '',
      args: [],
    );
  }

  /// `Internet Ads`
  String get internet_ads {
    return Intl.message(
      'Internet Ads',
      name: 'internet_ads',
      desc: '',
      args: [],
    );
  }

  /// `SEO`
  String get seo {
    return Intl.message(
      'SEO',
      name: 'seo',
      desc: '',
      args: [],
    );
  }

  /// `Credit Cards`
  String get credit_cards {
    return Intl.message(
      'Credit Cards',
      name: 'credit_cards',
      desc: '',
      args: [],
    );
  }

  /// `Entrepreneurship`
  String get entrepreneurship {
    return Intl.message(
      'Entrepreneurship',
      name: 'entrepreneurship',
      desc: '',
      args: [],
    );
  }

  /// `Fast Food Restaurants`
  String get fast_food_restaurants {
    return Intl.message(
      'Fast Food Restaurants',
      name: 'fast_food_restaurants',
      desc: '',
      args: [],
    );
  }

  /// `Drama Movies`
  String get drama_movies {
    return Intl.message(
      'Drama Movies',
      name: 'drama_movies',
      desc: '',
      args: [],
    );
  }

  /// `Documentary Movies`
  String get documentary_movies {
    return Intl.message(
      'Documentary Movies',
      name: 'documentary_movies',
      desc: '',
      args: [],
    );
  }

  /// `American Football`
  String get american_football {
    return Intl.message(
      'American Football',
      name: 'american_football',
      desc: '',
      args: [],
    );
  }

  /// `Role Playing Games`
  String get role_playing_games {
    return Intl.message(
      'Role Playing Games',
      name: 'role_playing_games',
      desc: '',
      args: [],
    );
  }

  /// `Reptiles`
  String get reptiles {
    return Intl.message(
      'Reptiles',
      name: 'reptiles',
      desc: '',
      args: [],
    );
  }

  /// `Portable Media Players`
  String get portable_media_players {
    return Intl.message(
      'Portable Media Players',
      name: 'portable_media_players',
      desc: '',
      args: [],
    );
  }

  /// `Racing Games`
  String get racing_games {
    return Intl.message(
      'Racing Games',
      name: 'racing_games',
      desc: '',
      args: [],
    );
  }

  /// `Fitness and Wellness`
  String get fitness_wellness {
    return Intl.message(
      'Fitness and Wellness',
      name: 'fitness_wellness',
      desc: '',
      args: [],
    );
  }

  /// `Recipes`
  String get recipes {
    return Intl.message(
      'Recipes',
      name: 'recipes',
      desc: '',
      args: [],
    );
  }

  /// `Website Hosting`
  String get website_hosting {
    return Intl.message(
      'Website Hosting',
      name: 'website_hosting',
      desc: '',
      args: [],
    );
  }

  /// `Social Media Marketing`
  String get social_media_marketing {
    return Intl.message(
      'Social Media Marketing',
      name: 'social_media_marketing',
      desc: '',
      args: [],
    );
  }

  /// `Investing`
  String get investing {
    return Intl.message(
      'Investing',
      name: 'investing',
      desc: '',
      args: [],
    );
  }

  /// `Energy Drinks`
  String get energy_drinks {
    return Intl.message(
      'Energy Drinks',
      name: 'energy_drinks',
      desc: '',
      args: [],
    );
  }

  /// `Shopping Centers`
  String get shopping_centers {
    return Intl.message(
      'Shopping Centers',
      name: 'shopping_centers',
      desc: '',
      args: [],
    );
  }

  /// `Drums`
  String get drums {
    return Intl.message(
      'Drums',
      name: 'drums',
      desc: '',
      args: [],
    );
  }

  /// `Home Appliances`
  String get home_appliances {
    return Intl.message(
      'Home Appliances',
      name: 'home_appliances',
      desc: '',
      args: [],
    );
  }

  /// `Vietnamese Cuisine`
  String get vietnamese_cuisine {
    return Intl.message(
      'Vietnamese Cuisine',
      name: 'vietnamese_cuisine',
      desc: '',
      args: [],
    );
  }

  /// `Shoes`
  String get shoes {
    return Intl.message(
      'Shoes',
      name: 'shoes',
      desc: '',
      args: [],
    );
  }

  /// `Online Shopping`
  String get online_shopping {
    return Intl.message(
      'Online Shopping',
      name: 'online_shopping',
      desc: '',
      args: [],
    );
  }

  /// `Camping`
  String get camping {
    return Intl.message(
      'Camping',
      name: 'camping',
      desc: '',
      args: [],
    );
  }

  /// `Fashion Accessories`
  String get fashion_accessories {
    return Intl.message(
      'Fashion Accessories',
      name: 'fashion_accessories',
      desc: '',
      args: [],
    );
  }

  /// `Computer Memory`
  String get computer_memory {
    return Intl.message(
      'Computer Memory',
      name: 'computer_memory',
      desc: '',
      args: [],
    );
  }

  /// `Entertainment`
  String get entertainment {
    return Intl.message(
      'Entertainment',
      name: 'entertainment',
      desc: '',
      args: [],
    );
  }

  /// `Triathlon`
  String get triathlon {
    return Intl.message(
      'Triathlon',
      name: 'triathlon',
      desc: '',
      args: [],
    );
  }

  /// `Musical Theater`
  String get musical_theater {
    return Intl.message(
      'Musical Theater',
      name: 'musical_theater',
      desc: '',
      args: [],
    );
  }

  /// `Nature`
  String get nature {
    return Intl.message(
      'Nature',
      name: 'nature',
      desc: '',
      args: [],
    );
  }

  /// `Motorcycles`
  String get motorcycles {
    return Intl.message(
      'Motorcycles',
      name: 'motorcycles',
      desc: '',
      args: [],
    );
  }

  /// `Basketball`
  String get basketball {
    return Intl.message(
      'Basketball',
      name: 'basketball',
      desc: '',
      args: [],
    );
  }

  /// `Nightclubs`
  String get nightclubs {
    return Intl.message(
      'Nightclubs',
      name: 'nightclubs',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Homes`
  String get mobile_homes {
    return Intl.message(
      'Mobile Homes',
      name: 'mobile_homes',
      desc: '',
      args: [],
    );
  }

  /// `Construction`
  String get construction {
    return Intl.message(
      'Construction',
      name: 'construction',
      desc: '',
      args: [],
    );
  }

  /// `Tennis`
  String get tennis {
    return Intl.message(
      'Tennis',
      name: 'tennis',
      desc: '',
      args: [],
    );
  }

  /// `Casual Restaurants`
  String get casual_restaurants {
    return Intl.message(
      'Casual Restaurants',
      name: 'casual_restaurants',
      desc: '',
      args: [],
    );
  }

  /// `Management`
  String get management {
    return Intl.message(
      'Management',
      name: 'management',
      desc: '',
      args: [],
    );
  }

  /// `Web Design`
  String get web_design {
    return Intl.message(
      'Web Design',
      name: 'web_design',
      desc: '',
      args: [],
    );
  }

  /// `Business`
  String get business {
    return Intl.message(
      'Business',
      name: 'business',
      desc: '',
      args: [],
    );
  }

  /// `Alcoholic Drink`
  String get alcoholic_drink {
    return Intl.message(
      'Alcoholic Drink',
      name: 'alcoholic_drink',
      desc: '',
      args: [],
    );
  }

  /// `Computers`
  String get computers {
    return Intl.message(
      'Computers',
      name: 'computers',
      desc: '',
      args: [],
    );
  }

  /// `Children's Clothes`
  String get children_clothes {
    return Intl.message(
      'Children\'s Clothes',
      name: 'children_clothes',
      desc: '',
      args: [],
    );
  }

  /// `Weddings`
  String get weddings {
    return Intl.message(
      'Weddings',
      name: 'weddings',
      desc: '',
      args: [],
    );
  }

  /// `French Cuisine`
  String get french_cuisine {
    return Intl.message(
      'French Cuisine',
      name: 'french_cuisine',
      desc: '',
      args: [],
    );
  }

  /// `Plays`
  String get plays {
    return Intl.message(
      'Plays',
      name: 'plays',
      desc: '',
      args: [],
    );
  }

  /// `Charity and Causes`
  String get charity_causes {
    return Intl.message(
      'Charity and Causes',
      name: 'charity_causes',
      desc: '',
      args: [],
    );
  }

  /// `Non-Fiction Books`
  String get non_fiction_books {
    return Intl.message(
      'Non-Fiction Books',
      name: 'non_fiction_books',
      desc: '',
      args: [],
    );
  }

  /// `Action Games`
  String get action_games {
    return Intl.message(
      'Action Games',
      name: 'action_games',
      desc: '',
      args: [],
    );
  }

  /// `Diners`
  String get diners {
    return Intl.message(
      'Diners',
      name: 'diners',
      desc: '',
      args: [],
    );
  }

  /// `Seafood`
  String get seafood {
    return Intl.message(
      'Seafood',
      name: 'seafood',
      desc: '',
      args: [],
    );
  }

  /// `Literature`
  String get literature {
    return Intl.message(
      'Literature',
      name: 'literature',
      desc: '',
      args: [],
    );
  }

  /// `Ballet`
  String get ballet {
    return Intl.message(
      'Ballet',
      name: 'ballet',
      desc: '',
      args: [],
    );
  }

  /// `Simulation Games`
  String get simulation_games {
    return Intl.message(
      'Simulation Games',
      name: 'simulation_games',
      desc: '',
      args: [],
    );
  }

  /// `Casino Games`
  String get casino_games {
    return Intl.message(
      'Casino Games',
      name: 'casino_games',
      desc: '',
      args: [],
    );
  }

  /// `Dancehall`
  String get dancehall {
    return Intl.message(
      'Dancehall',
      name: 'dancehall',
      desc: '',
      args: [],
    );
  }

  /// `Sunglasses`
  String get sunglasses {
    return Intl.message(
      'Sunglasses',
      name: 'sunglasses',
      desc: '',
      args: [],
    );
  }

  /// `Health Products`
  String get health_products {
    return Intl.message(
      'Health Products',
      name: 'health_products',
      desc: '',
      args: [],
    );
  }

  /// `Shopping`
  String get shopping {
    return Intl.message(
      'Shopping',
      name: 'shopping',
      desc: '',
      args: [],
    );
  }

  /// `Fashion Design`
  String get fashion_design {
    return Intl.message(
      'Fashion Design',
      name: 'fashion_design',
      desc: '',
      args: [],
    );
  }

  /// `Jewelry`
  String get jewelry {
    return Intl.message(
      'Jewelry',
      name: 'jewelry',
      desc: '',
      args: [],
    );
  }

  /// `Blues Music`
  String get blues_music {
    return Intl.message(
      'Blues Music',
      name: 'blues_music',
      desc: '',
      args: [],
    );
  }

  /// `Sports`
  String get sports {
    return Intl.message(
      'Sports',
      name: 'sports',
      desc: '',
      args: [],
    );
  }

  /// `Reality TV`
  String get reality_tv {
    return Intl.message(
      'Reality TV',
      name: 'reality_tv',
      desc: '',
      args: [],
    );
  }

  /// `Higher Education`
  String get higher_education {
    return Intl.message(
      'Higher Education',
      name: 'higher_education',
      desc: '',
      args: [],
    );
  }

  /// `Fiction Books`
  String get fiction_books {
    return Intl.message(
      'Fiction Books',
      name: 'fiction_books',
      desc: '',
      args: [],
    );
  }

  /// `GPS Devices`
  String get gps_devices {
    return Intl.message(
      'GPS Devices',
      name: 'gps_devices',
      desc: '',
      args: [],
    );
  }

  /// `MMORPG`
  String get mmorpg {
    return Intl.message(
      'MMORPG',
      name: 'mmorpg',
      desc: '',
      args: [],
    );
  }

  /// `Middle Eastern Cuisine`
  String get middle_eastern_cuisine {
    return Intl.message(
      'Middle Eastern Cuisine',
      name: 'middle_eastern_cuisine',
      desc: '',
      args: [],
    );
  }

  /// `Handbags`
  String get handbags {
    return Intl.message(
      'Handbags',
      name: 'handbags',
      desc: '',
      args: [],
    );
  }

  /// `Sci-Fi Movies`
  String get sci_fi_movies {
    return Intl.message(
      'Sci-Fi Movies',
      name: 'sci_fi_movies',
      desc: '',
      args: [],
    );
  }

  /// `Magazines`
  String get magazines {
    return Intl.message(
      'Magazines',
      name: 'magazines',
      desc: '',
      args: [],
    );
  }

  /// `Romance Novels`
  String get romance_novels {
    return Intl.message(
      'Romance Novels',
      name: 'romance_novels',
      desc: '',
      args: [],
    );
  }

  /// `People Carriers`
  String get people_carriers {
    return Intl.message(
      'People Carriers',
      name: 'people_carriers',
      desc: '',
      args: [],
    );
  }

  /// `Insurance`
  String get insurance {
    return Intl.message(
      'Insurance',
      name: 'insurance',
      desc: '',
      args: [],
    );
  }

  /// `Discount Stores`
  String get discount_stores {
    return Intl.message(
      'Discount Stores',
      name: 'discount_stores',
      desc: '',
      args: [],
    );
  }

  /// `Air Travel`
  String get air_travel {
    return Intl.message(
      'Air Travel',
      name: 'air_travel',
      desc: '',
      args: [],
    );
  }

  /// `Televisions`
  String get televisions {
    return Intl.message(
      'Televisions',
      name: 'televisions',
      desc: '',
      args: [],
    );
  }

  /// `Thriller Movies`
  String get thriller_movies {
    return Intl.message(
      'Thriller Movies',
      name: 'thriller_movies',
      desc: '',
      args: [],
    );
  }

  /// `Cruises`
  String get cruises {
    return Intl.message(
      'Cruises',
      name: 'cruises',
      desc: '',
      args: [],
    );
  }

  /// `Hip Hop Music`
  String get hip_hop_music {
    return Intl.message(
      'Hip Hop Music',
      name: 'hip_hop_music',
      desc: '',
      args: [],
    );
  }

  /// `Parenting`
  String get parenting {
    return Intl.message(
      'Parenting',
      name: 'parenting',
      desc: '',
      args: [],
    );
  }

  /// `Mountain Biking`
  String get mountain_biking {
    return Intl.message(
      'Mountain Biking',
      name: 'mountain_biking',
      desc: '',
      args: [],
    );
  }

  /// `Car Rentals`
  String get car_rentals {
    return Intl.message(
      'Car Rentals',
      name: 'car_rentals',
      desc: '',
      args: [],
    );
  }

  /// `Trucks`
  String get trucks {
    return Intl.message(
      'Trucks',
      name: 'trucks',
      desc: '',
      args: [],
    );
  }

  /// `Graphic Design`
  String get graphic_design {
    return Intl.message(
      'Graphic Design',
      name: 'graphic_design',
      desc: '',
      args: [],
    );
  }

  /// `Latin American Cuisine`
  String get latin_american_cuisine {
    return Intl.message(
      'Latin American Cuisine',
      name: 'latin_american_cuisine',
      desc: '',
      args: [],
    );
  }

  /// `Italian Cuisine`
  String get italian_cuisine {
    return Intl.message(
      'Italian Cuisine',
      name: 'italian_cuisine',
      desc: '',
      args: [],
    );
  }

  /// `Boutiques`
  String get boutiques {
    return Intl.message(
      'Boutiques',
      name: 'boutiques',
      desc: '',
      args: [],
    );
  }

  /// `Fishing`
  String get fishing {
    return Intl.message(
      'Fishing',
      name: 'fishing',
      desc: '',
      args: [],
    );
  }

  /// `Crafts`
  String get crafts {
    return Intl.message(
      'Crafts',
      name: 'crafts',
      desc: '',
      args: [],
    );
  }

  /// `Football`
  String get football {
    return Intl.message(
      'Football',
      name: 'football',
      desc: '',
      args: [],
    );
  }

  /// `Soul Music`
  String get soul_music {
    return Intl.message(
      'Soul Music',
      name: 'soul_music',
      desc: '',
      args: [],
    );
  }

  /// `Spanish Cuisine`
  String get spanish_cuisine {
    return Intl.message(
      'Spanish Cuisine',
      name: 'spanish_cuisine',
      desc: '',
      args: [],
    );
  }

  /// `Music Festivals`
  String get music_festivals {
    return Intl.message(
      'Music Festivals',
      name: 'music_festivals',
      desc: '',
      args: [],
    );
  }

  /// `Computer Monitors`
  String get computer_monitors {
    return Intl.message(
      'Computer Monitors',
      name: 'computer_monitors',
      desc: '',
      args: [],
    );
  }

  /// `Desktop Computers`
  String get desktop_computers {
    return Intl.message(
      'Desktop Computers',
      name: 'desktop_computers',
      desc: '',
      args: [],
    );
  }

  /// `Electric Car`
  String get electric_car {
    return Intl.message(
      'Electric Car',
      name: 'electric_car',
      desc: '',
      args: [],
    );
  }

  /// `Cafes`
  String get cafes {
    return Intl.message(
      'Cafes',
      name: 'cafes',
      desc: '',
      args: [],
    );
  }

  /// `Boats`
  String get boats {
    return Intl.message(
      'Boats',
      name: 'boats',
      desc: '',
      args: [],
    );
  }

  /// `Candy`
  String get candy {
    return Intl.message(
      'Candy',
      name: 'candy',
      desc: '',
      args: [],
    );
  }

  /// `Beauty`
  String get beauty {
    return Intl.message(
      'Beauty',
      name: 'beauty',
      desc: '',
      args: [],
    );
  }

  /// `Science`
  String get science {
    return Intl.message(
      'Science',
      name: 'science',
      desc: '',
      args: [],
    );
  }

  /// `Cosmetics`
  String get cosmetics {
    return Intl.message(
      'Cosmetics',
      name: 'cosmetics',
      desc: '',
      args: [],
    );
  }

  /// `Organic Food`
  String get organic_food {
    return Intl.message(
      'Organic Food',
      name: 'organic_food',
      desc: '',
      args: [],
    );
  }

  /// `Adventure Trip`
  String get adventure_trip {
    return Intl.message(
      'Adventure Trip',
      name: 'adventure_trip',
      desc: '',
      args: [],
    );
  }

  /// `Home Decor`
  String get home_decor {
    return Intl.message(
      'Home Decor',
      name: 'home_decor',
      desc: '',
      args: [],
    );
  }

  /// `Small Business`
  String get small_business {
    return Intl.message(
      'Small Business',
      name: 'small_business',
      desc: '',
      args: [],
    );
  }

  /// `Holidays`
  String get holidays {
    return Intl.message(
      'Holidays',
      name: 'holidays',
      desc: '',
      args: [],
    );
  }

  /// `Volleyball`
  String get volleyball {
    return Intl.message(
      'Volleyball',
      name: 'volleyball',
      desc: '',
      args: [],
    );
  }

  /// `Classical Music`
  String get classical_music {
    return Intl.message(
      'Classical Music',
      name: 'classical_music',
      desc: '',
      args: [],
    );
  }

  /// `Theater`
  String get theater {
    return Intl.message(
      'Theater',
      name: 'theater',
      desc: '',
      args: [],
    );
  }

  /// `Mexican Cuisine`
  String get mexican_cuisine {
    return Intl.message(
      'Mexican Cuisine',
      name: 'mexican_cuisine',
      desc: '',
      args: [],
    );
  }

  /// `Aviation`
  String get aviation {
    return Intl.message(
      'Aviation',
      name: 'aviation',
      desc: '',
      args: [],
    );
  }

  /// `Parties`
  String get parties {
    return Intl.message(
      'Parties',
      name: 'parties',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Phones`
  String get mobile_phones {
    return Intl.message(
      'Mobile Phones',
      name: 'mobile_phones',
      desc: '',
      args: [],
    );
  }

  /// `Surfing`
  String get surfing {
    return Intl.message(
      'Surfing',
      name: 'surfing',
      desc: '',
      args: [],
    );
  }

  /// `Mystery Fiction`
  String get mystery_fiction {
    return Intl.message(
      'Mystery Fiction',
      name: 'mystery_fiction',
      desc: '',
      args: [],
    );
  }

  /// `Outdoor Recreation`
  String get outdoor_recreation {
    return Intl.message(
      'Outdoor Recreation',
      name: 'outdoor_recreation',
      desc: '',
      args: [],
    );
  }

  /// `Motherhood`
  String get motherhood {
    return Intl.message(
      'Motherhood',
      name: 'motherhood',
      desc: '',
      args: [],
    );
  }

  /// `Singing`
  String get singing {
    return Intl.message(
      'Singing',
      name: 'singing',
      desc: '',
      args: [],
    );
  }

  /// `Reading`
  String get reading {
    return Intl.message(
      'Reading',
      name: 'reading',
      desc: '',
      args: [],
    );
  }

  /// `Video Cameras`
  String get video_cameras {
    return Intl.message(
      'Video Cameras',
      name: 'video_cameras',
      desc: '',
      args: [],
    );
  }

  /// `Music`
  String get music {
    return Intl.message(
      'Music',
      name: 'music',
      desc: '',
      args: [],
    );
  }

  /// `Gambling`
  String get gambling {
    return Intl.message(
      'Gambling',
      name: 'gambling',
      desc: '',
      args: [],
    );
  }

  /// `Japanese Cuisine`
  String get japanese_cuisine {
    return Intl.message(
      'Japanese Cuisine',
      name: 'japanese_cuisine',
      desc: '',
      args: [],
    );
  }

  /// `Online Poker`
  String get online_poker {
    return Intl.message(
      'Online Poker',
      name: 'online_poker',
      desc: '',
      args: [],
    );
  }

  /// `Arts and Music`
  String get arts_music {
    return Intl.message(
      'Arts and Music',
      name: 'arts_music',
      desc: '',
      args: [],
    );
  }

  /// `Tattoos`
  String get tattoos {
    return Intl.message(
      'Tattoos',
      name: 'tattoos',
      desc: '',
      args: [],
    );
  }

  /// `Coupons`
  String get coupons {
    return Intl.message(
      'Coupons',
      name: 'coupons',
      desc: '',
      args: [],
    );
  }

  /// `Gardens`
  String get gardens {
    return Intl.message(
      'Gardens',
      name: 'gardens',
      desc: '',
      args: [],
    );
  }

  /// `Community Issues`
  String get community_issues {
    return Intl.message(
      'Community Issues',
      name: 'community_issues',
      desc: '',
      args: [],
    );
  }

  /// `Ecotourism`
  String get ecotourism {
    return Intl.message(
      'Ecotourism',
      name: 'ecotourism',
      desc: '',
      args: [],
    );
  }

  /// `First Person Shooters`
  String get first_person_shooters {
    return Intl.message(
      'First Person Shooters',
      name: 'first_person_shooters',
      desc: '',
      args: [],
    );
  }

  /// `Retail Banking`
  String get retail_banking {
    return Intl.message(
      'Retail Banking',
      name: 'retail_banking',
      desc: '',
      args: [],
    );
  }

  /// `Investment Banking`
  String get investment_banking {
    return Intl.message(
      'Investment Banking',
      name: 'investment_banking',
      desc: '',
      args: [],
    );
  }

  /// `Mountains`
  String get mountains {
    return Intl.message(
      'Mountains',
      name: 'mountains',
      desc: '',
      args: [],
    );
  }

  /// `Children's Games`
  String get children_games {
    return Intl.message(
      'Children\'s Games',
      name: 'children_games',
      desc: '',
      args: [],
    );
  }

  /// `Sales`
  String get sales {
    return Intl.message(
      'Sales',
      name: 'sales',
      desc: '',
      args: [],
    );
  }

  /// `Ebooks`
  String get ebooks {
    return Intl.message(
      'Ebooks',
      name: 'ebooks',
      desc: '',
      args: [],
    );
  }

  /// `Manga`
  String get manga {
    return Intl.message(
      'Manga',
      name: 'manga',
      desc: '',
      args: [],
    );
  }

  /// `Email Marketing`
  String get email_marketing {
    return Intl.message(
      'Email Marketing',
      name: 'email_marketing',
      desc: '',
      args: [],
    );
  }

  /// `Beauty Salons`
  String get beauty_salons {
    return Intl.message(
      'Beauty Salons',
      name: 'beauty_salons',
      desc: '',
      args: [],
    );
  }

  /// `Baseball`
  String get baseball {
    return Intl.message(
      'Baseball',
      name: 'baseball',
      desc: '',
      args: [],
    );
  }

  /// `Thai Cuisine`
  String get thai_cuisine {
    return Intl.message(
      'Thai Cuisine',
      name: 'thai_cuisine',
      desc: '',
      args: [],
    );
  }

  /// `Smartphones`
  String get smartphones {
    return Intl.message(
      'Smartphones',
      name: 'smartphones',
      desc: '',
      args: [],
    );
  }

  /// `Projectors`
  String get projectors {
    return Intl.message(
      'Projectors',
      name: 'projectors',
      desc: '',
      args: [],
    );
  }

  /// `Web Development`
  String get web_development {
    return Intl.message(
      'Web Development',
      name: 'web_development',
      desc: '',
      args: [],
    );
  }

  /// `Current Events`
  String get current_events {
    return Intl.message(
      'Current Events',
      name: 'current_events',
      desc: '',
      args: [],
    );
  }

  /// `Drinks`
  String get drinks {
    return Intl.message(
      'Drinks',
      name: 'drinks',
      desc: '',
      args: [],
    );
  }

  /// `Greek Cuisine`
  String get greek_cuisine {
    return Intl.message(
      'Greek Cuisine',
      name: 'greek_cuisine',
      desc: '',
      args: [],
    );
  }

  /// `Yoga`
  String get yoga {
    return Intl.message(
      'Yoga',
      name: 'yoga',
      desc: '',
      args: [],
    );
  }

  /// `Cameras`
  String get cameras {
    return Intl.message(
      'Cameras',
      name: 'cameras',
      desc: '',
      args: [],
    );
  }

  /// `Skiing`
  String get skiing {
    return Intl.message(
      'Skiing',
      name: 'skiing',
      desc: '',
      args: [],
    );
  }

  /// `Dogs`
  String get dogs {
    return Intl.message(
      'Dogs',
      name: 'dogs',
      desc: '',
      args: [],
    );
  }

  /// `Pop Music`
  String get pop_music {
    return Intl.message(
      'Pop Music',
      name: 'pop_music',
      desc: '',
      args: [],
    );
  }

  /// `Music Videos`
  String get music_videos {
    return Intl.message(
      'Music Videos',
      name: 'music_videos',
      desc: '',
      args: [],
    );
  }

  /// `Korean Cuisine`
  String get korean_cuisine {
    return Intl.message(
      'Korean Cuisine',
      name: 'korean_cuisine',
      desc: '',
      args: [],
    );
  }

  /// `Digital Marketing`
  String get digital_marketing {
    return Intl.message(
      'Digital Marketing',
      name: 'digital_marketing',
      desc: '',
      args: [],
    );
  }

  /// `TV Game Shows`
  String get tv_game_shows {
    return Intl.message(
      'TV Game Shows',
      name: 'tv_game_shows',
      desc: '',
      args: [],
    );
  }

  /// `Furniture`
  String get furniture {
    return Intl.message(
      'Furniture',
      name: 'furniture',
      desc: '',
      args: [],
    );
  }

  /// `Animated Movies`
  String get animated_movies {
    return Intl.message(
      'Animated Movies',
      name: 'animated_movies',
      desc: '',
      args: [],
    );
  }

  /// `Vehicles`
  String get vehicles {
    return Intl.message(
      'Vehicles',
      name: 'vehicles',
      desc: '',
      args: [],
    );
  }

  /// `Volunteering`
  String get volunteering {
    return Intl.message(
      'Volunteering',
      name: 'volunteering',
      desc: '',
      args: [],
    );
  }

  /// `Mortgage Loans`
  String get mortgage_loans {
    return Intl.message(
      'Mortgage Loans',
      name: 'mortgage_loans',
      desc: '',
      args: [],
    );
  }

  /// `Computer Processors`
  String get computer_processors {
    return Intl.message(
      'Computer Processors',
      name: 'computer_processors',
      desc: '',
      args: [],
    );
  }

  /// `Personal Finance`
  String get personal_finance {
    return Intl.message(
      'Personal Finance',
      name: 'personal_finance',
      desc: '',
      args: [],
    );
  }

  /// `Car Racing`
  String get car_racing {
    return Intl.message(
      'Car Racing',
      name: 'car_racing',
      desc: '',
      args: [],
    );
  }

  /// `Jazz Music`
  String get jazz_music {
    return Intl.message(
      'Jazz Music',
      name: 'jazz_music',
      desc: '',
      args: [],
    );
  }

  /// `Wine`
  String get wine {
    return Intl.message(
      'Wine',
      name: 'wine',
      desc: '',
      args: [],
    );
  }

  /// `Performing Arts`
  String get performing_arts {
    return Intl.message(
      'Performing Arts',
      name: 'performing_arts',
      desc: '',
      args: [],
    );
  }

  /// `Cats`
  String get cats {
    return Intl.message(
      'Cats',
      name: 'cats',
      desc: '',
      args: [],
    );
  }

  /// `Bollywood Movies`
  String get bollywood_movies {
    return Intl.message(
      'Bollywood Movies',
      name: 'bollywood_movies',
      desc: '',
      args: [],
    );
  }

  /// `Comedy Movies`
  String get comedy_movies {
    return Intl.message(
      'Comedy Movies',
      name: 'comedy_movies',
      desc: '',
      args: [],
    );
  }

  /// `College Football`
  String get college_football {
    return Intl.message(
      'College Football',
      name: 'college_football',
      desc: '',
      args: [],
    );
  }

  /// `TV Talk Shows`
  String get tv_talk_shows {
    return Intl.message(
      'TV Talk Shows',
      name: 'tv_talk_shows',
      desc: '',
      args: [],
    );
  }

  /// `TV Programs`
  String get tv_programs {
    return Intl.message(
      'TV Programs',
      name: 'tv_programs',
      desc: '',
      args: [],
    );
  }

  /// `Cars`
  String get cars {
    return Intl.message(
      'Cars',
      name: 'cars',
      desc: '',
      args: [],
    );
  }

  /// `Fine Arts`
  String get fine_arts {
    return Intl.message(
      'Fine Arts',
      name: 'fine_arts',
      desc: '',
      args: [],
    );
  }

  /// `Dresses`
  String get dresses {
    return Intl.message(
      'Dresses',
      name: 'dresses',
      desc: '',
      args: [],
    );
  }

  /// `Dance Music`
  String get dance_music {
    return Intl.message(
      'Dance Music',
      name: 'dance_music',
      desc: '',
      args: [],
    );
  }

  /// `Dishes`
  String get dishes {
    return Intl.message(
      'Dishes',
      name: 'dishes',
      desc: '',
      args: [],
    );
  }

  /// `Rhythm and Blues Music`
  String get rhythm_blues_music {
    return Intl.message(
      'Rhythm and Blues Music',
      name: 'rhythm_blues_music',
      desc: '',
      args: [],
    );
  }

  /// `Bars`
  String get bars {
    return Intl.message(
      'Bars',
      name: 'bars',
      desc: '',
      args: [],
    );
  }

  /// `Fish`
  String get fish {
    return Intl.message(
      'Fish',
      name: 'fish',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get current_password {
    return Intl.message(
      'Current Password',
      name: 'current_password',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_password {
    return Intl.message(
      'New Password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirm_new_password {
    return Intl.message(
      'Confirm New Password',
      name: 'confirm_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Save Password`
  String get save_password {
    return Intl.message(
      'Save Password',
      name: 'save_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter all fields`
  String get error_empty_fields {
    return Intl.message(
      'Please enter all fields',
      name: 'error_empty_fields',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get error_short_password {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'error_short_password',
      desc: '',
      args: [],
    );
  }

  /// `Password and confirmation password do not match`
  String get error_password_mismatch {
    return Intl.message(
      'Password and confirmation password do not match',
      name: 'error_password_mismatch',
      desc: '',
      args: [],
    );
  }

  /// `Failed to update password: {error}`
  String error_update_password(Object error) {
    return Intl.message(
      'Failed to update password: $error',
      name: 'error_update_password',
      desc: '',
      args: [error],
    );
  }

  /// `Password updated successfully`
  String get success_update_password {
    return Intl.message(
      'Password updated successfully',
      name: 'success_update_password',
      desc: '',
      args: [],
    );
  }

  /// `What is Bird App?`
  String get faq_question_1 {
    return Intl.message(
      'What is Bird App?',
      name: 'faq_question_1',
      desc: '',
      args: [],
    );
  }

  /// `How to create an ad?`
  String get faq_question_2 {
    return Intl.message(
      'How to create an ad?',
      name: 'faq_question_2',
      desc: '',
      args: [],
    );
  }

  /// `How to recharge my wallet?`
  String get faq_question_3 {
    return Intl.message(
      'How to recharge my wallet?',
      name: 'faq_question_3',
      desc: '',
      args: [],
    );
  }

  /// `How to achieve the best results for the ad?`
  String get faq_question_4 {
    return Intl.message(
      'How to achieve the best results for the ad?',
      name: 'faq_question_4',
      desc: '',
      args: [],
    );
  }

  /// `Why was my ad rejected?`
  String get faq_question_5 {
    return Intl.message(
      'Why was my ad rejected?',
      name: 'faq_question_5',
      desc: '',
      args: [],
    );
  }

  /// `Can I withdraw my wallet balance?`
  String get faq_question_6 {
    return Intl.message(
      'Can I withdraw my wallet balance?',
      name: 'faq_question_6',
      desc: '',
      args: [],
    );
  }

  /// `What are the available offers or codes?`
  String get faq_question_7 {
    return Intl.message(
      'What are the available offers or codes?',
      name: 'faq_question_7',
      desc: '',
      args: [],
    );
  }

  /// `The ad ended and the balance did not appear in the Bird App wallet`
  String get faq_question_8 {
    return Intl.message(
      'The ad ended and the balance did not appear in the Bird App wallet',
      name: 'faq_question_8',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get first_name {
    return Intl.message(
      'First Name',
      name: 'first_name',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get last_name {
    return Intl.message(
      'Last Name',
      name: 'last_name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get save_changes {
    return Intl.message(
      'Save Changes',
      name: 'save_changes',
      desc: '',
      args: [],
    );
  }

  /// `Changes saved successfully`
  String get snack_bar_message {
    return Intl.message(
      'Changes saved successfully',
      name: 'snack_bar_message',
      desc: '',
      args: [],
    );
  }

  /// `Contact via phone`
  String get contact_phone {
    return Intl.message(
      'Contact via phone',
      name: 'contact_phone',
      desc: '',
      args: [],
    );
  }

  /// `Contact via WhatsApp`
  String get contact_whatsapp {
    return Intl.message(
      'Contact via WhatsApp',
      name: 'contact_whatsapp',
      desc: '',
      args: [],
    );
  }

  /// `Contact via Messenger`
  String get contact_messenger {
    return Intl.message(
      'Contact via Messenger',
      name: 'contact_messenger',
      desc: '',
      args: [],
    );
  }

  /// `Contact via Email`
  String get contact_email {
    return Intl.message(
      'Contact via Email',
      name: 'contact_email',
      desc: '',
      args: [],
    );
  }

  /// `Complaints and Suggestions`
  String get complaints_and_suggestions {
    return Intl.message(
      'Complaints and Suggestions',
      name: 'complaints_and_suggestions',
      desc: '',
      args: [],
    );
  }

  /// `Please leave your phone number for contact regarding the complaint`
  String get leave_phone_for_contact {
    return Intl.message(
      'Please leave your phone number for contact regarding the complaint',
      name: 'leave_phone_for_contact',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Enter your complaint here`
  String get enter_complaint_here {
    return Intl.message(
      'Enter your complaint here',
      name: 'enter_complaint_here',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Complaint Sent`
  String get complaint_sent {
    return Intl.message(
      'Complaint Sent',
      name: 'complaint_sent',
      desc: '',
      args: [],
    );
  }

  /// `Thank you. Your complaint has been sent successfully.`
  String get thank_you_complaint_sent {
    return Intl.message(
      'Thank you. Your complaint has been sent successfully.',
      name: 'thank_you_complaint_sent',
      desc: '',
      args: [],
    );
  }

  /// `Balance Amount`
  String get balance_amount {
    return Intl.message(
      'Balance Amount',
      name: 'balance_amount',
      desc: '',
      args: [],
    );
  }

  /// `Enter amount`
  String get enter_amount {
    return Intl.message(
      'Enter amount',
      name: 'enter_amount',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get note {
    return Intl.message(
      'Note',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  /// `The minimum amount to run an ad is 200 EGP.`
  String get minimum_ad_amount {
    return Intl.message(
      'The minimum amount to run an ad is 200 EGP.',
      name: 'minimum_ad_amount',
      desc: '',
      args: [],
    );
  }

  /// `Payment Details`
  String get payment_details {
    return Intl.message(
      'Payment Details',
      name: 'payment_details',
      desc: '',
      args: [],
    );
  }

  /// `Charging Amount`
  String get charging_amount {
    return Intl.message(
      'Charging Amount',
      name: 'charging_amount',
      desc: '',
      args: [],
    );
  }

  /// `VAT 14%`
  String get vat_14 {
    return Intl.message(
      'VAT 14%',
      name: 'vat_14',
      desc: '',
      args: [],
    );
  }

  /// `Charging Value`
  String get charging_value {
    return Intl.message(
      'Charging Value',
      name: 'charging_value',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue_action {
    return Intl.message(
      'Continue',
      name: 'continue_action',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue_text {
    return Intl.message(
      'Continue',
      name: 'continue_text',
      desc: '',
      args: [],
    );
  }

  /// `Enter Coupon Code`
  String get enter_coupon {
    return Intl.message(
      'Enter Coupon Code',
      name: 'enter_coupon',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply_coupon {
    return Intl.message(
      'Apply',
      name: 'apply_coupon',
      desc: '',
      args: [],
    );
  }

  /// `If you have a gift code, enter it here to get free ad credit (coupon one time use)`
  String get coupon_message {
    return Intl.message(
      'If you have a gift code, enter it here to get free ad credit (coupon one time use)',
      name: 'coupon_message',
      desc: '',
      args: [],
    );
  }

  /// `Invalid coupon`
  String get invalid_coupon {
    return Intl.message(
      'Invalid coupon',
      name: 'invalid_coupon',
      desc: '',
      args: [],
    );
  }

  /// `This coupon has already been used`
  String get used_coupon {
    return Intl.message(
      'This coupon has already been used',
      name: 'used_coupon',
      desc: '',
      args: [],
    );
  }

  /// `You have received an amount of {couponValue} EGP`
  String applied_coupon(Object couponValue) {
    return Intl.message(
      'You have received an amount of $couponValue EGP',
      name: 'applied_coupon',
      desc: '',
      args: [couponValue],
    );
  }

  /// `0 EGP`
  String get balance_0 {
    return Intl.message(
      '0 EGP',
      name: 'balance_0',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get currency {
    return Intl.message(
      'EGP',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `No transactions currently`
  String get no_transactions {
    return Intl.message(
      'No transactions currently',
      name: 'no_transactions',
      desc: '',
      args: [],
    );
  }

  /// `Coupon added`
  String get coupon_added {
    return Intl.message(
      'Coupon added',
      name: 'coupon_added',
      desc: '',
      args: [],
    );
  }

  /// `Ad cost`
  String get ad_cost {
    return Intl.message(
      'Ad cost',
      name: 'ad_cost',
      desc: '',
      args: [],
    );
  }

  /// `Balance Added`
  String get balance_added {
    return Intl.message(
      'Balance Added',
      name: 'balance_added',
      desc: '',
      args: [],
    );
  }

  /// `Balance Added Automatically`
  String get balance_added_auto {
    return Intl.message(
      'Balance Added Automatically',
      name: 'balance_added_auto',
      desc: '',
      args: [],
    );
  }

  /// `Available Balance`
  String get available_balance {
    return Intl.message(
      'Available Balance',
      name: 'available_balance',
      desc: '',
      args: [],
    );
  }

  /// `Refund Amount`
  String get refund_amount {
    return Intl.message(
      'Refund Amount',
      name: 'refund_amount',
      desc: '',
      args: [],
    );
  }

  /// `Refund Method`
  String get refund_method {
    return Intl.message(
      'Refund Method',
      name: 'refund_method',
      desc: '',
      args: [],
    );
  }

  /// `Account Number`
  String get account_number {
    return Intl.message(
      'Account Number',
      name: 'account_number',
      desc: '',
      args: [],
    );
  }

  /// `Refund Reason`
  String get refund_reason {
    return Intl.message(
      'Refund Reason',
      name: 'refund_reason',
      desc: '',
      args: [],
    );
  }

  /// `Other Reason`
  String get other_reason {
    return Intl.message(
      'Other Reason',
      name: 'other_reason',
      desc: '',
      args: [],
    );
  }

  /// `Submit Request`
  String get submit_request {
    return Intl.message(
      'Submit Request',
      name: 'submit_request',
      desc: '',
      args: [],
    );
  }

  /// `Your request has been submitted successfully`
  String get success_message {
    return Intl.message(
      'Your request has been submitted successfully',
      name: 'success_message',
      desc: '',
      args: [],
    );
  }

  /// `Transfer via Vodafone Cash`
  String get transfer_via_vodafone_cash {
    return Intl.message(
      'Transfer via Vodafone Cash',
      name: 'transfer_via_vodafone_cash',
      desc: '',
      args: [],
    );
  }

  /// `Transfer via Instapay`
  String get transfer_via_instapay {
    return Intl.message(
      'Transfer via Instapay',
      name: 'transfer_via_instapay',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Please attach a screenshot of the transfer`
  String get attachment_note {
    return Intl.message(
      'Please attach a screenshot of the transfer',
      name: 'attachment_note',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `File uploaded successfully`
  String get upload_success {
    return Intl.message(
      'File uploaded successfully',
      name: 'upload_success',
      desc: '',
      args: [],
    );
  }

  /// `File upload failed`
  String get upload_failure {
    return Intl.message(
      'File upload failed',
      name: 'upload_failure',
      desc: '',
      args: [],
    );
  }

  /// `Cash Wallet`
  String get cash_wallet {
    return Intl.message(
      'Cash Wallet',
      name: 'cash_wallet',
      desc: '',
      args: [],
    );
  }

  /// `Insta Pay`
  String get insta_pay {
    return Intl.message(
      'Insta Pay',
      name: 'insta_pay',
      desc: '',
      args: [],
    );
  }

  /// `Didn't like the service`
  String get service_not_liked {
    return Intl.message(
      'Didn\'t like the service',
      name: 'service_not_liked',
      desc: '',
      args: [],
    );
  }

  /// `Charged by mistake`
  String get charged_by_mistake {
    return Intl.message(
      'Charged by mistake',
      name: 'charged_by_mistake',
      desc: '',
      args: [],
    );
  }

  /// `Want to stop for a while`
  String get want_to_stop_for_a_while {
    return Intl.message(
      'Want to stop for a while',
      name: 'want_to_stop_for_a_while',
      desc: '',
      args: [],
    );
  }

  /// `Not suitable for my work`
  String get not_suitable_for_my_work {
    return Intl.message(
      'Not suitable for my work',
      name: 'not_suitable_for_my_work',
      desc: '',
      args: [],
    );
  }

  /// `Didn't like the results`
  String get results_not_liked {
    return Intl.message(
      'Didn\'t like the results',
      name: 'results_not_liked',
      desc: '',
      args: [],
    );
  }

  /// `Uploading`
  String get uploading {
    return Intl.message(
      'Uploading',
      name: 'uploading',
      desc: '',
      args: [],
    );
  }

  /// `New Transfer`
  String get new_transfer {
    return Intl.message(
      'New Transfer',
      name: 'new_transfer',
      desc: '',
      args: [],
    );
  }

  /// `Your request for adding funds is in progress`
  String get notification_message {
    return Intl.message(
      'Your request for adding funds is in progress',
      name: 'notification_message',
      desc: '',
      args: [],
    );
  }

  /// `Request Received`
  String get request_received {
    return Intl.message(
      'Request Received',
      name: 'request_received',
      desc: '',
      args: [],
    );
  }

  /// `Your order will be processed within 2 working hours. Please check the balance`
  String get follow_balance {
    return Intl.message(
      'Your order will be processed within 2 working hours. Please check the balance',
      name: 'follow_balance',
      desc: '',
      args: [],
    );
  }

  /// `Error occurred while saving data`
  String get data_save_failure {
    return Intl.message(
      'Error occurred while saving data',
      name: 'data_save_failure',
      desc: '',
      args: [],
    );
  }

  /// `Please choose a transfer method`
  String get choose_transfer_method {
    return Intl.message(
      'Please choose a transfer method',
      name: 'choose_transfer_method',
      desc: '',
      args: [],
    );
  }

  /// `Note: You can transfer from any e-wallet`
  String get transfer_note {
    return Intl.message(
      'Note: You can transfer from any e-wallet',
      name: 'transfer_note',
      desc: '',
      args: [],
    );
  }

  /// `Note: The name 'Rady' will appear`
  String get transfer_note_instapay {
    return Intl.message(
      'Note: The name \'Rady\' will appear',
      name: 'transfer_note_instapay',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the transfer number or Instapay name`
  String get transfer_note_input {
    return Intl.message(
      'Please enter the transfer number or Instapay name',
      name: 'transfer_note_input',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the transfer number or Instapay name`
  String get transfer_note_error {
    return Intl.message(
      'Please enter the transfer number or Instapay name',
      name: 'transfer_note_error',
      desc: '',
      args: [],
    );
  }

  /// `Number copied`
  String get copied {
    return Intl.message(
      'Number copied',
      name: 'copied',
      desc: '',
      args: [],
    );
  }

  /// `Copy`
  String get copy {
    return Intl.message(
      'Copy',
      name: 'copy',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get reset_password_title {
    return Intl.message(
      'Forgot Password',
      name: 'reset_password_title',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email to receive the password reset code.`
  String get reset_password_instruction {
    return Intl.message(
      'Please enter your email to receive the password reset code.',
      name: 'reset_password_instruction',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password_button {
    return Intl.message(
      'Reset Password',
      name: 'reset_password_button',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email_label {
    return Intl.message(
      'Email',
      name: 'email_label',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get invalid_email {
    return Intl.message(
      'Please enter a valid email',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `The email is not registered with us. Please create a new account.`
  String get email_not_registered {
    return Intl.message(
      'The email is not registered with us. Please create a new account.',
      name: 'email_not_registered',
      desc: '',
      args: [],
    );
  }

  /// `Verification code sent.`
  String get verification_code_sent {
    return Intl.message(
      'Verification code sent.',
      name: 'verification_code_sent',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while sending the verification code.`
  String get verification_code_error {
    return Intl.message(
      'An error occurred while sending the verification code.',
      name: 'verification_code_error',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while sending the password reset link: {errorMessage}`
  String reset_password_error(Object errorMessage) {
    return Intl.message(
      'An error occurred while sending the password reset link: $errorMessage',
      name: 'reset_password_error',
      desc: '',
      args: [errorMessage],
    );
  }

  /// `An unexpected error occurred while sending the password reset link`
  String get unexpected_error {
    return Intl.message(
      'An unexpected error occurred while sending the password reset link',
      name: 'unexpected_error',
      desc: '',
      args: [],
    );
  }

  /// `Error updating Firestore: `
  String get error_updating_firestore {
    return Intl.message(
      'Error updating Firestore: ',
      name: 'error_updating_firestore',
      desc: '',
      args: [],
    );
  }

  /// `Error: user is null`
  String get error_user_null {
    return Intl.message(
      'Error: user is null',
      name: 'error_user_null',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Start with Bird`
  String get start_with_bird {
    return Intl.message(
      'Start with Bird',
      name: 'start_with_bird',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Our Other Services`
  String get our_other_services {
    return Intl.message(
      'Our Other Services',
      name: 'our_other_services',
      desc: '',
      args: [],
    );
  }

  /// `Browse Our Services`
  String get browse_our_services {
    return Intl.message(
      'Browse Our Services',
      name: 'browse_our_services',
      desc: '',
      args: [],
    );
  }

  /// `View all our other services`
  String get view_all_our_other_services {
    return Intl.message(
      'View all our other services',
      name: 'view_all_our_other_services',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get remember_me {
    return Intl.message(
      'Remember me',
      name: 'remember_me',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgot_password {
    return Intl.message(
      'Forgot Password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Please enter all fields`
  String get login_error_empty_fields {
    return Intl.message(
      'Please enter all fields',
      name: 'login_error_empty_fields',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get login_error_invalid_email {
    return Intl.message(
      'Please enter a valid email',
      name: 'login_error_invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get login_error_short_password {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'login_error_short_password',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while logging in`
  String get login_error {
    return Intl.message(
      'An error occurred while logging in',
      name: 'login_error',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email and password to enjoy our services.`
  String get enter_email_and_password {
    return Intl.message(
      'Please enter your email and password to enjoy our services.',
      name: 'enter_email_and_password',
      desc: '',
      args: [],
    );
  }

  /// `Login successful`
  String get login_successful {
    return Intl.message(
      'Login successful',
      name: 'login_successful',
      desc: '',
      args: [],
    );
  }

  /// `User not found`
  String get user_not_found {
    return Intl.message(
      'User not found',
      name: 'user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `User disabled`
  String get user_disabled {
    return Intl.message(
      'User disabled',
      name: 'user_disabled',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password`
  String get wrong_password {
    return Intl.message(
      'Wrong password',
      name: 'wrong_password',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred`
  String get unknown_error {
    return Intl.message(
      'An unknown error occurred',
      name: 'unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `No notifications`
  String get no_notifications {
    return Intl.message(
      'No notifications',
      name: 'no_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Error: currentAdId not found in user document`
  String get error_currentAdId_not_found {
    return Intl.message(
      'Error: currentAdId not found in user document',
      name: 'error_currentAdId_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Create New Account`
  String get create_new_account {
    return Intl.message(
      'Create New Account',
      name: 'create_new_account',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter all fields`
  String get please_enter_all_fields {
    return Intl.message(
      'Please enter all fields',
      name: 'please_enter_all_fields',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get please_enter_valid_phone {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'please_enter_valid_phone',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get please_enter_valid_email {
    return Intl.message(
      'Please enter a valid email address',
      name: 'please_enter_valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get password_too_short {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'password_too_short',
      desc: '',
      args: [],
    );
  }

  /// `Password and confirm password do not match`
  String get passwords_do_not_match {
    return Intl.message(
      'Password and confirm password do not match',
      name: 'passwords_do_not_match',
      desc: '',
      args: [],
    );
  }

  /// `The password is too weak`
  String get weak_password {
    return Intl.message(
      'The password is too weak',
      name: 'weak_password',
      desc: '',
      args: [],
    );
  }

  /// `An account already exists for this email`
  String get email_already_in_use {
    return Intl.message(
      'An account already exists for this email',
      name: 'email_already_in_use',
      desc: '',
      args: [],
    );
  }

  /// `Error registering: {message}`
  String error_registering(Object message) {
    return Intl.message(
      'Error registering: $message',
      name: 'error_registering',
      desc: '',
      args: [message],
    );
  }

  /// `Sponsored ads for all platforms within the app`
  String get ad_services {
    return Intl.message(
      'Sponsored ads for all platforms within the app',
      name: 'ad_services',
      desc: '',
      args: [],
    );
  }

  /// `Create professional designs`
  String get design_services {
    return Intl.message(
      'Create professional designs',
      name: 'design_services',
      desc: '',
      args: [],
    );
  }

  /// `Create creative content`
  String get creative_content {
    return Intl.message(
      'Create creative content',
      name: 'creative_content',
      desc: '',
      args: [],
    );
  }

  /// `Ready-made Facebook pages`
  String get ready_facebook_pages {
    return Intl.message(
      'Ready-made Facebook pages',
      name: 'ready_facebook_pages',
      desc: '',
      args: [],
    );
  }

  /// `Increase Facebook followers`
  String get facebook_followers {
    return Intl.message(
      'Increase Facebook followers',
      name: 'facebook_followers',
      desc: '',
      args: [],
    );
  }

  /// `Increase comments, likes, and ratings on Facebook page`
  String get comments_likes {
    return Intl.message(
      'Increase comments, likes, and ratings on Facebook page',
      name: 'comments_likes',
      desc: '',
      args: [],
    );
  }

  /// `Increase Instagram accounts`
  String get instagram_accounts {
    return Intl.message(
      'Increase Instagram accounts',
      name: 'instagram_accounts',
      desc: '',
      args: [],
    );
  }

  /// `Ready Instagram accounts`
  String get ready_instagram_accounts {
    return Intl.message(
      'Ready Instagram accounts',
      name: 'ready_instagram_accounts',
      desc: '',
      args: [],
    );
  }

  /// `Ready TikTok accounts`
  String get ready_tiktok_accounts {
    return Intl.message(
      'Ready TikTok accounts',
      name: 'ready_tiktok_accounts',
      desc: '',
      args: [],
    );
  }

  /// `Click here to request services`
  String get request_services {
    return Intl.message(
      'Click here to request services',
      name: 'request_services',
      desc: '',
      args: [],
    );
  }

  /// `Order the service`
  String get order_service {
    return Intl.message(
      'Order the service',
      name: 'order_service',
      desc: '',
      args: [],
    );
  }

  /// `Other Services`
  String get other_services {
    return Intl.message(
      'Other Services',
      name: 'other_services',
      desc: '',
      args: [],
    );
  }

  /// `Facebook - Instagram - TikTok - YouTube - Google`
  String get ad_platforms {
    return Intl.message(
      'Facebook - Instagram - TikTok - YouTube - Google',
      name: 'ad_platforms',
      desc: '',
      args: [],
    );
  }

  /// `Social Media Post - Menu - Signage - etc.`
  String get design_examples {
    return Intl.message(
      'Social Media Post - Menu - Signage - etc.',
      name: 'design_examples',
      desc: '',
      args: [],
    );
  }

  /// `In collaboration with AI`
  String get ai_collaboration {
    return Intl.message(
      'In collaboration with AI',
      name: 'ai_collaboration',
      desc: '',
      args: [],
    );
  }

  /// `Price depends on the number and starts from 5k followers`
  String get price_based_on_followers {
    return Intl.message(
      'Price depends on the number and starts from 5k followers',
      name: 'price_based_on_followers',
      desc: '',
      args: [],
    );
  }

  /// `Real and engaged people`
  String get real_engaged_people {
    return Intl.message(
      'Real and engaged people',
      name: 'real_engaged_people',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password {
    return Intl.message(
      'Reset Password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter New Password`
  String get enter_new_password {
    return Intl.message(
      'Enter New Password',
      name: 'enter_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get error_passwords_not_matching {
    return Intl.message(
      'Passwords do not match',
      name: 'error_passwords_not_matching',
      desc: '',
      args: [],
    );
  }

  /// `Password reset successfully`
  String get success_password_reset {
    return Intl.message(
      'Password reset successfully',
      name: 'success_password_reset',
      desc: '',
      args: [],
    );
  }

  /// `Verify Code`
  String get verify_code {
    return Intl.message(
      'Verify Code',
      name: 'verify_code',
      desc: '',
      args: [],
    );
  }

  /// `Enter the 6-digit code sent to {email}`
  String enter_six_digit_code(Object email) {
    return Intl.message(
      'Enter the 6-digit code sent to $email',
      name: 'enter_six_digit_code',
      desc: '',
      args: [email],
    );
  }

  /// `Code`
  String get code {
    return Intl.message(
      'Code',
      name: 'code',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `The code is incorrect. Try again.`
  String get invalid_code {
    return Intl.message(
      'The code is incorrect. Try again.',
      name: 'invalid_code',
      desc: '',
      args: [],
    );
  }

  /// `Code verified successfully. You can now reset your password.`
  String get code_verified {
    return Intl.message(
      'Code verified successfully. You can now reset your password.',
      name: 'code_verified',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the 6-digit code`
  String get error_empty_code {
    return Intl.message(
      'Please enter the 6-digit code',
      name: 'error_empty_code',
      desc: '',
      args: [],
    );
  }

  /// `Please enter and confirm your new password.`
  String get enter_new_password_instructions {
    return Intl.message(
      'Please enter and confirm your new password.',
      name: 'enter_new_password_instructions',
      desc: '',
      args: [],
    );
  }

  /// `The email is not registered with us.`
  String get error_email_not_registered {
    return Intl.message(
      'The email is not registered with us.',
      name: 'error_email_not_registered',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while updating the password`
  String get error_updating_password {
    return Intl.message(
      'An error occurred while updating the password',
      name: 'error_updating_password',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred`
  String get error_occurred {
    return Intl.message(
      'An error occurred',
      name: 'error_occurred',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred while updating the password`
  String get error_unexpected {
    return Intl.message(
      'An unexpected error occurred while updating the password',
      name: 'error_unexpected',
      desc: '',
      args: [],
    );
  }

  /// `Advertisements`
  String get advertisements {
    return Intl.message(
      'Advertisements',
      name: 'advertisements',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Active Ads`
  String get active_ads {
    return Intl.message(
      'Active Ads',
      name: 'active_ads',
      desc: '',
      args: [],
    );
  }

  /// `Loading ads...`
  String get loading_ads {
    return Intl.message(
      'Loading ads...',
      name: 'loading_ads',
      desc: '',
      args: [],
    );
  }

  /// `No ads found`
  String get no_ads_found {
    return Intl.message(
      'No ads found',
      name: 'no_ads_found',
      desc: '',
      args: [],
    );
  }

  /// `Ad stop request sent. It will be stopped within 2 working hours.`
  String get stop_ad_request_sent {
    return Intl.message(
      'Ad stop request sent. It will be stopped within 2 working hours.',
      name: 'stop_ad_request_sent',
      desc: '',
      args: [],
    );
  }

  /// `Error loading ads: {error}`
  String error_loading_ads(Object error) {
    return Intl.message(
      'Error loading ads: $error',
      name: 'error_loading_ads',
      desc: '',
      args: [error],
    );
  }

  /// `Ad Details`
  String get ad_details {
    return Intl.message(
      'Ad Details',
      name: 'ad_details',
      desc: '',
      args: [],
    );
  }

  /// `Stop Ad Request`
  String get stop_ad_request {
    return Intl.message(
      'Stop Ad Request',
      name: 'stop_ad_request',
      desc: '',
      args: [],
    );
  }

  /// `Ad Results`
  String get ad_results {
    return Intl.message(
      'Ad Results',
      name: 'ad_results',
      desc: '',
      args: [],
    );
  }

  /// `Increase Ad`
  String get increase_ad {
    return Intl.message(
      'Increase Ad',
      name: 'increase_ad',
      desc: '',
      args: [],
    );
  }

  /// `Increase Budget`
  String get increase_budget {
    return Intl.message(
      'Increase Budget',
      name: 'increase_budget',
      desc: '',
      args: [],
    );
  }

  /// `Enter budget`
  String get enter_budget {
    return Intl.message(
      'Enter budget',
      name: 'enter_budget',
      desc: '',
      args: [],
    );
  }

  /// `Enter number of days`
  String get enter_days {
    return Intl.message(
      'Enter number of days',
      name: 'enter_days',
      desc: '',
      args: [],
    );
  }

  /// `Your current balance is {balance} EGP. Please recharge to continue the ad.`
  String budget_error_message(Object balance) {
    return Intl.message(
      'Your current balance is $balance EGP. Please recharge to continue the ad.',
      name: 'budget_error_message',
      desc: '',
      args: [balance],
    );
  }

  /// `The request to increase the ad by {budget} EGP and {days} days has been sent. It will be processed within 2 business hours.`
  String increase_request_sent(Object budget, Object days) {
    return Intl.message(
      'The request to increase the ad by $budget EGP and $days days has been sent. It will be processed within 2 business hours.',
      name: 'increase_request_sent',
      desc: '',
      args: [budget, days],
    );
  }

  /// `Facebook Ads`
  String get facebook_ads {
    return Intl.message(
      'Facebook Ads',
      name: 'facebook_ads',
      desc: '',
      args: [],
    );
  }

  /// `All Ads`
  String get all_ads {
    return Intl.message(
      'All Ads',
      name: 'all_ads',
      desc: '',
      args: [],
    );
  }

  /// `You can track the ad from the Ad Center.`
  String get ad_results_text {
    return Intl.message(
      'You can track the ad from the Ad Center.',
      name: 'ad_results_text',
      desc: '',
      args: [],
    );
  }

  /// `Stopped Ads`
  String get stopped_ads {
    return Intl.message(
      'Stopped Ads',
      name: 'stopped_ads',
      desc: '',
      args: [],
    );
  }

  /// `Platform`
  String get platform {
    return Intl.message(
      'Platform',
      name: 'platform',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message(
      'Age',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Budget`
  String get budget {
    return Intl.message(
      'Budget',
      name: 'budget',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get duration {
    return Intl.message(
      'Duration',
      name: 'duration',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Post Link`
  String get link_post {
    return Intl.message(
      'Post Link',
      name: 'link_post',
      desc: '',
      args: [],
    );
  }

  /// `Post Text`
  String get text_post {
    return Intl.message(
      'Post Text',
      name: 'text_post',
      desc: '',
      args: [],
    );
  }

  /// `Images`
  String get image_post {
    return Intl.message(
      'Images',
      name: 'image_post',
      desc: '',
      args: [],
    );
  }

  /// `View all advertisements`
  String get view_all_ads {
    return Intl.message(
      'View all advertisements',
      name: 'view_all_ads',
      desc: '',
      args: [],
    );
  }

  /// `Show Ads`
  String get show_ads {
    return Intl.message(
      'Show Ads',
      name: 'show_ads',
      desc: '',
      args: [],
    );
  }

  /// `Ad Number {adNumber}: {adName}`
  String ad_number(Object adNumber, Object adName) {
    return Intl.message(
      'Ad Number $adNumber: $adName',
      name: 'ad_number',
      desc: '',
      args: [adNumber, adName],
    );
  }

  /// `Ad Status: {status}`
  String ad_status(Object status) {
    return Intl.message(
      'Ad Status: $status',
      name: 'ad_status',
      desc: '',
      args: [status],
    );
  }

  /// `Resume Ad`
  String get resume_ad {
    return Intl.message(
      'Resume Ad',
      name: 'resume_ad',
      desc: '',
      args: [],
    );
  }

  /// `Provide Budget`
  String get provide_budget {
    return Intl.message(
      'Provide Budget',
      name: 'provide_budget',
      desc: '',
      args: [],
    );
  }

  /// `Provide Duration`
  String get provide_duration {
    return Intl.message(
      'Provide Duration',
      name: 'provide_duration',
      desc: '',
      args: [],
    );
  }

  /// `Enter Duration`
  String get enter_duration {
    return Intl.message(
      'Enter Duration',
      name: 'enter_duration',
      desc: '',
      args: [],
    );
  }

  /// `Please specify the amount and days`
  String get error_specify_amount_days {
    return Intl.message(
      'Please specify the amount and days',
      name: 'error_specify_amount_days',
      desc: '',
      args: [],
    );
  }

  /// `Your current balance is {balance} EGP. Please recharge to resume the ad.`
  String current_balance(Object balance) {
    return Intl.message(
      'Your current balance is $balance EGP. Please recharge to resume the ad.',
      name: 'current_balance',
      desc: '',
      args: [balance],
    );
  }

  /// `Ad successfully resumed`
  String get complete_ad_success {
    return Intl.message(
      'Ad successfully resumed',
      name: 'complete_ad_success',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while resuming the ad`
  String get complete_ad_error {
    return Intl.message(
      'An error occurred while resuming the ad',
      name: 'complete_ad_error',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while saving the customer request`
  String get customer_request_error {
    return Intl.message(
      'An error occurred while saving the customer request',
      name: 'customer_request_error',
      desc: '',
      args: [],
    );
  }

  /// `Age: From {ageFrom} to {ageTo}`
  String age_range(Object ageFrom, Object ageTo) {
    return Intl.message(
      'Age: From $ageFrom to $ageTo',
      name: 'age_range',
      desc: '',
      args: [ageFrom, ageTo],
    );
  }

  /// `Duration: {duration} days`
  String duration_days(Object duration) {
    return Intl.message(
      'Duration: $duration days',
      name: 'duration_days',
      desc: '',
      args: [duration],
    );
  }

  /// `Locations: {locations}`
  String locations(Object locations) {
    return Intl.message(
      'Locations: $locations',
      name: 'locations',
      desc: '',
      args: [locations],
    );
  }

  /// `Post: {link}`
  String post_link(Object link) {
    return Intl.message(
      'Post: $link',
      name: 'post_link',
      desc: '',
      args: [link],
    );
  }

  /// `Post: {text}`
  String post_text(Object text) {
    return Intl.message(
      'Post: $text',
      name: 'post_text',
      desc: '',
      args: [text],
    );
  }

  /// `Images: {images}`
  String post_images(Object images) {
    return Intl.message(
      'Images: $images',
      name: 'post_images',
      desc: '',
      args: [images],
    );
  }

  /// `Resume request sent successfully. Execution will take place within two working hours`
  String get resume_request_success {
    return Intl.message(
      'Resume request sent successfully. Execution will take place within two working hours',
      name: 'resume_request_success',
      desc: '',
      args: [],
    );
  }

  /// `New Request`
  String get new_request {
    return Intl.message(
      'New Request',
      name: 'new_request',
      desc: '',
      args: [],
    );
  }

  /// `Resume ad request with budget {budget} EGP and duration {duration} days`
  String request_note(Object budget, Object duration) {
    return Intl.message(
      'Resume ad request with budget $budget EGP and duration $duration days',
      name: 'request_note',
      desc: '',
      args: [budget, duration],
    );
  }

  /// `Ad Increase Request`
  String get request_status {
    return Intl.message(
      'Ad Increase Request',
      name: 'request_status',
      desc: '',
      args: [],
    );
  }

  /// `Email loaded: {email}`
  String email_loaded(Object email) {
    return Intl.message(
      'Email loaded: $email',
      name: 'email_loaded',
      desc: '',
      args: [email],
    );
  }

  /// `Ads loaded: {count}`
  String ads_loaded(Object count) {
    return Intl.message(
      'Ads loaded: $count',
      name: 'ads_loaded',
      desc: '',
      args: [count],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Age: from {ageFrom} to {ageTo}`
  String age_from_to(Object ageFrom, Object ageTo) {
    return Intl.message(
      'Age: from $ageFrom to $ageTo',
      name: 'age_from_to',
      desc: '',
      args: [ageFrom, ageTo],
    );
  }

  /// `Post`
  String get post {
    return Intl.message(
      'Post',
      name: 'post',
      desc: '',
      args: [],
    );
  }

  /// `Images`
  String get images {
    return Intl.message(
      'Images',
      name: 'images',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previous {
    return Intl.message(
      'Previous',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `No email found in SharedPreferences`
  String get error_message_no_email {
    return Intl.message(
      'No email found in SharedPreferences',
      name: 'error_message_no_email',
      desc: '',
      args: [],
    );
  }

  /// `Error loading user email`
  String get error_loading_email {
    return Intl.message(
      'Error loading user email',
      name: 'error_loading_email',
      desc: '',
      args: [],
    );
  }

  /// `Error loading user balance`
  String get error_loading_balance {
    return Intl.message(
      'Error loading user balance',
      name: 'error_loading_balance',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get wallet {
    return Intl.message(
      'Wallet',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `know_more`
  String get know_more {
    return Intl.message(
      'know_more',
      name: 'know_more',
      desc: '',
      args: [],
    );
  }

  /// `days`
  String get days {
    return Intl.message(
      'days',
      name: 'days',
      desc: '',
      args: [],
    );
  }

  /// `Edit Ad`
  String get edit_ad {
    return Intl.message(
      'Edit Ad',
      name: 'edit_ad',
      desc: '',
      args: [],
    );
  }

  /// `Request Targeting Change to Improve Results`
  String get request_targeting_change {
    return Intl.message(
      'Request Targeting Change to Improve Results',
      name: 'request_targeting_change',
      desc: '',
      args: [],
    );
  }

  /// `Targeting Change`
  String get targeting_change {
    return Intl.message(
      'Targeting Change',
      name: 'targeting_change',
      desc: '',
      args: [],
    );
  }

  /// `Using this request will put the ad into review mode. It should only be used if the ad results are poor.`
  String get targeting_change_note {
    return Intl.message(
      'Using this request will put the ad into review mode. It should only be used if the ad results are poor.',
      name: 'targeting_change_note',
      desc: '',
      args: [],
    );
  }

  /// `The targeting change request has been sent to the administration. Please follow the notifications.`
  String get targeting_change_sent {
    return Intl.message(
      'The targeting change request has been sent to the administration. Please follow the notifications.',
      name: 'targeting_change_sent',
      desc: '',
      args: [],
    );
  }

  /// `Other Edit`
  String get other_edit {
    return Intl.message(
      'Other Edit',
      name: 'other_edit',
      desc: '',
      args: [],
    );
  }

  /// `Please write the edits and notes you want`
  String get other_edit_prompt {
    return Intl.message(
      'Please write the edits and notes you want',
      name: 'other_edit_prompt',
      desc: '',
      args: [],
    );
  }

  /// `Enter your edits here...`
  String get enter_edit_details {
    return Intl.message(
      'Enter your edits here...',
      name: 'enter_edit_details',
      desc: '',
      args: [],
    );
  }

  /// `Edit the ad to`
  String get other_edit_note {
    return Intl.message(
      'Edit the ad to',
      name: 'other_edit_note',
      desc: '',
      args: [],
    );
  }

  /// `The edit request has been sent to the administration. Please follow the notifications.`
  String get edit_request_sent {
    return Intl.message(
      'The edit request has been sent to the administration. Please follow the notifications.',
      name: 'edit_request_sent',
      desc: '',
      args: [],
    );
  }

  /// `Please write the edits before sending the request.`
  String get enter_edit_details_error {
    return Intl.message(
      'Please write the edits before sending the request.',
      name: 'enter_edit_details_error',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Error: currentAdId not found in user document`
  String get current_ad_id_not_found {
    return Intl.message(
      'Error: currentAdId not found in user document',
      name: 'current_ad_id_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Error: user is null`
  String get user_is_null {
    return Intl.message(
      'Error: user is null',
      name: 'user_is_null',
      desc: '',
      args: [],
    );
  }

  /// `Edit Ad Duration and Budget`
  String get edit_duration_budget {
    return Intl.message(
      'Edit Ad Duration and Budget',
      name: 'edit_duration_budget',
      desc: '',
      args: [],
    );
  }

  /// `Set Ad Duration and Budget`
  String get set_duration_budget {
    return Intl.message(
      'Set Ad Duration and Budget',
      name: 'set_duration_budget',
      desc: '',
      args: [],
    );
  }

  /// `Ad Duration (days)`
  String get ad_duration_days {
    return Intl.message(
      'Ad Duration (days)',
      name: 'ad_duration_days',
      desc: '',
      args: [],
    );
  }

  /// `Ad Budget (EGP)`
  String get ad_budget_egp {
    return Intl.message(
      'Ad Budget (EGP)',
      name: 'ad_budget_egp',
      desc: '',
      args: [],
    );
  }

  /// `If you select a Google or YouTube ad, an additional 10% fee will be applied. The total amount to be deducted is {totalBudget} EGP.`
  String google_youtube_fee(Object totalBudget) {
    return Intl.message(
      'If you select a Google or YouTube ad, an additional 10% fee will be applied. The total amount to be deducted is $totalBudget EGP.',
      name: 'google_youtube_fee',
      desc: '',
      args: [totalBudget],
    );
  }

  /// `The minimum ad budget is 200 EGP *`
  String get min_budget_warning {
    return Intl.message(
      'The minimum ad budget is 200 EGP *',
      name: 'min_budget_warning',
      desc: '',
      args: [],
    );
  }

  /// `Your current balance is {currentBalance} EGP. Please top up to complete the ad.`
  String balance_warning(Object currentBalance) {
    return Intl.message(
      'Your current balance is $currentBalance EGP. Please top up to complete the ad.',
      name: 'balance_warning',
      desc: '',
      args: [currentBalance],
    );
  }

  /// `Ad Cost`
  String get ad_cost_transaction {
    return Intl.message(
      'Ad Cost',
      name: 'ad_cost_transaction',
      desc: '',
      args: [],
    );
  }

  /// `Select Video`
  String get select_video {
    return Intl.message(
      'Select Video',
      name: 'select_video',
      desc: '',
      args: [],
    );
  }

  /// `Regions`
  String get regions {
    return Intl.message(
      'Regions',
      name: 'regions',
      desc: '',
      args: [],
    );
  }

  /// `Please select target locations`
  String get please_select_target_locations {
    return Intl.message(
      'Please select target locations',
      name: 'please_select_target_locations',
      desc: '',
      args: [],
    );
  }

  /// `Post content selected`
  String get post_content_selected {
    return Intl.message(
      'Post content selected',
      name: 'post_content_selected',
      desc: '',
      args: [],
    );
  }

  /// `Select or Add`
  String get select_video_or_add {
    return Intl.message(
      'Select or Add',
      name: 'select_video_or_add',
      desc: '',
      args: [],
    );
  }

  /// `Transferred Amount`
  String get transferred_amount {
    return Intl.message(
      'Transferred Amount',
      name: 'transferred_amount',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number or Instapay`
  String get phone_or_instapay {
    return Intl.message(
      'Phone Number or Instapay',
      name: 'phone_or_instapay',
      desc: '',
      args: [],
    );
  }

  /// `Please attach a transfer receipt.`
  String get attachment_required {
    return Intl.message(
      'Please attach a transfer receipt.',
      name: 'attachment_required',
      desc: '',
      args: [],
    );
  }

  /// `Please transfer the exact amount without any excess or shortage for faster processing.`
  String get transfer_exact_amount_note {
    return Intl.message(
      'Please transfer the exact amount without any excess or shortage for faster processing.',
      name: 'transfer_exact_amount_note',
      desc: '',
      args: [],
    );
  }

  /// `Contact Ad`
  String get contact_ad {
    return Intl.message(
      'Contact Ad',
      name: 'contact_ad',
      desc: '',
      args: [],
    );
  }

  /// `This goal is used for contact ads`
  String get contact_note {
    return Intl.message(
      'This goal is used for contact ads',
      name: 'contact_note',
      desc: '',
      args: [],
    );
  }

  /// `Smart`
  String get smart {
    return Intl.message(
      'Smart',
      name: 'smart',
      desc: '',
      args: [],
    );
  }

  /// `Set Price`
  String get price {
    return Intl.message(
      'Set Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Notes: The call price is determined by daily competition, remains the first ad, and is approved quickly.`
  String get smart_note {
    return Intl.message(
      'Notes: The call price is determined by daily competition, remains the first ad, and is approved quickly.',
      name: 'smart_note',
      desc: '',
      args: [],
    );
  }

  /// `The price per call is determined and reviewed by Google within 48 hours.`
  String get price_note {
    return Intl.message(
      'The price per call is determined and reviewed by Google within 48 hours.',
      name: 'price_note',
      desc: '',
      args: [],
    );
  }

  /// `Set Call Price`
  String get set_price {
    return Intl.message(
      'Set Call Price',
      name: 'set_price',
      desc: '',
      args: [],
    );
  }

  /// `Please select ad type`
  String get select_ad_type {
    return Intl.message(
      'Please select ad type',
      name: 'select_ad_type',
      desc: '',
      args: [],
    );
  }

  /// `Select location`
  String get select_location {
    return Intl.message(
      'Select location',
      name: 'select_location',
      desc: '',
      args: [],
    );
  }

  /// `Select post`
  String get select_post {
    return Intl.message(
      'Select post',
      name: 'select_post',
      desc: '',
      args: [],
    );
  }

  /// `Post saved`
  String get ad_post_saved {
    return Intl.message(
      'Post saved',
      name: 'ad_post_saved',
      desc: '',
      args: [],
    );
  }

  /// `Run ad`
  String get run_ad {
    return Intl.message(
      'Run ad',
      name: 'run_ad',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number with country code`
  String get enter_phone {
    return Intl.message(
      'Please enter your phone number with country code',
      name: 'enter_phone',
      desc: '',
      args: [],
    );
  }

  /// `Saved phone`
  String get saved_phone {
    return Intl.message(
      'Saved phone',
      name: 'saved_phone',
      desc: '',
      args: [],
    );
  }

  /// `Select Ad Goal`
  String get select_ad_goal {
    return Intl.message(
      'Select Ad Goal',
      name: 'select_ad_goal',
      desc: '',
      args: [],
    );
  }

  /// `Exclude Area`
  String get exclude_area {
    return Intl.message(
      'Exclude Area',
      name: 'exclude_area',
      desc: '',
      args: [],
    );
  }

  /// `Enter the area to exclude`
  String get enter_exclude_area {
    return Intl.message(
      'Enter the area to exclude',
      name: 'enter_exclude_area',
      desc: '',
      args: [],
    );
  }

  /// `Excluded Areas`
  String get excluded_areas {
    return Intl.message(
      'Excluded Areas',
      name: 'excluded_areas',
      desc: '',
      args: [],
    );
  }

  /// `Your request has been submitted for review, and funds will be added within two working hours. Please check your balance.`
  String get funds_will_be_added {
    return Intl.message(
      'Your request has been submitted for review, and funds will be added within two working hours. Please check your balance.',
      name: 'funds_will_be_added',
      desc: '',
      args: [],
    );
  }

  /// `Your request to add funds is in progress.`
  String get funds_request_in_progress {
    return Intl.message(
      'Your request to add funds is in progress.',
      name: 'funds_request_in_progress',
      desc: '',
      args: [],
    );
  }

  /// `AM`
  String get am {
    return Intl.message(
      'AM',
      name: 'am',
      desc: '',
      args: [],
    );
  }

  /// `PM`
  String get pm {
    return Intl.message(
      'PM',
      name: 'pm',
      desc: '',
      args: [],
    );
  }

  /// `Activate Ad`
  String get activate_ad {
    return Intl.message(
      'Activate Ad',
      name: 'activate_ad',
      desc: '',
      args: [],
    );
  }

  /// `A request has been sent to the admin to reactivate the ad with the remaining budget`
  String get activate_ad_request_sent {
    return Intl.message(
      'A request has been sent to the admin to reactivate the ad with the remaining budget',
      name: 'activate_ad_request_sent',
      desc: '',
      args: [],
    );
  }

  /// `You can only refund the money that was charged without coupons`
  String get refund_policy {
    return Intl.message(
      'You can only refund the money that was charged without coupons',
      name: 'refund_policy',
      desc: '',
      args: [],
    );
  }

  /// `Your refund request has been submitted`
  String get refund_request_submitted {
    return Intl.message(
      'Your refund request has been submitted',
      name: 'refund_request_submitted',
      desc: '',
      args: [],
    );
  }

  /// `This phone number is already registered`
  String get phone_already_registered {
    return Intl.message(
      'This phone number is already registered',
      name: 'phone_already_registered',
      desc: '',
      args: [],
    );
  }

  /// `What are the working hours and what is the company's address and location?`
  String get faq_question_9 {
    return Intl.message(
      'What are the working hours and what is the company\'s address and location?',
      name: 'faq_question_9',
      desc: '',
      args: [],
    );
  }

  /// `Official working hours\nFrom 10:00 AM to 2:00 AM after midnight\n\nCompany address\nBuilding 7 (Beam), Rukn El Safa, from Khaled Amin, from El Ahram Street, Giza, 9th floor - in front of the elevator\n\nLocation\n[Click here](https://goo.gl/maps/hPNEgJBsGTVYFf7g8)`
  String get faq_answer_9 {
    return Intl.message(
      'Official working hours\nFrom 10:00 AM to 2:00 AM after midnight\n\nCompany address\nBuilding 7 (Beam), Rukn El Safa, from Khaled Amin, from El Ahram Street, Giza, 9th floor - in front of the elevator\n\nLocation\n[Click here](https://goo.gl/maps/hPNEgJBsGTVYFf7g8)',
      name: 'faq_answer_9',
      desc: '',
      args: [],
    );
  }

  /// `WhatsApp Number`
  String get whatsapp_number {
    return Intl.message(
      'WhatsApp Number',
      name: 'whatsapp_number',
      desc: '',
      args: [],
    );
  }

  /// `Saved WhatsApp Number`
  String get saved_whatsapp_number {
    return Intl.message(
      'Saved WhatsApp Number',
      name: 'saved_whatsapp_number',
      desc: '',
      args: [],
    );
  }

  /// `Copy Confirmation`
  String get copy_confirmation {
    return Intl.message(
      'Copy Confirmation',
      name: 'copy_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Email address copied to clipboard: `
  String get email_copied {
    return Intl.message(
      'Email address copied to clipboard: ',
      name: 'email_copied',
      desc: '',
      args: [],
    );
  }

  /// `Official Email`
  String get official_email {
    return Intl.message(
      'Official Email',
      name: 'official_email',
      desc: '',
      args: [],
    );
  }

  /// `Database Email`
  String get database_email {
    return Intl.message(
      'Database Email',
      name: 'database_email',
      desc: '',
      args: [],
    );
  }

  /// `Post Link`
  String get postLink {
    return Intl.message(
      'Post Link',
      name: 'postLink',
      desc: '',
      args: [],
    );
  }

  /// `Page Link`
  String get pageLink {
    return Intl.message(
      'Page Link',
      name: 'pageLink',
      desc: '',
      args: [],
    );
  }

  /// `Ad Code`
  String get adCode {
    return Intl.message(
      'Ad Code',
      name: 'adCode',
      desc: '',
      args: [],
    );
  }

  /// `Selected Option`
  String get selectedOption {
    return Intl.message(
      'Selected Option',
      name: 'selectedOption',
      desc: '',
      args: [],
    );
  }

  /// `Selected Platform`
  String get selectedPlatform {
    return Intl.message(
      'Selected Platform',
      name: 'selectedPlatform',
      desc: '',
      args: [],
    );
  }

  /// `Image URLs`
  String get imageUrls {
    return Intl.message(
      'Image URLs',
      name: 'imageUrls',
      desc: '',
      args: [],
    );
  }

  /// `Image Names`
  String get imageNames {
    return Intl.message(
      'Image Names',
      name: 'imageNames',
      desc: '',
      args: [],
    );
  }

  /// `Post Content`
  String get postContent {
    return Intl.message(
      'Post Content',
      name: 'postContent',
      desc: '',
      args: [],
    );
  }

  /// `Upload Status`
  String get uploadStatus {
    return Intl.message(
      'Upload Status',
      name: 'uploadStatus',
      desc: '',
      args: [],
    );
  }

  /// `Remove Image`
  String get removeImage {
    return Intl.message(
      'Remove Image',
      name: 'removeImage',
      desc: '',
      args: [],
    );
  }

  /// `Video Link`
  String get videoLink {
    return Intl.message(
      'Video Link',
      name: 'videoLink',
      desc: '',
      args: [],
    );
  }

  /// `Create New Post`
  String get createNewPost {
    return Intl.message(
      'Create New Post',
      name: 'createNewPost',
      desc: '',
      args: [],
    );
  }

  /// `If you choose an Instagram ad, the post must be linked to a Facebook page to create the ad.`
  String get instagramAdInfo {
    return Intl.message(
      'If you choose an Instagram ad, the post must be linked to a Facebook page to create the ad.',
      name: 'instagramAdInfo',
      desc: '',
      args: [],
    );
  }

  /// `If you choose a Facebook and Instagram ad, make sure the Facebook page is linked to Instagram.\nIf there is no link between Facebook and Instagram, the ad will only be created on Facebook.`
  String get facebookAndInstagramAdInfo {
    return Intl.message(
      'If you choose a Facebook and Instagram ad, make sure the Facebook page is linked to Instagram.\nIf there is no link between Facebook and Instagram, the ad will only be created on Facebook.',
      name: 'facebookAndInstagramAdInfo',
      desc: '',
      args: [],
    );
  }

  /// `If you choose a TikTok ad, you must enter the ad code.`
  String get tiktokAdInfo {
    return Intl.message(
      'If you choose a TikTok ad, you must enter the ad code.',
      name: 'tiktokAdInfo',
      desc: '',
      args: [],
    );
  }

  /// `Current Ad Code`
  String get currentAdCode {
    return Intl.message(
      'Current Ad Code',
      name: 'currentAdCode',
      desc: '',
      args: [],
    );
  }

  /// `How to get the ad code`
  String get adCodeInfo {
    return Intl.message(
      'How to get the ad code',
      name: 'adCodeInfo',
      desc: '',
      args: [],
    );
  }

  /// `Link copied`
  String get linkCopied {
    return Intl.message(
      'Link copied',
      name: 'linkCopied',
      desc: '',
      args: [],
    );
  }

  /// `Current page link`
  String get currentPageLink {
    return Intl.message(
      'Current page link',
      name: 'currentPageLink',
      desc: '',
      args: [],
    );
  }

  /// `Enter post content here...`
  String get enterPostContent {
    return Intl.message(
      'Enter post content here...',
      name: 'enterPostContent',
      desc: '',
      args: [],
    );
  }

  /// `Select post images (you can choose one or more images up to 10 images)`
  String get selectImages {
    return Intl.message(
      'Select post images (you can choose one or more images up to 10 images)',
      name: 'selectImages',
      desc: '',
      args: [],
    );
  }

  /// `Facebook & Instagram`
  String get facebookAndInstagram {
    return Intl.message(
      'Facebook & Instagram',
      name: 'facebookAndInstagram',
      desc: '',
      args: [],
    );
  }

  /// `Update Available`
  String get update_available_title {
    return Intl.message(
      'Update Available',
      name: 'update_available_title',
      desc: '',
      args: [],
    );
  }

  /// `A new version of the app is available. Please update it now.`
  String get update_available_message {
    return Intl.message(
      'A new version of the app is available. Please update it now.',
      name: 'update_available_message',
      desc: '',
      args: [],
    );
  }

  /// `Later`
  String get later {
    return Intl.message(
      'Later',
      name: 'later',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update_button {
    return Intl.message(
      'Update',
      name: 'update_button',
      desc: '',
      args: [],
    );
  }

  /// `Later`
  String get later_button {
    return Intl.message(
      'Later',
      name: 'later_button',
      desc: '',
      args: [],
    );
  }

  /// `How to promote someone to admin or editor?`
  String get faq_question_10 {
    return Intl.message(
      'How to promote someone to admin or editor?',
      name: 'faq_question_10',
      desc: '',
      args: [],
    );
  }

  /// `How to get the TikTok ad code?`
  String get faq_question_11 {
    return Intl.message(
      'How to get the TikTok ad code?',
      name: 'faq_question_11',
      desc: '',
      args: [],
    );
  }

  /// `Is there a video tutorial available?`
  String get faq_question_12 {
    return Intl.message(
      'Is there a video tutorial available?',
      name: 'faq_question_12',
      desc: '',
      args: [],
    );
  }

  /// `total`
  String get total {
    return Intl.message(
      'total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `administration`
  String get administration_0_percent {
    return Intl.message(
      'administration',
      name: 'administration_0_percent',
      desc: '',
      args: [],
    );
  }

  /// `administration`
  String get administration_15_percent {
    return Intl.message(
      'administration',
      name: 'administration_15_percent',
      desc: '',
      args: [],
    );
  }

  /// `details`
  String get details {
    return Intl.message(
      'details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Previous Requests`
  String get previous_requests {
    return Intl.message(
      'Previous Requests',
      name: 'previous_requests',
      desc: '',
      args: [],
    );
  }

  /// `professional video`
  String get professional_video {
    return Intl.message(
      'professional video',
      name: 'professional_video',
      desc: '',
      args: [],
    );
  }

  /// `video creation`
  String get video_creation {
    return Intl.message(
      'video creation',
      name: 'video_creation',
      desc: '',
      args: [],
    );
  }

  /// `tiktok followers`
  String get tiktok_followers {
    return Intl.message(
      'tiktok followers',
      name: 'tiktok_followers',
      desc: '',
      args: [],
    );
  }

  /// `real engaged people via ads`
  String get real_engaged_people_via_ads {
    return Intl.message(
      'real engaged people via ads',
      name: 'real_engaged_people_via_ads',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
