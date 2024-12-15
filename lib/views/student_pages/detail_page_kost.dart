import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPageKost extends StatelessWidget {
  final String name;
  final String image;
  final String description;
  final String address;
  final String price;
  final String gender;
  final String facilities;
  final String ownerId;
  final String phoneNumber;

  const DetailPageKost({
    Key? key,
    required this.name,
    required this.image,
    required this.description,
    required this.address,
    required this.price,
    required this.gender,
    required this.facilities,
    required this.ownerId,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Kost',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF1565C0),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Name
            Text(
              name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D47A1),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),

            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),

            // Description Card
            _buildInfoCard(
              icon: Icons.description,
              title: 'Description',
              content: description,
            ),
            SizedBox(height: 8),

            // Address Card
            _buildInfoCard(
              icon: Icons.location_on,
              title: 'Address',
              content: address,
            ),
            SizedBox(height: 8),

            // Price Card
            _buildInfoCard(
              icon: Icons.attach_money,
              title: 'Price',
              content: 'IDR $price',
            ),
            SizedBox(height: 8),

            // Gender Card
            _buildInfoCard(
              icon: gender == 'Boy'
                  ? Icons.male
                  : gender == 'Girl'
                  ? Icons.female
                  : Icons.people,
              title: 'Gender',
              content: gender,
            ),
            SizedBox(height: 8),

            // Facilities Card
            _buildInfoCard(
              icon: Icons.room_preferences,
              title: 'Facilities',
              content: facilities,
            ),
            SizedBox(height: 8),

            // Owner ID Card
            _buildInfoCard(
              icon: Icons.perm_identity,
              title: 'Owner ID',
              content: ownerId,
            ),
            SizedBox(height: 8),

            // Phone Number Card
            _buildInfoCard(
              icon: Icons.phone,
              title: 'Phone Number',
              content: phoneNumber,
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Color(0xFF1E88E5), size: 30),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF1565C0),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    content,
                    style: TextStyle(fontSize: 14, color: Color(0xFF0D47A1)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
