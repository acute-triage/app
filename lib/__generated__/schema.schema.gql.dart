// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_starter/__generated__/serializers.gql.dart' as _i1;
import 'package:gql_code_builder/src/serializers/default_scalar_serializer.dart'
    as _i2;

part 'schema.schema.gql.g.dart';

class GappFeature extends EnumClass {
  const GappFeature._(String name) : super(name);

  static const GappFeature INSTAGRAM_IMAGE_PICKER =
      _$gappFeatureINSTAGRAM_IMAGE_PICKER;

  static const GappFeature PAYWALL = _$gappFeaturePAYWALL;

  static const GappFeature MY_TYPE_FILTER = _$gappFeatureMY_TYPE_FILTER;

  static const GappFeature BOOST = _$gappFeatureBOOST;

  static const GappFeature PHOTO_TEST = _$gappFeaturePHOTO_TEST;

  static const GappFeature SWR = _$gappFeatureSWR;

  static const GappFeature COMPLIMENT_REACTIONS =
      _$gappFeatureCOMPLIMENT_REACTIONS;

  static const GappFeature READ_RECEIPTS = _$gappFeatureREAD_RECEIPTS;

  static const GappFeature CHAT_LINKS = _$gappFeatureCHAT_LINKS;

  static Serializer<GappFeature> get serializer => _$gappFeatureSerializer;

  static BuiltSet<GappFeature> get values => _$gappFeatureValues;

  static GappFeature valueOf(String name) => _$gappFeatureValueOf(name);
}

abstract class GAutoCompleteAddressInput
    implements
        Built<GAutoCompleteAddressInput, GAutoCompleteAddressInputBuilder> {
  GAutoCompleteAddressInput._();

  factory GAutoCompleteAddressInput(
          [void Function(GAutoCompleteAddressInputBuilder b) updates]) =
      _$GAutoCompleteAddressInput;

  String? get streetName;
  String? get streetNumber;
  String? get city;
  String? get postalCode;
  String? get formatted;
  String? get neighborhood;
  String? get countryCodeISO3;
  double? get latitude;
  double? get longitude;
  static Serializer<GAutoCompleteAddressInput> get serializer =>
      _$gAutoCompleteAddressInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAutoCompleteAddressInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAutoCompleteAddressInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAutoCompleteAddressInput.serializer,
        json,
      );
}

abstract class GCanChangeProfileFieldArg
    implements
        Built<GCanChangeProfileFieldArg, GCanChangeProfileFieldArgBuilder> {
  GCanChangeProfileFieldArg._();

  factory GCanChangeProfileFieldArg(
          [void Function(GCanChangeProfileFieldArgBuilder b) updates]) =
      _$GCanChangeProfileFieldArg;

  GrestrictedProfileField get field;
  static Serializer<GCanChangeProfileFieldArg> get serializer =>
      _$gCanChangeProfileFieldArgSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCanChangeProfileFieldArg.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCanChangeProfileFieldArg? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCanChangeProfileFieldArg.serializer,
        json,
      );
}

abstract class GCandidateStatsInput
    implements Built<GCandidateStatsInput, GCandidateStatsInputBuilder> {
  GCandidateStatsInput._();

  factory GCandidateStatsInput(
          [void Function(GCandidateStatsInputBuilder b) updates]) =
      _$GCandidateStatsInput;

  String? get id;
  String? get candidateUserId;
  GcandidateStatsType? get type;
  String? get firstImageId;
  String? get lastSeenImageId;
  String? get mostSeenImageId;
  String? get longestSeenImageId;
  double? get longestSeenImageSeconds;
  double? get imagesCount;
  double? get imagesSeen;
  double? get imagesSwiped;
  double? get secondsSeen;
  double? get undos;
  bool? get like;
  GJSON? get data;
  static Serializer<GCandidateStatsInput> get serializer =>
      _$gCandidateStatsInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCandidateStatsInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCandidateStatsInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCandidateStatsInput.serializer,
        json,
      );
}

class GcandidateStatsType extends EnumClass {
  const GcandidateStatsType._(String name) : super(name);

  static const GcandidateStatsType SWIPE_DECK = _$gcandidateStatsTypeSWIPE_DECK;

