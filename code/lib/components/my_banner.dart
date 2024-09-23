import 'package:flutter/material.dart';

class ErrorBanner {
  static void showError(BuildContext context, String errorMessage) {
    final materialBanner = MaterialBanner(
      content: Text(errorMessage),
      leading: const Icon(Icons.error),
      actions: [
        TextButton(
          child: const Icon(
            Icons.cancel,
            color: Colors.black,
          ),
          onPressed: () => ScaffoldMessenger.of(context)
              .hideCurrentMaterialBanner(),
        ),
      ],
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentMaterialBanner()
      ..showMaterialBanner(materialBanner);
  }
}