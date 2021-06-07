import 'package:flutter/material.dart';
import 'package:note_app/widgets/widgets.dart';

class CustomModalActionButton extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback onSave;

  CustomModalActionButton({@required this.onClose, @required this.onSave});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CustomButton(
          onPressed: onClose,
          buttonText: 'Kapat',
        ),
        CustomButton(
          onPressed: onSave,
          buttonText: 'Kaydet',
          color: Theme.of(context).accentColor,
          textColor: Colors.white,
        )
      ],
    );
  }
}
