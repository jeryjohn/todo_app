import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String text;
  final IconButton iconButton;
  const TodoCard({super.key, required this.text, required this.iconButton});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // width: 350,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
                // Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: iconButton,
                  color: Theme.of(context).colorScheme.secondary,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
