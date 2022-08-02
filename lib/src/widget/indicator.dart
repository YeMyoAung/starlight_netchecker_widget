part of starlight_netchecker_widget;

class _Indicator extends StatelessWidget with _Helper {
  // final IconData icon, errorIcon;
  final Color indicatorColor, errorIndicatorColor;
  final String label, errorLabel;
  final double indicatorHeight;
  final Duration duration;

  const _Indicator({
    // required this.icon,
    // required this.errorIcon,
    required this.indicatorColor,
    required this.errorIndicatorColor,
    required this.label,
    required this.errorLabel,
    required this.indicatorHeight,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    ///ToDo:: Same Icon Animation
    return
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [

        //     _IndicatorIcon(
        //       duration: duration,
        //       icon: isOnline == true ? icon : errorIcon,
        //       size: isOnline == true ? 0 : indicatorHeight / 2,
        //     ),
        //     const SizedBox(
        //       width: 5,
        //     ),
        _IndicatorText(
      fontSize: isOnline == true ? 0 : 14,
      text: isOnline == null
          ? "Checking"
          : isOnline == true
              ? label
              : errorLabel,
      duration: duration,
      //   )
      // ],
    );
  }
}
