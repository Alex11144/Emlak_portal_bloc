// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_reqest_bloc.dart';

@immutable
abstract class SearchRequestState {}

class SearchReqestInitial extends SearchRequestState {}

class SearchReqestInProgress extends SearchRequestState {}

class SearchReqestSuccess extends SearchRequestState {}
