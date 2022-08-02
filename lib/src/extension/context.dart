part of starlight_netchecker_widget;

extension _StarlightBuildContext on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.width;

  EdgeInsets get safeArea => MediaQuery.of(this).padding;
}
