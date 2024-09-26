import 'package:flutter/material.dart';

class StorePage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Product 1',
      'price': '\$10',
      'image': 'assets/product1.jpg',
    },
    {
      'name': 'Product 2',
      'price': '\$20',
      'image': 'assets/product2.jpg',
    },
    {
      'name': 'Product 3',
      'price': '\$30',
      'image': 'assets/product3.jpg',
    },
    // Add more products here
  ];

  StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'search',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'The Fastest Delivery',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.red, backgroundColor: Colors
                              .white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {
                            // Handle order now action
                          },
                          child: const Text('Order now'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Image.asset(
                    'assets/apples.png', // Update the path to your image
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Handle see all action
                  },
                  child: const Text('See all'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCategoryItem('Fuji', 'assets/fuji.jpg'),
                // Update the path to your image
                _buildCategoryItem('Pesticides', 'assets/pesticides.png'),
                // Update the path to your image
                _buildCategoryItem('Crops', 'assets/crops.jpg'),
                // Update the path to your image
                _buildCategoryItem('All', 'assets/all.jpg'),
                // Update the path to your image
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String label, String imagePath) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(label),
      ],
    );
  }
}