  static const GcandidateStatsType PROFILE_CARD =
      _$gcandidateStatsTypePROFILE_CARD;

  static const GcandidateStatsType UNLOCK_DOUBBLE_MATCH =
      _$gcandidateStatsTypeUNLOCK_DOUBBLE_MATCH;

  static Serializer<GcandidateStatsType> get serializer =>
      _$gcandidateStatsTypeSerializer;

  static BuiltSet<GcandidateStatsType> get values =>
      _$gcandidateStatsTypeValues;

  static GcandidateStatsType valueOf(String name) =>
      _$gcandidateStatsTypeValueOf(name);
}

class GchatUserStatus extends EnumClass {
  const GchatUserStatus._(String name) : super(name);

  static const GchatUserStatus ACCEPTED = _$gchatUserStatusACCEPTED;

  static const GchatUserStatus PENDING = _$gchatUserStatusPENDING;

  static const GchatUserStatus IGNORED = _$gchatUserStatusIGNORED;

  static Serializer<GchatUserStatus> get serializer =>
      _$gchatUserStatusSerializer;

  static BuiltSet<GchatUserStatus> get values => _$gchatUserStatusValues;

  static GchatUserStatus valueOf(String name) => _$gchatUserStatusValueOf(name);
}

class GcomplimentType extends EnumClass {
  const GcomplimentType._(String name) : super(name);

  static const GcomplimentType MORE_FRIENDS = _$gcomplimentTypeMORE_FRIENDS;

  static const GcomplimentType FUN_WITH_FRIENDS =
      _$gcomplimentTypeFUN_WITH_FRIENDS;

  static Serializer<GcomplimentType> get serializer =>
      _$gcomplimentTypeSerializer;

  static BuiltSet<GcomplimentType> get values => _$gcomplimentTypeValues;

  static GcomplimentType valueOf(String name) => _$gcomplimentTypeValueOf(name);
}

class GconsumableItemTrigger extends EnumClass {
  const GconsumableItemTrigger._(String name) : super(name);

  static const GconsumableItemTrigger SUBSCRIPTION =
      _$gconsumableItemTriggerSUBSCRIPTION;

  static const GconsumableItemTrigger PURCHASE =
      _$gconsumableItemTriggerPURCHASE;

  static const GconsumableItemTrigger PURCHASE_BONUS =
      _$gconsumableItemTriggerPURCHASE_BONUS;

  static const GconsumableItemTrigger REWARD = _$gconsumableItemTriggerREWARD;

  static const GconsumableItemTrigger GIFT = _$gconsumableItemTriggerGIFT;

  static Serializer<GconsumableItemTrigger> get serializer =>
      _$gconsumableItemTriggerSerializer;

  static BuiltSet<GconsumableItemTrigger> get values =>
      _$gconsumableItemTriggerValues;

  static GconsumableItemTrigger valueOf(String name) =>
      _$gconsumableItemTriggerValueOf(name);
}

class GconsumableItemType extends EnumClass {
  const GconsumableItemType._(String name) : super(name);

  static const GconsumableItemType BOOST = _$gconsumableItemTypeBOOST;

  static const GconsumableItemType GIFTABLE_JOINABLE_BOOST =
      _$gconsumableItemTypeGIFTABLE_JOINABLE_BOOST;

  static const GconsumableItemType JOINABLE_BOOST =
      _$gconsumableItemTypeJOINABLE_BOOST;

  static const GconsumableItemType SUPER_COMPLIMENT =
      _$gconsumableItemTypeSUPER_COMPLIMENT;

  static const GconsumableItemType PRIORITY_MESSAGE =
      _$gconsumableItemTypePRIORITY_MESSAGE;

  static const GconsumableItemType PHOTO_TEST = _$gconsumableItemTypePHOTO_TEST;

  static Serializer<GconsumableItemType> get serializer =>
      _$gconsumableItemTypeSerializer;

  static BuiltSet<GconsumableItemType> get values =>
      _$gconsumableItemTypeValues;

  static GconsumableItemType valueOf(String name) =>
      _$gconsumableItemTypeValueOf(name);
}

