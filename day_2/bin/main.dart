import 'package:day_2/navigation_calc.dart' as nav_calc;
import 'package:day_2/file_read.dart' as file_read;
import 'package:day_2/navigation_model.dart';

void main(List<String> arguments) async {
  var allLines = await file_read.readFile();
  var allNavigation = allLines.map((line) =>
    nav_calc.getNavigationFromFileline(line)
  ).toList();

  firstStep(allNavigation);
  secondStep(allNavigation);
}

void firstStep(List<NavigationModel> allNavigation) {
  var totalHorizontal = nav_calc.consolidateNavigation(allNavigation, navAxis.horizontal);
  var totalVertical = nav_calc.consolidateNavigation(allNavigation, navAxis.vertical);

  var result = totalVertical * totalHorizontal;
  print(result);
}

void secondStep(List<NavigationModel> allNavigation) {
  var results = nav_calc.convertVectorsToAbsoluteDirections(allNavigation);
  var totalHorizontal = nav_calc.consolidateNavigation(results, navAxis.vertical);
  var totalVertical = nav_calc.consolidateNavigation(results, navAxis.horizontal);

  var result = totalVertical * totalHorizontal;
  print(result);
}