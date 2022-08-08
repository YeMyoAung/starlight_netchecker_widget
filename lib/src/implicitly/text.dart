part of starlight_netchecker_widget;

class _IndicatorText extends ImplicitlyAnimatedWidget {
  final String text;
  final double fontSize;
  const _IndicatorText({
    required Duration duration,
    required this.text,
    required this.fontSize,
  }) : super(duration: duration);

  @override
  ImplicitlyAnimatedWidgetState<_IndicatorText> createState() =>
      __IndicatorTextState();
}

class __IndicatorTextState extends AnimatedWidgetBaseState<_IndicatorText> {
  Tween<double>? _sizeTween;

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(fontSize: _sizeTween?.evaluate(animation)),
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _sizeTween = visitor(
      _sizeTween,
      widget.fontSize,
      (dynamic value) => Tween<double>(begin: value as double?),
    ) as Tween<double>?;
  }
}