abstract class GCreatePlaceInput
    implements Built<GCreatePlaceInput, GCreatePlaceInputBuilder> {
  GCreatePlaceInput._();

  factory GCreatePlaceInput(
          [void Function(GCreatePlaceInputBuilder b) updates]) =
      _$GCreatePlaceInput;

  String get name;
  String get category;
  String? get base64Image;
  String? get phoneNumber;
  GAutoCompleteAddressInput get address;
  static Serializer<GCreatePlaceInput> get serializer =>
      _$gCreatePlaceInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreatePlaceInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreatePlaceInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreatePlaceInput.serializer,
        json,
      );
}

abstract class GDateTime implements Built<GDateTime, GDateTimeBuilder> {
  GDateTime._();

  factory GDateTime([String? value]) =>
      _$GDateTime((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDateTime> get serializer =>
      _i2.DefaultScalarSerializer<GDateTime>(
          (Object serialized) => GDateTime((serialized as String?)));
}

abstract class GDatingProfileInfoInput
    implements Built<GDatingProfileInfoInput, GDatingProfileInfoInputBuilder> {
  GDatingProfileInfoInput._();

  factory GDatingProfileInfoInput(
          [void Function(GDatingProfileInfoInputBuilder b) updates]) =
      _$GDatingProfileInfoInput;

  String? get name;
  Ggender? get gender;
  BuiltList<Ggender>? get sexualOrientations;
  GDateTime? get birthDate;
  String? get bio;
  String? get occupation;
  String? get school;
  double? get maxSuggestionDistance;
  int? get maxSuggestionAge;
  int? get minSuggestionAge;
  int? get height;
  GAutoCompleteAddressInput? get city;
  double? get algorithm;
  Glocales? get language;
  String? get username;
  String? get email;
  String? get phone;
  BuiltList<String>? get profileImageUrls;
  bool? get matchingActive;
  bool? get public;
  BuiltList<String>? get interests;
  BuiltList<String>? get compliments;
  GinboxPreference? get inboxPreference;
  bool? get incognito;
  static Serializer<GDatingProfileInfoInput> get serializer =>
      _$gDatingProfileInfoInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDatingProfileInfoInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDatingProfileInfoInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDatingProfileInfoInput.serializer,
        json,
      );
}

abstract class GDeleteProfileInput
    implements Built<GDeleteProfileInput, GDeleteProfileInputBuilder> {
  GDeleteProfileInput._();

  factory GDeleteProfileInput(
          [void Function(GDeleteProfileInputBuilder b) updates]) =
      _$GDeleteProfileInput;

  String get profileId;
  bool get delayed;
  static Serializer<GDeleteProfileInput> get serializer =>
      _$gDeleteProfileInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteProfileInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDeleteProfileInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteProfileInput.serializer,
        json,
      );
}

abstract class GEditPlaceInput
    implements Built<GEditPlaceInput, GEditPlaceInputBuilder> {
  GEditPlaceInput._();

  factory GEditPlaceInput([void Function(GEditPlaceInputBuilder b) updates]) =
      _$GEditPlaceInput;

  String get id;
  String? get name;
  String? get category;
  String? get base64Image;
  String? get phoneNumber;
  GAutoCompleteAddressInput? get address;
  static Serializer<GEditPlaceInput> get serializer =>
      _$gEditPlaceInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GEditPlaceInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GEditPlaceInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GEditPlaceInput.serializer,
        json,
      );
}

class GFeedbackType extends EnumClass {
  const GFeedbackType._(String name) : super(name);

  static const GFeedbackType FEEDBACK = _$gFeedbackTypeFEEDBACK;

  static const GFeedbackType DELETING_PROFILE = _$gFeedbackTypeDELETING_PROFILE;

  static const GFeedbackType DEACTIVATED_PROFILE =
      _$gFeedbackTypeDEACTIVATED_PROFILE;

  static Serializer<GFeedbackType> get serializer => _$gFeedbackTypeSerializer;

  static BuiltSet<GFeedbackType> get values => _$gFeedbackTypeValues;

  static GFeedbackType valueOf(String name) => _$gFeedbackTypeValueOf(name);
}

class Gfilter extends EnumClass {
  const Gfilter._(String name) : super(name);

  static const Gfilter FOR_YOU = _$gfilterFOR_YOU;

  static const Gfilter MY_TYPE = _$gfilterMY_TYPE;

