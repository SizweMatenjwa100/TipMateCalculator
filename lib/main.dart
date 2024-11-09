import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Mate Calculator',
      theme: ThemeData(

        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
TextEditingController billController =TextEditingController();
double billAmount=0;
double totalBillAmount=0.0;
int tipIndex=0;
double tipPercent=0.0;
double tipAmount=0.0;
List<bool> _selected=[true,false,false,false];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F3F3),
      appBar: AppBar(
        backgroundColor: Color(0xFF298f5e),
        leading: IconButton(
          icon:const Icon(
            Icons.menu,size: 30,color: Colors.white,
        ),
          onPressed:() {},
      ),
       title: Text('Tip Mate',style: GoogleFonts.lobster(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white)),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 25,25, 10),
          child: Column(
            children: [
              Text('Enter Bill Amount',style: GoogleFonts.roboto(
                color: const Color(0xFF9EA1A1),
                fontSize: 25,
              ),
              ),
              const SizedBox(height: 15,),
              Container(width: 200,
                child: TextFormField(
                  controller: billController,
                  style: GoogleFonts.roboto(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(hintText: '\$100', border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(height: 16),
              Text('Choose Tip',style: GoogleFonts.roboto(
                fontSize: 25,
                color: Color(0xFF9EA1A1),
        
        
              ),
              ),
              SizedBox(height: 15),
              Container(
                child: ToggleButtons(isSelected: _selected,
                  fillColor: const Color(0xFF298f5e),
                  selectedColor: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  children: const [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('10%'),
                  ),
                  Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text('15%'),
                     ),
                  Padding(
        
                      padding: const EdgeInsets.all(8.0),
                      child: Text('20%'),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('25%'),
                  ),
                ],
                onPressed: (int selectedIndex){
                  for (int index=0;index<_selected.length;index++){
                   setState(() {
                     _selected[index]= selectedIndex ==index;
                   });
                  }
                },
                ),
              ),

              //--------------------------
              SizedBox(height: 50,),
              Container(
                height: 70,
                width:double.infinity,
              child: ElevatedButton(
                   style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF298f5e)),
                  child:Text('Calculate',style: GoogleFonts.roboto(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,color: Colors.white
                  ),
                  ),
                  onPressed: () {
                     billAmount=double.parse(billController.text.trim());
                     tipIndex=_selected.indexWhere((_element)=> _element);
                     tipPercent=[0.1,0.15,0.20,0.25][tipIndex];
                     setState(() {
                       tipAmount= double.parse((billAmount*tipPercent).toStringAsFixed(2));
                       totalBillAmount=double.parse((billAmount +tipAmount).toStringAsFixed(2));
                     });
                  }
              ), 
              ),
              SizedBox(height: 50),
              Text('Total Bill Amount',style: GoogleFonts.roboto(
                fontSize: 25,color:Color(0xFF9EA1A1)
              ),
              ),
              Text('\$$totalBillAmount',style: GoogleFonts.roboto(
                fontSize: 50 ,
                fontWeight: FontWeight.w600,
                color: Color(0xFF9EA1A1),
              ),
              ),
              SizedBox(height: 20),
              Text('Tip Amount',style: GoogleFonts.roboto(
                fontSize: 30,
                color:Color(0xFF9EA1A1),
                fontWeight: FontWeight.w300,
        
              ),
              ),
              Text('\$$tipAmount',style: GoogleFonts.roboto(
                fontSize: 25,
                color: Color(0xFF298f5e),
        
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
