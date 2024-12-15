import 'package:flutter/material.dart';

class ManageKostPage extends StatefulWidget {
  @override
  _ManageKostPageState createState() => _ManageKostPageState();
}

class _ManageKostPageState extends State<ManageKostPage> {
  final List<Map<String, dynamic>> _kostList = [
    {
      "name": "Kost A",
      "price": "1,000,000",
      "images": [
        "https://via.placeholder.com/300",
        "https://via.placeholder.com/300/ff0000/ffffff"
      ],
      "description": "Cozy place near campus.",
      "address": "Jl. Sudirman No.1, Purwokerto",
      "gender": "Male",
      "facilities": "WiFi, AC, Parking",
      "phone": "081234567890"
    },
    {
      "name": "Kost B",
      "price": "850,000",
      "images": [
        "https://via.placeholder.com/300/0000ff/ffffff",
        "https://via.placeholder.com/300/ff8800/ffffff"
      ],
      "description": "Affordable with great facilities.",
      "address": "Jl. Ahmad Yani No.2, Purwokerto",
      "gender": "Female",
      "facilities": "WiFi, AC",
      "phone": "081298765432"
    },
  ];

  void _addKost(BuildContext context) {
    _openKostForm(context, title: "Add Kost", onSave: (newKost) {
      setState(() {
        _kostList.add(newKost);
      });
    });
  }

  void _editKost(BuildContext context, int index) {
    final existingKost = _kostList[index];
    _openKostForm(
      context,
      title: "Edit Kost",
      initialData: existingKost,
      onSave: (updatedKost) {
        setState(() {
          _kostList[index] = updatedKost;
        });
      },
    );
  }

  void _deleteKost(int index) {
    setState(() {
      _kostList.removeAt(index);
    });
  }

  void _openKostForm(
      BuildContext context, {
        required String title,
        Map<String, dynamic>? initialData,
        required Function(Map<String, dynamic>) onSave,
      }) {
    final TextEditingController nameController =
    TextEditingController(text: initialData?['name'] ?? "");
    final TextEditingController priceController =
    TextEditingController(text: initialData?['price'] ?? "");
    final TextEditingController imageUrlController =
    TextEditingController(text: initialData?['images']?[0] ?? "");
    final TextEditingController descriptionController =
    TextEditingController(text: initialData?['description'] ?? "");
    final TextEditingController addressController =
    TextEditingController(text: initialData?['address'] ?? "");
    final TextEditingController genderController =
    TextEditingController(text: initialData?['gender'] ?? "");
    final TextEditingController facilitiesController =
    TextEditingController(text: initialData?['facilities'] ?? "");
    final TextEditingController phoneController =
    TextEditingController(text: initialData?['phone'] ?? "");

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title, style: TextStyle(color: Color(0xFF0D47A1))),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTextField("Name", nameController, Icons.business),
              _buildTextField("Price (IDR)", priceController, Icons.attach_money),
              _buildTextField("Image URL", imageUrlController, Icons.image),
              _buildTextField("Description", descriptionController, Icons.description),
              _buildTextField("Address", addressController, Icons.place),
              _buildTextField("Gender", genderController, Icons.person),
              _buildTextField("Facilities", facilitiesController, Icons.settings),
              _buildTextField("Phone", phoneController, Icons.phone),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF0D47A1)),
            onPressed: () {
              final newKost = {
                "name": nameController.text,
                "price": priceController.text,
                "images": [imageUrlController.text], // Add images as a list
                "description": descriptionController.text,
                "address": addressController.text,
                "gender": genderController.text,
                "facilities": facilitiesController.text,
                "phone": phoneController.text,
              };
              onSave(newKost);
              Navigator.of(ctx).pop();
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        icon: Icon(icon, color: Color(0xFF1565C0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Stack(
        children: [
          Positioned(
            top: -50,
            left: -50,
            child: CircleAvatar(
              radius: 150,
              backgroundColor: Colors.blue.shade200.withOpacity(0.3),
            ),
          ),
          Positioned(
            bottom: -50,
            right: -50,
            child: CircleAvatar(
              radius: 150,
              backgroundColor: Colors.blue.shade400.withOpacity(0.3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton.icon(
                    onPressed: () => _addKost(context),
                    icon: Icon(Icons.add, color: Colors.white),
                    label: Text(
                      "Add Kost",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0D47A1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _kostList.length,
                    itemBuilder: (context, index) {
                      final kost = _kostList[index];
                      return KostCard(
                        kost: kost,
                        onEdit: () => _editKost(context, index),
                        onDelete: () => _deleteKost(index),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class KostCard extends StatelessWidget {
  final Map<String, dynamic> kost;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  KostCard({required this.kost, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        children: [
          // Image Carousel
          kost['images'].length > 1
              ? SizedBox(
            height: 200,
            child: PageView.builder(
              itemCount: kost['images'].length,
              itemBuilder: (ctx, index) {
                return Image.network(kost['images'][index], fit: BoxFit.cover);
              },
            ),
          )
              : Image.network(kost['images'][0], height: 200, fit: BoxFit.cover),

          // Details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Displaying the name as a large header
                Text(
                  kost['name'],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0D47A1),
                  ),
                ),
                SizedBox(height: 8),
                // Align text to left
                _buildDetailText("Price: IDR ${kost['price']}", alignment: TextAlign.start),
                _buildDetailText("Description: ${kost['description']}", alignment: TextAlign.start),
                _buildDetailText("Address: ${kost['address']}", alignment: TextAlign.start),
                _buildDetailText("Gender: ${kost['gender']}", alignment: TextAlign.start),
                _buildDetailText("Facilities: ${kost['facilities']}", alignment: TextAlign.start),
                _buildDetailText("Phone: ${kost['phone']}", alignment: TextAlign.start),
              ],
            ),
          ),
          ButtonBar(
            children: [
              IconButton(
                icon: Icon(Icons.edit, color: Colors.blue),
                onPressed: onEdit,
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: onDelete,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailText(String text, {TextAlign alignment = TextAlign.center}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        text,
        textAlign: alignment,
      ),
    );
  }
}
