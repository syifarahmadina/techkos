import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'detail_page_kost.dart';

class KostListPage extends StatefulWidget {
  @override
  _KostListPageState createState() => _KostListPageState();
}

class _KostListPageState extends State<KostListPage> {
  TextEditingController _searchController = TextEditingController();
  String _selectedGender = 'Semua';
  String _selectedFacility = 'Semua';
  String _priceFilter = 'Tidak Ada';
  List<String> facilities = ['WiFi', 'AC', 'Kipas', 'Kulkas', 'Kamar Mandi Dalam', 'Kamar Mandi Luar', 'Parkir'];
  bool _isFilterApplied = false;

  // Sample data with the provided image URL
  List<Map<String, dynamic>> _kostList = [
  {
  'name': 'Wisma Damai 1',
  'price': '5500000',
  'gender': 'Laki - Laki, Perempuan',
  'facility': 'Kamar Mandi Dalam, Kulkas, WiFi',
  'image': 'https://drive.google.com/uc?id=1QFQTIHt-eCREKLSSYtxltwfPyD0JeZqG',
  'description': 'Kost yang nyaman tenang, dekat dengan kampus, dan dikelilingi penjual makanan.',
  'address': 'RT. 02, RW. 03, Dusun 2, Desa Blater, Kecamatan Kalimanah, Purbalingga',
  'phoneNumber': '081327375251',
  'ownerID': 1001,
  'isFavorite': false,
  },
  {
  'name': 'Kost Blater 34',
  'price': '5000000',
  'gender': 'Laki - Laki',
  'facility': 'Kamar Mandi Dalam, Kulkas, WiFi',
  'image': 'https://drive.google.com/uc?id=1P2VckvwEpJYFMTxlC1FUh1Po2UqgEkdC',
  'description': 'Kost yang nyaman tenang, dekat dengan kampus, dan dikelilingi penjual makanan.',
  'address': 'RT. 03, RW. 03, Dusun 2, Desa Blater, Kecamatan Kalimanah, Purbalingga',
  'phoneNumber': '085290836595',
  'ownerID': 1002,
  'isFavorite': false,
  },
  {
  'name': 'Kost Barokah',
  'price': '5000000',
  'gender': 'Laki - Laki, Perempuan',
  'facility': 'Kamar Mandi Dalam, WiFi',
  'image': '',  // Provide image URL if available
  'description': 'Kost yang dekat dengan kampus, lapangan blater, dan juga tukang nasi goreng.',
  'address': 'RT. 03, RW. 03, Dusun 2, Desa Blater, Kecamatan Kalimanah, Purbalingga',
  'phoneNumber': '081231042593',
  'ownerID': 1003,
  'isFavorite': false,
  },
  {
  'name': 'Daisy Kost',
  'price': '6000000',
  'gender': 'Perempuan',
  'facility': 'Kamar Mandi Dalam, Kulkas, WiFi',
  'image': '',  // Provide image URL if available
  'description': 'Kost yang tidak dekat jalan utama sehingga memberikan kenyamanan dan keamanan yang baik.',
  'address': 'RT. 01, RW. 03, Dusun 2, Desa Blater, Kecamatan Kalimanah, Purbalingga',
  'phoneNumber': '085786000032',
  'ownerID': 1004,
  'isFavorite': false,
  },
  {
  'name': 'Kost Putra Bidan Yeti',
  'price': '5000000',
  'gender': 'Laki - Laki',
  'facility': 'Kamar Mandi Dalam, Wifi',
  'image': '',  // Provide image URL if available
  'description': 'Kost yang berada dekat perumahan warga sehingga memberikan kesan yang homy.',
  'address': 'RT. 02, RW. 03, Dusun 2, Desa Blater, Kecamatan Kalimanah, Purbalingga',
  'phoneNumber': '082169772574',
  'ownerID': 1005,
  'isFavorite': false,
  },
  {
  'name': 'Wisma Alden',
  'price': '5500000',
  'gender': 'Perempuan',
  'facility': 'Kamar Mandi Dalam, Kulkas, WiFi, Parkir',
  'image': '',  // Provide image URL if available
  'description': 'Kost yang memiliki banyak kamar, parkir luas, dan terdapat warung makan di dalam kawasan kost.',
  'address': 'RT. 02, RW. 03, Dusun 2, Desa Blater, Kecamatan Kalimanah, Purbalingga',
  'phoneNumber': '082122415204',
  'ownerID': 1006,
  'isFavorite': false,
  },
  {
  'name': 'Wisma Yolanda',
  'price': '4500000',
  'gender': 'Laki - Laki',
  'facility': 'Kamar Mandi Luar Kulkas, WiFi, Parkir',
  'image': '',  // Provide image URL if available
  'description': 'Kost yang cukup dekat dengan kampus, masih berada di jalan utama dan memiliko bangunan yang baru.',
  'address': 'RT. 01, RW. 03, Dusun 2, Desa Blater, Kecamatan Kalimanah, Purbalingga',
  'phoneNumber': '082242157793',
  'ownerID': 1007,
  'isFavorite': false,
  },
  {
  'name': 'Kosbin Blater',
  'price': '6500000',
  'gender': 'Perempuan',
  'facility': 'Kamar Mandi Dalam, Kulkas, WiFi, Parkir',
  'image': '',  // Provide image URL if available
  'description': 'Kost dengan bangunan baru, memiliki parkiran yang cukup luas, dan berada di jalan utama.',
  'address': 'RT. 01, RW. 03, Dusun 2, Desa Blater, Kecamatan Kalimanah, Purbalingga',
  'phoneNumber': '081379524663',
  'ownerID': 1008,
  'isFavorite': false,
  },
  {
  'name': 'Widya Kost',
  'price': '6000000',
  'gender': 'Perempuan',
  'facility': 'Kamar Mandi Dalam, Kulkas, WiFi',
  'image': '',  // Provide image URL if available
  'description': 'Kost khusus perempuan dan tidak memiliki banyak kamar sehingga membuat penghuni terasa tenang dan nyaman.',
  'address': 'RT. 01, RW. 03, Dusun 2, Desa Blater, Kecamatan Kalimanah, Purbalingga',
  'phoneNumber': '0821743888396',
  'ownerID': 1009,
  'isFavorite': false,
  },
  {
  'name': 'Rumah Kost Perwira',
  'price': '4500000',
  'gender': 'Perempuan',
  'facility': 'Kamar Mandi Luar, WiFi',
  'image': '',  // Provide image URL if available
  'description': 'Kost yang berada cukup jauh dari jalan utama sehingga memberikan kesan nyaman dan tenang.',
  'address': 'RT. 02, RW. 01, Dusun 1, Desa Blater, Kecamatan Kalimanah, Purbalingga',
  'phoneNumber': '08529083659',
  'ownerID': 1010,
  'isFavorite': false,
  },
  {
  'name': 'Wisma Ashie',
  'price': '5000000',
  'gender': 'Laki - Laki',
  'facility': 'Kamar Mandi Dalam, Kulkas, WiFi, Parkir',
  'image': '',  // Provide image URL if available
  'description': 'Kost dengan bangunan baru serta memiliki halaman parkir yang luas.',
  'address': 'RT. 01, RW. 02, Dusun 1, Desa Blater, Kecamatan Kalimanah, Purbalingga',
  'phoneNumber': '082254869322',
  'ownerID': 1011,
  'isFavorite': false,
  },
  {
  'name': 'Kost Bp. Safari Dy',
  'price': '5000000',
  'gender': 'Perempuan',
  'facility': 'Kamar Mandi Dalam, Kulkas, WiFi',
  'image': '',  // Provide image URL if available
  'description': 'Kost yang seperti rumah sendiri sehingga memberikan kesan nyaman.',
  'address': 'RT. 02, RW. 01, Dusun 1, Desa Blater, Kecamatan Kalimanah, Purbalingga',
  'phoneNumber': '082159337149',
  'ownerID': 1012,
  'isFavorite': false,
  },
  {
  'name': 'Kost Griya Dara',
  'price': '5000000',
  'gender': 'Perempuan',
  'facility': 'Kamar Mandi Dalam, WiFi',
  'image': '',  // Provide image URL if available
  'description': 'Kost yang berada di sekitar perumahan warga dan dekat dengan masjid.',
  'address': 'RT. 01, RW. 01, Dusun 1, Desa Blater, Kecamatan Kalimanah, Purbalingga',
  'phoneNumber': '082163584771',
  'ownerID': 1013,
  'isFavorite': false,
  },
  {
  'name': 'Kost Bu Dapin',
  'price': '5000000',
  'gender': 'Laki - Laki',
  'facility': 'Kamar Mandi Dalam, WiFi, Parkir',
  'image': '',  // Provide image URL if available
  'description': 'Kost dengan fasilitas lengkap, tempat tinggal yang nyaman.',
  'address': 'RT. 02, RW. 01, Dusun 1, Desa Blater, Kecamatan Kalimanah, Purbalingga',
  'phoneNumber': '085298372636',
  'ownerID': 1014,
  'isFavorite': false,
  },
  ];

