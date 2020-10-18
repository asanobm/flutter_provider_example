import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_example/states/Counter.dart';

class Count extends StatelessWidget {
  const Count({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '${context.watch<Counter>().count}',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
