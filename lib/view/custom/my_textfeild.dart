
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../config/constants/app_colors.dart';
import '../../config/constants/app_fonts.dart';
import 'my_text_widget.dart';

class MyTextField extends StatefulWidget {
  final String? label, hint;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool? isObSecure, haveLabel, isReadOnly;
  final double? marginBottom, radius;
  final int? maxLines;
  final double? labelSize, hintsize;
  final FocusNode? focusNode;
  final Color? filledColor, focusedFillColor, hintColor, labelColor, borderColor;
  final Widget? prefix, suffix;
  final FontWeight? labelWeight, hintWeight;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final double? height;
  final double? width;

  const MyTextField({
    super.key,
    this.controller,
    this.hint,
    this.label,
    this.onChanged,
    this.isObSecure = false,
    this.marginBottom = 8.0,
    this.maxLines = 1,
    this.filledColor,
    this.focusedFillColor,
    this.hintColor,
    this.labelColor,
    this.borderColor,
    this.haveLabel = true,
    this.labelSize,
    this.hintsize,
    this.prefix,
    this.suffix,
    this.labelWeight,
    this.hintWeight,
    this.keyboardType,
    this.isReadOnly,
    this.onTap,
    this.focusNode,
    this.radius,
    this.height = 62,
    this.width,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late FocusNode _focusNode;
  late TextEditingController _controller;

  bool _isOwnFocusNode = false;
  bool _isOwnController = false;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();

    _isOwnFocusNode = widget.focusNode == null;
    _isOwnController = widget.controller == null;

    _focusNode = widget.focusNode ?? FocusNode();
    _controller = widget.controller ?? TextEditingController();

    _focusNode.addListener(_handleUpdate);
    _controller.addListener(_handleUpdate);

    _isFocused = _focusNode.hasFocus;
  }

  void _handleUpdate() {
    if (mounted) {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    }
  }

  bool get _hasText => _controller.text.trim().isNotEmpty;

  @override
  void dispose() {
    _focusNode.removeListener(_handleUpdate);
    _controller.removeListener(_handleUpdate);

    if (_isOwnFocusNode) _focusNode.dispose();
    if (_isOwnController) _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(widget.radius ?? 18);

    return Padding(
      padding: EdgeInsets.only(bottom: widget.marginBottom ?? 0),
      child: SizedBox(
        height: widget.height,
        width: widget.width ?? double.infinity,
        child: TextFormField(
          controller: _controller,
          focusNode: _focusNode,
          onTap: widget.onTap,
          onChanged: widget.onChanged,
          readOnly: widget.isReadOnly ?? false,
          keyboardType: widget.keyboardType,
          maxLines: 1,
          textInputAction: TextInputAction.next,
          obscureText: widget.isObSecure ?? false,
          obscuringCharacter: '*',
          cursorColor: kBlueColor,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: AppFonts.satoshi,
            color: _isFocused ? kBlueColor : kBlackColor,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.filledColor ?? kQuaternaryColor,

            hintText: !_isFocused && !_hasText ? (widget.hint ?? '') : null,
            hintStyle: TextStyle(
              fontSize: widget.hintsize ?? 16,
              fontFamily: AppFonts.satoshi,
              color: widget.hintColor ?? const Color(0xFFAFAFAF),
              fontWeight: widget.hintWeight ?? FontWeight.w600,
            ),

            labelText: (_isFocused || _hasText) ? (widget.label ?? '') : null,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelStyle: TextStyle(
              fontSize: widget.labelSize ?? 14,
              fontFamily: AppFonts.satoshi,
              color: _isFocused
                  ? const Color(0xFF16C6F3)
                  : (widget.labelColor ?? kBlackColor),
              fontWeight: widget.labelWeight ?? FontWeight.w700,
            ),
            floatingLabelStyle: TextStyle(
              fontSize: widget.labelSize ?? 14,
              fontFamily: AppFonts.satoshi,
              color: const Color(0xFF16C6F3),
              fontWeight: widget.labelWeight ?? FontWeight.w700,
            ),

            prefixIcon: widget.prefix,
            suffixIcon: widget.suffix,

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 18,
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: radius,
              borderSide: BorderSide(
                color: widget.borderColor ?? const Color(0xFFD5D5D5),
                width: 1.2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: radius,
              borderSide: const BorderSide(
                color: Color(0xFF16C6F3),
                width: 1.4,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: radius,
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.2,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: radius,
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}





class MyTextField2 extends StatefulWidget {
  String? label, hint;
  TextEditingController? controller;
  ValueChanged<String>? onChanged;
  bool? isObSecure, haveLabel, isReadOnly;
  double? marginBottom, radius;
  int? maxLines;
  double? labelSize, hintsize;
  FocusNode? focusNode;
  Color? filledColor, focusedFillColor, hintColor, labelColor;
  Widget? prefix, suffix;
  FontWeight? labelWeight, hintWeight;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final double? height;
  final double? Width;

  MyTextField2({
    Key? key,
    this.controller,
    this.hint,
    this.label,
    this.onChanged,
    this.isObSecure = false,
    this.marginBottom = 16.0,
    this.maxLines = 1,
    this.filledColor,
    this.focusedFillColor,
    this.hintColor,
    this.labelColor,
    this.haveLabel = true,
    this.labelSize,
    this.hintsize,
    this.prefix,
    this.suffix,
    this.labelWeight,
    this.hintWeight,
    this.keyboardType,
    this.isReadOnly,
    this.onTap,
    this.focusNode,
    this.radius,
    this.height = 48,
    this.Width,
  }) : super(key: key);

  @override
  State<MyTextField2> createState() => _MyTextField2State();
}

class _MyTextField2State extends State<MyTextField2> {
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode?.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = widget.focusNode?.hasFocus ?? false;
    });
  }

  @override
  void dispose() {
    widget.focusNode?.removeListener(_onFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        FadeEffect(
          duration: Duration(milliseconds: 500),
        ),
        MoveEffect(
          curve: Curves.ease,
          duration: Duration(milliseconds: 500),
        ),
      ],
      child: Padding(
        padding: EdgeInsets.only(bottom: widget.marginBottom ?? 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.radius ?? 10),
                color: Colors.white,
              ),
              child: TextFormField(
                focusNode: widget.focusNode,
                onTap: widget.onTap,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: widget.keyboardType,
                cursorColor: kBlueColor,
                maxLines: widget.maxLines,
                readOnly: widget.isReadOnly ?? false,
                controller: widget.controller,
                onChanged: widget.onChanged,
                textInputAction: TextInputAction.next,
                obscureText: widget.isObSecure ?? false,
                obscuringCharacter: '*',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFonts.satoshi,
                  decoration: TextDecoration.none,
                  color: kBlueColor,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kQuaternaryColor,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kBlueColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(widget.radius ?? 10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius ?? 10),
                    borderSide: BorderSide(
                      color: kBorderColor,
                      width: 1,
                    ),
                  ),
                  prefixIcon: widget.prefix,
                  suffixIcon: widget.suffix,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: widget.maxLines! > 1 ? 15 : 0,
                  ),
                  labelText: widget.label ?? '',
                  labelStyle: TextStyle(
                    color: kBlueColor,
                    fontSize: widget.labelSize ?? 12,
                    fontFamily: AppFonts.satoshi,
                    fontWeight: widget.labelWeight ?? FontWeight.w600,
                  ),
                  hintText: widget.hint != null ? widget.hint!.tr : '',
                  hintStyle: TextStyle(
                    fontSize: widget.hintsize ?? 17,
                    fontFamily: AppFonts.satoshi,
                    color: widget.hintColor ?? kText2Color,
                    fontWeight: widget.hintWeight ?? FontWeight.w400,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius ?? 10),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius ?? 10),
                    borderSide: BorderSide(
                      width: 1,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}