import 'package:flutter/material.dart';

class AnimateInEffectWrapper extends StatefulWidget {
  const AnimateInEffectWrapper({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.initialDelay = const Duration(milliseconds: 500),
    this.initialOffset = const Offset(0, 30),
    this.keepAlive = false,
  }) : super(key: key);

  final Widget child;
  final Duration duration;
  final Duration initialDelay;
  final Offset initialOffset;
  final bool keepAlive;

  @override
  State<AnimateInEffectWrapper> createState() => _AnimateInEffectWrapperState();
}

class _AnimateInEffectWrapperState extends State<AnimateInEffectWrapper>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final AnimationController animationController;
  late final Animation<Offset> offsetAnimation;
  late final Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    Future.delayed(
      widget.initialDelay,
      () {
        if (!mounted) return;
        animationController.forward();
      },
    );

    Curve intervalCurve = const Interval(0, 1, curve: Curves.easeOut);

    offsetAnimation = Tween<Offset>(
      begin: widget.initialOffset,
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: intervalCurve,
      ),
    );

    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: intervalCurve,
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) => Transform.translate(
        offset: offsetAnimation.value,
        child: child,
      ),
      child: FadeTransition(
        opacity: fadeAnimation,
        child: widget.child,
      ),
    );
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}
