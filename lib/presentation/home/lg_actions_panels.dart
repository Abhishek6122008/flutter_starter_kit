// SKELETON: Action panel for triggering LG agent workflows.
//
// This widget does NOT directly call LGConnection or KML builders.
// All logic must be executed by Antigravity agent workflows.

import 'package:flutter/material.dart';

import '../../widgets/action_card.dart';

class TaskActions extends StatelessWidget {
  const TaskActions({super.key});

  /// SKELETON HOOK
  ///
  /// Agents will bind a concrete action handler to this callback.
  Future<void> runActionWorkflow(String actionId) async {
    // SKELETON:
    // Example actions:
    // - send_logo
    // - show_pyramid
    // - fly_home
    // - clean_logo
    // - clean_kml
    // - orbit
    await Future.delayed(const Duration(milliseconds: 400));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        children: [
          FamilyCard(
            icon: Icons.layers,
            title: "Send Logo",
            subtitle: "Workflow action",
            onTap: () => runActionWorkflow("send_logo"),
          ),

          FamilyCard(
            icon: Icons.change_history,
            title: "Show Pyramid",
            subtitle: "Workflow action",
            onTap: () => runActionWorkflow("show_pyramid"),
          ),

          FamilyCard(
            icon: Icons.home,
            title: "Fly Home",
            subtitle: "Workflow action",
            onTap: () => runActionWorkflow("fly_home"),
          ),

          FamilyCard(
            icon: Icons.delete_forever,
            title: "Clean Logo",
            subtitle: "Workflow action",
            onTap: () => runActionWorkflow("clean_logo"),
          ),

          FamilyCard(
            icon: Icons.delete_sweep,
            title: "Clean KML",
            subtitle: "Workflow action",
            onTap: () => runActionWorkflow("clean_kml"),
          ),

          FamilyCard(
            icon: Icons.sync,
            title: "Orbit",
            subtitle: "Workflow action",
            onTap: () => runActionWorkflow("orbit"),
          ),
        ],
      ),
    );
  }
}
