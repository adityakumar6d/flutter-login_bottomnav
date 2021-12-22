import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_login_project/item_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'choices.dart';
import 'grid_cell.dart';
import 'network_request.dart';
import 'photo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void createSnackBar(String message) {
    final snackBar =
        SnackBar(content: Text(message), backgroundColor: Colors.red);
    Scaffold.of(context).showSnackBar(snackBar);
  }

  int _currentIndex = 0;

  List<Widget> screens = [];

  circularProgress() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  gridView(AsyncSnapshot<List<Photo>> snapshot) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GridView.count(
        physics: const BouncingScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        childAspectRatio: 1,
        crossAxisSpacing: 4,
        children: snapshot.data!.map((photo) {
          return GestureDetector(
            child: GridTile(
              child: PhotoCell(photo),
            ),
            onTap: () {
              Fluttertoast.showToast(
                  msg: 'Clicked',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1);
            },
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    screens.add(
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     Flexible(
      //         child: FutureBuilder<List<ListItem>>(
      //       future: NetworkRequest.fetchItem(),
      //       builder: (context, snapshot) {
      //         if (snapshot.hasError) {
      //           return Text('Error ${snapshot.error}');
      //         } else if (snapshot.hasData) {
      //           return gridView(snapshot);
      //         }
      //         throw Exception(Exception);
      //       },
      //     ))
      //   ],
      // ),

      Flexible(
        child: FutureBuilder<List<Photo>>(
          future: NetworkRequest.fetchPhotos(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error ${snapshot.error}');
            } else if (snapshot.hasData) {
              return gridView(snapshot);
            }
            return circularProgress();
          },
        ),
      ),
    );

    screens.add(
        const Center(child: Text('Search', style: TextStyle(fontSize: 60))));
    screens.add(
        const Center(child: Text('Camera', style: TextStyle(fontSize: 60))));
    screens.add(
        const Center(child: Text('Profile', style: TextStyle(fontSize: 60))));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Page',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: screens[_currentIndex],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Camera',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.blue,
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
