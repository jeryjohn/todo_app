import 'package:demo5/todo_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  List<String> stringValue = [];
  String todotext = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void todoTextInput() {
    todotext = _controller.text;

    if (todotext.length < 2) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('value should be greater than 2 letters')));
    } else {
      stringValue.add(todotext);
    }

    saveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'TODO List',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                  focusColor: Colors.amber,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder()),
            ),
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  todoTextInput();
                  _controller.clear();
                });
              },
              child: const Text('Enter')),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: stringValue.length,
                itemBuilder: (context, int index) => TodoCard(
                      text: stringValue[index],
                      iconButton: IconButton(
                          onPressed: () async {
                            setState(() {
                              stringValue.removeAt(index);
                            });

                            await saveData();
                          },
                          icon: const Icon(Icons.delete)),
                    )),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      )),
    );
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      stringValue = prefs.getStringList('val') ?? [];
    });
  }

  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('val', stringValue);
  }
}