  static const Gfilter ACTIVE_TODAY = _$gfilterACTIVE_TODAY;

  static const Gfilter NEARBY = _$gfilterNEARBY;

  static Serializer<Gfilter> get serializer => _$gfilterSerializer;

  static BuiltSet<Gfilter> get values => _$gfilterValues;

  static Gfilter valueOf(String name) => _$gfilterValueOf(name);
}

class Ggender extends EnumClass {
  const Ggender._(String name) : super(name);

  static const Ggender MALE = _$ggenderMALE;

  static const Ggender FEMALE = _$ggenderFEMALE;

  static const Ggender NON_BINARY = _$ggenderNON_BINARY;

  static const Ggender Male = _$ggenderMale;

  static const Ggender Female = _$ggenderFemale;

  static const Ggender NonBinary = _$ggenderNonBinary;

  static Serializer<Ggender> get serializer => _$ggenderSerializer;

  static BuiltSet<Ggender> get values => _$ggenderValues;

  static Ggender valueOf(String name) => _$ggenderValueOf(name);
}

abstract class GGetSuspensionsInput
    implements Built<GGetSuspensionsInput, GGetSuspensionsInputBuilder> {
  GGetSuspensionsInput._();

  factory GGetSuspensionsInput(
          [void Function(GGetSuspensionsInputBuilder b) updates]) =
      _$GGetSuspensionsInput;

  String get userId;
  String get phoneNumber;
  static Serializer<GGetSuspensionsInput> get serializer =>
      _$gGetSuspensionsInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetSuspensionsInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetSuspensionsInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetSuspensionsInput.serializer,
        json,
      );
}

class GinboxPreference extends EnumClass {
  const GinboxPreference._(String name) : super(name);

  static const GinboxPreference DIRECT = _$ginboxPreferenceDIRECT;

  static const GinboxPreference REQUEST = _$ginboxPreferenceREQUEST;

  static Serializer<GinboxPreference> get serializer =>
      _$ginboxPreferenceSerializer;

  static BuiltSet<GinboxPreference> get values => _$ginboxPreferenceValues;

  static GinboxPreference valueOf(String name) =>
      _$ginboxPreferenceValueOf(name);
}

class GinviteResponse extends EnumClass {
  const GinviteResponse._(String name) : super(name);

  static const GinviteResponse Reject = _$ginviteResponseReject;

  static const GinviteResponse Accept = _$ginviteResponseAccept;

  static Serializer<GinviteResponse> get serializer =>
      _$ginviteResponseSerializer;

  static BuiltSet<GinviteResponse> get values => _$ginviteResponseValues;

  static GinviteResponse valueOf(String name) => _$ginviteResponseValueOf(name);
}

abstract class GJSON implements Built<GJSON, GJSONBuilder> {
  GJSON._();

  factory GJSON([String? value]) =>
      _$GJSON((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GJSON> get serializer => _i2.DefaultScalarSerializer<GJSON>(
      (Object serialized) => GJSON((serialized as String?)));
}

class GlikedMeType extends EnumClass {
  const GlikedMeType._(String name) : super(name);

  static const GlikedMeType ALL = _$glikedMeTypeALL;

  static const GlikedMeType NEW = _$glikedMeTypeNEW;

  static const GlikedMeType DISLIKED = _$glikedMeTypeDISLIKED;

  static Serializer<GlikedMeType> get serializer => _$glikedMeTypeSerializer;

  static BuiltSet<GlikedMeType> get values => _$glikedMeTypeValues;

  static GlikedMeType valueOf(String name) => _$glikedMeTypeValueOf(name);
}

class Glocales extends EnumClass {
  const Glocales._(String name) : super(name);

  static const Glocales DA = _$glocalesDA;

  static const Glocales EN = _$glocalesEN;

  static const Glocales SV = _$glocalesSV;

  static const Glocales NO = _$glocalesNO;

  static const Glocales NL = _$glocalesNL;

  static const Glocales da = _$glocalesda;

  static const Glocales en = _$glocalesen;

  static const Glocales sv = _$glocalessv;

  static const Glocales no = _$glocalesno;

  static const Glocales nl = _$glocalesnl;

  static Serializer<Glocales> get serializer => _$glocalesSerializer;

  static BuiltSet<Glocales> get values => _$glocalesValues;

  static Glocales valueOf(String name) => _$glocalesValueOf(name);
}

abstract class GLogoutInput
    implements Built<GLogoutInput, GLogoutInputBuilder> {
  GLogoutInput._();

  factory GLogoutInput([void Function(GLogoutInputBuilder b) updates]) =
      _$GLogoutInput;

  String get refreshToken;
  static Serializer<GLogoutInput> get serializer => _$gLogoutInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GLogoutInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GLogoutInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GLogoutInput.serializer,
        json,
      );
}

class GmessageAttachmentKind extends EnumClass {
  const GmessageAttachmentKind._(String name) : super(name);

