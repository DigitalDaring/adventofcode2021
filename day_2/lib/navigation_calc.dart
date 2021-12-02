import 'navigation_model.dart';

NavigationModel getNavigationFromFileline(String line) {
  var lineSplit = line.split(' ');
  var isInverted = lineSplit[0] == 'up';
  var axis = isInverted || lineSplit[0] == 'down' ? navAxis.vertical : navAxis.horizontal;
  var magnitude = int.tryParse(lineSplit[1]) ?? 0;
  return NavigationModel(axis, magnitude * (isInverted ? -1 : 1));
}

int consolidateNavigation(List<NavigationModel> allNavigation, navAxis axis) {
  return allNavigation.where((nav) => nav.axis == axis).map((nav) => nav.magnitude).fold(0, (a, b) => a + b);  
}

List<List<NavigationModel>> chunkNavigation(List<NavigationModel> allNavigation) {
  var navChunks = <List<NavigationModel>>[];
  var curChunk = <NavigationModel>[];
  allNavigation.forEach((nav) {
    curChunk.add(nav);
    if(nav.axis == navAxis.horizontal) {
      navChunks.add(curChunk);
      curChunk = <NavigationModel>[];
    }
  });
  return navChunks;
}

List<NavigationModel> convertVectorsToAbsoluteDirections(List<NavigationModel> allNavigation) {
  var vectorNavs = <NavigationModel>[];
  var currentAim = 0;

  var navChunks = chunkNavigation(allNavigation);
  navChunks.forEach((chunk) {
    currentAim += consolidateNavigation(chunk, navAxis.vertical);
    var distance = consolidateNavigation(chunk, navAxis.horizontal);
    vectorNavs.add(NavigationModel(navAxis.horizontal, distance));

    if (currentAim != 0) {
      vectorNavs.add(NavigationModel(navAxis.vertical, distance * currentAim));
    }
  });

  return vectorNavs;
}
