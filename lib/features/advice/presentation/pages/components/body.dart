import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/advice_bloc.dart';
import 'advice_field.dart';
import 'custom_button.dart';
import 'error_message.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: BlocBuilder<AdviceBloc, AdviceState>(
                builder: (context, state) {
                  if (state is AdviceInitial) {
                    return Text(
                      'your advice is waiting for you .',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  } else if (state is AdviceStateLoading) {
                    return CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.secondary);
                  } else if (state is AdviceStateLoaded) {
                    return AdviceField(advice: state.advice);
                  } else if (state is AdviceStateError) {
                    return ErrorMessage(message: state.message);
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ),
          const Center(child: CustomButton()),
        ],
      ),
    );
  }
}
