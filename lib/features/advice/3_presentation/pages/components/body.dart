import 'package:advice/features/advice/3_presentation/pages/components/custom_button.dart';
import 'package:advice/features/advice/3_presentation/pages/components/error_message.dart';
import 'package:flutter/material.dart';

import 'advice_field.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: ErrorMessage(message: 'ooops somthing gone wrong')
              /*AdviceField(advice: 'example advice - you day will ne good')*/

              /*CircularProgressIndicator(
                color: Theme.of(context).colorScheme.secondary,
              )*/

              /*Text(
                'your advice is waiting for you .',
                style: Theme.of(context).textTheme.headlineMedium,
              )*/
              ,
            ),
          ),
          const Center(child: CustomButton()),
        ],
      ),
    );
  }
}
