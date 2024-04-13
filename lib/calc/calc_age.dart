
import 'package:flutter/material.dart';

class CalcAge extends StatefulWidget {
  const CalcAge({super.key});

  @override
  State<CalcAge> createState() => _CalcAgeState();
}

class _CalcAgeState extends State<CalcAge> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    TextStyle style = const TextStyle(
        color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold);

    Widget button() {
      return ElevatedButton(
          onPressed: () {
            try {
              var birth = int.parse(controller.text);
              var currentDate = DateTime.now().year;
              var age = currentDate - birth;
              if (birth >= currentDate) {
                showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    title: Text('Error'),
                    content: Text(
                        'The Birth Shouldn\'t be Greater Than Current Year Or Equal it!'),
                  ),
                );
              } else {
                setState(() {
                  showDialog(
                      builder: (context) => AlertDialog(
                            title: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                      text: 'Your Age Is ',
                                      style: TextStyle(color: Colors.white)),
                                  TextSpan(
                                    text: '$age',
                                    style: style,
                                  ),
                                ],
                              ),
                            ),
                            backgroundColor: Colors.deepOrange,
                          ),
                      context: context);
                });
              }
            } catch (e) {
              {
                // Handle any errors that occur during parsing or calculation
                showDialog(
                  builder: (context) => AlertDialog(
                    title: const Text('Error'),
                    content:
                        const Text('Invalid input: Please enter a valid year.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                  context: context,
                );
              }
            }
          },
          child: const Text('Calculate'));
    }

    onSubmit() {
      try {
        var birth = int.parse(controller.text);
        var currentDate = DateTime.now().year;
        var age = currentDate - birth;
        if (birth >= currentDate) {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text('Error'),
              content: Text(
                  'The Birth Shouldn\'t be Greater Than Current Year Or Equal it!'),
            ),
          );
        } else {
          setState(() {
            showDialog(
                builder: (context) => AlertDialog(
                      title: Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                                text: 'Your Age Is ',
                                style: TextStyle(color: Colors.white)),
                            TextSpan(
                              text: '$age',
                              style: style,
                            ),
                          ],
                        ),
                      ),
                      backgroundColor: Colors.deepOrange,
                    ),
                context: context);
          });
        }
      } catch (e) {
        {
          // Handle any errors that occur during parsing or calculation
          showDialog(
            builder: (context) => AlertDialog(
              title: const Text('Error'),
              content: const Text('Invalid input: Please enter a valid year.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
            context: context,
          );
        }
      }
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(bottom: 10, top: 50, right: 50, left: 50),
            child: TextField(
              onSubmitted: (value) {
                Navigator.of(context);
                onSubmit();
                controller.clear();
              },
              controller: controller,
              keyboardType: const TextInputType.numberWithOptions(),
              maxLength: 4,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'For Ex: 1997',
                labelText: 'Input Age!',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: button(),
          ),
        ],
      ),
    );
  }
}
