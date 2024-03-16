import 'package:flutter/material.dart';
import '../../utils/color.dart';

class MyInputField extends StatefulWidget {
  final String? title;
  final String? hint;
  final TextEditingController? controller;
  final Widget? leadingWidget;
  final Widget? trailWidget;

  const MyInputField({
    super.key,
    this.title,
    this.hint,
    this.controller,
    this.leadingWidget,
    this.trailWidget,
  });

  @override
  State<MyInputField> createState() => _MyInputFieldState();
}

class _MyInputFieldState extends State<MyInputField> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Text(
              widget.title!,
              style: titleStyle,
            ),
          Container(
            height: 52,
            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                if (widget.leadingWidget != null)
                  Container(
                    child: widget.leadingWidget,
                  ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Form(
                    key: formKey,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your information please";
                        }
                        return null;
                      },
                      readOnly: widget.trailWidget == null ? false : true,
                      autofocus: false,
                      cursorColor: Colors.grey,
                      controller: widget.controller,
                      //style: subTitleStyle,
                      decoration: InputDecoration(
                        hintText: widget.hint,
                        hintStyle: subTitleStyle,
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 0,
                          ),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (widget.trailWidget != null)
                  Container(
                    child: widget.trailWidget,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
