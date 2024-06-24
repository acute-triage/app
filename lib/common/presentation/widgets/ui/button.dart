import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter/common/presentation/widgets/ui/text_typography.dart';
import 'package:flutter_starter/common/util/haptic_feedback.dart';
import 'package:skeletons/skeletons.dart';

enum ButtonShape {
  Default,
  Circled,
}

enum ButtonSize {
  ExtraLarge,
  Large,
  Medium,
  Small,
  ExtraSmall,
}

enum ButtonColor {
  Primary,
  Secondary,
  Transparent,
  White,
}

enum ButtonVariant {
  Filled,
  FilledWithStroke,
  Outlined,
}

enum HapticFeedbackType {
  LIGHT,
  MEDIUM,
  HEAVY,
  NONE,
}

const Map<ButtonSize, double> BUTTON_HEIGHTS = {
  ButtonSize.ExtraLarge: 64,
  ButtonSize.Large: 56,
  ButtonSize.Medium: 44,
  ButtonSize.Small: 32,
  ButtonSize.ExtraSmall: 24,
};

class Button extends StatelessWidget {
  final String? text;

  /// Bad practice; avoid using this, to keep design consistent
  final double? height;
  final ButtonShape shape;
  final ButtonSize size;
  final ButtonColor color;
  final VoidCallback? onTap;
  final ButtonVariant variant;

  final double? tapAreaMargin;

  /// Whether the button should take up the full width of its parent.
  /// NOTE: Cannot be used inside Rows/Colums, use Expanded() instead
  final bool fullWidth;

  final bool isLoading;

  final bool skeleton;

  final HapticFeedbackType? haptic;

  final double? width;

  final TextStyle? textStyle;

  final Alignment? alignment;

  final double? iconSize;

  final Color? iconColor;

  final Widget? suffix;

  final Color? backgroundColor;
  final Color? textColor;

  final Widget? child;

  final Color? splashColor;

  /// Override the default border color of the button.
  final Color? borderColor;

  /// A path to an SVG icon asset.
  final String? iconSvgPath;

  /// An Icons.Check icon.
  final IconData? icon;

  /// A custom widget to use as the icon.
  final Widget? iconWidget;

  /// Padding override
  final double? paddingRight;

  /// Padding override
  final double? paddingLeft;

  /// Text wrapper
  final Widget Function(Widget textWidget)? textWrapper;

  const Button({
    super.key,
    this.text,
    this.child,
    this.onTap,
    this.shape = ButtonShape.Default,
    this.size = ButtonSize.Large,
    this.color = ButtonColor.Secondary,
    this.variant = ButtonVariant.Filled,
    this.fullWidth = true,
    this.iconSvgPath,
    this.icon,
    this.iconWidget,
    this.isLoading = false,
    this.skeleton = false,
    this.haptic,
    this.width,
    @deprecated this.height,
    this.textStyle,
    this.alignment,
    this.borderColor,
    this.iconColor,
    this.iconSize,
    this.backgroundColor,
    this.splashColor,
    this.textColor,
    this.suffix,
    this.tapAreaMargin,
    this.paddingRight,
    this.paddingLeft,
    this.textWrapper,
  }) : assert((text != null || child != null) ||
            (text == null && iconSvgPath != null ||
                icon != null ||
                iconWidget != null));

  Button.outlined(
    this.text, {
    this.onTap,
    this.isLoading = false,
    this.color = ButtonColor.Secondary,
    this.variant = ButtonVariant.Outlined,
    this.size = ButtonSize.Large,
    this.icon,
    this.haptic,
    this.fullWidth = true,
    this.skeleton = false,
    this.iconSvgPath,
    this.iconWidget,
    this.shape = ButtonShape.Default,
    this.width,
    @deprecated this.height,
    this.textStyle,
    this.alignment,
    this.borderColor,
    this.iconColor,
    this.iconSize,
    this.backgroundColor,
    this.splashColor,
    this.textColor,
    this.suffix,
    this.tapAreaMargin,
    this.paddingRight,
    this.paddingLeft,
    this.textWrapper,
  }) : child = null;

  Button.primary(
    this.text, {
    this.onTap,
    this.isLoading = false,
    this.color = ButtonColor.Primary,
    this.variant = ButtonVariant.Filled,
    this.size = ButtonSize.Large,
    this.icon,
    this.haptic,
    this.fullWidth = true,
    this.skeleton = false,
    this.iconSvgPath,
    this.iconWidget,
    this.shape = ButtonShape.Default,
    this.width,
    @deprecated this.height,
    this.textStyle,
    this.alignment,
    this.borderColor,
    this.iconColor,
    this.iconSize,
    this.backgroundColor,
    this.splashColor,
    this.textColor,
    this.suffix,
    this.tapAreaMargin,
    this.paddingRight,
    this.paddingLeft,
    this.textWrapper,
  }) : child = null;

