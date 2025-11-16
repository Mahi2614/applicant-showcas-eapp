import 'package:assetwize/core/constants/app_colors.dart';
import 'package:assetwize/presentation/screens/arts_list_screen.dart';
import 'package:assetwize/presentation/screens/collectible_list_screen.dart';
import 'package:assetwize/presentation/screens/electronics_list_screen.dart';
import 'package:assetwize/presentation/screens/realty_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:assetwize/presentation/widgets/section_header.dart';
import 'package:assetwize/presentation/screens/insurance_list_screen.dart';
import 'package:assetwize/presentation/screens/garage_list_screen.dart';
import 'package:assetwize/presentation/screens/jewellery_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, String>> tabs = [
    {"title": "My Insurances", "icon": "assets/icons/insurance.png"},
    {"title": "Garage", "icon": "assets/icons/garage.png"},
    {"title": "Jewellery", "icon": "assets/icons/jewellery.png"},
    {"title": "Realty", "icon": "assets/icons/realty.png"},
    {"title": "Electronics", "icon": "assets/icons/electronics.png"},
    {"title": "Collectible", "icon": "assets/icons/collectible.png"},
    {"title": "Arts", "icon": "assets/icons/arts.png"},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            color: white,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),
                Text(
                  "ASSETWIZE",
                  style: GoogleFonts.inter(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Nayra's assets",
                  style: TextStyle(fontSize: 14, color: greyDark),
                ),
                SectionHeader(controller: _tabController, tabs: tabs),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                InsuranceListScreen(),
                const GarageListScreen(),
                const JewelleryListScreen(),
                const RealtyListScreen(),
                const ElectronicsListScreen(),
                const CollectibleListScreen(),
                const ArtsListScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
