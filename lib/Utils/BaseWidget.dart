import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taqspalestine/Utils/locator.dart';

class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T value, Widget child) builder;
  final Function(T) onModelReady;

  final T provider;
  final Widget child;
  BaseWidget(
      {Key key, this.provider, this.builder, this.child, this.onModelReady})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  // We want to store the instance of the model in the state
  // that way it stays constant through rebuilds
  T provider = locator<T>();
  @override
  void initState() {
    // assign the model once when state is initialised
    if (widget.onModelReady != null) {
      widget.onModelReady(provider);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: provider,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}
