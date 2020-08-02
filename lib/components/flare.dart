import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Heart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlareActor(
      'raw/animate.flr',
      animation: 'animation2',
    );
  }
}
