import 'dart:math';
import 'dart:html' as html;
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const GamingZoneBookingApp());
}

class GamingZoneBookingApp extends StatelessWidget {
  const GamingZoneBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Next Level Gaming Zone Booking',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF111827),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFF8C42),
          secondary: Color(0xFFFFB067),
          surface: Color(0xFF1F2937),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF111827),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
        cardTheme: CardThemeData(
          color: const Color(0xFF1F2937),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF8C42),
            foregroundColor: Colors.white,
            minimumSize: const Size(110, 48),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: const BorderSide(
              color: Color(0xFFFF8C42),
              width: 1.3,
            ),
            minimumSize: const Size(110, 48),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF1F2937),
          hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
          labelStyle: const TextStyle(color: Color(0xFFD1D5DB)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFF374151)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFF374151)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: Color(0xFFFF8C42),
              width: 1.5,
            ),
          ),
        ),
        dialogTheme: DialogThemeData(
          backgroundColor: const Color(0xFF1F2937),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          contentTextStyle: const TextStyle(
            color: Color(0xFFE5E7EB),
            fontSize: 15,
          ),
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: const Color(0xFF1F2937),
          contentTextStyle: const TextStyle(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          behavior: SnackBarBehavior.floating,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _goToBookSlot(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BookingPage()),
    );
  }

  void _goToCheckStatus(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CheckBookingStatusPage(),
      ),
    );
  }

  void _goToOwnerLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OwnerLoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: TextButton(
              onPressed: () => _goToOwnerLogin(context),
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFFFF8C42),
              ),
              child: const Text(
                'Owner Login',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF111827),
              Color(0xFF1F2937),
              Color(0xFF0F172A),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFFF8C42).withOpacity(0.12),
                        border: Border.all(
                          color: const Color(0xFFFF8C42).withOpacity(0.35),
                          width: 1.2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFF8C42).withOpacity(0.18),
                            blurRadius: 22,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.sports_esports,
                        size: 56,
                        color: Color(0xFFFF8C42),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Welcome to\nNext Level Gaming Zone Booking',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Book your PS5 slot quickly and check your booking status anytime.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFD1D5DB),
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 300,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () => _goToBookSlot(context),
                        child: const Text('Book Slot'),
                      ),
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      width: 300,
                      height: 52,
                      child: OutlinedButton(
                        onPressed: () => _goToCheckStatus(context),
                        child: const Text('Check Booking Status'),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  String? selectedSlot;
  String? selectedDevice;

  List<String> availableSlots = [];
  Set<String> approvedBookedSlots = {};

  final List<String> availableDevices = [
    'PS5 Solo Play',
    'PS5 Multiplayer',
    'PS5 Racing Setup 1',
    'PS5 Racing Setup 2',
  ];

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    dateController.dispose();
    super.dispose();
  }

  String formatTimeOfDay(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  void generateSlotsForDate(DateTime selectedDate) {
    final bool isSunday = selectedDate.weekday == DateTime.sunday;
    final int startHour = isSunday ? 8 : 9;
    final int endHour = 23;

    final DateTime now = DateTime.now();
    final bool isToday = selectedDate.year == now.year &&
        selectedDate.month == now.month &&
        selectedDate.day == now.day;

    List<String> slots = [];

    for (int hour = startHour; hour < endHour; hour++) {
      final DateTime slotStart = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        hour,
        0,
      );

      if (isToday && !slotStart.isAfter(now)) {
        continue;
      }

      final start = TimeOfDay(hour: hour, minute: 0);
      final end = TimeOfDay(hour: hour + 1, minute: 0);

      slots.add('${formatTimeOfDay(start)} - ${formatTimeOfDay(end)}');
    }

    setState(() {
      availableSlots = slots;
      selectedSlot = null;
    });
  }

  Future<void> loadApprovedBookedSlots() async {
    final device = selectedDevice?.trim();
    final date = dateController.text.trim();

    if (device == null || date.isEmpty) {
      setState(() {
        approvedBookedSlots = {};
        selectedSlot = null;
      });
      return;
    }

    final querySnapshot = await FirebaseFirestore.instance
        .collection('bookings')
        .where('device', isEqualTo: device)
        .where('date', isEqualTo: date)
        .where('status', isEqualTo: 'approved')
        .get();

    final bookedSlots = querySnapshot.docs
        .map((doc) {
          final booking = doc.data();
          return (booking['slot'] ?? '').toString();
        })
        .where((slot) => slot.isNotEmpty)
        .toSet();

    setState(() {
      approvedBookedSlots = bookedSlots;

      if (selectedSlot != null && bookedSlots.contains(selectedSlot)) {
        selectedSlot = null;
      }
    });
  }

  void copyText(String text, String label) {
    Clipboard.setData(ClipboardData(text: text));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$label copied'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Booking Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDeviceInfoCard() {
    if (selectedDevice == null) return const SizedBox.shrink();

    Widget content;

    switch (selectedDevice) {
      case 'PS5 Solo Play':
        content = _deviceInfoLayout(
          title: 'PS5 Solo Play',
          subtitle: 'Best for single-player gaming sessions.',
          children: const [
            _PriceTile(label: 'Price', value: '₹60 / hour'),
          ],
        );
        break;

      case 'PS5 Multiplayer':
        content = _deviceInfoLayout(
          title: 'PS5 Multiplayer Pricing',
          subtitle: 'Select pricing based on player count.',
          children: const [
            _PriceTile(label: '2 Players', value: '₹100 / hour'),
            _PriceTile(label: '3 Players', value: '₹150 / hour'),
            _PriceTile(label: '4 Players', value: '₹200 / hour'),
          ],
        );
        break;

      case 'PS5 Racing Setup 1':
        content = _deviceInfoLayout(
          title: 'PS5 Racing Setup 1',
          subtitle: 'Racing wheel experience with PS5 setup.',
          children: const [
            _PriceTile(label: 'Price', value: '₹100 / hour'),
          ],
        );
        break;

      case 'PS5 Racing Setup 2':
        content = _deviceInfoLayout(
          title: 'PS5 Racing Setup 2',
          subtitle: 'Racing wheel experience with PS5 setup.',
          children: const [
            _PriceTile(label: 'Price', value: '₹100 / hour'),
          ],
        );
        break;

      default:
        content = const SizedBox.shrink();
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFF8C42).withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFFF8C42).withOpacity(0.25),
        ),
      ),
      child: content,
    );
  }

  Widget _deviceInfoLayout({
    required String title,
    required String subtitle,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFB067),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFFD1D5DB),
          ),
        ),
        const SizedBox(height: 12),
        ...children,
      ],
    );
  }

  Future<String> generateBookingCode() async {
    final random = Random();

    while (true) {
      final code = (100000 + random.nextInt(900000)).toString();

      final querySnapshot = await FirebaseFirestore.instance
          .collection('bookings')
          .where('bookingCode', isEqualTo: code)
          .get();

      if (querySnapshot.docs.isEmpty) {
        return code;
      }
    }
  }

  Future<String> saveBookingToFirestore({
    required String name,
    required String phone,
    required String device,
    required String date,
    required String slot,
  }) async {
    final bookingCode = await generateBookingCode();

    await FirebaseFirestore.instance.collection('bookings').add({
      'bookingCode': bookingCode,
      'name': name,
      'phone': phone,
      'device': device,
      'date': date,
      'slot': slot,
      'status': 'pending',
      'createdAt': FieldValue.serverTimestamp(),
    });

    return bookingCode;
  }

  Future<bool> isSlotAlreadyBooked({
    required String device,
    required String date,
    required String slot,
  }) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('bookings')
        .where('device', isEqualTo: device.trim())
        .where('date', isEqualTo: date.trim())
        .where('slot', isEqualTo: slot.trim())
        .where('status', isEqualTo: 'approved')
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  Future<void> confirmBooking() async {
    final name = nameController.text.trim();
    final phone = phoneController.text.trim();
    final date = dateController.text.trim();
    final slot = selectedSlot?.trim();
    final device = selectedDevice?.trim();

    if (name.isEmpty ||
        phone.isEmpty ||
        date.isEmpty ||
        slot == null ||
        device == null) {
      showErrorDialog('Please fill all fields');
      return;
    }

    if (phone.length != 10) {
      showErrorDialog('Mobile number must be exactly 10 digits');
      return;
    }

    final alreadyBooked = await isSlotAlreadyBooked(
      device: device,
      date: date,
      slot: slot,
    );

    if (alreadyBooked) {
      showErrorDialog('This slot is already booked for the selected PS5.');
      return;
    }

    String bookingId;
    try {
      bookingId = await saveBookingToFirestore(
        name: name,
        phone: phone,
        device: device,
        date: date,
        slot: slot,
      );
    } catch (e) {
      showErrorDialog('Failed to save booking: $e');
      return;
    }

    if (!mounted) return;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Booking Received'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Your booking request has been placed successfully.'),
              const SizedBox(height: 12),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8,
                children: [
                  const Text('Booking ID: '),
                  SelectableText(
                    bookingId,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    tooltip: 'Copy Booking ID',
                    onPressed: () => copyText(bookingId, 'Booking ID'),
                    icon: const Icon(Icons.copy, size: 20),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text('Status: Pending Approval'),
              const SizedBox(height: 12),
              Text('Name: $name'),
              Text('Phone: $phone'),
              Text('PS5: $device'),
              Text('Date: $date'),
              Text('Slot: $slot'),
              const SizedBox(height: 12),
              const Text(
                'Please save your Booking ID to check your booking status later.',
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);

                nameController.clear();
                phoneController.clear();
                dateController.clear();

                setState(() {
                  selectedDevice = null;
                  selectedSlot = null;
                  availableSlots = [];
                });
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Slot'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 520,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF1F2937).withOpacity(0.65),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: const Color(0xFFFF8C42).withOpacity(0.18),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 24,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Reserve Your PS5 Session",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Choose your setup, date, and time slot to confirm your booking.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'Customer Name',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
                  ],
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Phone Number',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  decoration: InputDecoration(
                    hintText: 'Enter 10-digit mobile number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Select PS5 Setup',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: selectedSlot,
                  isExpanded: true,
                  onTap: () async {
                    await loadApprovedBookedSlots();
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  items: availableDevices.map((device) {
                    return DropdownMenuItem<String>(
                      value: device,
                      child: Text(
                        device,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) async {
                    setState(() {
                      selectedDevice = value;
                      selectedSlot = null;
                      approvedBookedSlots = {};
                    });

                    await loadApprovedBookedSlots();
                  },
                  hint: const Text('Choose PS5 setup'),
                ),
                _buildDeviceInfoCard(),
                const SizedBox(height: 16),
                const Text(
                  'Select Date',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: dateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'Select a date',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    suffixIcon: const Icon(Icons.calendar_today),
                  ),
                  onTap: () async {
                    final DateTime now = DateTime.now();

                    final DateTime today = DateTime(
                      now.year,
                      now.month,
                      now.day,
                    );

                    final DateTime lastAllowedDate =
                        today.add(const Duration(days: 2));

                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: today,
                      firstDate: today,
                      lastDate: lastAllowedDate,
                      selectableDayPredicate: (DateTime day) {
                        final DateTime cleanDay = DateTime(
                          day.year,
                          day.month,
                          day.day,
                        );

                        return cleanDay.isAtSameMomentAs(today) ||
                            cleanDay.isAtSameMomentAs(
                                today.add(const Duration(days: 1))) ||
                            cleanDay.isAtSameMomentAs(
                                today.add(const Duration(days: 2)));
                      },
                    );

                    if (pickedDate != null) {
                      final day = pickedDate.day.toString().padLeft(2, '0');
                      final month = pickedDate.month.toString().padLeft(2, '0');
                      final year = pickedDate.year.toString();

                      dateController.text = '$day-$month-$year';
                      generateSlotsForDate(pickedDate);
                      await loadApprovedBookedSlots();
                    }
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Select Slot',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: selectedSlot,
                  isExpanded: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  items: availableSlots.map((slot) {
                    final bool isBooked = approvedBookedSlots.contains(slot);

                    return DropdownMenuItem<String>(
                      value: slot,
                      enabled: !isBooked,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              slot,
                              style: TextStyle(
                                color: isBooked
                                    ? Colors.grey.shade400
                                    : Colors.white,
                                fontWeight: isBooked
                                    ? FontWeight.w500
                                    : FontWeight.w400,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (isBooked) ...[
                            const SizedBox(width: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 9,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    const Color(0xFFEF4444).withOpacity(0.12),
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                  color:
                                      const Color(0xFFEF4444).withOpacity(0.45),
                                  width: 1,
                                ),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.lock_rounded,
                                    size: 12,
                                    color: Color(0xFFFCA5A5),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    'Booked',
                                    style: TextStyle(
                                      color: Color(0xFFFCA5A5),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value == null) return;

                    if (approvedBookedSlots.contains(value)) {
                      setState(() {
                        selectedSlot = null;
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('This slot is already booked'),
                          duration: Duration(seconds: 2),
                        ),
                      );

                      return;
                    }

                    setState(() {
                      selectedSlot = value;
                    });
                  },
                  hint: const Text('Choose a slot'),
                ),
                const SizedBox(height: 24),
                Center(
                  child: SizedBox(
                    width: 300,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: confirmBooking,
                      child: const Text('Confirm Booking'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PriceTile extends StatelessWidget {
  final String label;
  final String value;

  const _PriceTile({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFFE5E7EB),
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFB067),
            ),
          ),
        ],
      ),
    );
  }
}

class OwnerLoginPage extends StatefulWidget {
  const OwnerLoginPage({super.key});

  @override
  State<OwnerLoginPage> createState() => _OwnerLoginPageState();
}

class _OwnerLoginPageState extends State<OwnerLoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool obscurePassword = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null && mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OwnerBookingsPage()),
        );
      }
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void showLoginError(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Login Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> ownerLogin() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      showLoginError('Please enter email and password');
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OwnerBookingsPage()),
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      showLoginError(e.message ?? 'Login failed');
    } catch (e) {
      if (!mounted) return;
      showLoginError('Something went wrong: $e');
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Owner Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 420,
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Owner Login',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Email',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Enter owner email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Password',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: passwordController,
                  obscureText: obscurePassword,
                  decoration: InputDecoration(
                    hintText: 'Enter password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: SizedBox(
                    width: 300,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : ownerLogin,
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : const Text('Login'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OwnerBookingsPage extends StatefulWidget {
  const OwnerBookingsPage({super.key});

  @override
  State<OwnerBookingsPage> createState() => _OwnerBookingsPageState();
}

class _OwnerBookingsPageState extends State<OwnerBookingsPage> {
  String? selectedFilterDate;
  String selectedStatusFilter = 'all';

  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  final Set<String> _seenPendingBookingIds = {};
  bool _hasLoadedInitialPendingBookings = false;
  String? _highlightedBookingId;

  bool notificationPermissionGranted = false;

  Future<void> _requestNotificationPermission() async {
    if (!kIsWeb) return;

    try {
      final permission = await html.Notification.requestPermission();

      if (!mounted) return;

      setState(() {
        notificationPermissionGranted = permission == 'granted';
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            permission == 'granted'
                ? 'Booking notifications enabled'
                : 'Notification permission not allowed',
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Notifications not supported on this browser: $e'),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  void _showNewBookingNotification({
    required String name,
    required String device,
    required String date,
    required String slot,
  }) {
    if (!kIsWeb) return;
    if (!notificationPermissionGranted) return;

    html.Notification(
      'New Booking Received',
      body: '$name booked $device\n$date | $slot',
      icon: 'icons/Icon-192.png',
    );
  }

  @override
  void initState() {
    super.initState();

    if (kIsWeb) {
      notificationPermissionGranted = html.Notification.permission == 'granted';
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _handleIncomingPendingBookings(List<QueryDocumentSnapshot> allDocs) {
    final pendingDocs = allDocs.where((doc) {
      final booking = doc.data() as Map<String, dynamic>;
      return (booking['status'] ?? 'pending') == 'pending';
    }).toList();

    final currentPendingIds = pendingDocs.map((doc) => doc.id).toSet();

    if (!_hasLoadedInitialPendingBookings) {
      _seenPendingBookingIds
        ..clear()
        ..addAll(currentPendingIds);
      _hasLoadedInitialPendingBookings = true;
      return;
    }

    final newPendingIds = currentPendingIds.difference(_seenPendingBookingIds);

    _seenPendingBookingIds
      ..clear()
      ..addAll(currentPendingIds);

    if (newPendingIds.isEmpty) return;

    final newestPendingDoc = pendingDocs.firstWhere(
      (doc) => newPendingIds.contains(doc.id),
      orElse: () => pendingDocs.first,
    );

    if (!mounted) return;

    final newestBooking = newestPendingDoc.data() as Map<String, dynamic>;

    setState(() {
      _highlightedBookingId = newestPendingDoc.id;
    });

    _showNewBookingNotification(
      name: (newestBooking['name'] ?? '').toString(),
      device: (newestBooking['device'] ?? '').toString(),
      date: (newestBooking['date'] ?? '').toString(),
      slot: (newestBooking['slot'] ?? '').toString(),
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('New booking received'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  Future<void> updateBookingStatus(String docId, String status) async {
    await FirebaseFirestore.instance.collection('bookings').doc(docId).update({
      'status': status,
    });
  }

  Future<void> deleteBooking(String docId) async {
    await FirebaseFirestore.instance.collection('bookings').doc(docId).delete();
  }

  Future<void> openWhatsAppMessage({
    required String phone,
    required String bookingCode,
    required String name,
    required String device,
    required String date,
    required String slot,
  }) async {
    String cleanPhone = phone.replaceAll(RegExp(r'[^0-9]'), '');

    if (cleanPhone.length == 10) {
      cleanPhone = '91$cleanPhone';
    }

    final message = '''
Hello $name,

Your booking is confirmed at Next Level Gaming Zone Booking.

Booking ID: $bookingCode
PS5: $device
Date: $date
Slot: $slot
Status: Approved

Please arrive on time. Thank you!
''';

    final url =
        'https://wa.me/$cleanPhone?text=${Uri.encodeComponent(message)}';

    if (kIsWeb) {
      html.window.open(url, '_blank');
      return;
    }

    final uri = Uri.parse(url);
    final launched = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    if (!launched && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not open WhatsApp'),
        ),
      );
    }
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'approved':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      default:
        return Colors.orange;
    }
  }

  Future<void> pickFilterDate() async {
    final DateTime today = DateTime.now();

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: today,
      lastDate: today.add(const Duration(days: 2)),
    );

    if (pickedDate != null) {
      final day = pickedDate.day.toString().padLeft(2, '0');
      final month = pickedDate.month.toString().padLeft(2, '0');
      final year = pickedDate.year.toString();

      setState(() {
        selectedFilterDate = '$day-$month-$year';
      });
    }
  }

  Future<void> ownerLogout() async {
    await FirebaseAuth.instance.signOut();

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const OwnerLoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Owner Bookings'),
        actions: [
          TextButton(
            onPressed: ownerLogout,
            child: const Text('Logout'),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search by name or phone',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            searchController.clear();
                            searchQuery = '';
                          });
                        },
                        icon: const Icon(Icons.clear),
                      )
                    : null,
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.trim().toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('bookings')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final allDocs = snapshot.data!.docs;

                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) {
                    _handleIncomingPendingBookings(allDocs);
                  }
                });

                final pendingCount = allDocs.where((doc) {
                  final booking = doc.data() as Map<String, dynamic>;
                  return (booking['status'] ?? 'pending') == 'pending';
                }).length;

                final docs = allDocs.where((doc) {
                  final booking = doc.data() as Map<String, dynamic>;

                  final bookingDate = (booking['date'] ?? '').toString();
                  final name = (booking['name'] ?? '').toString().toLowerCase();
                  final phone =
                      (booking['phone'] ?? '').toString().toLowerCase();

                  final matchesDate = selectedFilterDate == null ||
                      bookingDate == selectedFilterDate;

                  final status = (booking['status'] ?? 'pending').toString();

                  final matchesSearch = searchQuery.isEmpty ||
                      name.contains(searchQuery) ||
                      phone.contains(searchQuery);

                  final matchesStatus = selectedStatusFilter == 'all' ||
                      status == selectedStatusFilter;

                  return matchesDate && matchesSearch && matchesStatus;
                }).toList();

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF8C42).withOpacity(0.12),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color:
                                    const Color(0xFFFF8C42).withOpacity(0.35),
                              ),
                            ),
                            child: Text(
                              'Pending Bookings: $pendingCount',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFFB067),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              onPressed: notificationPermissionGranted
                                  ? null
                                  : _requestNotificationPermission,
                              icon: Icon(
                                notificationPermissionGranted
                                    ? Icons.notifications_active
                                    : Icons.notifications_off,
                              ),
                              label: Text(
                                notificationPermissionGranted
                                    ? 'Notifications Enabled'
                                    : 'Enable Booking Notifications',
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            selectedFilterDate == null
                                ? 'Showing: All Bookings'
                                : 'Showing: $selectedFilterDate',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              ElevatedButton(
                                onPressed: pickFilterDate,
                                child: const Text('Filter Date'),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedFilterDate = null;
                                  });
                                },
                                child: const Text('Clear Date'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              ChoiceChip(
                                label: const Text('All'),
                                selected: selectedStatusFilter == 'all',
                                onSelected: (_) {
                                  setState(() {
                                    selectedStatusFilter = 'all';
                                  });
                                },
                              ),
                              ChoiceChip(
                                label: const Text('Pending'),
                                selected: selectedStatusFilter == 'pending',
                                onSelected: (_) {
                                  setState(() {
                                    selectedStatusFilter = 'pending';
                                  });
                                },
                              ),
                              ChoiceChip(
                                label: const Text('Approved'),
                                selected: selectedStatusFilter == 'approved',
                                onSelected: (_) {
                                  setState(() {
                                    selectedStatusFilter = 'approved';
                                  });
                                },
                              ),
                              ChoiceChip(
                                label: const Text('Rejected'),
                                selected: selectedStatusFilter == 'rejected',
                                onSelected: (_) {
                                  setState(() {
                                    selectedStatusFilter = 'rejected';
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: docs.isEmpty
                          ? const Center(
                              child: Text('No bookings found'),
                            )
                          : ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 0,
                              ),
                              itemCount: docs.length,
                              itemBuilder: (context, index) {
                                final doc = docs[index];
                                final booking =
                                    doc.data() as Map<String, dynamic>;

                                final bookingCode =
                                    booking['bookingCode'] ?? 'N/A';
                                final name = booking['name'] ?? '';
                                final phone = booking['phone'] ?? '';
                                final device = booking['device'] ?? '';
                                final date = booking['date'] ?? '';
                                final slot = booking['slot'] ?? '';
                                final status = booking['status'] ?? 'pending';

                                final isHighlighted =
                                    doc.id == _highlightedBookingId;

                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: const EdgeInsets.only(bottom: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: isHighlighted
                                          ? const Color(0xFFFF8C42)
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                    boxShadow: isHighlighted
                                        ? [
                                            BoxShadow(
                                              color: const Color(0xFFFF8C42)
                                                  .withOpacity(0.25),
                                              blurRadius: 16,
                                              spreadRadius: 1,
                                            ),
                                          ]
                                        : [],
                                  ),
                                  child: Card(
                                    margin: EdgeInsets.zero,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            name,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          if (isHighlighted) ...[
                                            const SizedBox(height: 6),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10,
                                                vertical: 6,
                                              ),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFFF8C42)
                                                    .withOpacity(0.12),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: const Text(
                                                'New Booking',
                                                style: TextStyle(
                                                  color: Color(0xFFFFB067),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ],
                                          const SizedBox(height: 8),
                                          RichText(
                                            text: TextSpan(
                                              style:
                                                  DefaultTextStyle.of(context)
                                                      .style,
                                              children: [
                                                const TextSpan(
                                                  text: 'Booking ID: ',
                                                ),
                                                TextSpan(
                                                  text: '$bookingCode',
                                                  style: const TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text('Phone: $phone'),
                                          Text('PS5: $device'),
                                          Text('Date: $date'),
                                          Text('Slot: $slot'),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Booking Status: $status',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: getStatusColor(status),
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          Wrap(
                                            spacing: 10,
                                            runSpacing: 10,
                                            children: [
                                              ElevatedButton(
                                                onPressed: status == 'approved'
                                                    ? null
                                                    : () async {
                                                        await updateBookingStatus(
                                                          doc.id,
                                                          'approved',
                                                        );
                                                      },
                                                child: const Text('Approve'),
                                              ),
                                              ElevatedButton(
                                                onPressed: status == 'rejected'
                                                    ? null
                                                    : () async {
                                                        await updateBookingStatus(
                                                          doc.id,
                                                          'rejected',
                                                        );
                                                      },
                                                child: const Text('Reject'),
                                              ),
                                              if (status == 'approved')
                                                ElevatedButton(
                                                  onPressed: () async {
                                                    await openWhatsAppMessage(
                                                      phone: phone.toString(),
                                                      bookingCode: bookingCode
                                                          .toString(),
                                                      name: name.toString(),
                                                      device: device.toString(),
                                                      date: date.toString(),
                                                      slot: slot.toString(),
                                                    );
                                                  },
                                                  child: const Text('WhatsApp'),
                                                ),
                                              OutlinedButton(
                                                onPressed: () async {
                                                  final shouldDelete =
                                                      await showDialog<bool>(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                          'Delete Booking',
                                                        ),
                                                        content: const Text(
                                                          'Are you sure you want to delete this booking?',
                                                        ),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                              context,
                                                              false,
                                                            ),
                                                            child: const Text(
                                                              'No',
                                                            ),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                              context,
                                                              true,
                                                            ),
                                                            child: const Text(
                                                              'Yes',
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );

                                                  if (shouldDelete == true) {
                                                    await deleteBooking(doc.id);
                                                  }
                                                },
                                                child: const Text('Delete'),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CheckBookingStatusPage extends StatefulWidget {
  const CheckBookingStatusPage({super.key});

  @override
  State<CheckBookingStatusPage> createState() => _CheckBookingStatusPageState();
}

class _CheckBookingStatusPageState extends State<CheckBookingStatusPage> {
  final TextEditingController bookingIdController = TextEditingController();

  Map<String, dynamic>? bookingData;
  bool isLoading = false;

  @override
  void dispose() {
    bookingIdController.dispose();
    super.dispose();
  }

  void copyText(String text, String label) {
    Clipboard.setData(ClipboardData(text: text));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$label copied'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> checkBookingStatus() async {
    final bookingId = bookingIdController.text.trim();

    if (bookingId.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please enter your Booking ID'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    setState(() {
      isLoading = true;
      bookingData = null;
    });

    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('bookings')
          .where('bookingCode', isEqualTo: bookingId)
          .limit(1)
          .get();

      if (querySnapshot.docs.isEmpty) {
        if (!mounted) return;

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Not Found'),
              content: const Text('No booking found with this Booking ID'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        setState(() {
          bookingData = querySnapshot.docs.first.data();
        });
      }
    } catch (e) {
      if (!mounted) return;

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('Failed to fetch booking: $e'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'approved':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    final status = bookingData?['status'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Booking Status'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 500,
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Check Your Booking',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Enter Booking ID',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: bookingIdController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(6),
                  ],
                  decoration: InputDecoration(
                    hintText: 'Enter 6-digit Booking ID',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: 300,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : checkBookingStatus,
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : const Text('Check Status'),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                if (bookingData != null)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 8,
                            children: [
                              const Text('Booking ID: '),
                              SelectableText(
                                '${bookingData!['bookingCode'] ?? ''}',
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                tooltip: 'Copy Booking ID',
                                onPressed: () => copyText(
                                  '${bookingData!['bookingCode'] ?? ''}',
                                  'Booking ID',
                                ),
                                icon: const Icon(Icons.copy, size: 20),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text('Name: ${bookingData!['name'] ?? ''}'),
                          Text('Phone: ${bookingData!['phone'] ?? ''}'),
                          Text('PS5: ${bookingData!['device'] ?? ''}'),
                          Text('Date: ${bookingData!['date'] ?? ''}'),
                          Text('Slot: ${bookingData!['slot'] ?? ''}'),
                          const SizedBox(height: 8),
                          Text(
                            'Booking Status: $status',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: getStatusColor(status),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