  static const GmessageAttachmentKind REACTION =
      _$gmessageAttachmentKindREACTION;

  static const GmessageAttachmentKind REPLY = _$gmessageAttachmentKindREPLY;

  static const GmessageAttachmentKind CONTEXT = _$gmessageAttachmentKindCONTEXT;

  static const GmessageAttachmentKind PROFILE = _$gmessageAttachmentKindPROFILE;

  static const GmessageAttachmentKind PROFILE_SWIPE =
      _$gmessageAttachmentKindPROFILE_SWIPE;

  static const GmessageAttachmentKind IMAGE = _$gmessageAttachmentKindIMAGE;

  static const GmessageAttachmentKind GIF = _$gmessageAttachmentKindGIF;

  static const GmessageAttachmentKind VIDEO = _$gmessageAttachmentKindVIDEO;

  static const GmessageAttachmentKind AUDIO = _$gmessageAttachmentKindAUDIO;

  static const GmessageAttachmentKind FILE = _$gmessageAttachmentKindFILE;

  static const GmessageAttachmentKind COMPLIMENT =
      _$gmessageAttachmentKindCOMPLIMENT;

  static Serializer<GmessageAttachmentKind> get serializer =>
      _$gmessageAttachmentKindSerializer;

  static BuiltSet<GmessageAttachmentKind> get values =>
      _$gmessageAttachmentKindValues;

  static GmessageAttachmentKind valueOf(String name) =>
      _$gmessageAttachmentKindValueOf(name);
}

abstract class GNotificationOptionInput
    implements
        Built<GNotificationOptionInput, GNotificationOptionInputBuilder> {
  GNotificationOptionInput._();

  factory GNotificationOptionInput(
          [void Function(GNotificationOptionInputBuilder b) updates]) =
      _$GNotificationOptionInput;

  bool get allowed;
  String get type;
  static Serializer<GNotificationOptionInput> get serializer =>
      _$gNotificationOptionInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GNotificationOptionInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GNotificationOptionInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GNotificationOptionInput.serializer,
        json,
      );
}

class GPhotoTestStatus extends EnumClass {
  const GPhotoTestStatus._(String name) : super(name);

  static const GPhotoTestStatus PENDING = _$gPhotoTestStatusPENDING;

  static const GPhotoTestStatus IN_PROGRESS = _$gPhotoTestStatusIN_PROGRESS;

  static const GPhotoTestStatus COMPLETED = _$gPhotoTestStatusCOMPLETED;

  static const GPhotoTestStatus FAILED = _$gPhotoTestStatusFAILED;

  static const GPhotoTestStatus REVEALED = _$gPhotoTestStatusREVEALED;

  static Serializer<GPhotoTestStatus> get serializer =>
      _$gPhotoTestStatusSerializer;

  static BuiltSet<GPhotoTestStatus> get values => _$gPhotoTestStatusValues;

  static GPhotoTestStatus valueOf(String name) =>
      _$gPhotoTestStatusValueOf(name);
}

abstract class GPlaceSuggestionInput
    implements Built<GPlaceSuggestionInput, GPlaceSuggestionInputBuilder> {
  GPlaceSuggestionInput._();

  factory GPlaceSuggestionInput(
          [void Function(GPlaceSuggestionInputBuilder b) updates]) =
      _$GPlaceSuggestionInput;

  String get text;
  static Serializer<GPlaceSuggestionInput> get serializer =>
      _$gPlaceSuggestionInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPlaceSuggestionInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPlaceSuggestionInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPlaceSuggestionInput.serializer,
        json,
      );
}

