enum navAxis {
  vertical,
  horizontal
}

class NavigationModel {
  navAxis axis;
  int magnitude;

  NavigationModel(this.axis, this.magnitude);

  @override
  bool operator ==(Object other) =>
      (other is NavigationModel) ? (axis == other.axis && magnitude == other.magnitude) : false;

  @override
  // use different prime numbers to simply calculate unique hashes
  int get hashCode => magnitude * (axis == navAxis.horizontal ? 4957 : 5683);
}
