import 'package:flutter/material.dart';

class ToDoCard extends StatelessWidget {
  final String task;
  final bool status;
  final Function changeStatus;
  final int index;
  final Function deleteTask;
  const ToDoCard(
      {super.key,
      required this.task,
      required this.status,
      required this.changeStatus,
      required this.index,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeStatus(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(198, 94, 82, 99),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                task,
                style: TextStyle(
                  fontSize: 18,
                  color: status ? Colors.white : Colors.black,
                  decoration:
                      status ? TextDecoration.none : TextDecoration.lineThrough,
                ),
              ),
              Row(
                children: [
                  Icon(
                    status ? Icons.check : Icons.close,
                    size: 22,
                    color: status ? Colors.green : Colors.red,
                  ),
                  const SizedBox(
                    width: 17,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                    ),
                    iconSize: 22,
                    color: Colors.red[200],
                    onPressed: () {
                      deleteTask(index);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
