import 'package:flutter/material.dart';

class LoginRegisterCustomButton extends StatelessWidget {
  const LoginRegisterCustomButton({
    super.key,
    this.backgroundColor,
    this.textColor,
    this.text,
    this.onPressed,
    this.width,
    this.icon,
    this.height = 48,
    this.image,
  });

  final Color? backgroundColor;
  final Color? textColor;
  final String? text;
  final String? image;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        style: TextButton.styleFrom(
          side: BorderSide(
            color: Colors.blue[400]!,
          ),
          backgroundColor: backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0),
              topRight: Radius.circular(3.0),
              bottomLeft: Radius.circular(3.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: text != null
            ? Text(
                text!,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              )
            : Center(
                child: icon == null
                    ? Image(
                        image: AssetImage(image!),
                      )
                    : Column(
                        children: [
                          Icon(
                            icon,
                            color: Colors.black,
                            size: 25,
                          ),
                          const Spacer(),
                          const Text(
                            'Guest',
                            style: TextStyle(
                              color: Colors.black,
                              // fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
              ),
      ),
    );
  }
}
