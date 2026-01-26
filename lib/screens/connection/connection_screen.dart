import 'package:flutter/material.dart';
import '../widgets/gradient_background.dart';
import '../../lg/lg_connection.dart';
import '../task_demo/task_demo_screen.dart';

class ConnectionScreen
    extends
        StatefulWidget {
  const ConnectionScreen({
    super.key,
  });

  @override
  State<
    ConnectionScreen
  >
  createState() => _ConnectionScreenState();
}

class _ConnectionScreenState
    extends
        State<
          ConnectionScreen
        > {
  final TextEditingController ipController = TextEditingController();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController portController = TextEditingController(
    text: '22',
  );

  bool isConnecting = false;
  String statusText = 'Not connected';

  Future<
    void
  >
  connectToLG() async {
    setState(
      () {
        isConnecting = true;
        statusText = 'Connecting...';
      },
    );

    final config = LGConfig(
      ip: ipController.text.trim(),
      port: int.parse(
        portController.text.trim(),
      ),
      username: userController.text.trim(),
      password: passController.text,
    );

    final lg = LGConnection(
      config,
    );

    final success = await lg.connect();

    if (!mounted) return;

    if (success) {
      setState(
        () {
          statusText = 'Connected to Liquid Galaxy';
          isConnecting = false;
        },
      );

      // 🔥 GO DIRECTLY TO TASK DEMO SCREEN
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder:
              (
                _,
              ) => TaskDemoScreen(
                lg: lg,
              ),
        ),
      );
    } else {
      setState(
        () {
          statusText = 'Connection failed';
          isConnecting = false;
        },
      );
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: const GradientBackground(
        child: SafeArea(
          child: _ConnectionBody(),
        ),
      ),
    );
  }
}

class _ConnectionBody
    extends
        StatelessWidget {
  const _ConnectionBody();

  @override
  Widget build(
    BuildContext context,
  ) {
    final state = context
        .findAncestorStateOfType<
          _ConnectionScreenState
        >()!;

    return Padding(
      padding: const EdgeInsets.all(
        24,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),

            const Text(
              'Liquid Galaxy Connection',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(
              height: 8,
            ),

            const Text(
              'Enter your LG cluster credentials',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),

            const SizedBox(
              height: 40,
            ),

            _InputField(
              controller: state.ipController,
              label: 'IP Address',
            ),

            _InputField(
              controller: state.userController,
              label: 'Username',
            ),

            _InputField(
              controller: state.passController,
              label: 'Password',
              obscure: true,
            ),

            _InputField(
              controller: state.portController,
              label: 'SSH Port',
              keyboard: TextInputType.number,
            ),

            const SizedBox(
              height: 30,
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: state.isConnecting
                    ? null
                    : state.connectToLG,
                child: state.isConnecting
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
                        'Connect',
                      ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Text(
              state.statusText,
              style: TextStyle(
                color:
                    state.statusText.contains(
                      'Connected',
                    )
                    ? Colors.greenAccent
                    : Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InputField
    extends
        StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscure;
  final TextInputType keyboard;

  const _InputField({
    required this.controller,
    required this.label,
    this.obscure = false,
    this.keyboard = TextInputType.text,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        keyboardType: keyboard,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.white70,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              12,
            ),
            borderSide: const BorderSide(
              color: Colors.white24,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              12,
            ),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
