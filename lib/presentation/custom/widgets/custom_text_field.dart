import 'package:base_project/util/input_formatter.dart';

import '../../../util/core_export.dart';

/// Text field with title on top. Set [isPassword] to get the show/hide icon.
class CustomTextField extends StatefulWidget {
  final String hintText;
  final String titleText;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final bool readOnly;
  final bool isEnabled;
  final bool isPassword;
  final bool isShowCount;
  final bool isTitleVisible;
  final bool autofocus;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? fillColor;
  final double borderRadius;
  final String? errorText;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.titleText,
    required this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    this.readOnly = false,
    this.isEnabled = true,
    this.isPassword = false,
    this.isShowCount = false,
    this.isTitleVisible = true,
    this.autofocus = false,
    this.suffixIcon,
    this.prefixIcon,
    this.fillColor,
    this.borderRadius = 100,
    this.errorText,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> with TextStyles {
  bool _obscureText = true;

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 1),
        borderRadius: BorderRadius.circular(widget.borderRadius.r),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.isTitleVisible) ...[
          Text(widget.titleText, style: dmSans400(color: ColorName.neutral20)),
          6.h.verticalSpace,
        ],
        TextField(
          autofocus: widget.autofocus,
          enabled: widget.isEnabled,
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          maxLines: widget.isPassword ? 1 : widget.maxLines,
          minLines: widget.minLines,
          inputFormatters: widget.inputFormatters ?? [NoLeadingSpaceFormatter()],
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          onChanged: widget.onChanged,
          onSubmitted: widget.onSubmitted,
          controller: widget.controller,
          style: dmSans500(color: ColorName.neutral20),
          cursorColor: ColorName.neutral20,
          maxLength: widget.maxLength,
          obscureText: widget.isPassword && _obscureText,
          decoration: InputDecoration(
            counter: widget.isShowCount ? null : const Offstage(),
            fillColor: widget.fillColor,
            filled: widget.fillColor != null,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            hintText: widget.hintText,
            hintStyle: dmSans500(color: ColorName.neutral80),
            errorText: widget.errorText,
            errorStyle: dmSans400(size: 12, color: ColorName.red),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: (_obscureText ? Assets.drawables.icHidePwd : Assets.drawables.icShowPwd)
                        .svg(width: 24.w, height: 24.h),
                    onPressed: () => setState(() => _obscureText = !_obscureText),
                  )
                : widget.suffixIcon,
            border: _border(ColorName.neutral80),
            enabledBorder: _border(ColorName.neutral80),
            focusedBorder: _border(ColorName.neutral20),
            disabledBorder: _border(ColorName.neutral95),
            errorBorder: _border(ColorName.red),
            focusedErrorBorder: _border(ColorName.red),
          ),
        ),
      ],
    );
  }
}
