import 'package:dart_mappable/dart_mappable.dart';

part 'project_color.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.snakeCase)
enum ProjectColor {
  berryRed(0xffb8256f),
  lightBlue(0xff96c3eb),
  red(0xffdb4035),
  blue(0xff4073ff),
  orange(0xffff9933),
  grape(0xff884dff),
  yellow(0xfffad000),
  violet(0xffaf38eb),
  oliveGreen(0xffafb83b),
  lavender(0xffeb96eb),
  limeGreen(0xff7ecc49),
  magenta(0xffe05194),
  green(0xff299438),
  salmon(0xffff8d85),
  mintGreen(0xff6accbc),
  charcoal(0xff808080),
  teal(0xff158fad),
  grey(0xffb8b8b8),
  skyBlue(0xff14aaf5),
  taupe(0xffccac93);

  final int hex;
  const ProjectColor(this.hex);
}
