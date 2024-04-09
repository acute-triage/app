import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';

enum TypographyVariant {
  display,
  headline,
  body,
}

enum TypographySize {
  large,
  medium,
  small,
  extraSmall,
}

class TextTypography extends StatelessWidget {
  final String text;
  final TypographyVariant variant;
  final TypographySize size;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;
  final double? textScaleFactor;
  final FontWeight? fontWeight;
  final bool faded;
  final bool center;

  /// If set, it will try to fit the text within the specified [minFontSize] and [maxFontSize], using AutoSizeText.
  final double? minFontSize;

  /// If set, it will try to fit the text within the specified [minFontSize] and [maxFontSize], using AutoSizeText.
  final double? maxFontSize;

  bool get usingAutoSizeText => minFontSize != null || maxFontSize != null;

  const TextTypography(
    this.text, {
    super.key,
    this.variant = TypographyVariant.body,
    this.size = TypographySize.medium,
    this.textStyle,
    this.textAlign,
    this.color,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.minFontSize,
    this.maxFontSize,
    this.textScaleFactor,
    this.fontWeight,
    this.faded = false,
    this.center = false,
  }) : assert(
          !(variant != TypographyVariant.body &&
              size == TypographySize.extraSmall),
          'ExtraSmall size is only available for Body variant',
        );

  const TextTypography.displaySmall(
    this.text, {
    super.key,
    this.textStyle,
    this.textAlign,
    this.color,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.minFontSize,
    this.maxFontSize,
    this.textScaleFactor,
    this.fontWeight,
    this.faded = false,
    this.center = false,
  })  : variant = TypographyVariant.display,
        size = TypographySize.small;

  const TextTypography.display(
    this.text, {
    super.key,
    this.textStyle,
    this.textAlign,
    this.color,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.minFontSize,
    this.maxFontSize,
    this.textScaleFactor,
    this.fontWeight,
    this.faded = false,
    this.center = false,
    this.size = TypographySize.medium,
  }) : variant = TypographyVariant.display;

  const TextTypography.displayLarge(
    this.text, {
    super.key,
    this.textStyle,
    this.textAlign,
    this.color,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.minFontSize,
    this.maxFontSize,
    this.textScaleFactor,
    this.fontWeight,
    this.faded = false,
    this.center = false,
  })  : variant = TypographyVariant.display,
        size = TypographySize.large;

  const TextTypography.headlineSmall(
    this.text, {
    super.key,
    this.textStyle,
    this.textAlign,
    this.color,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.minFontSize,
    this.maxFontSize,
    this.textScaleFactor,
    this.fontWeight,
    this.faded = false,
    this.center = false,
  })  : variant = TypographyVariant.headline,
        size = TypographySize.small;

  const TextTypography.headlineMedium(
    this.text, {
    super.key,
    this.textStyle,
    this.textAlign,
    this.color,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.minFontSize,
    this.maxFontSize,
    this.textScaleFactor,
    this.fontWeight,
    this.faded = false,
    this.center = false,
  })  : variant = TypographyVariant.headline,
        size = TypographySize.medium;

  const TextTypography.headline(
    this.text, {
    super.key,
    this.textStyle,
    this.textAlign,
    this.color,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.minFontSize,
    this.maxFontSize,
    this.textScaleFactor,
    this.fontWeight,
    this.faded = false,
    this.center = false,
    this.size = TypographySize.large,
  }) : variant = TypographyVariant.headline;

  const TextTypography.bodyExtraSmall(
    this.text, {
    super.key,
    this.textStyle,
    this.textAlign,
    this.color,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.minFontSize,
    this.maxFontSize,
    this.textScaleFactor,
    this.fontWeight,
    this.faded = false,
    this.center = false,
  })  : variant = TypographyVariant.body,
        size = TypographySize.extraSmall;

