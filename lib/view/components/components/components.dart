import 'package:flutter/material.dart';

Widget defaultTitle() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          'Orange ',
          style: TextStyle(
              color: Colors.deepOrangeAccent,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        Text(
          'Digital Center',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 30,
          ),
        )
      ],
    );

Widget defaultText({
  required TextEditingController cont,
  required String text,
  IconData? sufFixIcon,
  Color? sufFixIconColor,
  Color? preFixIconColor,
  IconData? preFixIcon,
  Color? colorText,
  Color? borderColor,
  Color? focusColor,
  Function(bool s)? onFocus,
  TextInputType? keyBoard,
  bool obsCure = false,
  required Function() suffixTap,
  String? errorText,
}) =>
    Focus(
      onFocusChange: (s) {
        onFocus!(s);
      },
      child: TextFormField(
        validator: (v) {
          if (v!.isEmpty) {
            return errorText;
          }
          return null;
        },
        obscureText: obsCure,
        controller: cont,
        keyboardType: keyBoard,
        decoration: InputDecoration(
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? Colors.deepOrange,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? Colors.deepOrange,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          suffixIcon: InkWell(
            onTap: () {
              suffixTap();
            },
            child: Icon(
              sufFixIcon,
              color: sufFixIconColor,
            ),
          ),
          prefixIcon: Icon(
            preFixIcon,
            color: preFixIconColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? Colors.grey,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: focusColor ?? Colors.deepOrange,
            ),
          ),
          label: Text(
            text,
            style: TextStyle(
              color: colorText ?? Colors.grey,
            ),
          ),
        ),
      ),
    );

Widget space({
  double width = 20,
  double height = 20,
}) =>
    SizedBox(
      width: width,
      height: height,
    );

Widget defaultButton({
  Color backgroundColor = Colors.deepOrange,
  required String text,
  Color textColor = Colors.white,
  Color? borderColor,
  double? borderWidth,
}) =>
    Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: borderColor ?? Colors.deepOrange,
          width: borderWidth ?? 2,
        ),
      ),
      width: double.infinity,
      height: 50,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );

Widget defaultDropButton({
  required String text,
  required value,
  required dropDownList,
  required Function(String string) onChanged,
}) =>
    Column(
      children: [
        Text(
          text,
        ),
        //gender drop
        DropdownButton(
          value: value,
          items: dropDownList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (v) {
            onChanged(v.toString());
          },
        ),
      ],
    );

PreferredSizeWidget defaultBar({
  required String text,
  IconData leadingIcon = Icons.arrow_back_ios,
  List<Widget> actions = const [],
}) =>
    AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: Icon(leadingIcon),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: actions.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                actions[index],
              ],
            );
          },
        ),
      ],
    );
