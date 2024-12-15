import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'detail_page_kost.dart';

class KostListPage extends StatefulWidget {
  @override
  _KostListPageState createState() => _KostListPageState();
}

class _KostListPageState extends State<KostListPage> {
  TextEditingController _searchController = TextEditingController();
  String _selectedGender = 'All';
  String _selectedFacility = 'All';
  String _priceFilter = 'None';
  List<String> _facilities = ['WiFi', 'AC', 'Parking'];
  bool _isFilterApplied = false;

  // Sample data with the provided image URL
  List<Map<String, dynamic>> _kostList = List.generate(10, (index) {
    return {
      'name': 'Kost ${index + 1}',
      'price': (index * 50000 + 100000).toString(),
      'gender': index % 2 == 0 ? 'Boy' : 'Girl',
      'facility': 'WiFi, AC',
      'image': 'https://binabangunbangsa.com/wp-content/uploads/2020/03/tips-Manajemen-Rumah-Kost-yang-Baik-dan-Benar-.jpg',
      'description': 'A cozy and affordable kost with great facilities.',
      'address': 'Jl. Example ${index + 1}, City',
      'isFavorite': false,
    };
  });

  List<Map<String, dynamic>> _applyFilters() {
    List<Map<String, dynamic>> filteredList = _kostList.where((kost) {
      bool matchesSearch = kost['name']!
          .toLowerCase()
          .contains(_searchController.text.toLowerCase());
      bool matchesGender =
          _selectedGender == 'All' || kost['gender'] == _selectedGender;
      bool matchesFacility =
          _selectedFacility == 'All' || kost['facility']!.contains(_selectedFacility);
      return matchesSearch && matchesGender && matchesFacility;
    }).toList();

    // Apply price sorting
    if (_priceFilter == 'Low to High') {
      filteredList.sort((a, b) => int.parse(a['price']!).compareTo(int.parse(b['price']!)));
    } else if (_priceFilter == 'High to Low') {
      filteredList.sort((a, b) => int.parse(b['price']!).compareTo(int.parse(a['price']!)));
    }

    return filteredList;
  }

  void _toggleFavorite(int index) {
    setState(() {
      _kostList[index]['isFavorite'] = !_kostList[index]['isFavorite'];
    });
  }

  void _clearFilters() {
    setState(() {
      _selectedGender = 'All';
      _selectedFacility = 'All';
      _priceFilter = 'None';
      _isFilterApplied = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1565C0), // Primary blue
                Color(0xFF42A5F5), // Light blue
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Find Your Kost',
          style: TextStyle(
            fontFamily: 'Roboto', // Changed font to Roboto
            fontWeight: FontWeight.w500,
            fontSize: 26,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1565C0), // Primary blue
              Color(0xFF1E88E5), // Lighter blue
              Color(0xFF42A5F5), // Even lighter blue
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search Kost...',
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.6),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (_) => setState(() {}),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.filter_list, color: Colors.white),
                  onPressed: () {
                    _showFilterDialog(context);
                  },
                ),
                if (_isFilterApplied)
                  IconButton(
                    icon: Icon(Icons.clear_all, color: Colors.white),
                    onPressed: _clearFilters,
                  ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _applyFilters().length,
                itemBuilder: (context, index) {
                  var kost = _applyFilters()[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => DetailPageKost(
                        name: kost['name']!,
                        image: kost['image']!,
                        description: kost['description']!,
                        address: kost['address']!,
                        price: kost['price']!,
                        gender: kost['gender']!,
                        facilities: kost['facility']!,
                        ownerId: 'Owner ID',
                        phoneNumber: '123-456-789',
                      ));
                    },
                    child: Card(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 5,
                      shadowColor: Color(0xFF1E88E5),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                                child: Image.network(
                                  kost['image'] ?? '',
                                  width: double.infinity,
                                  height: 200,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: double.infinity,
                                      height: 200,
                                      color: Colors.grey[300],
                                      child: Center(
                                        child: Icon(Icons.broken_image, size: 40, color: Colors.grey),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: IconButton(
                                  icon: Icon(
                                    kost['isFavorite'] ? Icons.favorite : Icons.favorite_border,
                                    color: kost['isFavorite'] ? Colors.red : Colors.grey,
                                  ),
                                  onPressed: () => _toggleFavorite(index),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      kost['name']!,
                                      style: TextStyle(
                                        fontFamily: 'Roboto', // Changed font to Roboto
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF0D47A1),
                                        fontSize: 18,
                                      ),
                                    ),
                                    // No need for the love button here anymore
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(Icons.attach_money, color: Colors.green, size: 18),
                                    SizedBox(width: 5),
                                    Text("Price: IDR ${kost['price']}"),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(Icons.person, color: Colors.blue, size: 18),
                                    SizedBox(width: 5),
                                    Text("Gender: ${kost['gender']}"),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(Icons.check_circle, color: Colors.orange, size: 18),
                                    SizedBox(width: 5),
                                    Text("Facilities: ${kost['facility']}"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Apply Filters"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Gender filter
              Text("Select Gender Filter"),
              DropdownButton<String>(
                value: _selectedGender,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedGender = newValue!;
                    _isFilterApplied = true;
                  });
                  Navigator.of(context).pop();
                },
                items: <String>['All', 'Boy', 'Girl']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              // Facility filter
              Text("Select Facility Filter"),
              DropdownButton<String>(
                value: _selectedFacility,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedFacility = newValue!;
                    _isFilterApplied = true;
                  });
                  Navigator.of(context).pop();
                },
                items: <String>['All', 'WiFi', 'AC', 'Parking']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              // Price filter
              Text("Select Price Filter"),
              DropdownButton<String>(
                value: _priceFilter,
                onChanged: (String? newValue) {
                  setState(() {
                    _priceFilter = newValue!;
                    _isFilterApplied = true;
                  });
                  Navigator.of(context).pop();
                },
                items: <String>['None', 'Low to High', 'High to Low']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
