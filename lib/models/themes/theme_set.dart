library theme_set;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/enums/themes/theme_brightness.dart';
import 'package:flireator/models/themes/theme_colors.dart';
import 'package:flireator/utils/serializers.dart';

part 'theme_set.g.dart';

abstract class ThemeSet implements Built<ThemeSet, ThemeSetBuilder> {
  ThemeColors get colors;
  ThemeBrightness get brightness;

  ThemeSet._();

  factory ThemeSet([void Function(ThemeSetBuilder) updates]) = _$ThemeSet;

  Object toJson() => serializers.serializeWith(ThemeSet.serializer, this);

  static ThemeSet fromJson(String jsonString) =>
      serializers.deserializeWith(ThemeSet.serializer, json.decode(jsonString));

  static Serializer<ThemeSet> get serializer => _$themeSetSerializer;
}