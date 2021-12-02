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
}
