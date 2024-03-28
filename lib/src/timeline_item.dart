import 'package:flutter/material.dart';
import 'iscrollable_timeline.dart';
import 'timeline_item_data.dart';

class TimelineItem extends StatefulWidget {
  final TimelineItemData curItem;
  // potentially independent bg color for each item
  final Color backgroundColor;
  final double rulerOutsidePadding;
  final double rulerSize;
  final double rulerInsidePadding;

  const TimelineItem(this.curItem, this.backgroundColor,
      this.rulerOutsidePadding, this.rulerSize, this.rulerInsidePadding,
      {Key? key})
      : super(key: key);

  @override
  _TimelineItemState createState() => _TimelineItemState();
}

class _TimelineItemState extends State<TimelineItem> {
  late String? minsText;
  late String secsText;

  @override
  void initState() {
    super.initState();

    final curItem = widget.curItem;
    final secs = curItem.tSecs;
    secsText = secs?.toString().padLeft(2, '0') ?? "00";
    minsText =
        curItem.tMins != null ? curItem.tMins.toString().padLeft(2, '0') : '00';
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 1,
            vertical: widget.rulerOutsidePadding,
          ),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: itemMinSecsLabels(secsText, minsText, widget.curItem,
              widget.rulerSize, widget.rulerInsidePadding)),
    );
  }
}
