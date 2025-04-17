import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result='';
  var bgColor = Colors.deepPurple.shade100;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
        backgroundColor: Colors.deepPurple,
      ),

      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI', style: TextStyle(
                  fontSize: 32, fontWeight: FontWeight.w600
                )),

                SizedBox(height: 21,),

                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your weight(in KG)'),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 11,),

                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text('Enter your height(in Feet)'),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 11,),

                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                      label: Text('Enter your height(in Inches)'),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 21,),

                ElevatedButton(
                  onPressed: (){
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();

                    if(wt!='' && ft!='' && inch!=''){

                      //BMI calculation
                      var intWt = int.parse(wt);
                      var intFt = int.parse(ft);
                      var intInch = int.parse(inch);

                      var totalInch = (intFt*12) + intInch;
                      var totalCm = totalInch*2.54;
                      var totalM = totalCm/100;

                      var bmi = intWt/(totalM*totalM);

                      var msg = '';

                      if(bmi>25){
                        msg = 'You are OverWeight!!';
                        bgColor = Colors.red.shade200;
                      } else if(bmi<18){
                        msg = 'You are UnderWeight!!';
                        bgColor = Colors.orange.shade200;
                      } else {
                        msg = 'You are Healthy!!';
                        bgColor = Colors.green.shade200;
                      }

                      setState(() {
                        result = '$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}';
                      });

                    }
                    else {
                      setState(() {
                        result = 'Please fill the required blanks!!';
                      });
                    }


                  },
                  child: Text('Calculate', style: TextStyle(fontSize: 21,),),
                ),

                SizedBox(height: 21,),

                Text(result, style: TextStyle(fontSize: 16)),


              ],
            ),
          ),
        ),
      )

    );
  }
}
