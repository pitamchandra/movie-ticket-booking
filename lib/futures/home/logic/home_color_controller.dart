
import 'package:flutter/material.dart';

class HomeColorController{

static Color backgroundColor(BuildContext context) =>
    Theme
        .of(context)
        .colorScheme
        .surface;

}