import 'package:flutter/material.dart';
import 'package:tpm_uts/homepage.dart';

class Trapesium extends StatefulWidget {
  const Trapesium({Key? key}) : super(key: key);

  @override
  State<Trapesium> createState() => _TrapesiumState();
}

class _TrapesiumState extends State<Trapesium> {
  final s1controller = TextEditingController();
  final s2controller = TextEditingController();
  final tcontroller = TextEditingController();
  final s3controller = TextEditingController();

  double arearesult = 0,aroundresult = 0;

  void calculate(){
    double s1 = double.tryParse(s1controller.text) ?? 0;
    double s2 = double.tryParse(s2controller.text) ?? 0;
    double t = double.tryParse(tcontroller.text) ?? 0;
    double s3 = double.tryParse(s3controller.text) ?? 0;
    setState(() {
      arearesult = (0.5 * t * (s1 + s2));
      aroundresult = (s1 + s2 + s3 + t);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trapezoid Menu"),
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
              controller: s1controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Input First side',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: s2controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Input Second side',
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
            TextFormField(
              controller: s3controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Input third side',
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
            Text('Trapezoid Area : $arearesult'),
            SizedBox(height: 15),
            Text('Trapezoid Around : $aroundresult'),
          ],
        ),
      ),
    );
  }
}
