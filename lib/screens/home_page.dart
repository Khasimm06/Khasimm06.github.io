import 'package:flutter/material.dart';
import 'booking_page.dart'; // Ensure this file exists
import 'account_page.dart';
import 'eventdetail_page.dart'; // Ensure this file exists

class HomePage extends StatefulWidget {
  final bool isFirstLogin;

  HomePage({this.isFirstLogin = false});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCity = "Select a city";
  String selectedCategory = "Entertainment";
  String hoveredItem = "";
  int _selectedIndex = 0;

  Map<String, List<Map<String, String>>> categoryItems = {
    "Entertainment": [
      {"name": "Movies & TV", "image": "movies.jpeg"},
      {"name": "Music", "image": "music.jpeg"},
      {"name": "Gaming", "image": "gaming.jpeg"},
      {"name": "Sports", "image": "sports.png"},
      {"name": "Literature & Books", "image": "books.jpeg"},
      {"name": "Live Events", "image": "concert.jpg"},
      {"name": "Online Content", "image": "online.jpeg"},
      {"name": "Fashion & Lifestyle", "image": "fashion.jpeg"},
    ],
    "Academic": [
      {"name": "Science", "image": "science.png"},
      {"name": "Mathematics", "image": "maths.png"},
      {"name": "Engineering & Technology", "image": "engineering.png"},
      {"name": "Medical & Health Sciences", "image": "medical.jpeg"},
      {"name": "Social Sciences", "image": "social.png"},
      {"name": "Humanities & Arts", "image": "humanity.png"},
      {"name": "Business & Management", "image": "business.jpeg"},
      {"name": "Education & Teaching", "image": "teaching.jpeg"},
      {"name": "Law & Legal Studies", "image": "law.jpeg"},
      {"name": "Environmental Studies", "image": "environment.jpeg"},
    ],
    "Volunteering": [
      {"name": "Education & Mentorship", "image": "education.jpeg"},
      {"name": "Healthcare & Medical", "image": "medicalV.png"},
      {"name": "Environmental & Conservation", "image": "environmentalV.jpeg"},
      {
        "name": "Disaster Relief & Humanitarian Aid",
        "image": "disaster relif.jpeg"
      },
      {"name": "Community Development", "image": "community.jpeg"},
      {"name": "Animal Welfare", "image": "animal.jpeg"},
      {"name": "Arts & Culture", "image": "arts.jpeg"},
      {"name": "Technology & Digital Volunteering", "image": "digital.jpeg"},
    ],
  };

  @override
  void initState() {
    super.initState();
    if (widget.isFirstLogin) {
      Future.delayed(Duration.zero, () => _showCitySelectionDialog());
    }
  }

  void _showCitySelectionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Select a City"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: ["Bengaluru", "Hyderabad", "Delhi", "Mumbai"]
                .map((city) => ListTile(
                      title: Text(city),
                      onTap: () {
                        setState(() {
                          selectedCity = city;
                        });
                        Navigator.pop(context);
                      },
                    ))
                .toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/logo1.png',
          height: 40,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          // City selection container
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 247, 225, 246),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.red),
                          SizedBox(width: 5),
                          Text(
                            selectedCity,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Icon(Icons.notifications, color: Colors.black),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    "   All areas in $selectedCity",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          // Category selection row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCategoryItem("Entertainment"),
                    _buildCategoryItem("Academic"),
                    _buildCategoryItem("Volunteering"),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Pick Your Category',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          // Grid view for categories
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.5, // Adjusted for full image coverage
                ),
                itemCount: categoryItems[selectedCategory]?.length ?? 0,
                itemBuilder: (context, index) {
                  Map<String, String> item =
                      categoryItems[selectedCategory]![index];
                  return _buildGridItem(item);
                },
              ),
            ),
          ),
          // "Most Popular" section (Only for "Entertainment" category)
          // "Most Popular" section (Only for "Entertainment" category)
          if (selectedCategory == "Entertainment") ...[
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Most Popular',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            // Inside the Most Popular section
            Container(
              height: 180, // Fixed height for scrolling
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildPopularItem(
                      "assets/popular1.png", "AR Rahman Live Concert"),
                  _buildPopularItem(
                      "assets/popular2.jpg", "IND vs ENG 2nd ODI"),
                  _buildPopularItem(
                      "assets/popular3.jpeg", "Arijit Singh's Live Concert"),
                  _buildPopularItem(
                      "assets/popular4.jpg", "CSK vs MI Semi-Final"),
                ],
              ),
            ),
          ],
        ],
      ),
      // Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple, // Active color
        unselectedItemColor: Colors.black, // Default color
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });

          if (index == 1) {
            // Booking
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookingPage()),
            );
          } else if (index == 2) {
            // Account
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccountPage()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  Widget _buildPopularItem(String imagePath, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            width: 250, // Fixed width for horizontal scrolling
            height: 140, // Ensure it has a height
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
              color: Colors.grey[300], // Placeholder color
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child:
                        Icon(Icons.broken_image, size: 50, color: Colors.red),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 8), // Space between image and button
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EventDetailsPage(imagePath: imagePath, title: title),
                ),
              );
            },
            child: Text("Book Tickets"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String category) {
    bool isSelected = category == selectedCategory;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          boxShadow: isSelected
              ? [BoxShadow(color: Colors.black26, blurRadius: 5)]
              : [],
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            category,
            style: TextStyle(
              fontSize: isSelected ? 18 : 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(Map<String, String> item) {
    return GestureDetector(
      onTap: () {
        setState(() {
          hoveredItem = item["name"]!;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150), // Reduced zoom effect
        transform: Matrix4.identity()
          ..scale(
              hoveredItem == item["name"] ? 1.05 : 1.0), // Smaller zoom effect
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: hoveredItem == item["name"]
              ? [BoxShadow(color: Colors.black45, blurRadius: 5)]
              : [BoxShadow(color: Colors.black26, blurRadius: 3)],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/${item["image"]}',
                fit: BoxFit.cover, // Full width image
              ),
              Container(
                color: Colors.black
                    .withOpacity(0.3), // Dark overlay for readability
              ),
              Center(
                child: Text(
                  item["name"]!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
