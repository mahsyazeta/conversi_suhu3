import 'package:conversi_suhu3/widgets/hasilKonversi.dart';
import 'package:conversi_suhu3/widgets/inputSuhu.dart';
import 'package:conversi_suhu3/widgets/konversiSuhu.dart';
import 'package:conversi_suhu3/widgets/pilihanKonvert.dart';
import 'package:conversi_suhu3/widgets/riwayat.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;
  TextEditingController etInput = TextEditingController();
  String selectedDropdown = 'Kelvin';
  List<String> listSatuanSuhu = ['Kelvin','Reamur','Fahrenheit'];
  double hasil = 0;
  List<String> listHasil = [];


  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }

  void onDropdownChange(Object? value) {
    return setState(() {
        selectedDropdown = value.toString();
    });
  } 

  void konversi() {
    return setState(() {
        if (etInput.text.isNotEmpty) {
          switch (selectedDropdown) {
          case 'Kelvin':
            hasil = int.parse(etInput.text) + 273.15;
            break;
          case 'Reamur':
            hasil = int.parse(etInput.text) * 4/5;
            break;
          case 'Fahrenheit':
            hasil = int.parse(etInput.text)* (9/5) +32;
            break;
          default:
          }

          listHasil.add('Konversi dari '+ 
            etInput.text +
            ' Celcius ke '+
            selectedDropdown+
            ' dengan hasil : '+
            hasil.toString());
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tugas 1 Jobsheet 4'),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children:[
              inputSuhu(
                etInput: etInput
              ),
              SizedBox(height: 8,),
              pilihanKonvert(
                selectedDropdown: selectedDropdown, 
                listSatuanSuhu: listSatuanSuhu, 
                onDropdownChange: onDropdownChange,
              ),
              SizedBox(height: 10,),
              Text(
                'Hasil',style: TextStyle(fontSize: 24),
              ),
              hasilKonversi(
                hasil: hasil
              ),
              SizedBox(height: 8,),
              konversiSuhu(
                onPressed: konversi,
              ),
              SizedBox(height: 10,),
              Text('Riwayat konversi',style: TextStyle(fontSize: 20),),
              riwayat(listHasil: listHasil),
            ],
          ),
        ),
      ),
    );
  }     
}










