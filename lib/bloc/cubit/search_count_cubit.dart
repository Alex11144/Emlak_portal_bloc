import 'package:bloc/bloc.dart';
import 'package:database_trial/domain/api_clients/filter_api/filter_api_client.dart';
import 'package:meta/meta.dart';

part 'search_count_state.dart';

class SearchCountCubit extends Cubit<SearchCountState> {
  SearchCountCubit() : super(SearchCountState(CounterValue: 0));

  Future<void> getSatilirMertebeCount() async {
    final posts = await FilterApiClient().getMertebeSatilirCount();
    try {
      emit(state.CounterValue = posts);

      // isloading = true;

    } catch (e) {}
  }
}
