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