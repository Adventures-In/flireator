library store_user_data;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/models/auth/user_data.dart';
import 'package:flireator/utils/serializers.dart';
import 'package:meta/meta.dart';

part 'store_user_data.g.dart';

abstract class StoreUserData extends Object
    with ReduxAction
    implements Built<StoreUserData, StoreUserDataBuilder> {
  @nullable
  UserData get userData;

  StoreUserData._();

  factory StoreUserData({@required UserData userData}) = _$StoreUserData._;

  Object toJson() => serializers.serializeWith(StoreUserData.serializer, this);

  static StoreUserData fromJson(String jsonString) => serializers
      .deserializeWith(StoreUserData.serializer, json.decode(jsonString));

  static Serializer<StoreUserData> get serializer => _$storeUserDataSerializer;

  @override
  String toString() {
    var userDataSummary = '-';

    if (userData == null) {
      userDataSummary = 'null';
    } else if (userData.isAnonymous) {
      userDataSummary = 'anon-${userData.uid.substring(0, 4)}...';
    } else {
      userDataSummary = '${userData.uid.substring(0, 4)}...';
    }

    return 'STORE_USER_DATA: $userDataSummary';
  }
}