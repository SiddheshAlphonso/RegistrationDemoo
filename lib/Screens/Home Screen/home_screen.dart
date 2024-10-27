import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('hello user !!'),
            Text(
              'Have a nice day',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification action
            },
          ),
          IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () {
              // Handle location action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Field
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            // Ads Slider
            Container(
              height: 200, // Set the height for the ads
              child: PageView(
                children: [
                  Image.asset('assets/HomeScreen/ads/fashion_offer.png',
                      fit: BoxFit.cover),
                  Image.asset('assets/HomeScreen/ads/mobile.png',
                      fit: BoxFit.cover),
                  Image.asset('assets/HomeScreen/ads/watch_ads.png ',
                      fit: BoxFit.cover),
                  Image.asset('assets/HomeScreen/ads/accessories.png',
                      fit: BoxFit.cover),
                  Image.asset(
                    'assets/HomeScreen/ads/clothing.png',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Icon Rows
            _buildIconRow('Icon 1', 'assets/icon1.png'),
            _buildIconRow('Icon 2', 'assets/icon2.png'),
            _buildIconRow('Icon 3', 'assets/icon3.png'),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Handle 'See All' action
              },
              child: Text('See All'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0, // Change according to the selected index
        onTap: (index) {
          // Handle bottom navigation tap
        },
      ),
    );
  }

  Widget _buildIconRow(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Image.asset(imagePath, width: 50, height: 50),
              SizedBox(height: 4),
              Text(title),
            ],
          ),
          Column(
            children: [
              Image.asset(imagePath, width: 50, height: 50),
              SizedBox(height: 4),
              Text(title),
            ],
          ),
          Column(
            children: [
              Image.asset(imagePath, width: 50, height: 50),
              SizedBox(height: 4),
              Text(title),
            ],
          ),
        ],
      ),
    );
  }
}
