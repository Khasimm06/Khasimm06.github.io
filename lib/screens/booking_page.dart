import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'home_page.dart';
import 'account_page.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int _selectedIndex = 1;
  List<Map<String, dynamic>> bookingHistory = [];

  @override
  void initState() {
    super.initState();
    _loadBookingHistory();
  }

  // Load booking history from SharedPreferences
  Future<void> _loadBookingHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? storedBookings = prefs.getStringList('booking_history');

    if (storedBookings == null || storedBookings.isEmpty) {
      setState(() {
        bookingHistory = []; // No bookings
      });
      return;
    }

    try {
      setState(() {
        bookingHistory = storedBookings
            .map((booking) => jsonDecode(booking) as Map<String, dynamic>)
            .toList();
      });
    } catch (e) {
      print("Error decoding booking history: $e");
      setState(() {
        bookingHistory = []; // Clear on error
      });
    }
  }

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    Widget nextPage;
    switch (index) {
      case 0:
        nextPage = HomePage();
        break;
      case 1:
        return;
      case 2:
        nextPage = AccountPage();
        break;
      default:
        return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => nextPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Booking History')),
      body: bookingHistory.isEmpty
          ? Center(
              child: Text(
                "No bookings yet!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: bookingHistory.length,
              itemBuilder: (context, index) {
                final booking = bookingHistory[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      booking['event'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Seats: ${booking['seatCount']} • Price: ₹${booking['totalAmount']}",
                      style: TextStyle(color: Colors.black87),
                    ),
                    trailing: Text(
                      booking['date'].split(" ")[0], // Display only the date
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
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
}
