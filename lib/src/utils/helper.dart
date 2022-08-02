part of starlight_netchecker_widget;

mixin _Helper {
  EdgeInsets _safePadding(
      StarlightNetCheckerPosition position, BuildContext context) {
    EdgeInsets padding;
    switch (position) {
      case StarlightNetCheckerPosition.bottom:
        padding = EdgeInsets.only(bottom: context.safeArea.bottom);
        break;

      ///ToDo :: Implement lef & right
      // case StarlightNetCheckerPosition.left:
      //   padding = EdgeInsets.only(left: context.safeArea.left);

      //   break;
      // case StarlightNetCheckerPosition.right:
      //   padding = EdgeInsets.only(right: context.safeArea.right);

      //   break;
      default:
        padding = EdgeInsets.only(top: context.safeArea.top);

        break;
    }
    return padding;
  }

  dynamic _safeHeight(StarlightNetCheckerPosition position,
      BuildContext context, double value) {
    double height;
    switch (position) {
      case StarlightNetCheckerPosition.bottom:
        height = value + context.safeArea.bottom;
        break;

      ///ToDo :: Implement lef & right
      // case StarlightNetCheckerPosition.left:
      //   height = value+ context.safeArea.left;

      //   break;
      // case StarlightNetCheckerPosition.right:
      //   height = EdgeInsets.only(right: context.safeArea.right);

      //   break;
      default:
        height = value + context.safeArea.top;

        break;
    }
    return height;
  }

  EdgeInsets _padding(StarlightNetCheckerPosition position, double value) {
    EdgeInsets padding;
    switch (position) {
      case StarlightNetCheckerPosition.bottom:
        padding = EdgeInsets.only(bottom: value);
        break;

      ///ToDo :: Implement lef & right
      // case StarlightNetCheckerPosition.left:
      //   padding = EdgeInsets.only(left: value);

      //   break;
      // case StarlightNetCheckerPosition.right:
      //   padding = EdgeInsets.only(right: value);

      //   break;
      default:
        padding = EdgeInsets.only(top: value);

        break;
    }
    return padding;
  }

  Stream<bool?> get stream => _NetChecker._get._netStream;
  bool? get isOnline => _NetChecker._get._lastedValue;
}
