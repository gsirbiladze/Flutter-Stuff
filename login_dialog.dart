import 'package:flutter/material.dart';

class LoginDialog extends StatelessWidget{
  LoginDialog({
    Key key,
    this.color = Colors.blue,
    this.borderWidth = 2,
    this.borderRoudness = 15,
    this.alertDialogStile = true,
  }):super(key:key);

  final bool alertDialogStile;

  final Color  color;
  final double borderWidth;
  final double borderRoudness;

  @override
  Widget build(BuildContext context) {

    var uCtl = TextEditingController();
    var pCtl = TextEditingController();

    return alertDialogStile
      ?AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRoudness)),
        content: Container(
          child: _ActiveElements(color: color, borderWidth: borderWidth, borderRoudness: borderRoudness, uCtl: uCtl, pCtl: pCtl),
        ),
      )
      :Scaffold(
        body: Padding(
          padding: EdgeInsets.all(borderRoudness),
          child: Center(
            child: _ActiveElements(color: color, borderWidth: borderWidth, borderRoudness: borderRoudness, uCtl: uCtl, pCtl: pCtl),
          )
        )
      );
  }
}

class _ActiveElements extends StatelessWidget {
  const _ActiveElements({
    Key key,
    @required this.color,
    @required this.borderWidth,
    @required this.borderRoudness,
    @required this.uCtl,
    @required this.pCtl,
  }) : super(key: key);

  final Color color;
  final double borderWidth;
  final double borderRoudness;
  final TextEditingController uCtl;
  final TextEditingController pCtl;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: color, width: borderWidth),
                  borderRadius: BorderRadius.all(Radius.circular(borderRoudness)),
                ),
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: color, width: borderWidth),
                  borderRadius: BorderRadius.all(Radius.circular(borderRoudness)),
                ),
              ),
              controller: uCtl,
            ),
            Placeholder(
              color: Colors.transparent,
              fallbackHeight: borderRoudness,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: color, width: borderWidth),
                  borderRadius: BorderRadius.all(Radius.circular(borderRoudness)),
                ),
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: color, width: borderWidth),
                  borderRadius: BorderRadius.all(Radius.circular(borderRoudness)),
                ),
              ),
              controller: pCtl,
            ),
            Placeholder(
              color: Colors.transparent,
              fallbackHeight: borderRoudness,
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                  color: color,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRoudness)),
                  child: Text('Cancel'),
                  onPressed: ()=>Navigator.pop(context),
                ),
                FlatButton(
                  color: color,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRoudness)),
                  child: Text('Login'),
                  onPressed: ()=>Navigator.pop(context, {"username": uCtl.text, "password": pCtl.text}),
                ),
              ],
            ),
        ],
    );
  }
}
