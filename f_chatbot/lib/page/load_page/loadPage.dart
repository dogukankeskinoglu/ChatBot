import 'package:f_chatbot/core/enum/durationEnum.dart';
import 'package:flutter/material.dart';

class LoadPage extends StatefulWidget {
  final Widget page;

  const LoadPage({Key? key, required this.page}) : super(key: key);
  @override
  _LoadPageState createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    waitForTime();
  }

  Future<void> waitForTime() async {
    await Future.delayed(DurationEnums.LOW.time);
    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? widget.page : Center(child: CircularProgressIndicator());
  }
}
