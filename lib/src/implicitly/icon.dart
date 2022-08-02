part of starlight_netchecker_widget;

class _IndicatorIcon extends ImplicitlyAnimatedWidget {
  final IconData icon;
  final double size;
  const _IndicatorIcon({
    required super.duration,
    required this.icon,
    required this.size,
  });

  @override
  ImplicitlyAnimatedWidgetState<_IndicatorIcon> createState() =>
      __IndicatorIconState();
}

class __IndicatorIconState extends AnimatedWidgetBaseState<_IndicatorIcon> {
  Tween<double>? _sizeTween;

  @override
  Widget build(BuildContext context) {
    return Icon(
      widget.icon,
      size: _sizeTween?.evaluate(animation),
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _sizeTween = visitor(
      _sizeTween,
      widget.size,
      (dynamic value) => Tween<double>(begin: value as double?),
    ) as Tween<double>?;
  }
}
