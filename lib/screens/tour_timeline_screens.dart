import 'package:flutter/material.dart';
import '../../utils/tour_panser.dart';

class TourTimelineScreen
    extends
        StatefulWidget {
  final List<
    TourStop
  >
  stops;

  const TourTimelineScreen({
    super.key,
    required this.stops,
  });

  @override
  State<
    TourTimelineScreen
  >
  createState() => _TourTimelineScreenState();
}

class _TourTimelineScreenState
    extends
        State<
          TourTimelineScreen
        > {
  int currentStep = 0;

  @override
  void initState() {
    super.initState();
    _runTimeline();
  }

  Future<
    void
  >
  _runTimeline() async {
    for (
      int i = 0;
      i <
          widget.stops.length;
      i++
    ) {
      setState(
        () {
          currentStep = i;
        },
      );

      await Future.delayed(
        Duration(
          seconds: widget.stops[i].duration.toInt(),
        ),
      );
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final total = widget.stops.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tour Timeline",
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(
              12,
            ),
            child: LinearProgressIndicator(
              value:
                  (currentStep +
                      1) /
                  total,
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: widget.stops.length,
              itemBuilder:
                  (
                    context,
                    index,
                  ) {
                    return ListTile(
                      leading: Icon(
                        index ==
                                currentStep
                            ? Icons.flight_takeoff
                            : Icons.location_on,
                        color:
                            index ==
                                currentStep
                            ? Colors.orange
                            : Colors.grey,
                      ),
                      title: Text(
                        "Visiting ${widget.stops[index].name}",
                      ),
                    );
                  },
            ),
          ),
        ],
      ),
    );
  }
}
