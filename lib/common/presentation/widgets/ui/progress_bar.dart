import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  final int? value;
  final int? max;
  final double? valuePercent;
  final Color? backgroundColor;
  final Color? valueColor;
  final BoxBorder? border;
  final double width;
  final double height;
  final bool rounded;

  const ProgressBar({
    super.key,
    this.value,
    this.max,
    this.valuePercent,
    this.backgroundColor,
    this.valueColor,
    this.border,
    required this.width,
    required this.height,
    this.rounded = false,
  }) : assert(value != null && max != null || valuePercent != null);

  const ProgressBar.rounded({
    super.key,
    this.value,
    this.max,
    this.valuePercent,
    this.backgroundColor,
    this.valueColor,
    this.border,
    required this.width,
    required this.height,
  })  : rounded = true,
        assert(value != null && max != null || valuePercent != null);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      _animationController,
    );

    final valuePercentFinal = widget.valuePercent != null
        ? widget.valuePercent!
        : (widget.value! / widget.max!).clamp(0.03, 1.0);
    if (!mounted) return;
    animateTo(valuePercentFinal);

    animateTo(valuePercentFinal, ms: 750);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(ProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if ((widget.value != null &&
            widget.max != null &&
            (oldWidget.value != widget.value || oldWidget.max != widget.max)) ||
        widget.valuePercent != null) {
      final valuePercentFinal = widget.valuePercent != null
          ? widget.valuePercent!
          : (widget.value! / widget.max!).clamp(0.03, 1.0);
      if (!mounted) return;
      animateTo(valuePercentFinal);
    }
  }

  void animateTo(double percent, {int? ms}) {
    _animationController.animateTo(
      percent,
      curve: Curves.easeOut,
      duration: Duration(milliseconds: ms ?? 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = widget.rounded
        ? BorderRadius.all(Radius.circular(widget.height / 2))
        : BorderRadius.zero;
    return Container(
      decoration: BoxDecoration(
        border: widget.border,
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Container(
              width: widget.width,
              height: widget.height,
              color: widget.backgroundColor ?? Colors.grey[300],
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  width: widget.width * _animation.value,
                  height: widget.height,
                  color: widget.valueColor ?? Theme.of(context).primaryColor,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
