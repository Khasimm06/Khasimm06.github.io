import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'booking_page.dart';

class PaymentPage extends StatelessWidget {
  final int totalAmount;
  final String eventTitle;
  final int seatCount;

  PaymentPage(
      {required this.totalAmount,
      required this.eventTitle,
      required this.seatCount});

  // Save booking details to SharedPreferences
  Future<void> saveBookingHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Get existing bookings
    List<String> existingBookings =
        prefs.getStringList('booking_history') ?? [];

    // New booking entry
    Map<String, dynamic> newBooking = {
      'event': eventTitle,
      'totalAmount': totalAmount,
      'seatCount': seatCount,
      'date': DateTime.now().toString(),
    };

    // Add new booking to the list
    existingBookings.add(jsonEncode(newBooking));

    // Save back to SharedPreferences
    await prefs.setStringList('booking_history', existingBookings);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payment")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Total Amount:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("₹ $totalAmount",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await saveBookingHistory(); // Save booking after payment

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Payment Successful!")),
                );

                // Navigate to Booking Page after payment
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => BookingPage()),
                );
              },
              child: Text("Pay Now"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12),
                textStyle: TextStyle(fontSize: 18),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
