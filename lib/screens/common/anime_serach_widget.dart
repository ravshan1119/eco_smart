import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnimSearchBar extends StatefulWidget {
  final double width;
  final TextEditingController textController;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final String? helpText;
  final String? hintText;
  final int animationDurationInMilli;
  final onSuffixTap;
  final bool rtl;
  final bool autoFocus;
  final TextStyle? style;
  final bool closeSearchOnSuffixTap;
  final Color? color;
  final Color? textFieldColor;
  final Color? searchIconColor;
  final Color? textFieldIconColor;
  final List<TextInputFormatter>? inputFormatters;
  final bool boxShadow;
  final Function(String) onSubmitted;
  final Function(String) onChanged;

  const AnimSearchBar({
    Key? key,
    required this.width,
    required this.textController,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText ,
    this.helpText ,
    this.color = Colors.white,
    this.textFieldColor = Colors.white,
    this.searchIconColor = Colors.black,
    this.textFieldIconColor = Colors.black,
    required this.onSuffixTap,
    this.animationDurationInMilli = 375,
    required this.onSubmitted,
    required this.onChanged,
    this.rtl = false,
    this.autoFocus = false,
    this.style,
    this.closeSearchOnSuffixTap = false,
    this.boxShadow = true,
    this.inputFormatters,
  }) : super(key: key);

  @override
  _AnimSearchBarState createState() => _AnimSearchBarState();
}

int toggle = 0;

String textFieldValue = '';

class _AnimSearchBarState extends State<AnimSearchBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _con;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _con = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animationDurationInMilli),
    );
  }

  unfocusKeyboard() {
    final FocusScopeNode currentScope = FocusScope.of(context);
    if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      alignment:
      widget.rtl ? Alignment.centerRight : const Alignment(-1.0, 0.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: widget.animationDurationInMilli),
        height: 48.0,
        width: (toggle == 0) ? 48.0 : widget.width,
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: toggle == 1 ? widget.textFieldColor : widget.color,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: !widget.boxShadow
              ? null
              : [
            const BoxShadow(
              color: Colors.black26,
              spreadRadius: -10.0,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: widget.animationDurationInMilli),
              top: 6.0,
              right: 7.0,
              curve: Curves.easeOut,
              child: AnimatedOpacity(
                opacity: (toggle == 0) ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: AnimatedBuilder(
                    builder: (context, widget) {
                      return Transform.rotate(
                        angle: _con.value * 2.0 * pi,
                        child: widget,
                      );
                    },
                    animation: _con,
                    child: GestureDetector(
                      onTap: () {
                        try {
                          widget.onSuffixTap();

                          // * if field empty then the user trying to close bar
                          if (textFieldValue == '') {
                            unfocusKeyboard();
                            setState(() {
                              toggle = 0;
                            });

                            _con.reverse();
                          }

                          // * why not clear textfield here?
                          widget.textController.clear();
                          textFieldValue = '';

                          if (widget.closeSearchOnSuffixTap) {
                            unfocusKeyboard();
                            setState(() {
                              toggle = 0;
                            });
                          }
                        } catch (e) {
                          debugPrint(e.toString());
                        }
                      },
                      child: widget.suffixIcon ??
                          Icon(
                            Icons.close,
                            size: 20.0,
                            color: widget.textFieldIconColor,
                          ),
                    ),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: widget.animationDurationInMilli),
              left: 20,
              curve: Curves.easeOut,
              top: 11.0,
              child: AnimatedOpacity(
                opacity: (toggle == 0) ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  alignment: Alignment.topCenter,
                  width: widget.width / 1.7,
                  child: TextField(
                    controller: widget.textController,
                    inputFormatters: widget.inputFormatters,
                    focusNode: focusNode,
                    cursorRadius: const Radius.circular(10.0),
                    cursorWidth: 2.0,
                    onChanged: (value) {
                      widget.onChanged(value);
                      textFieldValue = value;
                    },
                    onSubmitted: (value) => {
                      widget.onSubmitted(value),
                      unfocusKeyboard(),
                      setState(() {
                        toggle = 0;
                      }),
                      widget.textController.clear(),
                    },
                    onEditingComplete: () {
                      unfocusKeyboard();
                      setState(() {
                        toggle = 0;
                      });
                    },
                    style: widget.style ?? const TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 5),
                      isDense: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: widget.helpText,
                      labelStyle: const TextStyle(
                        color: Color(0xff5B5B5B),
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: widget.hintText,
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (toggle == 0)
              Material(
                color: toggle == 0 ? widget.color : widget.textFieldColor,
                borderRadius: BorderRadius.circular(30.0),
                child: toggle == 1
                    ? null
                    : IconButton(
                  splashRadius: 19.0,
                  icon: widget.prefixIcon != null
                      ? toggle == 1
                      ? const SizedBox()
                      : widget.prefixIcon!
                      : Icon(
                    toggle == 1
                        ? Icons.arrow_back_ios
                        : Icons.search,
                    // search icon color when closed
                    color: toggle == 0
                        ? widget.searchIconColor
                        : widget.textFieldIconColor,
                    size: 20.0,
                  ),
                  onPressed: () {
                    setState(
                          () {
                        if (toggle == 0) {
                          toggle = 1;
                          setState(() {
                            if (widget.autoFocus) {
                              FocusScope.of(context)
                                  .requestFocus(focusNode);
                            }
                          });

                          _con.forward();
                        } else {
                          toggle = 0;

                          setState(() {
                            if (widget.autoFocus) unfocusKeyboard();
                          });

                          _con.reverse();
                        }
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}