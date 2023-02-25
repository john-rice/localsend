import 'package:flutter/material.dart';
import 'package:localsend_app/gen/strings.g.dart';
import 'package:localsend_app/util/platform_strings.dart';
import 'package:routerino/routerino.dart';

class NotAvailableOnPlatformDialog extends StatelessWidget {
  final List<TargetPlatform> platforms;

  const NotAvailableOnPlatformDialog({required this.platforms});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(t.dialogs.notAvailableOnPlatform.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(t.dialogs.notAvailableOnPlatform.content),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              ...platforms.map((p) {
                return Chip(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  label: Text(p.humanName, style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
                );
              }),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(t.general.close),
        )
      ],
    );
  }
}
