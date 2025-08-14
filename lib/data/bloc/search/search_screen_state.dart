import 'package:kaizen_tech_recipe/core/base/bloc/base_bloc_state.dart';

final class SearchScreenState extends BaseBlocState {
  SearchScreenState({
    super.hasError,
    super.errorMessage,
    super.isLoading,
  });


  @override
  List<Object?> get props {
    return <Object?>[
      ...super.props,
    ];
  }

  @override
  SearchScreenState copyWith({
    bool? hasError,
    String? errorMessage,
    bool? isLoading,
  }) {
    return SearchScreenState(
      hasError: hasError ?? false,
      errorMessage: errorMessage ?? '',
      isLoading: isLoading ?? this.isLoading,
    );
  }
}