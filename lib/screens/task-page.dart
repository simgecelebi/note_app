import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class Task {
  final String task;
  final bool isFinish;
  const Task(this.task, this.isFinish);
}

final List<Task> _taskList = [
  new Task('Randevu hakkında doktoru ara.', false),
  new Task('Deneyimi düzelt.', false),
  new Task('API documentation düzenle.', false),
  new Task('Kurulum kullanıcı odak grubu.', false),
  new Task('Sam ile kahve içmek.', true),
  new Task('Ortaklarla tanış.', true),
];

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: _taskList.length,
      itemBuilder: (context, index) {
        return _taskList[index].isFinish
            ? _taskComplete(_taskList[index].task)
            : _taskUnComplete(_taskList[index].task);
      },
    );
  }

  Widget _taskUnComplete(String task) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 24.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.radio_button_unchecked,
            color: Colors.green,
            size: 20,
          ),
          SizedBox(
            width: 28,
          ),
          Text(task),
        ],
      ),
    );
  }

  Widget _taskComplete(String task) {
    return Container(
      foregroundDecoration: BoxDecoration(color: Color(0x60FDFDFD)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 24.0),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.radio_button_checked,
              color: Colors.green,
              size: 20,
            ),
            SizedBox(
              width: 28,
            ),
            Text(task),
          ],
        ),
      ),
    );
  }
}
