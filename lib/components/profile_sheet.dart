import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileSheet extends StatelessWidget {
  const ProfileSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/person.jpg'),),
            const SizedBox(height: 16),
            Text('Hilda', style: GoogleFonts.plusJakartaSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),),
          ],
        ),
      ),
    );
  }
}