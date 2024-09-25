import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Multi-page Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageOne(), // First page of the form
    );
  }
}

// First Page of the Form
class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final _formKey = GlobalKey<FormState>();
  String name = '';

  void _goToNextPage() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Navigate to the next page and pass the data (name) as an argument
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PageTwo(name: name),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 1: Enter Name')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onSaved: (value) {
                  name = value ?? '';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _goToNextPage,
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Second Page of the Form
class PageTwo extends StatefulWidget {
  final String name; // Data passed from the first page

  PageTwo({required this.name});

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  final _formKey = GlobalKey<FormState>();
  String email = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Perform any action with the form data, such as sending to a server
      print('Name: ${widget.name}, Email: $email');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form Submitted')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 2: Enter Email')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text(
                'Hello ${widget.name}, please enter your email:',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value ?? '';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




// form with drawer

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Form with Menubar',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: FormWithMenubar(),
//     );
//   }
// }

// class FormWithMenubar extends StatefulWidget {
//   @override
//   _FormWithMenubarState createState() => _FormWithMenubarState();
// }

// class _FormWithMenubarState extends State<FormWithMenubar> {
//   final _formKey = GlobalKey<FormState>();
//   String name = '';
//   String email = '';

//   // Function to validate and submit the form
//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       print('Name: $name, Email: $email');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Form Submitted')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Form App'),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text(
//                 'Menu',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text('Home'),
//               onTap: () {
//                 Navigator.pop(context);
//                 // Perform Home action
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text('Settings'),
//               onTap: () {
//                 Navigator.pop(context);
//                 // Perform Settings action
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.contact_page),
//               title: Text('Contact Us'),
//               onTap: () {
//                 Navigator.pop(context);
//                 // Navigate to contact page
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: <Widget>[
//               // Name input
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Name'),
//                 onSaved: (value) {
//                   name = value ?? '';
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//               ),
//               // Email input
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Email'),
//                 keyboardType: TextInputType.emailAddress,
//                 onSaved: (value) {
//                   email = value ?? '';
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                     return 'Please enter a valid email';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               // Submit button
//               ElevatedButton(
//                 onPressed: _submitForm,
//                 child: Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




// multi screen

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'BottomNavigationBar Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;

//   // List of widget screens corresponding to each tab
//   final List<Widget> _screens = [
//     ScreenOne(),
//     ScreenTwo(),
//     ScreenThree(),
//   ];

//   // Function to handle tap on bottom navigation bar items
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Multi-Screen with Bottom Bar'),
//       ),
//       body: _screens[_selectedIndex], // Show the selected screen
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped, // Change screen when tapped
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.business),
//             label: 'Business',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.school),
//             label: 'School',
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Screen 1: Home
// class ScreenOne extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Home Screen',
//         style: TextStyle(fontSize: 24),
//       ),
//     );
//   }
// }

// // Screen 2: Business
// class ScreenTwo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Business Screen',
//         style: TextStyle(fontSize: 24),
//       ),
//     );
//   }
// }

// // Screen 3: School
// class ScreenThree extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'School Screen',
//         style: TextStyle(fontSize: 24),
//       ),
//     );
//   }
// }
