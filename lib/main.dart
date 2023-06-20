import 'package:flutter/material.dart';
import 'package:flutter_to_do/widets/counter.dart';
import 'widets/card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ToDo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

//Class for tasks(Card).
class Task {
  final String task;
  bool status;

  Task({required this.task, required this.status});
}

//list of to-do
List list = [
  Task(task: "Go to Gym", status: true),
  Task(task: "Play Football", status: false),
  Task(task: "say Hello", status: true),
];

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  // Create controller to get the text inside the textfield..
  final myController = TextEditingController();
  // To add new todo when clicking on "ADD" in the dialog widget..
  addTask() {
    setState(() {
      list.add(
        Task(task: myController.text, status: false),
      );
    });
  }

  // To calculate only completed todos..
  int countTask() {
    int done = 0;
    for (var element in list) {
      if (element.status) {
        done++;
      }
    }
    return done;
  }

  // TO change state of the todo (completed or not) when click on the todo...
  changeStatus(int index) {
    setState(() {
      list[index].status = !list[index].status;
    });
  }

  // To remove todo when clicking on "delete" icon
  deleteTask(int indexDel) {
    setState(() {
      list.remove(list[indexDel]);
    });
  }

  // To remove all todos when clicking on "delete_forever" icon...
  deleteAll() {
    setState(() {
      list.removeRange(0, list.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 66, 48, 55),
      appBar: AppBar(
        title: const Text(
          "TO DO APP",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 66, 48, 66),
        actions: [
          IconButton(
            onPressed: () {
              deleteAll();
            },
            icon: const Icon(Icons.delete_forever),
            iconSize: 25,
            color: Colors.red[400],
          )
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Counter(sizeList: list.length, countTask: countTask()),
            Container(
              height: 300,
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black26,
              ),
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return ToDoCard(
                    // I will pass all these information when create the ToDoCard() widget in "card.dart"...
                    task: list[index].task,
                    status: list[index].status,
                    changeStatus: changeStatus,
                    index: index,
                    deleteTask: deleteTask,
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                child: Container(
                  height: 220,
                  padding: const EdgeInsets.all(22),
                  // color: Colors.purple[200],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        maxLength: 25,
                        controller: myController,
                        decoration: const InputDecoration(
                          hintText: "Add new Task",
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      TextButton(
                        onPressed: () {
                          addTask();
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "ADD",
                          style: TextStyle(color: Colors.blue, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
