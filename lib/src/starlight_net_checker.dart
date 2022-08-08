part of starlight_netchecker_widget;

class StarlightNetChecker extends StatefulWidget {
  final Widget child;
  final StarlightNetCheckerPosition position;
  final double indicatorHeight;
  final Color indicatorColor, errorIndicatorColor;
  final String label, errorLabel;

  ///ToDo:: Icon Animation
  // final IconData icon, errorIcon;
  final Duration duration;
  final Widget? customIndicator;
  const StarlightNetChecker({
    Key? key,
    required this.child,
    this.position = StarlightNetCheckerPosition.bottom,
    this.indicatorHeight = 30,
    this.indicatorColor = Colors.green,
    this.errorIndicatorColor = Colors.red,
    this.label = "Connected",
    this.errorLabel = "No Internet Connection",
    // this.icon = Icons.check_circle,
    // this.errorIcon = Icons.error,
    this.duration = const Duration(milliseconds: 400),
    this.customIndicator,
  }) : super(key: key);

  @override
  State<StarlightNetChecker> createState() => _StarlightNetCheckerState();
}

class _StarlightNetCheckerState extends State<StarlightNetChecker>
    with SingleTickerProviderStateMixin, _Helper {
  late AnimationController _animationController;

  late Animation<double> _animation;

  StreamSubscription<bool?>? _subscription;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    );
    stream.listen((event) {
      if (event == null || !event) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  void didUpdateWidget(covariant StarlightNetChecker oldWidget) {
    if (oldWidget != widget) {
      _animationController.reset();
      _NetChecker._get.reset();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _subscription = null;
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) => AnimatedContainer(
              duration: widget.duration,
              width: context.width,
              height: context.height,
              padding: _padding(
                    widget.position,
                    widget.indicatorHeight,
                  ) *
                  _animationController.value,
              alignment: Alignment.center,
              child: child,
            ),
            child: widget.child,
          ),
          _StarlightPosition(
            value: 0,
            position: widget.position,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) => AnimatedContainer(
                duration: widget.duration,
                color: isOnline == true
                    ? widget.indicatorColor
                    : widget.errorIndicatorColor,
                width: context.width,
                padding: _safePadding(
                  widget.position,
                  context,
                ),
                height: _safeHeight(
                      widget.position,
                      context,
                      widget.indicatorHeight,
                    ) *
                    _animationController.value,
                alignment: Alignment.center,
                child: child ??
                    _Indicator(
                      // icon: widget.icon,
                      // errorIcon: widget.errorIcon,
                      indicatorColor: widget.indicatorColor,
                      errorIndicatorColor: widget.errorIndicatorColor,
                      label: widget.label,
                      errorLabel: widget.errorLabel,
                      indicatorHeight: widget.indicatorHeight,
                      duration: widget.duration,
                    ),
              ),
              child: widget.customIndicator,
            ),
          )
        ],
      ),
    );
  }
}
