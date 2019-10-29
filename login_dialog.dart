import 'package:flutter/material.dart';


class LoginDialog extends StatefulWidget{
  LoginDialog({
    Key key,
    this.color = Colors.blue,
    this.borderWidth = 2,
    this.borderRoudness = 15, 
    this.title,
  }):super(key:key);

  final Color  color;
  final double borderWidth;
  final double borderRoudness;
  final String title;

  @override
  State<StatefulWidget> createState() => _LoginDialog();  
}

class _LoginDialog extends State<LoginDialog>{

  final TextEditingController usernameCtl = TextEditingController();
  final TextEditingController passwordCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return SimpleDialog(
      contentPadding: EdgeInsets.all(15),
      shape: borderUniformShape(), 
      title: widget.title!=null?Text(widget.title):null,
      children: <Widget>[
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              enabledBorder: borderUniformShape(),
              labelText: 'Username',
              border: borderUniformShape(),
            ),
            controller: usernameCtl,
          ),
          spaceInBetween(),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              enabledBorder: borderUniformShape(),
              labelText: 'Password',
              border: borderUniformShape(),
            ),
            controller: passwordCtl,
          ),
          spaceInBetween(),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton(
                color: widget.color,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.borderRoudness)),
                child: Text('Cancel'),
                onPressed: ()=> Navigator.pop(context),
              ),
              FlatButton(
                color: widget.color,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.borderRoudness)),
                child: Text('Login'),
                onPressed: ()=> Navigator.pop(context, {"username": usernameCtl.text, "password": passwordCtl.text}),
              ),
            ],
          ),
      ],
    );
  }

  spaceInBetween() => Placeholder(
    color: Colors.transparent,
    fallbackHeight: widget.borderRoudness,
  );

  borderUniformShape() => OutlineInputBorder(
    borderSide: BorderSide(color: widget.color, width: widget.borderWidth),
    borderRadius: BorderRadius.all(Radius.circular(widget.borderRoudness)),
  );


}
