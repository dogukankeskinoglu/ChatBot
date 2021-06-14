import 'package:f_chatbot/core/component/card/job_card.dart';
import 'package:f_chatbot/core/enum/jobAction.dart';
import 'package:f_chatbot/Job/model/job_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableWidget<T> extends StatelessWidget {
  final Widget child;
  final Function(JobActionEnum action) onDismissed;

  const SlidableWidget({
    Key? key,
    required this.child,
    required this.onDismissed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: child,
      actionPane: SlidableBehindActionPane(),
      //left side
      actionExtentRatio: 0.3,
      movementDuration: Duration(seconds: 1),
      actions: [
        IconSlideAction(
            caption: "Apply",
            color: Colors.green,
            icon: Icons.check,
            onTap: () => onDismissed(JobActionEnum.apply)),
      ],
      secondaryActions: [
        IconSlideAction(
            caption: "Cancel",
            color: Colors.red,
            icon: Icons.cancel,
            onTap: () => onDismissed(JobActionEnum.not_apply))
      ],
    );
  }
}