abstract class GPollUserData
    implements Built<GPollUserData, GPollUserDataBuilder> {
  GPollUserData._();

  factory GPollUserData([void Function(GPollUserDataBuilder b) updates]) =
      _$GPollUserData;

  String get id;
  GpollUserRelation get relation;
  static Serializer<GPollUserData> get serializer => _$gPollUserDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPollUserData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPollUserData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPollUserData.serializer,
        json,
      );
}

class GpollUserRelation extends EnumClass {
  const GpollUserRelation._(String name) : super(name);

  static const GpollUserRelation FRIEND = _$gpollUserRelationFRIEND;

  static const GpollUserRelation FRIEND_SUGGESTION =
      _$gpollUserRelationFRIEND_SUGGESTION;

  static const GpollUserRelation INVITEABLE_CONTACT =
      _$gpollUserRelationINVITEABLE_CONTACT;

  static Serializer<GpollUserRelation> get serializer =>
      _$gpollUserRelationSerializer;

  static BuiltSet<GpollUserRelation> get values => _$gpollUserRelationValues;

  static GpollUserRelation valueOf(String name) =>
      _$gpollUserRelationValueOf(name);
}

class GpremiumEntitlement extends EnumClass {
  const GpremiumEntitlement._(String name) : super(name);

  static const GpremiumEntitlement UNDO = _$gpremiumEntitlementUNDO;

  static const GpremiumEntitlement UNLIMITED_LIKES =
      _$gpremiumEntitlementUNLIMITED_LIKES;

  static const GpremiumEntitlement MATCH_CHAT = _$gpremiumEntitlementMATCH_CHAT;

  static const GpremiumEntitlement LIKED_ME = _$gpremiumEntitlementLIKED_ME;

  static const GpremiumEntitlement PRIORITY_LIKES =
      _$gpremiumEntitlementPRIORITY_LIKES;

  static const GpremiumEntitlement FILTERS = _$gpremiumEntitlementFILTERS;

  static const GpremiumEntitlement INCOGNITO = _$gpremiumEntitlementINCOGNITO;

  static const GpremiumEntitlement WEEKLY_FREE_BOOST =
      _$gpremiumEntitlementWEEKLY_FREE_BOOST;

  static const GpremiumEntitlement WEEKLY_FREE_PHOTO_TEST =
      _$gpremiumEntitlementWEEKLY_FREE_PHOTO_TEST;

  static const GpremiumEntitlement READ_RECEIPTS =
      _$gpremiumEntitlementREAD_RECEIPTS;

  static Serializer<GpremiumEntitlement> get serializer =>
      _$gpremiumEntitlementSerializer;

  static BuiltSet<GpremiumEntitlement> get values =>
      _$gpremiumEntitlementValues;

  static GpremiumEntitlement valueOf(String name) =>
      _$gpremiumEntitlementValueOf(name);
}

abstract class GProfileContactInformationInput
    implements
        Built<GProfileContactInformationInput,
            GProfileContactInformationInputBuilder> {
  GProfileContactInformationInput._();

  factory GProfileContactInformationInput(
          [void Function(GProfileContactInformationInputBuilder b) updates]) =
      _$GProfileContactInformationInput;

  String get phoneNumber;
  String get name;
  String? get firstName;
  String? get lastName;
  bool? get hasEmail;
  String? get company;
  String? get birthDate;
  String? get referenceId;
  bool? get hasPhoto;
  static Serializer<GProfileContactInformationInput> get serializer =>
      _$gProfileContactInformationInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GProfileContactInformationInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GProfileContactInformationInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GProfileContactInformationInput.serializer,
        json,
      );
}

