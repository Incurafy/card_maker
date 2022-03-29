// text_utils.dart

import 'package:flutter/cupertino.dart';

Widget cardHeaderText(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    )
  );
}

// This is likely unnecessary in this context. Possibly useful for a version
// that converts widgets into an image to generate a saveable magic item card.
Widget cardSubheaderText(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontStyle: FontStyle.italic,
    )
  );
}

Widget cardText(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 14, // Default Material font size in logical pixels
    )
  );
}