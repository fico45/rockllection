import 'package:flutter/material.dart';
import 'package:flutter_template/theme/theme_data.dart';
import 'package:flutter_template/utils/consts.dart';
import 'package:flutter_template/utils/extensions.dart';

enum ButtonType {
  primary,
  secondary,
  error,
  success,
  warning,
  neutral,
  transparent,
  filter,
  disabled
}

class Button extends StatefulWidget {
  const Button({
    required this.child,
    this.leadingIcon,
    this.headingWidget,
    this.type = ButtonType.primary,
    this.onPressed,
    this.styleOverride,
    this.childStyleOverride,
    super.key,
  });
  final String child;
  final IconData? leadingIcon;
  final Widget? headingWidget;
  final ButtonType type;
  final TextStyle? childStyleOverride;

  final void Function()? onPressed;
  final ButtonStyle? styleOverride;
  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: widget.onPressed,
      style: widget.onPressed == null
          ? ButtonType.disabled.style
          : widget.styleOverride ?? widget.type.style,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment:
            (widget.leadingIcon == null && widget.headingWidget == null)
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
        children: [
          if (widget.leadingIcon != null)
            Icon(widget.leadingIcon, size: 16, color: widget.type.lightColor),
          if (widget.leadingIcon != null)
            const SizedBox(
              width: 6,
            ),
          Expanded(
            child: Padding(
              padding: MyFacts.padding.buttonContentPadding,
              child: Text(
                widget.child,
                textAlign: TextAlign.center,
                softWrap: true,
                style: widget.childStyleOverride ??
                    context.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: widget.onPressed == null
                          ? ButtonType.disabled.lightColor
                          : widget.type.lightColor,
                    ),
              ),
            ),
          ),
          if (widget.headingWidget != null)
            const SizedBox(
              width: 6,
            ),
          if (widget.headingWidget != null) widget.headingWidget!
        ],
      ),
    );
  }
}

extension LightButtonColor on ButtonType {
  Color get lightColor {
    switch (this) {
      case ButtonType.primary:
        return CustomTheme.light.colorScheme.onPrimary;
      case ButtonType.secondary:
        return CustomTheme.light.colorScheme.onSecondary;
      case ButtonType.warning:
        return CustomTheme.light.colorScheme.onTertiary;
      case ButtonType.error:
        return CustomTheme.light.colorScheme.background;
      case ButtonType.neutral:
        return CustomTheme.light.colorScheme.tertiary;
      case ButtonType.transparent:
        return CustomTheme.light.colorScheme.onSurface;
      case ButtonType.filter:
        return CustomTheme.light.colorScheme.onBackground;
      case ButtonType.disabled:
        return CustomTheme.light.colorScheme.onBackground.withOpacity(0.6);
      default:
        return CustomTheme.light.colorScheme.background;
    }
  }
}

extension DarkButtonColor on ButtonType {
  Color get darkColor {
    switch (this) {
      case ButtonType.primary:
        return CustomTheme.dark.colorScheme.onPrimary;
      case ButtonType.secondary:
        return CustomTheme.dark.colorScheme.onSecondary;
      case ButtonType.warning:
        return CustomTheme.dark.colorScheme.onTertiary;
      case ButtonType.error:
        return CustomTheme.dark.colorScheme.background;
      case ButtonType.neutral:
        return CustomTheme.dark.colorScheme.tertiary;
      case ButtonType.transparent:
        return CustomTheme.dark.colorScheme.onSurface;
      case ButtonType.filter:
        return CustomTheme.dark.colorScheme.onBackground;
      case ButtonType.disabled:
        return CustomTheme.dark.colorScheme.onBackground.withOpacity(0.6);
      default:
        return CustomTheme.dark.colorScheme.background;
    }
  }
}

extension Style on ButtonType {
  ButtonStyle get style {
    switch (this) {
      case ButtonType.primary:
        return ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            CustomTheme.light.colorScheme.primary,
          ),
          side: MaterialStateProperty.all<BorderSide>(
            const BorderSide(
              color: Colors.transparent,
            ),
          ),
          overlayColor: MaterialStateProperty.all<Color>(
            CustomTheme.light.colorScheme.primary.withOpacity(0.4),
          ),
          splashFactory: InkRipple.splashFactory,
        );

      case ButtonType.secondary:
        return ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            CustomTheme.light.colorScheme.secondary,
          ),
          side: MaterialStateProperty.all<BorderSide>(
            const BorderSide(
              color: Colors.transparent,
            ),
          ),
          overlayColor: MaterialStateProperty.all<Color>(
            CustomTheme.light.colorScheme.secondary.withOpacity(0.4),
          ),
          splashFactory: InkRipple.splashFactory,
        );
      case ButtonType.warning:
        return ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            CustomTheme.light.colorScheme.tertiary,
          ),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(
              color: CustomTheme.light.colorScheme.tertiary,
            ),
          ),
          overlayColor: MaterialStateProperty.all<Color>(
            CustomTheme.light.colorScheme.primary.withOpacity(0.4),
          ),
          splashFactory: InkRipple.splashFactory,
        );
      case ButtonType.error:
        return ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            CustomTheme.light.colorScheme.error,
          ),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(
              color: CustomTheme.light.colorScheme.error,
            ),
          ),
          overlayColor: MaterialStateProperty.all<Color>(
            CustomTheme.light.colorScheme.error.withOpacity(0.4),
          ),
          splashFactory: InkRipple.splashFactory,
        );
      case ButtonType.neutral:
        return ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xFFFFFFFF),
          ),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(
              color: CustomTheme.light.colorScheme.onSecondary,
            ),
          ),
          overlayColor: MaterialStateProperty.all<Color>(
            CustomTheme.light.colorScheme.primary.withOpacity(0.4),
          ),
          splashFactory: InkRipple.splashFactory,
        );

      case ButtonType.transparent:
        return ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.transparent,
          ),
          side: MaterialStateProperty.all<BorderSide>(
            const BorderSide(
              color: Colors.transparent,
            ),
          ),
          overlayColor: MaterialStateProperty.all<Color>(
            CustomTheme.light.colorScheme.surfaceVariant.withOpacity(0.2),
          ),
          splashFactory: InkRipple.splashFactory,
        );
      case ButtonType.filter:
        return ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xFFFFFFFF),
          ),
          side: MaterialStateProperty.all<BorderSide>(
            const BorderSide(
              color: Colors.transparent,
            ),
          ),
          overlayColor: MaterialStateProperty.all<Color>(
            CustomTheme.light.colorScheme.primary.withOpacity(0.4),
          ),
          splashFactory: InkRipple.splashFactory,
        );

      case ButtonType.disabled:
        return ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.grey.shade300,
          ),
          side: MaterialStateProperty.all<BorderSide>(
            const BorderSide(
              color: Colors.transparent,
            ),
          ),
          overlayColor: MaterialStateProperty.all<Color>(
            CustomTheme.light.colorScheme.primary.withOpacity(0.4),
          ),
          splashFactory: InkRipple.splashFactory,
        );

      default:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          disabledBackgroundColor: Colors.green.withOpacity(0.3),
        );
    }
  }
}
