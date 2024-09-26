import 'package:flutter/material.dart';
import 'home.dart'; // Import Homepage

class PestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
        title: Text("Pest and Diseases"),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Insects"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Background color
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: <Widget>[
                  _buildGridItem('Aphids', 'assets/aphids.jpg'),
                  _buildGridItem('Brown Sting', 'assets/brownstring.jpg'),
                  _buildGridItem('Caterpillar', 'assets/caterpiller.jpg'),
                  _buildGridItem('Codling Moth', 'assets/coldingmoth.jpg'),
                  _buildGridItem('Alternaria Leaf', 'assets/altenarialeaf.jpg'),
                  _buildGridItem('Anthracnose', 'assets/antharacnose.jpg'),
                  _buildGridItem('Sooty Blotch', 'assets/sootyblotch.jpg'),
                  _buildGridItem('White Rot', 'assets/whiterot.jpg'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pest_control, color: Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info, color: Colors.black),
            label: '',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Homepage()), // Navigate to Homepage
            );
          }
        },
      ),
    );
  }

  Widget _buildGridItem(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(imagePath, height: 80),
          SizedBox(height: 10),
          Text(title, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
