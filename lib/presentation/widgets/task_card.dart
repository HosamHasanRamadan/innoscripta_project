import 'dart:async';

import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:innoscripta_project/data/trackable_task.dart';
import 'package:innoscripta_project/util/date_time_x.dart';

class TaskCard extends StatefulWidget {
  final TrackableTask task;
  final VoidCallback? onTab;
  final VoidCallback? onDelete;
  final VoidCallback? onRun;
  final VoidCallback? onStop;
  final VoidCallback? onComplete;

  const TaskCard({
    super.key,
    required this.task,
    this.onTab,
    this.onDelete,
    this.onRun,
    this.onStop,
    this.onComplete,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  late Duration duration;
  late final StreamSubscription<int> timer;

  @override
  void initState() {
    super.initState();
    setDuration();
    timer = Stream<int>.periodic(const Duration(seconds: 1), (c) => c)
        .listen(onTick);

    if (widget.task.trackingData.isRunning == false) timer.pause();
  }

  void onTick(int tick) {
    setDuration();
    setState(() {});
  }

  void setDuration() {
    if (widget.task.trackingData.isRunning) {
      final durationDiff = DateTime.now().unixTimestamp -
          widget.task.trackingData.lastStartTimestamp;

      duration = Duration(
        seconds: widget.task.trackingData.durationSpentInSec + durationDiff,
      );
    } else {
      duration = Duration(seconds: widget.task.trackingData.durationSpentInSec);
    }
  }

  @override
  void didUpdateWidget(covariant TaskCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.task.trackingData.isRunning ==
        oldWidget.task.trackingData.isRunning) return;
    setDuration();
    if (widget.task.trackingData.isRunning) {
      timer.resume();
    } else {
      timer.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTab,
      child: Container(
        width: double.infinity,
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.onInverseSurface,
          shadows: kElevationToShadow[1],
          shape: RoundedRectangleBorder(
            side: widget.task.trackingData.isRunning
                ? BorderSide(
                    color: Theme.of(context).colorScheme.onBackground,
                    width: 2,
                  )
                : BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.task.task.content,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                PopupMenuButton(
                  child: Icon(Icons.more_vert),
                  itemBuilder: (context) {
                    return [
                      if (widget.task.trackingData.isRunning)
                        PopupMenuItem(
                          onTap: widget.onStop,
                          child: Text(
                            'Stop',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        )
                      else
                        PopupMenuItem(
                          onTap: widget.onRun,
                          child: Text(
                            widget.task.trackingData.durationSpentInSec == 0
                                ? 'Start'
                                : 'Resume',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ),
                      PopupMenuItem(
                        onTap: widget.onComplete,
                        child: Text(
                          'Mark as completed',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                      PopupMenuItem(
                        onTap: widget.onDelete,
                        child: Text(
                          'Delete',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    ];
                  },
                ),
              ],
            ),
            if (widget.task.task.description != null) ...[
              const SizedBox(height: 8),
              Text(
                widget.task.task.description!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
            if (widget.task.trackingData.durationSpentInSec > 0 ||
                widget.task.trackingData.isRunning) ...[
              const SizedBox(height: 8),
              Text(
                prettyDuration(duration, abbreviated: true),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ]
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
