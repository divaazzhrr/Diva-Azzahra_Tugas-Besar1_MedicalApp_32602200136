import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicalapps/core/widgets/health_stat_widget.dart';
import 'package:medicalapps/features/second_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _showReminderNotification = true;

  void _showOverlay(BuildContext context) {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50.0,
        left: MediaQuery.of(context).size.width / 2 - 100,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Reminder has been successfully set',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );

    overlayState.insert(overlayEntry);

    Future.delayed(Duration(seconds: 3), () {
      overlayEntry.remove();
      setState(() {
        _showReminderNotification = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6F0F8),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: _buildLeftCard(context),
        ),
      ),
    );
  }

  // Left Card Widget (Initial Screen)
  Widget _buildLeftCard(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(left: 50), // Geser seluruh kartu ke kanan
      decoration: _leftCardDecoration(),
      child: Stack(
        children: [
          _buildBackgroundDecorations(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _headerText('Good Morning!', 'Eugenia Burke'),
              const SizedBox(height: 16),
              _buildDoctorCard(
                context,
                'Dr. Maurice Tyler',
                'PHYSIOTHERAPY',
                'Hi Eugenia, you can find the first examination report here. And please check our next meet.',
                'assets/images/doctor_image.jpg',
              ),
              const SizedBox(height: 30), // Jarak antara dua kartu
              _buildPhysicalExamCard(),
            ],
          ),
        ],
      ),
    );
  }

  // Background Decorations
  Widget _buildBackgroundDecorations() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Stack(
          children: [
            Positioned(
              top: -30,
              left: -30,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: -40,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 40,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: 60,
              left: 100,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Header Text Widget
  Widget _headerText(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  // Doctor Card Widget
  Widget _buildDoctorCard(BuildContext context, String name, String subtitle, String message, String imageUrl) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _innerCardDecoration(),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                message,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Wrap(
                  spacing: 16, // Geser lebih ke kanan
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    HealthStatWidget(value: '86', label: 'HEART RATE', color: Colors.blue, icon: FontAwesomeIcons.heartbeat),
                    HealthStatWidget(value: '122 / 95', label: 'BLOOD PRESSURE', color: Colors.blue, icon: FontAwesomeIcons.tint, isLarge: true),
                    HealthStatWidget(value: '217', label: 'CHOLESTEROL', color: Colors.blue, icon: FontAwesomeIcons.cheese),
                    HealthStatWidget(value: '145', label: 'BLOOD SUGAR', color: Colors.blue, icon: FontAwesomeIcons.candyCane),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondScreen()),
                    );
                  },
                  child: Text(
                    'Check Complete Report',
                    style: TextStyle(
                      color: Colors.blue[500],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (_showReminderNotification)
            Positioned(
              top: 100,
              left: -80, // Geser lebih ke kanan agar tidak terpotong
              child: _buildReminderNotification(context),
            ),
        ],
      ),
    );
  }

  // Reminder Notification Widget
  Widget _buildReminderNotification(BuildContext context) {
    return Container(
      width: 300, // Perbesar width container
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/confirmation_image.jpeg'),
                radius: 20,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Helena Castillo',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Please remember to take your medicine on time everyday. You can set an alert from the app.',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: FaIcon(
                  FontAwesomeIcons.capsules,
                  color: Colors.blue[500],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '2 capsules daily after meals',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _showOverlay(context);
                      },
                      child: Row(
                        children: [
                          Text(
                            'Set an alert',
                            style: TextStyle(
                              color: Colors.blue[500],
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.notifications,
                            color: Colors.blue[500],
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Physical Examination Card Widget
  Widget _buildPhysicalExamCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _innerCardDecoration(),
      child: Stack(
        children: [
          Column(
            children: [
              const Text(
                'Physical Examination',
                style: TextStyle(
                  color: Color(0xFF1DB954),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Stack(
                children: [
                  Image.asset(
                    'assets/images/physical_examination_image.png',
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 50,
                      );
                    },
                  ),
                  Positioned(
                    bottom: 60, // Naikkan posisi teks "SHOULDER MUSCLE"
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'SHOULDER MUSCLE',
                              style: TextStyle(
                                color: Color(0xFF4A4A4A),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 4),
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: Color(0xFF4A4A4A),
                              child: Text(
                                'i',
                                style: GoogleFonts.roboto( // Menggunakan font Roboto
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 4,
                    left: 4,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Color(0xFF00796B), // Warna hijau tosca yang lebih gelap
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Icon(
                        Icons.description,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Left Card Decoration
  BoxDecoration _leftCardDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFF66BB6A), Color(0xFF26A69A)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3), // Posisi bayangan
        ),
      ],
    );
  }

  // Inner Card Decoration
  BoxDecoration _innerCardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 3,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }
}