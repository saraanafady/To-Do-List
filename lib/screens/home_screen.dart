

import 'package:flutter/material.dart';
import '../models/task_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> _tasks = [];
  final TextEditingController _taskController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isDarkMode = true;

  void _addTask() {
    if (_taskController.text.isNotEmpty) {
      setState(() {
        _tasks.add(Task(
          title: _taskController.text,
          position: 'Task',
        ));
        _taskController.clear();
      });
    }
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    int completedTasks = _tasks.where((task) => task.isCompleted).length;
    int remainingTasks = _tasks.length - completedTasks;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Daily Tasks', 
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          )
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color.fromARGB(255, 255, 255, 255)),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.black),
              accountName: const Text('Martha Hays'),
              accountEmail: const Text(''),
              currentAccountPicture: Image.asset('assets/profile.png'),
              currentAccountPictureSize: const Size(50, 50),
              otherAccountsPictures: [
                IconButton(
                  icon: const Icon(Icons.add_circle, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
            ListTile(
              title: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text('$remainingTasks Task left'),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text('$completedTasks Task done'),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.grey),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('App Settings'),
            ),
            const Divider(color: Colors.grey),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Change account name'),
            ),
            const ListTile(
              leading: Icon(Icons.lock),
              title: Text('Change account password'),
            ),
            const ListTile(
              leading: Icon(Icons.image),
              title: Text('Change account Image'),
            ),
            ListTile(
              leading: const Icon(Icons.brightness_4),
              title: const Text('Change Mode'),
              trailing: Switch(
                value: _isDarkMode,
                onChanged: (value) {
                  setState(() {
                    _isDarkMode = value;
                  });
                },
                activeColor: Colors.teal,
              ),
            ),
            const Divider(color: Colors.grey),
            const ListTile(
              leading: Icon(Icons.info),
              title: Text('About Us'),
            ),
            const ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('FAQ'),
            ),
            const ListTile(
              leading: Icon(Icons.help),
              title: Text('Help & Feedback'),
            ),
            const ListTile(
              leading: Icon(Icons.support),
              title: Text('Support US'),
            ),
            const Divider(color: Colors.grey),
            ListTile(
              leading: const Icon(Icons.logout, color: Color.fromARGB(255, 255, 255, 255)),
              title: const Text('Log out', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // New Task Input and Add Button at the top
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _taskController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'Add a new task',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      onSubmitted: (_) => _addTask(),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add, color: Colors.white),
                      onPressed: _addTask,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Today\'s Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.purple, width: 1),
                  ),
                  child: Text(
                    '$remainingTasks remaining',
                    style: const TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            Expanded(
              child: _tasks.isEmpty 
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.task_alt, size: 70, color: Colors.grey),
                        SizedBox(height: 16),
                        Text(
                          'No tasks yet',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Add a task to get started',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: _tasks.length,
                    itemBuilder: (context, index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: _tasks[index].isCompleted 
                              ? [Colors.green.withOpacity(0.7), Colors.green.withOpacity(0.2)]
                              : [Colors.purple.withOpacity(0.7), Colors.purple.withOpacity(0.2)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: _tasks[index].isCompleted
                                ? Colors.green.withOpacity(0.2)
                                : Colors.purple.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          leading: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              shape: BoxShape.circle,
                            ),
                            child: Checkbox(
                              value: _tasks[index].isCompleted,
                              onChanged: (_) => _toggleTaskCompletion(index),
                              shape: const CircleBorder(),
                              checkColor: Colors.white,
                              fillColor: WidgetStateProperty.resolveWith(
                                (states) => _tasks[index].isCompleted ? Colors.green : Colors.purple,
                              ),
                            ),
                          ),
                          title: Text(
                            _tasks[index].title,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: _tasks[index].isCompleted 
                                ? TextDecoration.lineThrough 
                                : TextDecoration.none,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  _tasks[index].isCompleted ? 'Completed' : 'In Progress',
                                  style: TextStyle(
                                    color: _tasks[index].isCompleted ? Colors.green : Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              InkWell(
                                onTap: () => _deleteTask(index),
                                customBorder: const CircleBorder(),
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.2),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.delete, color: Colors.red, size: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
            ),
          ],
        ),
      ),
    );
  }
}