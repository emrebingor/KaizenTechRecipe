import 'package:kaizen_tech_recipe/core/base/bloc/base_bloc_state.dart';
import 'package:kaizen_tech_recipe/models/get_category_response_model.dart';
import 'package:kaizen_tech_recipe/models/get_recipe_response_model.dart';

final class HomeState extends BaseBlocState {
  HomeState({
    super.hasError,
    super.errorMessage,
    super.isLoading,
    this.recipes,
    this.categories,
    this.selectedCategory,
    this.filteredRecipe,
  });

  List<GetRecipeResponseModel>? recipes;
  List<GetRecipeResponseModel>? filteredRecipe;
  List<GetCategoryResponseModel>? categories;
  GetCategoryResponseModel? selectedCategory;

  @override
  List<Object?> get props {
    return <Object?>[
      ...super.props,
      recipes,
      categories,
      selectedCategory,
      filteredRecipe,
    ];
  }

  @override
  HomeState copyWith({
    bool? hasError,
    String? errorMessage,
    bool? isLoading,
    List<GetRecipeResponseModel>? recipes,
    List<GetRecipeResponseModel>? filteredRecipe,
    List<GetCategoryResponseModel>? categories,
    GetCategoryResponseModel? selectedCategory,
  }) {
    return HomeState(
      hasError: hasError ?? false,
      errorMessage: errorMessage ?? '',
      isLoading: isLoading ?? this.isLoading,
      recipes: recipes ?? this.recipes,
      filteredRecipe: filteredRecipe ?? this.filteredRecipe,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}