  Button.secondary(
    this.text, {
    this.onTap,
    this.isLoading = false,
    this.color = ButtonColor.Secondary,
    this.variant = ButtonVariant.Filled,
    this.size = ButtonSize.Large,
    this.icon,
    this.haptic,
    this.fullWidth = true,
    this.skeleton = false,
    this.iconSvgPath,
    this.iconWidget,
    this.shape = ButtonShape.Default,
    this.width,
    @deprecated this.height,
    this.textStyle,
    this.alignment,
    this.borderColor,
    this.iconColor,
    this.iconSize,
    this.backgroundColor,
    this.splashColor,
    this.textColor,
    this.suffix,
    this.tapAreaMargin,
    this.paddingRight,
    this.paddingLeft,
    this.textWrapper,
  }) : child = null;

  Button.skeleton({
    this.text,
    this.onTap,
    this.isLoading = false,
    this.color = ButtonColor.Primary,
    this.variant = ButtonVariant.Filled,
    this.size = ButtonSize.Large,
    this.icon,
    this.haptic,
    this.fullWidth = true,
    this.skeleton = true,
    this.iconSvgPath,
    this.iconWidget,
    this.shape = ButtonShape.Default,
    this.width,
    @deprecated this.height,
    this.textStyle,
    this.alignment,
    this.borderColor,
    this.iconColor,
    this.iconSize,
    this.backgroundColor,
    this.splashColor,
    this.textColor,
    this.suffix,
    this.tapAreaMargin,
    this.paddingRight,
    this.paddingLeft,
    this.textWrapper,
  }) : child = null;

  Button.text(
    this.text, {
    this.onTap,
    this.isLoading = false,
    this.color = ButtonColor.Secondary,
    this.variant = ButtonVariant.Outlined,
    this.size = ButtonSize.Large,
    this.icon,
    this.haptic,
    this.fullWidth = true,
    this.skeleton = false,
    this.iconSvgPath,
    this.iconWidget,
    this.shape = ButtonShape.Default,
    this.width,
    @deprecated this.height,
    this.textStyle,
    this.alignment,
    this.borderColor = Colors.transparent,
    this.iconColor,
    this.iconSize,
    this.backgroundColor,
    this.splashColor,
    this.textColor,
    this.suffix,
    this.tapAreaMargin,
    this.paddingRight,
    this.paddingLeft,
    this.textWrapper,
  }) : child = null;

  Button.icon({
    this.onTap,
    this.isLoading = false,
    this.color = ButtonColor.Secondary,
    this.variant = ButtonVariant.Outlined,
    this.size = ButtonSize.Large,
    this.icon,
    this.haptic,
    this.fullWidth = false,
    this.skeleton = false,
    this.iconSvgPath,
    this.iconWidget,
    this.shape = ButtonShape.Circled,
    this.width,
    @deprecated this.height,
    this.textStyle,
    this.alignment,
    this.borderColor = Colors.transparent,
    this.iconColor,
    this.iconSize,
    this.backgroundColor,
    this.splashColor,
    this.textColor,
    this.suffix,
    this.tapAreaMargin,
    this.paddingRight,
    this.paddingLeft,
    this.textWrapper,
  })  : text = null,
        child = null,
        assert(iconSvgPath != null || icon != null || iconWidget != null);

  bool get isDisabled => onTap == null || isLoading;

  bool get hasIcon =>
      !isLoading &&
      (iconSvgPath != null ||
          icon != null ||
          iconWidget != null ||
          suffix != null);

  bool get isFullWidth => fullWidth && width == null;

  bool get isIconButton =>
      (iconSvgPath != null || icon != null || iconWidget != null) &&
      text == null &&
      child == null;

  double get getIconSize {
    if (iconSize != null) {
      return iconSize!;
    }

    switch (size) {
      case ButtonSize.ExtraLarge:
        return 28;
      case ButtonSize.Large:
        return 24;
      case ButtonSize.Medium:
        return 18;
      case ButtonSize.Small:
        return 16;
      case ButtonSize.ExtraSmall:
        return 14;
    }
  }

  Widget? getIcon(BuildContext context) {
    if (isLoading) {
      return Container(
        width: isIconButton ? getIconSize : getIconSize / 1.2,
        height: isIconButton ? getIconSize : getIconSize / 1.3,
        margin: EdgeInsets.only(right: isIconButton ? 0 : 6),
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(getIconColor(context)),
        ),
      );
    }

