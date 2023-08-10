import 'package:flooz_challenge/components/pin_code/cursor_painter.dart';
import 'package:flooz_challenge/components/pin_code/pin_theme.dart';
import 'package:flooz_challenge/res/style/app_colors.dart';
import 'package:flooz_challenge/res/style/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';

class FloozPinCodeTextField extends StatefulWidget {
  final BuildContext context;
  final int length;
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onCompleted;
  final ValueChanged<String>? onSubmitted;
  final bool enabled;
  final TextEditingController? controller;
  final PinTheme pinTheme;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final double errorTextSpace;
  final EdgeInsets errorTextMargin;
  final TextDirection errorTextDirection;


  const FloozPinCodeTextField({
    Key? key,
    required this.context,
    required this.length,
    this.controller,
    required this.onChanged,
    this.onCompleted,
    this.enabled = true,
    this.onSubmitted,
    this.pinTheme = const PinTheme.defaults(),
    this.validator,
    this.onSaved,
    this.errorTextSpace = 16,
    this.errorTextDirection = TextDirection.ltr,
    this.errorTextMargin = EdgeInsets.zero,
  }) :
        super(key: key);

  @override
  _FloozPinCodeTextFieldState createState() => _FloozPinCodeTextFieldState();
}

class _FloozPinCodeTextFieldState extends State<FloozPinCodeTextField>
    with TickerProviderStateMixin {
  TextEditingController? _textEditingController;
  FocusNode? _focusNode;
  late List<String> _inputList;
  int _selectedIndex = 0;
  BorderRadius? borderRadius;
  bool _hasBlinked = false;
  late AnimationController _controller;

  late AnimationController _cursorController;

  StreamSubscription<ErrorAnimationType>? _errorAnimationSubscription;
  bool isInErrorMode = false;

  late Animation<Offset> _offsetAnimation;

  late Animation<double> _cursorAnimation;
  PinTheme get _pinTheme => widget.pinTheme;


  TextStyle get _textStyle => AppTextStyles.kH2;

  TextStyle get _hintStyle => _textStyle
      .copyWith(
    color: _pinTheme.disabledColor,
  );

  bool get _hintAvailable => false;

  @override
  void initState() {
    _assignController();
    if (_pinTheme.shape != PinCodeFieldShape.circle &&
        _pinTheme.shape != PinCodeFieldShape.underline) {
      borderRadius = _pinTheme.borderRadius;
    }
    _focusNode =  FocusNode();
    _focusNode!.addListener(() {
      setState(() {});
    });
    _inputList = List<String>.filled(widget.length, "");

    _hasBlinked = true;

    _cursorController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _cursorAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(
      parent: _cursorController,
      curve: Curves.easeIn,
    ));
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(.1, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticIn,
    ));
      _cursorController.repeat();


    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
    if (_textEditingController!.text.isNotEmpty) {
      _setTextToInput(_textEditingController!.text);
    }
    super.initState();
  }
  void _assignController() {
    if (widget.controller == null) {
      _textEditingController = TextEditingController();
    } else {
      _textEditingController = widget.controller;
    }

    _textEditingController?.addListener(() {

      if (isInErrorMode) {
        setState(() => isInErrorMode = false);
      }


      var currentText = _textEditingController!.text;

      if (widget.enabled && _inputList.join("") != currentText) {
        if (currentText.length >= widget.length) {
          if (widget.onCompleted != null) {
            if (currentText.length > widget.length) {
              currentText = currentText.substring(0, widget.length);
            }
            Future.delayed(const Duration(milliseconds: 300),
                    () => widget.onCompleted!(currentText));
          }

           _focusNode!.unfocus();
        }
        widget.onChanged(currentText);
      }

      _setTextToInput(currentText);
    });
  }

  @override
  void dispose() {
      _textEditingController!.dispose();
      _focusNode!.dispose();
    _errorAnimationSubscription?.cancel();

    _cursorController.dispose();

    _controller.dispose();
    super.dispose();
  }

  Color _getColorFromIndex(int index) {
    if (!widget.enabled) {
      return _pinTheme.disabledColor;
    }
    if (((_selectedIndex == index) ||
        (_selectedIndex == index + 1 && index + 1 == widget.length)) &&
        _focusNode!.hasFocus) {
      return _pinTheme.selectedColor;
    } else if (_selectedIndex > index) {
      Color relevantActiveColor = _pinTheme.activeColor;
      if (isInErrorMode) relevantActiveColor = _pinTheme.errorBorderColor;
      return relevantActiveColor;
    }

    Color relevantInActiveColor = _pinTheme.inactiveColor;
    if (isInErrorMode) relevantInActiveColor = _pinTheme.errorBorderColor;
    return relevantInActiveColor;
  }

  Widget _renderPinField({
    @required int? index,
  }) {
    assert(index != null);

    bool showObscured =
        (_hasBlinked) ||
        index != _inputList.where((x) => x.isNotEmpty).length - 1;


    if (_inputList[index!].isEmpty && _hintAvailable) {
      return Text(
        '',
        key: ValueKey(_inputList[index]),
        style: _hintStyle,
      );
    }

    final text =
    _inputList[index].isNotEmpty && showObscured
        ? '●'
        : _inputList[index];
    return  Text(
      text,
      key: ValueKey(_inputList[index]),
      style: _textStyle,
    );
  }

  Color _getFillColorFromIndex(int index) {
    if (!widget.enabled) {
      return _pinTheme.disabledColor;
    }
    if (((_selectedIndex == index) ||
        (_selectedIndex == index + 1 && index + 1 == widget.length)) &&
        _focusNode!.hasFocus) {
      return _pinTheme.selectedFillColor;
    } else if (_selectedIndex > index) {
      return _pinTheme.activeFillColor;
    }
    return _pinTheme.inactiveFillColor;
  }

  Widget buildChild(int index) {
    if (((_selectedIndex == index) ||
        (_selectedIndex == index + 1 && index + 1 == widget.length)) &&
        _focusNode!.hasFocus) {
      var cursorColor = AppColors.black;
      final cursorHeight = _textStyle.fontSize! + 8;

      if ((_selectedIndex == index + 1 && index + 1 == widget.length)) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: _textStyle.fontSize! / 1.5),
                child: FadeTransition(
                  opacity: _cursorAnimation,
                  child: CustomPaint(
                    size: Size(0, cursorHeight),
                    painter: CursorPainter(
                      cursorColor: cursorColor,
                      cursorWidth: 2,
                    ),
                  ),
                ),
              ),
            ),
            _renderPinField(
              index: index,
            ),
          ],
        );
      } else {
        return Center(
          child: FadeTransition(
            opacity: _cursorAnimation,
            child: CustomPaint(
              size: Size(0, cursorHeight),
              painter: CursorPainter(
                cursorColor: cursorColor,
                cursorWidth: 2,
              ),
            ),
          ),
        );
      }
    }
    return _renderPinField(
      index: index,
    );
  }


  @override
  Widget build(BuildContext context) {
    var textField = Directionality(
      textDirection: widget.errorTextDirection,
      child: Padding(
        padding: widget.errorTextMargin,
        child: TextFormField(
          textInputAction: TextInputAction.done,
          controller: _textEditingController,
          focusNode: _focusNode,
          enabled: widget.enabled,
          autofillHints:  widget.enabled
              ? <String>[AutofillHints.oneTimeCode]
              : null,
          autofocus: true,
          autocorrect: false,
          keyboardType: TextInputType.number,
          validator: widget.validator,
          onSaved: widget.onSaved,
          autovalidateMode: AutovalidateMode.disabled,
          inputFormatters: [
            LengthLimitingTextInputFormatter(
              widget.length,
            ),
          ],
          onFieldSubmitted: widget.onSubmitted,
          enableInteractiveSelection: false,
          showCursor: false,
          cursorWidth: 0.01,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(0),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          style: const TextStyle(
            color: Colors.transparent,
            height: .01,
            fontSize: kIsWeb
                ? 1
                : 0.01,
          ),
        ),
      ),
    );

    return SlideTransition(
      position: _offsetAnimation,
      child: SizedBox(
        height: (widget.validator == null)
            ? widget.pinTheme.fieldHeight
            : widget.pinTheme.fieldHeight + widget.errorTextSpace,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            AbsorbPointer(
              absorbing: true,
              child: AutofillGroup(
                onDisposeAction: AutofillContextAction.commit,
                child: textField,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  _onFocus();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _generateFields(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _generateFields() {
    var result = <Widget>[];
    for (int i = 0; i < widget.length; i++) {
      result.add(
        Container(
            padding: _pinTheme.fieldOuterPadding,
            child: AnimatedContainer(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 300),
              width: _pinTheme.fieldWidth,
              height: _pinTheme.fieldHeight,
              decoration: BoxDecoration(
                color:  _getFillColorFromIndex(i),
                shape: _pinTheme.shape == PinCodeFieldShape.circle
                    ? BoxShape.circle
                    : BoxShape.rectangle,
                borderRadius: borderRadius,
                border: _pinTheme.shape == PinCodeFieldShape.underline
                    ? Border(
                  bottom: BorderSide(
                    color: _getColorFromIndex(i),
                    width: _pinTheme.borderWidth,
                  ),
                )
                    : Border.all(
                  color: _getColorFromIndex(i),
                  width: _pinTheme.borderWidth,
                ),
              ),
              child: Center(
                child: AnimatedSwitcher(
                  switchInCurve: Curves.easeInOut,
                  switchOutCurve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                  },
                  child: buildChild(i),
                ),
              ),
            )),
      );
    }
    return result;
  }

  void _onFocus() {
      if (_focusNode!.hasFocus &&
          MediaQuery.of(widget.context).viewInsets.bottom == 0) {
        _focusNode!.unfocus();
        Future.delayed(
            const Duration(microseconds: 1), () => _focusNode!.requestFocus());
      } else {
        _focusNode!.requestFocus();
      }
  }

  void _setTextToInput(String data) async {
    var replaceInputList = List<String>.filled(widget.length, "");

    for (int i = 0; i < widget.length; i++) {
      replaceInputList[i] = data.length > i ? data[i] : "";
    }

    if (mounted) {
      setState(() {
        _selectedIndex = data.length;
        _inputList = replaceInputList;
      });
    }
  }
}

enum PinCodeFieldShape { box, underline, circle }

enum ErrorAnimationType { shake }


