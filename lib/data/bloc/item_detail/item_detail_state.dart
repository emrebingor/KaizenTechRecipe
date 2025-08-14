import 'package:kaizen_tech_recipe/core/base/bloc/base_bloc_state.dart';
import 'package:kaizen_tech_recipe/enum/tab_type_enum.dart';
import 'package:kaizen_tech_recipe/models/get_recipe_detail_response_model.dart';

final class ItemDetailState extends BaseBlocState {
  ItemDetailState({
    super.hasError,
    super.errorMessage,
    super.isLoading,
    this.recipe,
    this.selectedTab = TabType.ingredients,
  });

  GetRecipeDetailResponseModel? recipe;
  TabType selectedTab;

  @override
  List<Object?> get props {
    return <Object?>[
      ...super.props,
      recipe,
      selectedTab,
    ];
  }

  @override
  ItemDetailState copyWith({
    bool? hasError,
    String? errorMessage,
    bool? isLoading,
    GetRecipeDetailResponseModel? recipe,
    TabType? selectedTab,
  }) {
    return ItemDetailState(
      hasError: hasError ?? false,
      errorMessage: errorMessage ?? '',
      isLoading: isLoading ?? this.isLoading,
      recipe: recipe ?? this.recipe,
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }
}