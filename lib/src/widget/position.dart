part of starlight_netchecker_widget;

class _StarlightPosition extends Positioned {
  const _StarlightPosition({
    Key? key,
    required StarlightNetCheckerPosition position,
    required double value,
    required Widget child,
  }) : super(
          key: key,
          top: StarlightNetCheckerPosition.top == position ? value : null,

          ///ToDo:: Implement Left & Right
          // right: StarlightNetCheckerPosition.right == position ? value : null,
          // left: StarlightNetCheckerPosition.left == position ? value : null,
          bottom: StarlightNetCheckerPosition.bottom == position ? value : null,
          child: child,
        );
}
