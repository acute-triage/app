import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_starter/common/presentation/widgets/ui/text_typography.dart';

const smallRadius = 8.0;

class DialogBox extends StatefulWidget {
  final String? title;
  final String? content;
  final Widget? contentWidget;
  final String? cancelText;
  final String confirmText;
  final FutureOr<void> Function()? cancelAction;
  final FutureOr<void> Function()? confirmAction;
  final FutureOr<void> Function()? alwaysCallback;
  final bool shake;
  final bool loading;
  final bool highlighConfirm;
  final bool dangerConfirm;
  final int? confirmCooldown;

  const DialogBox({
    super.key,
    this.title,
    this.content,
    this.contentWidget,
    this.cancelText,
    required this.confirmText,
    required this.confirmAction,
    this.alwaysCallback,
    this.cancelAction,
    this.shake = false,
    this.loading = false,
    this.highlighConfirm = false,
    this.dangerConfirm = false,
    this.confirmCooldown,
  });

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final GlobalKey _globalKey = GlobalKey();
  late double _buttonWidth = 150;
  late int _countdown = widget.confirmCooldown ?? 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final buttonWidth = _globalKey.currentContext?.size?.width;

      if (buttonWidth != null) {
        setState(() {
          _buttonWidth = buttonWidth;
        });
      }

      shake().then((value) => startTimer());
    });
  }

  shake() async {
    // wait 150 ms
    await Future.delayed(const Duration(milliseconds: 100));
    await _controller.forward(from: 0.0);
    await _controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    if (widget.confirmCooldown == null) {
      return;
    }

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        return;
      }

      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          _timer!.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool disabled = _countdown > 0;

    final dialog = AlertDialog(
      elevation: 3,
      actionsPadding: const EdgeInsets.all(0),
      title: widget.title != null
          ? TextTypography.headlineMedium(
              widget.title!,
            )
          : const SizedBox(),
      content: widget.content == null && widget.contentWidget == null
          ? null
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.content != null)
                  TextTypography.body(
                    widget.content!,
                  ),
                if (widget.contentWidget != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: widget.contentWidget,
                  ),
              ],
            ),
      contentPadding: EdgeInsets.fromLTRB(
        24.0,
        widget.title != null ? 10.0 : 0,
        24.0,
        24.0,
      ),
      buttonPadding: EdgeInsets.zero,
      actions: <Widget>[
        Container(
          height: 56,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Theme.of(context).dividerColor,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              widget.cancelText != null
                  ? // Only show the secondary (left) button if it has a callback function.
                  Expanded(
                      child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Theme.of(context).dividerColor,
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: IgnorePointer(
                          ignoring: widget.loading,
                          child: InkWell(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(smallRadius),
                            ),
                            child: Center(
                              child: TextTypography.body(
                                widget.cancelText!,
                                faded: true,
                              ),
                            ),
                            onTap: () {
                              widget.cancelAction?.call();
                              widget.alwaysCallback?.call();
                            },
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(
                      width: 0,
                      height: 0,
                    ),
              Expanded(
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    border: widget.cancelText?.isNotEmpty == true
                        ? Border(
                            left: BorderSide(
                              color: Theme.of(context).dividerColor,
                            ),
                          )
                        : null,
                  ),
                  child: IgnorePointer(
                    ignoring: widget.loading,
                    child: Stack(
                      key: _globalKey,
                      clipBehavior: Clip.none,
                      children: [
                        if (widget.highlighConfirm)
                          Positioned(
                            top: -16,
                            left: _buttonWidth / 2 - 45,
                            child: const SizedBox(
                              width: 90,
                              height: 90,
                              child: Center(
                                child: _PulsingCircle(
                                  size: 60,
                                  increaseSize: 20,
                                ),
                              ),
                            ),
                          ),
                        InkWell(
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(smallRadius),
                          ),
                          child: Center(
                            child: widget.loading
                                ? const CircularProgressIndicator()
                                : TextTypography.body(
                                    '${widget.confirmText}${_countdown > 0 ? ' ($_countdown)' : ''}',
                                    textAlign: TextAlign.center,
                                    textStyle: TextStyle(
                                      color: widget.dangerConfirm && !disabled
                                          ? Theme.of(context).colorScheme.error
                                          : (disabled
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .onSurface
                                                  .withOpacity(0.5)
                                              : null),
                                    ),
                                  ),
                          ),
                          onTap: () async {
                            if (disabled) {
                              return;
                            }

                            await widget.confirmAction!();

                            widget.alwaysCallback?.call();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    );

    if (widget.shake) {
      return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          final dx = sin(_controller.value * 2 * pi) * 24;
          return Transform.translate(
            offset: Offset(dx, 0),
            child: child,
          );
        },
        child: dialog,
      );
    }

    return dialog;
  }
}

class _PulsingCircle extends StatefulWidget {
  final double size;
  final double increaseSize;

  const _PulsingCircle({
    // ignore: unused_element
    super.key,
    this.size = 40,
    this.increaseSize = 10,
  });

  @override
  _PulsingCircleState createState() => _PulsingCircleState();
}

class _PulsingCircleState extends State<_PulsingCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late double _width;
  late double _height;

  @override
  void initState() {
    super.initState();
    _width = widget.size;
    _height = widget.size;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 950),
    );
    _controller.addListener(() {
      setState(() {
        _width = widget.size + widget.increaseSize * _controller.value;
        _height = widget.size + widget.increaseSize * _controller.value;
      });
    });
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.7),
          width: 4,
        ),
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
