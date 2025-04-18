import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zentask/data/database.dart';
import 'package:zentask/utils/zentask.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('mybox');
  ZenTaskDatabase db = ZenTaskDatabase();

  @override
  void initState() {
    if (_myBox.get("TO_DO_LIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  void checkBoxChanged(int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear(); // inputveld leegmaken na toevoegen
    });
    db.updateDataBase();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // geen achtergrondkleur nodig, we gebruiken nu een afbeelding
      appBar: AppBar(
        title: const Text('Zen Task'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 249, 248, 243),
        foregroundColor: Color.fromARGB(255, 110, 104, 104),
        actions: [
          IconButton(
            icon: Icon(Icons.format_quote),
            onPressed: () {
              Navigator.pushNamed(context, '/quotes');
            },
          ),
          IconButton(
            icon: Icon(Icons.restaurant),
            onPressed: () {
              Navigator.pushNamed(context, '/recipes');
            },
          ),
        ],
      ),

      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.65, // Subtiel effect
              child: Image.asset(
                'assets/images/background1.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),

          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: db.toDoList.length,
                  itemBuilder: (BuildContext context, index) {
                    return ZenTask(
                      taskName: db.toDoList[index][0],
                      taskCompleted: db.toDoList[index][1],
                      onChanged: (value) => checkBoxChanged(index),
                      deleteFunction: (context) => deleteTask(index),
                    );
                  },
                ),
              ),
              // 💡 Input en knop onderaan
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Add a new task',
                          filled: true,
                          fillColor: Color.fromARGB(
                            255,
                            249,
                            248,
                            243,
                          ).withOpacity(0.8),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 249, 248, 243),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color(0xFF6B9080),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    FloatingActionButton(
                      onPressed: saveNewTask,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
