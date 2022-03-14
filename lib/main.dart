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
              TextField(
                controller: etInput,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Celcius',
                  hintText: 'enter the temperature in celcius'
                ),
              ),
              SizedBox(height: 8,),
              DropdownButton(
                isExpanded: true,
                value: selectedDropdown,
                items: listSatuanSuhu.map((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(), 
                onChanged: (value){
                  onDropdownChange(value);
                },
              ),
              SizedBox(height: 10,),
              Text('Hasil',style: TextStyle(fontSize: 24),),
              Text('$hasil',style: TextStyle(fontSize: 36),),
              SizedBox(height: 8,),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: (){
                        konversi();
                      }, 
                      child: Text('conversi suhu')
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Text('Riwayat konversi',style: TextStyle(fontSize: 20),),
            ],
          ),
        ),
      ),
    );
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
        }
    });
  }   
}
