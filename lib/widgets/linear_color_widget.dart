import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc_tema/tema_bloc.dart';

class LinearContainer extends StatelessWidget {
  final Widget child;

  const LinearContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TemaBloc, TemaState>(builder: (context, state) {
      MaterialColor color = (state as UygulamaTemasi).color;
      return Container(
        child: child,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.shade700, color.shade500, color.shade200],
                stops: const [0.6, 0.8, 1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      );
    });
  }
}
