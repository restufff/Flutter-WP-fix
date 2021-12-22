import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'More',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'Poppins'),
        ),
        elevation: 5,
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Image(
                image: AssetImage('assets/unas.png'),
                height: 50,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: Text(
                "Aplikasi TA \n Portal Berita Universitas Nasional \n Dibuat demi kepentingan Tugas Akhir",
                textAlign: TextAlign.center,
                style: TextStyle(height: 1.6, color: Colors.black87),
              ),
            ),
            Divider(
              height: 10,
              thickness: 2,
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  leading: Image.asset(
                    "assets/more/profile.png",
                    width: 60,
                  ),
                  title: Text('Profile Mahasiswa'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextButton(
                          onPressed: () async {
                            // const url = 'https://flutterblog.crumet.com';
                            // if (await canLaunch(url)) {
                            //   await launch(url);
                            // } else {
                            //   throw 'Could not launch $url';
                            // }
                          },
                          child: Text(
                            "Nama : Restu Fauzi",
                            style: TextStyle(color: Colors.black54),
                          )),
                      TextButton(
                          onPressed: () async {
                            // const url = 'mailto:info@crumet.com';
                            // if (await canLaunch(url)) {
                            //   await launch(url);
                            // } else {
                            //   throw 'Could not launch $url';
                            // }
                          },
                          child: Text(
                            "NPM : 183112706450123",
                            style: TextStyle(color: Colors.black54),
                          )),
                      TextButton(
                          onPressed: () async {
                            // const url = 'mailto:info@crumet.com';
                            // if (await canLaunch(url)) {
                            //   await launch(url);
                            // } else {
                            //   throw 'Could not launch $url';
                            // }
                          },
                          child: Text(
                            "Prodi : Informatika",
                            style: TextStyle(color: Colors.black54),
                          )),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
