import 'navigation_model.dart';

NavigationModel getNavigationFromFileline(String line) {
  var lineSplit = line.split(' ');
  var isInverted = lineSplit[0] == 'up';
  var axis = isInverted || lineSplit[0] == 'down' ? navAxis.vertical : navAxis.horizontal;
  var magnitude = int.tryParse(lineSplit[1]) ?? 0;
  return NavigationModel(axis, magnitude * (isInverted ? -1 : 1));
}

num consolidateNavigation(List<NavigationModel> allNavigation, navAxis axis) {
  return allNavigation.where((nav) => nav.axis == axis).map((nav) => nav.magnitude).fold(0, (a, b) => a + b);  
}
