import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuitAppDialog extends StatelessWidget {
  const QuitAppDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var translate = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(translate.home_exit),
      content: Text(translate.home_exit_confirmation),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(translate.buttonCancel),
        ),
        TextButton(
          onPressed: () => exit(0),
          child: Text(translate.home_exit),
        ),
      ],
    );
  }
}
