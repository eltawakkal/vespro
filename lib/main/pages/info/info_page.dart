import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Spacer(),
              SizedBox(height: 20,),
              UnconstrainedBox(child: Image.asset('assets/images/office.png', width: 200,)),
              Text('Informasi & Call Center', textAlign: TextAlign.center, style: GoogleFonts.lato().copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              Spacer(),
              Card(
                child: ListTile(
                  onTap: () async {
                    if (!await launchUrl(Uri.parse('https://api.whatsapp.com/send/?phone=6285234578920&text&type=phone_number&app_absent=0'))) {
                    throw Exception('Could not launch');
                    }
                  },
                  leading: CircleAvatar(
                    child: Icon(EvaIcons.phoneCall, color: Colors.blue,),
                  ),
                  title: Text('Whasapp Kami'),
                  subtitle: Text('237498394'),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () async {
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'layanan@vespro.id',
                    );
                    if (!await launchUrl(emailLaunchUri)) {
                      throw Exception('Could not launch');
                    }
                  },
                  leading: CircleAvatar(
                    child: Icon(EvaIcons.email, color: Colors.blue,),
                  ),
                  title: Text('Email Kami'),
                  subtitle: Text('237498394'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
