import 'package:flutter/material.dart';

class PortfolioSectionKeys {
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void scrollTo(GlobalKey key, {bool afterFrame = false}) {
    void doScroll() {
      final context = key.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          alignment: 0.08,
        );
      }
    }

    if (afterFrame) {
      WidgetsBinding.instance.addPostFrameCallback((_) => doScroll());
    } else {
      doScroll();
    }
  }
}