abstract class GProfileInfoInput
    implements Built<GProfileInfoInput, GProfileInfoInputBuilder> {
  GProfileInfoInput._();

  factory GProfileInfoInput(
          [void Function(GProfileInfoInputBuilder b) updates]) =
      _$GProfileInfoInput;

  String? get name;
  Ggender? get gender;
  BuiltList<Ggender>? get sexualOrientations;
  GDateTime? get birthDate;
  String? get bio;
  String? get occupation;
  String? get school;
  double? get maxSuggestionDistance;
  int? get maxSuggestionAge;
  int? get minSuggestionAge;
  int? get height;
  GAutoCompleteAddressInput? get city;
  double? get algorithm;
  Glocales? get language;
  String? get username;
  String? get email;
  String? get phone;
  BuiltList<String>? get profileImageUrls;
  bool? get matchingActive;
  bool? get public;
  BuiltList<String>? get interests;
  BuiltList<String>? get compliments;
  GinboxPreference? get inboxPreference;
  bool? get incognito;
  static Serializer<GProfileInfoInput> get serializer =>
      _$gProfileInfoInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GProfileInfoInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GProfileInfoInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GProfileInfoInput.serializer,
        json,
      );
}

abstract class GRefreshAuthTokensInput
    implements Built<GRefreshAuthTokensInput, GRefreshAuthTokensInputBuilder> {
  GRefreshAuthTokensInput._();

  factory GRefreshAuthTokensInput(
          [void Function(GRefreshAuthTokensInputBuilder b) updates]) =
      _$GRefreshAuthTokensInput;

  String get refreshToken;
  static Serializer<GRefreshAuthTokensInput> get serializer =>
      _$gRefreshAuthTokensInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRefreshAuthTokensInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GRefreshAuthTokensInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRefreshAuthTokensInput.serializer,
        json,
      );
}

class Gregion extends EnumClass {
  const Gregion._(String name) : super(name);

  static const Gregion EUROPE_WEST = _$gregionEUROPE_WEST;

  static const Gregion US_EAST = _$gregionUS_EAST;

  static const Gregion US_WEST = _$gregionUS_WEST;

  static Serializer<Gregion> get serializer => _$gregionSerializer;

  static BuiltSet<Gregion> get values => _$gregionValues;

  static Gregion valueOf(String name) => _$gregionValueOf(name);
}

abstract class GReportInput
    implements Built<GReportInput, GReportInputBuilder> {
  GReportInput._();

  factory GReportInput([void Function(GReportInputBuilder b) updates]) =
      _$GReportInput;

  String? get message;
  String get offendingElementId;
  GReportType get type;
  static Serializer<GReportInput> get serializer => _$gReportInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReportInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReportInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReportInput.serializer,
        json,
      );
}

class GReportType extends EnumClass {
  const GReportType._(String name) : super(name);

  static const GReportType PROFILE = _$gReportTypePROFILE;

  static const GReportType DATING_PROFILE = _$gReportTypeDATING_PROFILE;

  static const GReportType CHAT_MESSAGE = _$gReportTypeCHAT_MESSAGE;

  static Serializer<GReportType> get serializer => _$gReportTypeSerializer;

  static BuiltSet<GReportType> get values => _$gReportTypeValues;

  static GReportType valueOf(String name) => _$gReportTypeValueOf(name);
}

class GrestrictedProfileField extends EnumClass {
  const GrestrictedProfileField._(String name) : super(name);

  static const GrestrictedProfileField NAME = _$grestrictedProfileFieldNAME;

  static const GrestrictedProfileField BIRTH_DATE =
      _$grestrictedProfileFieldBIRTH_DATE;

  static const GrestrictedProfileField GENDER = _$grestrictedProfileFieldGENDER;

  static Serializer<GrestrictedProfileField> get serializer =>
      _$grestrictedProfileFieldSerializer;

  static BuiltSet<GrestrictedProfileField> get values =>
      _$grestrictedProfileFieldValues;

  static GrestrictedProfileField valueOf(String name) =>
      _$grestrictedProfileFieldValueOf(name);
}

abstract class GRevokeSuspensionInput
    implements Built<GRevokeSuspensionInput, GRevokeSuspensionInputBuilder> {
  GRevokeSuspensionInput._();

  factory GRevokeSuspensionInput(
          [void Function(GRevokeSuspensionInputBuilder b) updates]) =
      _$GRevokeSuspensionInput;

  String get suspensionId;
  static Serializer<GRevokeSuspensionInput> get serializer =>
      _$gRevokeSuspensionInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRevokeSuspensionInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GRevokeSuspensionInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRevokeSuspensionInput.serializer,
        json,
      );
}

