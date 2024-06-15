// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'project_color.dart';

class ProjectColorMapper extends EnumMapper<ProjectColor> {
  ProjectColorMapper._();

  static ProjectColorMapper? _instance;
  static ProjectColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProjectColorMapper._());
    }
    return _instance!;
  }

  static ProjectColor fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ProjectColor decode(dynamic value) {
    switch (value) {
      case 'berry_red':
        return ProjectColor.berryRed;
      case 'light_blue':
        return ProjectColor.lightBlue;
      case 'red':
        return ProjectColor.red;
      case 'blue':
        return ProjectColor.blue;
      case 'orange':
        return ProjectColor.orange;
      case 'grape':
        return ProjectColor.grape;
      case 'yellow':
        return ProjectColor.yellow;
      case 'violet':
        return ProjectColor.violet;
      case 'olive_green':
        return ProjectColor.oliveGreen;
      case 'lavender':
        return ProjectColor.lavender;
      case 'lime_green':
        return ProjectColor.limeGreen;
      case 'magenta':
        return ProjectColor.magenta;
      case 'green':
        return ProjectColor.green;
      case 'salmon':
        return ProjectColor.salmon;
      case 'mint_green':
        return ProjectColor.mintGreen;
      case 'charcoal':
        return ProjectColor.charcoal;
      case 'teal':
        return ProjectColor.teal;
      case 'grey':
        return ProjectColor.grey;
      case 'sky_blue':
        return ProjectColor.skyBlue;
      case 'taupe':
        return ProjectColor.taupe;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ProjectColor self) {
    switch (self) {
      case ProjectColor.berryRed:
        return 'berry_red';
      case ProjectColor.lightBlue:
        return 'light_blue';
      case ProjectColor.red:
        return 'red';
      case ProjectColor.blue:
        return 'blue';
      case ProjectColor.orange:
        return 'orange';
      case ProjectColor.grape:
        return 'grape';
      case ProjectColor.yellow:
        return 'yellow';
      case ProjectColor.violet:
        return 'violet';
      case ProjectColor.oliveGreen:
        return 'olive_green';
      case ProjectColor.lavender:
        return 'lavender';
      case ProjectColor.limeGreen:
        return 'lime_green';
      case ProjectColor.magenta:
        return 'magenta';
      case ProjectColor.green:
        return 'green';
      case ProjectColor.salmon:
        return 'salmon';
      case ProjectColor.mintGreen:
        return 'mint_green';
      case ProjectColor.charcoal:
        return 'charcoal';
      case ProjectColor.teal:
        return 'teal';
      case ProjectColor.grey:
        return 'grey';
      case ProjectColor.skyBlue:
        return 'sky_blue';
      case ProjectColor.taupe:
        return 'taupe';
    }
  }
}

extension ProjectColorMapperExtension on ProjectColor {
  String toValue() {
    ProjectColorMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ProjectColor>(this) as String;
  }
}
