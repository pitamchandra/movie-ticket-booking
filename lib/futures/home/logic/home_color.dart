
import 'package:flutter/material.dart';

class HomeColor{

static Color backgroundColor(BuildContext context) =>
    Theme
        .of(context)
        .colorScheme
        .surface;

Color appBar(context) =>
    Theme
        .of(context)
        .colorScheme
        .primary;

Color floatingActionButton(context) =>
    Theme
        .of(context)
        .colorScheme
        .secondary;
}