abstract class GSaveDeviceInfoArgs
    implements Built<GSaveDeviceInfoArgs, GSaveDeviceInfoArgsBuilder> {
  GSaveDeviceInfoArgs._();

  factory GSaveDeviceInfoArgs(
          [void Function(GSaveDeviceInfoArgsBuilder b) updates]) =
      _$GSaveDeviceInfoArgs;

  GJSON get data;
  static Serializer<GSaveDeviceInfoArgs> get serializer =>
      _$gSaveDeviceInfoArgsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSaveDeviceInfoArgs.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSaveDeviceInfoArgs? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSaveDeviceInfoArgs.serializer,
        json,
      );
}

abstract class GSendMessageInput
    implements Built<GSendMessageInput, GSendMessageInputBuilder> {
  GSendMessageInput._();

  factory GSendMessageInput(
          [void Function(GSendMessageInputBuilder b) updates]) =
      _$GSendMessageInput;

  String get chatId;
  String get message;
  String? get messageRepliedToId;
  String? get contextId;
  static Serializer<GSendMessageInput> get serializer =>
      _$gSendMessageInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSendMessageInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSendMessageInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSendMessageInput.serializer,
        json,
      );
}

abstract class GShareProfileInput
    implements Built<GShareProfileInput, GShareProfileInputBuilder> {
  GShareProfileInput._();

  factory GShareProfileInput(
          [void Function(GShareProfileInputBuilder b) updates]) =
      _$GShareProfileInput;

  BuiltList<String> get userIds;
  String get profileId;
  String get message;
  String? get matchId;
  static Serializer<GShareProfileInput> get serializer =>
      _$gShareProfileInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GShareProfileInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GShareProfileInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GShareProfileInput.serializer,
        json,
      );
}

abstract class GStartPhotoTestInput
    implements Built<GStartPhotoTestInput, GStartPhotoTestInputBuilder> {
  GStartPhotoTestInput._();

  factory GStartPhotoTestInput(
          [void Function(GStartPhotoTestInputBuilder b) updates]) =
      _$GStartPhotoTestInput;

  BuiltList<String> get imageUrls;
  static Serializer<GStartPhotoTestInput> get serializer =>
      _$gStartPhotoTestInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GStartPhotoTestInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GStartPhotoTestInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GStartPhotoTestInput.serializer,
        json,
      );
}

abstract class GSuspensionInput
    implements Built<GSuspensionInput, GSuspensionInputBuilder> {
  GSuspensionInput._();

  factory GSuspensionInput([void Function(GSuspensionInputBuilder b) updates]) =
      _$GSuspensionInput;

  String get userId;
  bool get permanent;
  GDateTime? get until;
  String? get reason;
  static Serializer<GSuspensionInput> get serializer =>
      _$gSuspensionInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSuspensionInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSuspensionInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSuspensionInput.serializer,
        json,
      );
}

abstract class GUserFeedbackInput
    implements Built<GUserFeedbackInput, GUserFeedbackInputBuilder> {
  GUserFeedbackInput._();

  factory GUserFeedbackInput(
          [void Function(GUserFeedbackInputBuilder b) updates]) =
      _$GUserFeedbackInput;

  BuiltList<String>? get reasons;
  String? get description;
  GFeedbackType? get type;
  static Serializer<GUserFeedbackInput> get serializer =>
      _$gUserFeedbackInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserFeedbackInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserFeedbackInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserFeedbackInput.serializer,
        json,
      );
}

abstract class GWhitelistPhoneNumberInput
    implements
        Built<GWhitelistPhoneNumberInput, GWhitelistPhoneNumberInputBuilder> {
  GWhitelistPhoneNumberInput._();

  factory GWhitelistPhoneNumberInput(
          [void Function(GWhitelistPhoneNumberInputBuilder b) updates]) =
      _$GWhitelistPhoneNumberInput;

  String get phoneNumber;
  String get description;
  static Serializer<GWhitelistPhoneNumberInput> get serializer =>
      _$gWhitelistPhoneNumberInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWhitelistPhoneNumberInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GWhitelistPhoneNumberInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWhitelistPhoneNumberInput.serializer,
        json,
      );
}

const Map<String, Set<String>> possibleTypesMap = {};
