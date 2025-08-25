import 'package:kaizen_tech_recipe/enum/image_path_enum.dart';
import 'package:kaizen_tech_recipe/utils/extension/string_extension.dart';

extension ImagePathEnumExtension on ImagePathEnum {
  String get getImagePath {
    const String _baseImagePath = 'assets/';
    const String _svgPath = 'svg/';
    const String _pngPath = 'png/';
    String _imagePath = '';

    switch (this) {
      case ImagePathEnum.home:
        _imagePath = _baseImagePath + _svgPath + 'ic_bottom_bar_home'.toSvg;
        break;
      case ImagePathEnum.search:
        _imagePath = _baseImagePath + _svgPath + 'ic_bottom_bar_search'.toSvg;
        break;
      case ImagePathEnum.alert:
        _imagePath = _baseImagePath + _svgPath + 'ic_bottom_bar_alert'.toSvg;
        break;
      case ImagePathEnum.profile:
        _imagePath = _baseImagePath + _svgPath + 'ic_bottom_bar_profile'.toSvg;
        break;
      case ImagePathEnum.selectedHome:
        _imagePath = _baseImagePath + _svgPath + 'ic_selected_bottom_home'.toSvg;
        break;
      case ImagePathEnum.selectedSearch:
        _imagePath = _baseImagePath + _svgPath + 'ic_selected_bottom_search'.toSvg;
        break;
      case ImagePathEnum.chef:
        _imagePath = _baseImagePath + _svgPath + 'ic_chef'.toSvg;
        break;
      case ImagePathEnum.sun:
        _imagePath = _baseImagePath + _svgPath + 'ic_sun'.toSvg;
        break;
      case ImagePathEnum.calories:
        _imagePath = _baseImagePath + _svgPath + 'ic_calories'.toSvg;
        break;
      case ImagePathEnum.time:
        _imagePath = _baseImagePath + _svgPath + 'ic_time'.toSvg;
        break;
      case ImagePathEnum.backArrowIcon:
        _imagePath = _baseImagePath + _svgPath + 'ic_back_arrow'.toSvg;
        break;
      case ImagePathEnum.textFieldSearch:
        _imagePath = _baseImagePath + _svgPath + 'ic_text_field_search'.toSvg;
        break;
      case ImagePathEnum.arrowRight:
        _imagePath = _baseImagePath + _svgPath + 'ic_arrow_right'.toSvg;
        break;
      case ImagePathEnum.heart:
        _imagePath = _baseImagePath + _svgPath + 'ic_heart'.toSvg;
        break;
      case ImagePathEnum.X:
        _imagePath = _baseImagePath + _svgPath + 'ic_x_mark'.toSvg;
        break;
      case ImagePathEnum.cal:
        _imagePath = _baseImagePath + _svgPath + 'ic_cal'.toSvg;
        break;
      case ImagePathEnum.carb:
        _imagePath = _baseImagePath + _svgPath + 'ic_carb'.toSvg;
        break;
      case ImagePathEnum.fat:
        _imagePath = _baseImagePath + _svgPath + 'ic_fat'.toSvg;
        break;
      case ImagePathEnum.protein:
        _imagePath = _baseImagePath + _svgPath + 'ic_protein'.toSvg;
        break;
      case ImagePathEnum.onboarding:
        _imagePath = _baseImagePath + _pngPath + 'onboarding_image'.toPng;
        break;
    }
    return _imagePath;
  }
}