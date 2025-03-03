import 'package:flutter/material.dart';
import 'payment_page.dart';

class SeatSelectionPage extends StatefulWidget {
  final String eventTitle;

  SeatSelectionPage({required this.eventTitle});

  @override
  _SeatSelectionPageState createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  int platinumSeats = 0;
  int goldSeats = 0;
  int silverSeats = 0;

  final int platinumPrice = 2500;
  final int goldPrice = 1500;
  final int silverPrice = 500;
  final int taxFees = 199;

  int getTotalPrice() {
    int total = (platinumSeats * platinumPrice) +
        (goldSeats * goldPrice) +
        (silverSeats * silverPrice);
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Seats")),
      body: Column(
        children: [
          // Seat Layout
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text("Stage",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                _buildSeatClass("Platinum Class", platinumPrice, Colors.purple,
                    platinumSeats, (value) {
                  setState(() => platinumSeats = value);
                }),
                _buildSeatClass(
                    "Gold Class", goldPrice, Colors.orange, goldSeats, (value) {
                  setState(() => goldSeats = value);
                }),
                _buildSeatClass(
                    "Silver Class", silverPrice, Colors.grey, silverSeats,
                    (value) {
                  setState(() => silverSeats = value);
                }),
              ],
            ),
          ),
          Spacer(),
          // Bottom Bar for Pricing & Pay Now Button
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Column(
              children: [
                Text(
                  "₹ ${getTotalPrice()} for ${platinumSeats + goldSeats + silverSeats} seat(s)",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text("+₹ $taxFees tax & fees",
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: getTotalPrice() > 0
                      ? () {
                          // Navigate to Payment Page with event details
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentPage(
                                totalAmount: getTotalPrice() + taxFees,
                                eventTitle: widget.eventTitle,
                                seatCount:
                                    platinumSeats + goldSeats + silverSeats,
                              ),
                            ),
                          );
                        }
                      : null,
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
        ],
      ),
    );
  }

  // Helper function to build seat class row
  Widget _buildSeatClass(
      String name, int price, Color color, int count, Function(int) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.event_seat, color: color),
              SizedBox(width: 8),
              Text("$name  ₹$price",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove,
                    color: count > 0 ? Colors.purple : Colors.grey),
                onPressed: count > 0 ? () => onChanged(count - 1) : null,
              ),
              Text("$count", style: TextStyle(fontSize: 16)),
              IconButton(
                icon: Icon(Icons.add, color: Colors.purple),
                onPressed: () => onChanged(count + 1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
