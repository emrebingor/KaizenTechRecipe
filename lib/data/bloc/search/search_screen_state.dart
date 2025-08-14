import 'package:kaizen_tech_recipe/core/base/bloc/base_bloc_state.dart';
import 'package:kaizen_tech_recipe/models/get_category_response_model.dart';
import 'package:kaizen_tech_recipe/models/get_recipe_response_model.dart';

final class SearchScreenState extends BaseBlocState {
  SearchScreenState({
    super.hasError,
    super.errorMessage,
    super.isLoading,
    this.selectedCategory,
    this.filteredRecipe,
  });

  GetCategoryResponseModel? selectedCategory;
  List<GetRecipeResponseModel>? filteredRecipe;

  @override
  List<Object?> get props {
    return <Object?>[
      ...super.props,
      selectedCategory,
      filteredRecipe,
    ];
  }

  @override
  SearchScreenState copyWith({
    bool? hasError,
    String? errorMessage,
    bool? isLoading,
    GetCategoryResponseModel? selectedCategory,
    List<GetRecipeResponseModel>? filteredRecipe,
  }) {
    return SearchScreenState(
      hasError: hasError ?? false,
      errorMessage: errorMessage ?? '',
      isLoading: isLoading ?? this.isLoading,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      filteredRecipe: filteredRecipe ?? this.filteredRecipe,
    );
  }
}