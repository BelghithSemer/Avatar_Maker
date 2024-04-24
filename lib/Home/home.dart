import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter_svg/svg.dart';

import '../avatar_maker_screen.dart';
import 'custom_avatar.dart';



class HomeInterface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  List<Map<String, dynamic>> exploreList = [
    {
      'icon': Icons.code,
      'name': 'Coding',
      'description': 'Description 1',
    },
    {
      'icon': Icons.translate,
      'name': 'Translater',
      'description': 'Description 2',
    },
    {
      'icon': Icons.monitor_heart,
      'name': 'Health',
      'description': 'Description 2',
    },
    {
      'icon': Icons.music_note,
      'name': 'Music',
      'description': 'Description 2',
    },
    // Add more items as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),

        actions: [
          CircleAvatar(
              radius: 20,// Circular icon
              backgroundImage: AssetImage('assets/user_profile.jpg') // Replace with user's image URL
          ),
          SizedBox(width: 8,)
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Favorits'),
              onTap: () {

              },
            ),

          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20), // Add some spacing
            Container(

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.white, Colors.blueAccent], // Adjust colors as needed
                ),
              ),
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hi Rached',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        _showDialog(context);
                      },
                      child: Text('Tap to chat',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,)

                      ),
                    ),
                    SizedBox(height: 8),
                    SvgPicture.asset(
                      'assets/vocal.svg', // Replace this with the path to your .svg file
                      width: 60,
                      height: 60,
                      color: Colors.white,

                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20), // Add some spacing

            Row(

              children: [
                SizedBox(width: 20,),
                Text("Explore", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
              ],
            ),
            SizedBox(height: 10,),// Add some spacing
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: exploreList.length, // Adjust as needed
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 200,
                  child: Card(
                    child: ListTile(
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(exploreList[index]['icon'], color: Colors.blue,size: 40,),
                          Text(exploreList[index]['name']),
                          Text(exploreList[index]['description']),

                        ],
                      ),
                      onTap: () {
                        //_showDialog(context);
                      },

                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        selectedItemColor: Colors.blue,
        onTap: (int index) {
          // Handle bottom navigation tap
        },
      ),
    );
  }
}
void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Create An Avatar'),
        content:
          SizedBox(
            height: 120,
            child: Column(

              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>AvatarMakerScreen()));
                  },
                  child: Text('Custom Avatar '),
                ),
                ElevatedButton(
                  onPressed: () {
                    //Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>AvatarGeneratorPage()));
                  },
                  child: Text('Avatar with AI'),
                ),
              ],
            ),
          )

      );
    },
  );
}
