import 'package:flutter/material.dart';

class LoginDialog extends StatelessWidget{
  LoginDialog({
    Key key,
    this.borderColor = Colors.green,
    this.borderWidth = 4,
    this.borderRoudness = 15,
  }):super(key:key);

  final Color borderColor;
  final double borderWidth;
  final double borderRoudness;

  @override
  Widget build(BuildContext context) {

    var uCtl = TextEditingController();
    var pCtl = TextEditingController();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor, width: borderWidth),
                  borderRadius: BorderRadius.all(Radius.circular(borderRoudness)),
                ),
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor, width: borderWidth),
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
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor, width: borderWidth),
                  borderRadius: BorderRadius.all(Radius.circular(borderRoudness)),
                ),
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor, width: borderWidth),
                  borderRadius: BorderRadius.all(Radius.circular(borderRoudness)),
                ),
              ),
              controller: pCtl,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text('Cancel'),
                  onPressed: ()=>Navigator.pop(context),
                ),
                RaisedButton(
                  child: Text('Login'),
                  onPressed: ()=>Navigator.pop(context, {"username": uCtl.text, "password": pCtl.text}),
                ),
              ],
            ),
          ],
        ),
      ),    
    );
  }
}