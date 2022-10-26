import 'package:flutter/material.dart';
import 'package:get_to_know/components/background_container.dart';
import 'package:get_to_know/components/initial_form_field.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _searchKey = GlobalKey<FormState>();
  final String message = 'Search for an Artist';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        ClipRRect(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  message,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Form(
                      key: _searchKey,
                      child: InitialSearchFormField(
                        'Artist',
                        'The Weeknd',
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
