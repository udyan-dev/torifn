// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchReq {

 String get token; String get uuid; String get sort; String get nsfw; String get search; int get page;
/// Create a copy of SearchReq
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchReqCopyWith<SearchReq> get copyWith => _$SearchReqCopyWithImpl<SearchReq>(this as SearchReq, _$identity);

  /// Serializes this SearchReq to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchReq&&(identical(other.token, token) || other.token == token)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.nsfw, nsfw) || other.nsfw == nsfw)&&(identical(other.search, search) || other.search == search)&&(identical(other.page, page) || other.page == page));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,uuid,sort,nsfw,search,page);

@override
String toString() {
  return 'SearchReq(token: $token, uuid: $uuid, sort: $sort, nsfw: $nsfw, search: $search, page: $page)';
}


}

/// @nodoc
abstract mixin class $SearchReqCopyWith<$Res>  {
  factory $SearchReqCopyWith(SearchReq value, $Res Function(SearchReq) _then) = _$SearchReqCopyWithImpl;
@useResult
$Res call({
 String token, String uuid, String sort, String nsfw, String search, int page
});




}
/// @nodoc
class _$SearchReqCopyWithImpl<$Res>
    implements $SearchReqCopyWith<$Res> {
  _$SearchReqCopyWithImpl(this._self, this._then);

  final SearchReq _self;
  final $Res Function(SearchReq) _then;

/// Create a copy of SearchReq
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? uuid = null,Object? sort = null,Object? nsfw = null,Object? search = null,Object? page = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String,nsfw: null == nsfw ? _self.nsfw : nsfw // ignore: cast_nullable_to_non_nullable
as String,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SearchReq extends SearchReq {
  const _SearchReq({required this.token, required this.uuid, required this.sort, required this.nsfw, required this.search, required this.page}): super._();
  factory _SearchReq.fromJson(Map<String, dynamic> json) => _$SearchReqFromJson(json);

@override final  String token;
@override final  String uuid;
@override final  String sort;
@override final  String nsfw;
@override final  String search;
@override final  int page;

/// Create a copy of SearchReq
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchReqCopyWith<_SearchReq> get copyWith => __$SearchReqCopyWithImpl<_SearchReq>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchReqToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchReq&&(identical(other.token, token) || other.token == token)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.nsfw, nsfw) || other.nsfw == nsfw)&&(identical(other.search, search) || other.search == search)&&(identical(other.page, page) || other.page == page));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,uuid,sort,nsfw,search,page);

@override
String toString() {
  return 'SearchReq(token: $token, uuid: $uuid, sort: $sort, nsfw: $nsfw, search: $search, page: $page)';
}


}

/// @nodoc
abstract mixin class _$SearchReqCopyWith<$Res> implements $SearchReqCopyWith<$Res> {
  factory _$SearchReqCopyWith(_SearchReq value, $Res Function(_SearchReq) _then) = __$SearchReqCopyWithImpl;
@override @useResult
$Res call({
 String token, String uuid, String sort, String nsfw, String search, int page
});




}
/// @nodoc
class __$SearchReqCopyWithImpl<$Res>
    implements _$SearchReqCopyWith<$Res> {
  __$SearchReqCopyWithImpl(this._self, this._then);

  final _SearchReq _self;
  final $Res Function(_SearchReq) _then;

/// Create a copy of SearchReq
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? uuid = null,Object? sort = null,Object? nsfw = null,Object? search = null,Object? page = null,}) {
  return _then(_SearchReq(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String,nsfw: null == nsfw ? _self.nsfw : nsfw // ignore: cast_nullable_to_non_nullable
as String,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
