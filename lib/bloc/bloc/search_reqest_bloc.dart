import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:database_trial/bloc/cubit/search_count_cubit.dart';
import 'package:database_trial/data/evler_data/evler_data.dart';
import 'package:database_trial/domain/api_clients/filter_api/filter_api_client.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';

part 'search_reqest_event.dart';
part 'search_reqest_state.dart';

class SearchRequestBloc extends Bloc<SearchRequestEvent, SearchRequestState> {
  // final watch = Provider.of<SatilanEvlerData>(context, listen: false);
  final filter = FilterApiClient();

  SearchRequestBloc() : super(SearchReqestInitial()) {
    on<OntapEvent>((event, emit) async {
      if (event is SearchRequestEvent) {
        // final posts = await FilterApiClient().getMertebeSatilirCount();

        emit(SearchReqestInProgress());
        // emit(SearchRequestState(count: posts));

        await Future.delayed(Duration(seconds: 3));
        emit(SearchReqestSuccess());
      }
    }, transformer: restartable());
  }

  // Future<void> getSatilirMertebeCount() async {
  //   // isloading = true;
  // }
}
