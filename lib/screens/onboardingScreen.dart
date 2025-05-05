// ignore: file_names
import 'package:flutter/material.dart';
import '../components/onboarding_page.dart';
import 'start_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _onboardingData = [
    {
      'image': 'assets/1.png', // This would be your first illustration
      'title': 'Manage your tasks',
      'description':
          'You can easily manage all of your daily tasks in DoMe for free',
    },
    {
      'image': 'assets/2.png', // This would be your second illustration
      'title': 'Create daily routine',
      'description':
          'In UpTodo, you can create your personalized routine to stay productive',
    },
    {
      'image': 'assets/3.png', // This would be your third illustration
      'title': 'Orgonaize your tasks',
      'description':
          'You can organize your daily tasks by adding your tasks into separate categories',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const StartScreen()),
      );
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _skipToStartScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const StartScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _skipToStartScreen,
                    child: const Text(
                      'SKIP',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPage(
                    title: _onboardingData[index]['title'],
                    description: _onboardingData[index]['description'],
                    imagePath: _onboardingData[index]['image'],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _onboardingData.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color:
                          _currentPage == index
                              ? const Color(0xFF8875FF)
                              : Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: _goToPreviousPage,
                    child: Text(
                      'BACK',
                      style: TextStyle(
                        color:
                            _currentPage > 0
                                ? Colors.white
                                : Colors.grey.shade700,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _goToNextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8875FF),
                      minimumSize: const Size(100, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Text(
                      _currentPage < _onboardingData.length - 1
                          ? 'NEXT'
                          : 'GET STARTED',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////
//home_screen.dart
// import 'package:flutter/material.dart';
// import '../models/task_model.dart';
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final List<Task> _tasks = [];
//   final TextEditingController _taskController = TextEditingController();
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   bool _isDarkMode = true;

//   void _addTask() {
//     if (_taskController.text.isNotEmpty) {
//       setState(() {
//         _tasks.add(Task(
//           title: _taskController.text,
//           position: 'Position',
//         ));
//         _taskController.clear();
//       });
//     }
//   }

//   void _toggleTaskCompletion(int index) {
//     setState(() {
//       _tasks[index].isCompleted = !_tasks[index].isCompleted;
//     });
//   }

//   void _deleteTask(int index) {
//     setState(() {
//       _tasks.removeAt(index);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     int completedTasks = _tasks.where((task) => task.isCompleted).length;
//     int remainingTasks = _tasks.length - completedTasks;

//     return Scaffold(
//       key: _scaffoldKey,
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         elevation: 0,
//         title: const Text('Daily Tasks', style: TextStyle(color: Colors.white)),
//         leading: IconButton(
//           icon: const Icon(Icons.menu, color: Colors.red),
//           onPressed: () {
//             _scaffoldKey.currentState?.openDrawer();
//           },
//         ),
//       ),
//       drawer: Drawer(
//         backgroundColor: Colors.black,
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             UserAccountsDrawerHeader(
//               decoration: const BoxDecoration(color: Colors.black),
//               accountName: const Text('Martha Hays'),
//               accountEmail: Text(''),
//           currentAccountPicture: Image.asset('assets/profile.png'),
//               currentAccountPictureSize: const Size(50, 50),
//               otherAccountsPictures: [
//                 IconButton(
//                   icon: const Icon(Icons.add_circle, color: Colors.white),
//                   onPressed: () {},
//                 ),
//               ],
//             ),
//             ListTile(
//               title: Row(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                     decoration: BoxDecoration(
//                       color: Colors.grey[800],
//                       borderRadius: BorderRadius.circular(6),
//                     ),
//                     child: Text('$remainingTasks Task left'),
//                   ),
//                   const SizedBox(width: 10),
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                     decoration: BoxDecoration(
//                       color: Colors.grey[800],
//                       borderRadius: BorderRadius.circular(6),
//                     ),
//                     child: Text('$completedTasks Task done'),
//                   ),
//                 ],
//               ),
//             ),
//             const Divider(color: Colors.grey),
//             const ListTile(
//               leading: Icon(Icons.settings),
//               title: Text('App Settings'),
//             ),
//             const Divider(color: Colors.grey),
//             const ListTile(
//               leading: Icon(Icons.person),
//               title: Text('Change account name'),
//             ),
//             const ListTile(
//               leading: Icon(Icons.lock),
//               title: Text('Change account password'),
//             ),
//             const ListTile(
//               leading: Icon(Icons.image),
//               title: Text('Change account Image'),
//             ),
//             ListTile(
//               leading: const Icon(Icons.brightness_4),
//               title: const Text('Change Mode'),
//               trailing: Switch(
//                 value: _isDarkMode,
//                 onChanged: (value) {
//                   setState(() {
//                     _isDarkMode = value;
//                   });
//                 },
//                 activeColor: Colors.teal,
//               ),
//             ),
//             const Divider(color: Colors.grey),
//             const ListTile(
//               leading: Icon(Icons.info),
//               title: Text('About Us'),
//             ),
//             const ListTile(
//               leading: Icon(Icons.question_answer),
//               title: Text('FAQ'),
//             ),
//             const ListTile(
//               leading: Icon(Icons.help),
//               title: Text('Help & Feedback'),
//             ),
//             const ListTile(
//               leading: Icon(Icons.support),
//               title: Text('Support US'),
//             ),
//             const Divider(color: Colors.grey),
//             ListTile(
//               leading: const Icon(Icons.logout, color: Colors.red),
//               title: const Text('Log out', style: TextStyle(color: Colors.red)),
//               onTap: () {
//                 Navigator.pushReplacementNamed(context, '/login');
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Task', style: TextStyle(color: Colors.white)),
//             const SizedBox(height: 8),
//             Material(
//               color: Colors.purple,
//               borderRadius: BorderRadius.circular(30),
//               child: InkWell(
//                 onTap: _addTask,
//                 borderRadius: BorderRadius.circular(30),
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
//                   width: double.infinity,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Icon(Icons.note_add, color: Colors.white),
//                       const SizedBox(width: 8),
//                       const Text(
//                         'add tasks',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               'To do Tasks',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _tasks.length,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     margin: const EdgeInsets.only(bottom: 8),
//                     decoration: BoxDecoration(
//                       color: _tasks[index].isCompleted ? Colors.white : Colors.grey[900],
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: ListTile(
//                       leading: Checkbox(
//                         value: _tasks[index].isCompleted,
//                         onChanged: (_) => _toggleTaskCompletion(index),
//                         checkColor: Colors.white,
//                         fillColor: WidgetStateProperty.resolveWith(
//                           (states) => _tasks[index].isCompleted ? Colors.teal : Colors.grey,
//                         ),
//                       ),
//                       title: Text(
//                         _tasks[index].title,
//                         style: TextStyle(
//                           color: _tasks[index].isCompleted ? Colors.black : Colors.white,
//                         ),
//                       ),
//                       subtitle: Text(
//                         _tasks[index].position,
//                         style: TextStyle(
//                           color: _tasks[index].isCompleted ? Colors.black54 : Colors.grey,
//                         ),
//                       ),
//                       trailing: IconButton(
//                         icon: const Icon(Icons.delete, color: Colors.red),
//                         onPressed: () => _deleteTask(index),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8.0),
//               child: TextField(
//                 controller: _taskController,
//                 style: const TextStyle(color: Colors.white),
//                 decoration: InputDecoration(
//                   hintText: 'Add a new task',
//                   hintStyle: TextStyle(color: Colors.grey),
//                   filled: true,
//                   fillColor: Colors.grey[900],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide.none,
//                   ),
//                   suffixIcon: IconButton(
//                     icon: const Icon(Icons.add, color: Colors.purple),
//                     onPressed: _addTask,
//                   ),
//                 ),
//                 onSubmitted: (_) => _addTask(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