    //TODO
    // if (iconSvgPath != null) {
    //   return Padding(
    //     // NOTE: This padding is added, as the icon is otherwise cut off
    //     padding: EdgeInsets.all(isIconButton ? 7.0 : 0),
    //     child: SvgIcon(
    //       iconSvgPath!,
    //       size: getIconSize,
    //       color: getIconColor(context),
    //     ),
    //   );
    // }

    if (icon != null) {
      return Icon(
        icon,
        size: getIconSize,
        color: getIconColor(context),
      );
    }

    if (iconWidget != null) {
      return iconWidget!;
    }

    return null;
  }

  Widget _maybeWithIcon(BuildContext context) {
    final icon = getIcon(context);

    if (text == null && child == null && icon != null) {
      return SizedBox(width: 30, child: icon);
    }

    final textWidget = getButtonText(context);

    if (icon == null && !hasIcon) {
      return textWidget;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: suffix != null
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        ...(icon != null ? [icon, SizedBox(width: iconSpacing)] : []),
        textWidget,
        ...(suffix != null ? [suffix!] : []),
      ],
    );
  }

  double get iconSpacing {
    switch (size) {
      case ButtonSize.ExtraLarge:
        return 4;
      case ButtonSize.Large:
        return 10;
      case ButtonSize.Medium:
        return 4;
      case ButtonSize.Small:
        return 4;
      case ButtonSize.ExtraSmall:
        return 4;
    }
  }

  /// The typography to use, based on the [size] and [color].
  Widget getButtonText(BuildContext context) {
    if (child != null) {
      return child!;
    }

    TextTypography Function(String,
        {Key? key,
        TextAlign? textAlign,
        TextStyle? textStyle,
        bool center})? textWidget;

    switch (size) {
      case ButtonSize.ExtraLarge:
      case ButtonSize.Large:
        textWidget = TextTypography.bodyLarge;
        break;
      case ButtonSize.Medium:
        textWidget = TextTypography.body;
        break;
      case ButtonSize.Small:
        textWidget = TextTypography.bodySmall;
        break;
      case ButtonSize.ExtraSmall:
        textWidget = TextTypography.bodyExtraSmall;
        break;
    }

    final widget = textWidget(
      text!,
      textStyle:
          TextStyle(color: textColor ?? getForegroundColor(context), height: 0)
              .merge(textStyle),
      center: true,
    );

    if (textWrapper != null) {
      return textWrapper!(widget);
    }

    return widget;
  }

  /// Size of the button, based on the [size]
  Size getSize() {
    final buttonHeight = BUTTON_HEIGHTS[size]!;

    if (isIconButton) {
      return Size(buttonHeight, buttonHeight);
    }

    final double buttonWidth = isFullWidth ? double.infinity : (width ?? 0);

    return Size(buttonWidth, height ?? buttonHeight);
  }

  /// Get the background color of the button, based on the [color] and [variant]
  Color getBackgroundColor(BuildContext context) {
    if (backgroundColor != null) {
      return backgroundColor!;
    }

    if (variant == ButtonVariant.Outlined) {
      return Colors.transparent;
    }

    switch (color) {
      case ButtonColor.White:
      case ButtonColor.Primary:
        return context.colors.scheme.primary;
      case ButtonColor.Secondary:
        return context.colors.scheme.secondary;
      case ButtonColor.Transparent:
        return context.colors.disabled.withOpacity(0.5);
    }
  }

  Color getIconColor(BuildContext context) {
    return iconColor ?? getForegroundColor(context);
  }

  /// Get the text color of the button, based on the [color] and [variant]
  Color getForegroundColor(BuildContext context) {
    if (isDisabled) {
      if ([ButtonVariant.Filled, ButtonVariant.FilledWithStroke]
          .contains(variant)) {
        return context.colors.disabled;
      }

      return context.colors.disabled;
    }

    // if (variant == ButtonVariant.Outlined) {
    //   return color != ButtonVariant.Transparent ? context.colors.scheme.primary : Colors.white;
    // }

    if (variant == ButtonVariant.Outlined) {
      if (color == ButtonColor.Primary) {
        return context.colors.scheme.primary;
      } else if (color == ButtonColor.White) {
        return context.colors.scheme.onBackground;
      }

      return context.colors.scheme.secondary;
    }

    switch (color) {
      case ButtonColor.Primary:
        return context.colors.scheme.onPrimary;
      case ButtonColor.Secondary:
        return context.colors.scheme.onSecondary;
      case ButtonColor.Transparent:
      case ButtonColor.White:
        return context.colors.scheme.onBackground;
    }
  }

  /// Get color when button is disabled
  Color? getDisabledBackgroundColor(BuildContext context) {
    if (variant == ButtonVariant.Outlined) {
      return Colors.transparent;
    }

    if (isDisabled) {
      return context.colors.disabled.withOpacity(0.5);
    }

    return null;
  }

  Color getBorderColor(BuildContext context) {
    final Color? harcodedBorderColor = borderColor;
    Color? theBorderColor;

    if (harcodedBorderColor != null) {
      theBorderColor = harcodedBorderColor;
    }

    if (theBorderColor == null && color == ButtonColor.Transparent) {
      theBorderColor = Colors.transparent;
    }

    theBorderColor ??= getForegroundColor(context);

    if (variant == ButtonVariant.Outlined && harcodedBorderColor == null) {
      if (color == ButtonColor.Primary) {
        theBorderColor = getForegroundColor(context).withOpacity(0.3);
      } else {
        theBorderColor = context.colors.scheme.secondary.withOpacity(0.3);
      }
    }

    return theBorderColor;
  }

  /// Get the BorderSide of the button, based on the [color] and [variant]
  BorderSide getBorderSide(BuildContext context) {
    if (variant == ButtonVariant.Outlined) {
      return BorderSide(color: getBorderColor(context), width: 1);
    }

    if (variant == ButtonVariant.FilledWithStroke) {
      return BorderSide(color: context.colors.scheme.onBackground, width: 1);
    }

    return BorderSide(color: borderColor ?? Colors.transparent, width: 1);
  }

  BorderRadiusGeometry getBorderRadius(BuildContext context) {
    if (shape == ButtonShape.Circled) {
      return BorderRadius.circular(30);
    }

    switch (size) {
      case ButtonSize.ExtraSmall:
        return BorderRadius.circular(4);
      default:
        // TODO: get default button border radius from theme
        return BorderRadius.circular(8);
    }
  }

  void playHaptic() {
    switch (haptic) {
      case HapticFeedbackType.HEAVY:
        HapticFeedback.heavyImpact();
        break;
      case HapticFeedbackType.NONE:
        break;
      case HapticFeedbackType.MEDIUM:
        HapticFeedback.mediumImpact();
        break;
      case HapticFeedbackType.LIGHT:
        HapticFeedback.lightImpact();
        break;
      default:
        playHapticFeedback();
        break;
    }
  }

  Size getSkeletonSize() {
    double width = 0;
    double height = 0;
    if (!isFullWidth) {
      width = widthBasedOnText();
      height = getSize().height;
    } else {
      final size = getSize();
      width = size.width;
      height = size.height;
    }

    if (hasIcon) {
      width += getIconSize + iconSpacing;
    }

    return Size(width, height);
  }

  double widthBasedOnText() {
    if (text?.isEmpty == true || text == null) {
      final buttonWidth = getSize().width;

      return buttonWidth.isInfinite ? 50 : buttonWidth;
    }

    switch (size) {
      case ButtonSize.Large:
      case ButtonSize.ExtraLarge:
        return text!.length * 14;
      case ButtonSize.Medium:
        return text!.length * 12.85;
      case ButtonSize.Small:
        return text!.length * 11.5;
      case ButtonSize.ExtraSmall:
        return text!.length * 10.5;
    }
  }

  EdgeInsetsGeometry? getPadding(BuildContext context) {
    if (isIconButton) {
      return EdgeInsets.zero;
    }

    EdgeInsetsGeometry padding = Theme.of(context).buttonTheme.padding;

    if (paddingRight != null) {
      padding = padding.add(EdgeInsets.only(right: paddingRight!));
    }

    if (paddingLeft != null) {
      padding = padding.add(EdgeInsets.only(left: paddingLeft!));
    }

    return padding;
  }

  @override
  Widget build(BuildContext context) {
    final onPressed = onTap != null && !isLoading
        ? () {
            playHaptic();
            onTap!();
          }
        : null;

    if (skeleton) {
      return SizedBox(
        height: getSkeletonSize().height + 2,
        width: getSkeletonSize().width,
        child: Stack(
          children: [
            SkeletonLine(
              style: SkeletonLineStyle(
                height: getSkeletonSize().height,
                width: getSkeletonSize().width,
                borderRadius: getBorderRadius(context),
              ),
            ),
          ],
        ),
      );
    }

    final button = SizedBox(
      height: getSize().height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          alignment: alignment,
          minimumSize: getSize(),
          fixedSize: isIconButton ? getSize() : null,
          backgroundColor: getBackgroundColor(context),
          disabledBackgroundColor: getDisabledBackgroundColor(context),
          shadowColor: Colors.transparent,
          side: getBorderSide(context),
          shape: RoundedRectangleBorder(borderRadius: getBorderRadius(context)),
          padding: getPadding(context),
          foregroundColor: splashColor ?? context.colors.disabled,
        ),
        child: _maybeWithIcon(context),
      ),
    );

    if (tapAreaMargin != null && !isIconButton) {
      return GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.all(tapAreaMargin!),
          child: button,
        ),
      );
    }

    return button;
  }
}
