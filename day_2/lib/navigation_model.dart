enum navAxis {
  vertical,
  horizontal
}

class NavigationModel {
  navAxis axis;
  int magnitude;

  NavigationModel(this.axis, this.magnitude);
}
