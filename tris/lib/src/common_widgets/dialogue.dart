import 'package:flutter/material.dart';

class Dialogue extends StatelessWidget {
  const Dialogue({Key? key}) : super(key: key);

  static void communicateEndGame(BuildContext context, VoidCallback f) {
    showDialog(
        context: context,
        builder: (BuildContext newContext) {
          return Dialog(
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text("Game ended"),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // ElevatedButton(      <-- many buttons here
                        //     onPressed: () {
                        //       Navigator.of(newContext).pop();
                        //     },
                        //     child: Text("Cancelar")),
                        ElevatedButton(
                            onPressed: () {
                              f();
                              Navigator.of(context).pop();
                            },
                            child: const Text("OK"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
