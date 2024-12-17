import 'package:flutter/material.dart';

class DetailPageKost extends StatelessWidget {
  final String name;
  final String image;
  final String description;
  final String address;
  final String price;
  final String gender;
  final String facilities;
  final String phoneNumber;
  final String ownerID;

  const DetailPageKost({
    Key? key,
    required this.name,
    required this.image,
    required this.description,
    required this.address,
    required this.price,
    required this.gender,
    required this.facilities,
    required this.phoneNumber,
    required this.ownerID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Kos',
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
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: Icon(Icons.broken_image, size: 50),
                  );
                },
              ),
            ),
            SizedBox(height: 16),

            // Description Card
            _buildInfoCard(
              icon: Icons.description,
              title: 'Deskripsi Kos',
              content: description,
            ),
            SizedBox(height: 8),

            // Address Card
            _buildInfoCard(
              icon: Icons.location_on,
              title: 'Alamat',
              content: address,
            ),
            SizedBox(height: 8),

            // Price Card
            _buildInfoCard(
              icon: Icons.attach_money,
              title: 'Harga',
              content: 'Rp $price',
            ),
            SizedBox(height: 8),

            // Gender Card
            _buildInfoCard(
              icon: gender == 'Laki - Laki'
                  ? Icons.male
                  : gender == 'Perempuan'
                  ? Icons.female
                  : Icons.people,
              title: 'Jenis Kelamin',
              content: gender,
            ),
            SizedBox(height: 8),

            // Facilities Card
            _buildInfoCard(
              icon: Icons.room_preferences,
              title: 'Fasilitas',
              content: facilities,
            ),
            SizedBox(height: 8),

            // Phone Number Card
            _buildInfoCard(
              icon: Icons.phone,
              title: 'Nomor Telepon',
              content: phoneNumber,
            ),
            SizedBox(height: 8),

            // Owner ID Card
            _buildInfoCard(
              icon: Icons.account_circle,
              title: 'Owner ID',
              content: ownerID,
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
