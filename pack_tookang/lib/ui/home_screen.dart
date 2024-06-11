import 'package:flutter/material.dart';
import 'package:pack_tookang/ui/mortar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bersama Kuli Membangun Negeri'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
      ),
      body: HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 300,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => mortar()));
            },
            child: Text('Mortar'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(vertical: 20),
            ),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: 300,
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Kramik'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(vertical: 20),
            ),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: 300,
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Tembok'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(vertical: 20),
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