  const TextTypography.bodySmall(
    this.text, {
    super.key,
    this.textStyle,
    this.textAlign,
    this.color,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.minFontSize,
    this.maxFontSize,
    this.textScaleFactor,
    this.fontWeight,
    this.faded = false,
    this.center = false,
  })  : variant = TypographyVariant.body,
        size = TypographySize.small;

  const TextTypography.body(
    this.text, {
    super.key,
    this.textStyle,
    this.textAlign,
    this.color,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.minFontSize,
    this.maxFontSize,
    this.textScaleFactor,
    this.fontWeight,
    this.faded = false,
    this.center = false,
    this.size = TypographySize.medium,
  }) : variant = TypographyVariant.body;

  const TextTypography.bodyLarge(
    this.text, {
    super.key,
    this.textStyle,
    this.textAlign,
    this.color,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.minFontSize,
    this.maxFontSize,
    this.textScaleFactor,
    this.fontWeight,
    this.faded = false,
    this.center = false,
  })  : variant = TypographyVariant.body,
        size = TypographySize.large;

  const TextTypography.bodyLargeFaded(
    this.text, {
    super.key,
    this.textStyle,
    this.textAlign,
    this.color,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.minFontSize,
    this.maxFontSize,
    this.textScaleFactor,
    this.fontWeight,
    this.faded = true,
    this.center = false,
  })  : variant = TypographyVariant.body,
        size = TypographySize.large;

  const TextTypography.caption(
    this.text, {
    super.key,
    this.textStyle,
    this.textAlign,
    this.color,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.minFontSize,
    this.maxFontSize,
    this.textScaleFactor,
    this.fontWeight,
    this.faded = true,
    this.center = false,
  })  : variant = TypographyVariant.body,
        size = TypographySize.small;

  @override
  Widget build(BuildContext context) {
    final align = center ? TextAlign.center : textAlign;

    final style =
        _getTextThemeFromTypography(context, variant, size).merge(textStyle);

    final fontStyle = style.copyWith(
      color: color ?? (faded ? style.color?.withOpacity(0.5) : style.color),
      overflow: overflow,
      fontWeight: fontWeight,
    );

    if (usingAutoSizeText) {
      return AutoSizeText(
        text,
        style: fontStyle,
        textAlign: align,
        maxLines: maxLines,
        minFontSize: minFontSize ?? 12,
        maxFontSize: maxFontSize ?? double.infinity,
        textScaleFactor: textScaleFactor,
        overflow: overflow,
      );
    }

    return Text(
      text,
      style: fontStyle,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
      textHeightBehavior: const TextHeightBehavior(
        applyHeightToFirstAscent: false,
        applyHeightToLastDescent: false,
      ),
      textScaler:
          textScaleFactor != null ? TextScaler.linear(textScaleFactor!) : null,
    );
  }
}

TextStyle _getTextThemeFromTypography(
    BuildContext context, TypographyVariant variant, TypographySize size) {
  final textTheme = context.textStyles;

  switch (variant) {
    case TypographyVariant.display:
      switch (size) {
        case TypographySize.large:
          return textTheme.displayLarge;
        case TypographySize.medium:
          return textTheme.displayMedium;
        case TypographySize.small:
          return textTheme.displaySmall;
        default:
          throw Exception('Invalid size for Display variant');
      }
    case TypographyVariant.headline:
      switch (size) {
        case TypographySize.large:
          return textTheme.headlineLarge;
        case TypographySize.medium:
          return textTheme.headlineMedium;
        case TypographySize.small:
          return textTheme.headlineSmall;
        default:
          throw Exception('Invalid size for Headline variant');
      }
    case TypographyVariant.body:
      switch (size) {
        case TypographySize.large:
          return textTheme.bodyLarge;
        case TypographySize.medium:
          return textTheme.bodyMedium;
        case TypographySize.small:
          return textTheme.bodySmall;
        // case TypographySize.ExtraSmall:
        //   return Theme.of(context).extension<ExtraSmallBodyTypography>()!.textStyle!;
        default:
          throw Exception('Invalid size for Body variant');
      }
  }
}
