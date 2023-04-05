import 'package:flutter/material.dart';
import 'package:tpm_uts/homepage.dart';

class Tabung extends StatefulWidget {
  const Tabung({Key? key}) : super(key: key);

  @override
  State<Tabung> createState() => _TabungState();
}

class _TabungState extends State<Tabung> {

  final rcontroller = TextEditingController();
  final tcontroller = TextEditingController();

  double surfacearearesult = 0,volumeresult = 0;

  void calculate(){
    final double phi = 3.14;
    double r = double.tryParse(rcontroller.text) ?? 0;
    double t = double.tryParse(tcontroller.text) ?? 0;
    setState(() {
      surfacearearesult = (2 * phi * r * (r + t));
      volumeresult = (phi * t * r * r);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tube Menu"),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context)=>HomePage()));
              },
              icon: Icon(Icons.navigate_before))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical:10 ,horizontal:20 ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: rcontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Input r',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: tcontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Input height',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
                onPressed: calculate,
                child: Text('Calculate')
            ),
            SizedBox(height: 15),
            Text('Tube Surface Area : $surfacearearesult'),
            SizedBox(height: 15),
            Text('Tube Volume : $volumeresult')
          ],
        ),
      ),
    );
  }
}
