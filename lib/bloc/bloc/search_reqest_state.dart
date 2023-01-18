// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_reqest_bloc.dart';

@immutable
class SearchRequestState {
  // int? count = 10;
  // SearchRequestState({
  //   this.count,
  // });
}

class SearchReqestInitial extends SearchRequestState {}

class SearchReqestInProgress extends SearchRequestState {}

class SearchReqestSuccess extends SearchRequestState {}
