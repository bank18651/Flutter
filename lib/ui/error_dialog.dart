import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String message;

  ErrorDialog({this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: FittedBox(
        child: SizedBox(
          width: 310,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Text(
                  'Error',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: const Color.fromRGBO(0, 0, 0, 1)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 22, bottom: 22),
                  child: Text(
                    message ?? '',
                    style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1), height: 1.2),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      splashColor: Colors.grey,
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(3))),
                      child: Text(
                        'OK',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
