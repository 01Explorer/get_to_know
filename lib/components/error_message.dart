import 'package:flutter/material.dart';
import 'package:get_to_know/components/background_container.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      Center(
        child: Container(
          height: 250,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: kElevationToShadow[5],
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.warning,
                size: 72,
                color: Colors.red,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black, fontSize: 32),
                ),
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Return')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
