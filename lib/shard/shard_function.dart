import 'package:flutter/material.dart';

Future<Widget> alertDialogFunc(
    {required BuildContext context, required String error}) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 100,
          title: Row(
            children: [
              Icon(Icons.error_outline,color: Colors.red,),
              SizedBox(width: 15,),
              Text('Error'),
            ],
          ),
          content: Text(error),
          actions: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop(true);
                },
                textColor: Colors.white,
                color: Colors.red[700],
                child: const Text("Ok"),
              ),
            )
          ],
        );
      }).catchError((error) {
    throw error;
  });
}
