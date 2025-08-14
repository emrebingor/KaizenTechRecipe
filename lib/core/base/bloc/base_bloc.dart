import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen_tech_recipe/core/base/bloc/base_bloc_state.dart';

abstract class BaseBloc<T, R extends BaseBlocState> extends Bloc<T, R> {
  BaseBloc(super.initialState);

  @override
  void emit(R state) {
    if (isClosed) return;
    super.emit(state);
  }

  void errorEmit(String? errorMessage) {
    emit(state.copyWith(hasError: true, errorMessage: errorMessage) as R);
  }
}