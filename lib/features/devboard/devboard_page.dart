import 'package:devs/core/models/dev.dart';
import 'package:devs/features/devboard/devboard_model.dart';
import 'package:devs/features/devboard/devs/devs_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'devs/devs_list.dart';

class DevboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DevboardPageState();
}

class _DevboardPageState extends State<DevboardPage> {
  DevBoardModel devBoard;

  @override
  void didChangeDependencies() {
    devBoard = Provider.of<DevBoardModel>(
      context,
      listen: false,
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: FutureProvider<List<Dev>>(
          create: (_) => devBoard.getDevs(),
          initialData: [],
          child: Consumer<List<Dev>>(
            builder: (_, data, __) => DevsList(
              devs: data,
            ),
          ),
        ),
      ),
    );
  }
}
