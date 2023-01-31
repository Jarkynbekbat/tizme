import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studtime/src/shared/data/repos/app_cache_repo.dart';

part 'init_state.dart';
part 'init_cubit.freezed.dart';

class InitCubit extends Cubit<InitState> {
  final AppCacheRepo _cacheRepo;

  InitCubit(this._cacheRepo) : super(const InitState.loading());

  /// Инициализация приложения
  Future<void> initApp() async {
    final futures = <Future>[];

    /// формируем список репозиториев для инициализации
    futures.add(_cacheRepo.init());

    try {
      /// инициализируем все репозитории
      await Future.wait(futures);

      emit(const InitState.loaded());
    } catch (e) {
      emit(InitState.error(e.toString()));
    }
  }
}
