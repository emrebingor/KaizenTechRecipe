import 'package:kaizen_tech_recipe/enum/image_path_enum.dart';
import 'package:kaizen_tech_recipe/utils/extension/string_extension.dart';

extension ImagePathEnumExtension on ImagePathEnum {
  String get getImagePath {
    const String _baseImagePath = 'assets/';
    const String _svgPath = 'svg/';
    const String _pngPath = 'png/';
    String _imagePath = '';

    switch (this) {
      case ImagePathEnum.HOME:
        _imagePath = _baseImagePath + _svgPath + 'ic_bottom_bar_home'.toSvg;
        break;
      case ImagePathEnum.SEARCH:
        _imagePath = _baseImagePath + _svgPath + 'ic_bottom_bar_search'.toSvg;
        break;
      case ImagePathEnum.ALERT:
        _imagePath = _baseImagePath + _svgPath + 'ic_bottom_bar_alert'.toSvg;
        break;
      case ImagePathEnum.PROFILE:
        _imagePath = _baseImagePath + _svgPath + 'ic_bottom_bar_profile'.toSvg;
        break;
      case ImagePathEnum.SELECTED_HOME:
        _imagePath = _baseImagePath + _svgPath + 'ic_selected_bottom_home'.toSvg;
        break;
      case ImagePathEnum.SELECTED_SEARCH:
        _imagePath = _baseImagePath + _svgPath + 'ic_selected_bottom_search'.toSvg;
        break;
      case ImagePathEnum.CHEF:
        _imagePath = _baseImagePath + _svgPath + 'ic_chef'.toSvg;
        break;
      case ImagePathEnum.SUN:
        _imagePath = _baseImagePath + _svgPath + 'ic_sun'.toSvg;
        break;
      case ImagePathEnum.CALORIES:
        _imagePath = _baseImagePath + _svgPath + 'ic_calories'.toSvg;
        break;
      case ImagePathEnum.TIME:
        _imagePath = _baseImagePath + _svgPath + 'ic_time'.toSvg;
        break;
      case ImagePathEnum.BACK_ARROW:
        _imagePath = _baseImagePath + _svgPath + 'ic_back_arrow'.toSvg;
        break;
      case ImagePathEnum.TEXT_FIELD_SEARCH:
        _imagePath = _baseImagePath + _svgPath + 'ic_text_field_search'.toSvg;
        break;
      case ImagePathEnum.ARROW_RIGHT:
        _imagePath = _baseImagePath + _svgPath + 'ic_arrow_right'.toSvg;
        break;
      case ImagePathEnum.HEART:
        _imagePath = _baseImagePath + _svgPath + 'ic_heart'.toSvg;
        break;
      case ImagePathEnum.X:
        _imagePath = _baseImagePath + _svgPath + 'ic_x_mark'.toSvg;
        break;
      case ImagePathEnum.CAL:
        _imagePath = _baseImagePath + _svgPath + 'ic_cal'.toSvg;
        break;
      case ImagePathEnum.CARB:
        _imagePath = _baseImagePath + _svgPath + 'ic_carb'.toSvg;
        break;
      case ImagePathEnum.FAT:
        _imagePath = _baseImagePath + _svgPath + 'ic_fat'.toSvg;
        break;
      case ImagePathEnum.PROTEIN:
        _imagePath = _baseImagePath + _svgPath + 'ic_protein'.toSvg;
        break;
      case ImagePathEnum.ONBOARDING:
        _imagePath = _baseImagePath + _pngPath + 'onboarding_image'.toPng;
        break;
    }
    return _imagePath;
  }
}