import 'package:flutter/material.dart';
import '../../screens/widgets/gradient_background.dart';
import '../../lg/lg_connection.dart';
import 'task_actions.dart';

class TaskDemoScreen
    extends
        StatelessWidget {
  final LGConnection lg;

  const TaskDemoScreen({
    super.key,
    required this.lg,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return GradientBackground(
      child: DefaultTextStyle.merge(
        style: const TextStyle(
          decoration: TextDecoration.none,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Task Demo",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            const Text(
              "Agentic Flutter Starter Kit",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            // 🔥 MAIN TASK BUTTON GRID
            TaskActions(
              lg: lg,
            ),
          ],
        ),
      ),
    );
  }
}
