import 'package:day_2/navigation_calc.dart' as nav_calc;
import 'package:day_2/navigation_model.dart';
import 'package:test/test.dart';

void main() {
  test('It should get the axis and magnitude from a line of text', () {
    const testLine = 'forward 100';
    var result = nav_calc.getNavigationFromFileline(testLine);
    expect(result.axis, equals(navAxis.horizontal));
    expect(result.magnitude, equals(100));
  });

  test('It should get a negative magnitude if the direction is up', () {
    const testLine = 'up 2000';
    var result = nav_calc.getNavigationFromFileline(testLine);
    expect(result.axis, equals(navAxis.vertical));
    expect(result.magnitude, equals(-2000));
  });

  test('It should consolidate all results on a specific axis', () {
    var testNavs = [
      NavigationModel(navAxis.vertical, -100),
      NavigationModel(navAxis.vertical, 100),
      NavigationModel(navAxis.horizontal, 900),
      NavigationModel(navAxis.vertical, 200),
      NavigationModel(navAxis.horizontal, -100),
      NavigationModel(navAxis.vertical, 210),
      NavigationModel(navAxis.horizontal, -9999)
    ];
    var result = nav_calc.consolidateNavigation(testNavs, navAxis.vertical);
    expect(result, equals(410));
  });

  test('it should convert vector navigation to absolute navigation', () {
    var testNavs = [  
      NavigationModel(navAxis.horizontal, 5),
      NavigationModel(navAxis.vertical, 5),
      NavigationModel(navAxis.horizontal, 8),
      NavigationModel(navAxis.vertical, -3),
      NavigationModel(navAxis.vertical, 8),
      NavigationModel(navAxis.horizontal, 2)
    ];

    var results = nav_calc.convertVectorsToAbsoluteDirections(testNavs);

    expect(results[0], equals(NavigationModel(navAxis.horizontal, 5)));
    expect(results[1], equals(NavigationModel(navAxis.horizontal, 8)));
    expect(results[2], equals(NavigationModel(navAxis.vertical, 40)));
    expect(results[3], equals(NavigationModel(navAxis.horizontal, 2)));
    expect(results[4], equals(NavigationModel(navAxis.vertical, 20)));
  });

  test('it should perform entire vector navigation by combining step 2 and step 1', () {
    var testNavs = [  
      NavigationModel(navAxis.horizontal, 5),
      NavigationModel(navAxis.vertical, 5),
      NavigationModel(navAxis.horizontal, 8),
      NavigationModel(navAxis.vertical, -3),
      NavigationModel(navAxis.vertical, 8),
      NavigationModel(navAxis.horizontal, 2)
    ];

    var results = nav_calc.convertVectorsToAbsoluteDirections(testNavs);
    var verticalResult = nav_calc.consolidateNavigation(results, navAxis.vertical);
    var horizontalResult = nav_calc.consolidateNavigation(results, navAxis.horizontal);
    
    expect(horizontalResult, equals(15));
    expect(verticalResult, equals(60));
  });
}
