import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class CustomBlocProvider<T extends StateStreamableSource<S>, S>
    extends SingleChildStatelessWidget {
  const CustomBlocProvider({
    required Create<T> create,
    super.key,
    required this.listener,
    required this.builder,
    this.lazy = true,
  })  : _create = create,
        _value = null;

  const CustomBlocProvider.value({
    required T value,
    required this.listener,
    required this.builder,

    super.key,
  })  : _value = value,
        _create = null,
        lazy = true;

  final BlocWidgetBuilder<S> builder;

  final BlocWidgetListener<S> listener;

  final bool lazy;

  final Create<T>? _create;

  final T? _value;

  static T of<T extends StateStreamableSource<Object?>>(
      BuildContext context, {
        bool listen = false,
      }) {
    try {
      return Provider.of<T>(context, listen: listen);
    } on ProviderNotFoundException catch (e) {
      if (e.valueType != T) rethrow;
      throw FlutterError(
        '''
        BlocProvider.of() called with a context that does not contain a $T.
        No ancestor could be found starting from the context that was passed to BlocProvider.of<$T>().

        This can happen if the context you used comes from a widget above the BlocProvider.

        The context used was: $context
        ''',
      );
    }
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    final value = _value;
    return value != null
        ? InheritedProvider<T>.value(
      value: value,
      startListening: _startListening,
      lazy: lazy,
      child: BlocConsumer<T, S>(
        listener: listener,
        builder: builder,
      ),
    )
        : InheritedProvider<T>(
      create: _create,
      dispose: (_, bloc) => bloc.close(),
      startListening: _startListening,
      lazy: lazy,
      child: BlocConsumer<T, S>(
        listener: listener,
        builder: builder,
      ),
    );
  }

  static VoidCallback _startListening(
      InheritedContext<StateStreamable<dynamic>?> e,
      StateStreamable<dynamic> value,
      ) {
    final subscription = value.stream.listen(
          (dynamic _) => e.markNeedsNotifyDependents(),
    );
    return subscription.cancel;
  }
}