  List<Map<String, dynamic>> _applyFilters() {
    List<Map<String, dynamic>> filteredList = _kostList.where((kost) {
      bool matchesSearch = kost['name']!
          .toLowerCase()
          .contains(_searchController.text.toLowerCase());
      bool matchesGender =
          _selectedGender == 'Semua' || kost['gender'] == _selectedGender;
      bool matchesFacility =
          _selectedFacility == 'Semua' || kost['facility']!.contains(_selectedFacility);
      return matchesSearch && matchesGender && matchesFacility;
    }).toList();

    // Apply price sorting
    if (_priceFilter == 'Termurah ke Termahal') {
      filteredList.sort((a, b) => int.parse(a['price']!).compareTo(int.parse(b['price']!)));
    } else if (_priceFilter == 'Termahal ke Termurah') {
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
      _selectedGender = 'Semua';
      _selectedFacility = 'Semua';
      _priceFilter = 'Tidak Ada';
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
          'Temukan Kost Sesuai Pilihanmu',
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
                      hintText: 'Cari Kost ...',
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
                        phoneNumber: kost ['phoneNumber']!,
                        ownerID: kost ['Owner ID'].toString(),
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
                                    Text("Harga: Rp ${kost['price']}"),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(Icons.person, color: Colors.blue, size: 18),
                                    SizedBox(width: 5),
                                    Text("Jenis Kelamin: ${kost['gender']}"),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(Icons.check_circle, color: Colors.orange, size: 18),
                                    SizedBox(width: 5),
                                    Text("Fasilitas: ${kost['facility']}"),
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
          title: Text("Cari Sesuai Kriteria"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Gender filter
              Text("Berdasarkan Jenis Kelamin"),
              DropdownButton<String>(
                value: _selectedGender,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedGender = newValue!;
                    _isFilterApplied = true;
                  });
                  Navigator.of(context).pop();
                },
                items: <String>['Semua', 'Laki - Laki', 'Perempuan']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              // Facility filter
              Text("Berdasarkan Fasilitas"),
              DropdownButton<String>(
                value: _selectedFacility,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedFacility = newValue!;
                    _isFilterApplied = true;
                  });
                  Navigator.of(context).pop();
                },
                items: <String>['Semua', 'WiFi', 'AC', 'Kipas', 'Kulkas', 'Kamar Mandi Dalam', 'Kamar Mandi Luar', 'Parkir']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              // Price filter
              Text("Berdasarkan Harga"),
              DropdownButton<String>(
                value: _priceFilter,
                onChanged: (String? newValue) {
                  setState(() {
                    _priceFilter = newValue!;
                    _isFilterApplied = true;
                  });
                  Navigator.of(context).pop();
                },
                items: <String>['Tidak Ada', 'Termurah ke Termahal', 'Termahal ke Termurah']
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
