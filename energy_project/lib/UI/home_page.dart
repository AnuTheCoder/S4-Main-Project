import 'package:energy_project/UI/bill.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool firstButton = false;
  bool secondButton = false;
  bool thirdButton = false;

  DateTime  _firststartTime = DateTime.now();
   DateTime _firstendTime = DateTime.now();
  double _firstTotalTime = 0.0;

  late DateTime  _secondstartTime ;
  late DateTime _secondendTime;
  double _secondTotalTime = 0.0;

  late DateTime  _thirdstartTime ;
  late DateTime _thirdendTime;
  double _thirdTotalTime = 0.0;


  /*  String tvStartTime = '';
   double tvTotalTime = 0.0;
   late SharedPreferences prefs;*/

  String sensorData = '';
  String voltage = '';
  String firstCurrent = '';
  String secondCurrent = '';
  double exactVoltage = 0.0;
  String firstDevice = '';
  String secondDevice = '';
  String thirdDevice = '';

  DatabaseReference ref = FirebaseDatabase.instance.ref();

  void firebaseData(){
    DatabaseReference _dbRef = FirebaseDatabase.instance.ref();
    _dbRef.once().then((DatabaseEvent databaseEvent) {
      print("Database Data" + databaseEvent.snapshot.value.toString());
      sensorData = (databaseEvent.snapshot.value as Map<Object?,dynamic>)['sensorData']['sensor'].toString();
      setState((){
        voltage = sensorData.split('a')[0].toString();
        firstCurrent = sensorData.split('a')[1].toString();
        secondCurrent = firstCurrent.split('b')[1].toString();

        exactVoltage = double.parse(voltage.split('v')[1].toString());
        firstDevice = firstCurrent.split('b')[0].toString();
        secondDevice = secondCurrent.split('c')[0].toString();
        thirdDevice = sensorData.split('c')[1].toString();
        if((databaseEvent.snapshot.value as Map<Object?,dynamic>)['devices']['device1'] == 1){
          firstButton = true;
        }
        if((databaseEvent.snapshot.value as Map<Object?,dynamic>)['devices']['device2'] == 1){
          secondButton = true;
        }
        if((databaseEvent.snapshot.value as Map<Object?,dynamic>)['devices']['device3'] == 1){
          thirdButton = true;
        }
      });
    });

  }

  @override
   void initState(){
   /* getsharePref();*/
    super.initState();
  }



  /*void getsharePref() async{
    prefs = await SharedPreferences.getInstance();
    tvStartTime = prefs.getString('tvStartTime');
    tvTotalTime = prefs.getDouble('tvTotalTime');
  }*/

  @override
  Widget build(BuildContext context) {
    firebaseData();
    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 5,
        title: const Text('SMART HOME',
          style: TextStyle(
              color:  Colors.white,
              fontSize: 20
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width:250, height:250,
                child:SfRadialGauge(
                    title: const GaugeTitle(text: "Voltage Reading"),
                    enableLoadingAnimation: true,
                    animationDuration: 4500,
                    axes: <RadialAxis>[
                      RadialAxis(minimum: 0,maximum: 240,
                          ranges: <GaugeRange>[
                            GaugeRange(startValue: 0,endValue: 60, color: Colors.green, startWidth: 5,endWidth: 5),
                            GaugeRange(startValue: 60,endValue: 130,color: Colors.orange,startWidth: 5,endWidth: 5),
                            GaugeRange(startValue: 130,endValue: 240,color: Colors.red,startWidth: 5,endWidth: 5)
                          ],
                          pointers:  <GaugePointer>[
                            NeedlePointer(value: exactVoltage, )
                          ],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                                widget: Container(
                                    child:  Column(
                                      children:  [
                                        const Text('Voltage',style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold)),
                                        const SizedBox(height: 5,),
                                        Text(exactVoltage.toString(),style: const TextStyle(fontSize: 15,fontWeight:FontWeight.bold)),
                                      ],
                                    )
                                ),
                                angle: 90,
                                positionFactor: 1.7),
                          ]
                      )]
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.transparent
                            ),
                            alignment: Alignment.center,
                            child:  Icon(
                              Icons.lightbulb,
                              size: 50,
                              color:  (firstButton == false)?Colors.grey:Colors.blue,
                            ),
                          ),
                          const Text(
                            'Device 1',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Current usage :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    ),
                              ),
                              Text(
                                firstDevice,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.all(3),
                            alignment: Alignment.center,
                            color: Colors.transparent,
                            child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      (firstButton == false)?Colors.green:Colors.red),
                                  shape:
                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                  )),
                              onPressed: () {
                                setState((){
                                  if( firstButton == true){
                                    ref.child('devices')
                                        .child('device1')
                                        .set(0);
                                    firstButton = false;
                                    setState((){
                                      _firstendTime = DateTime.now();
                                    });
                                    double firsttimeDiff = (_firstendTime.minute + (_firstendTime.second / 60)) -
                                        (_firststartTime.minute + (_firststartTime.second / 60));
                                    /* double total = prefs?.getDouble('tvTotalTime');
                                    double totalTime = total + timeDiff;
                                    prefs?.setDouble('tvTotalTime', totalTime);
                                    print(totalTime);*/
                                    _firstTotalTime = _firstTotalTime + firsttimeDiff;
                                  /* prefs?.setString('tvStartTime', _firststartTime.toString());*/

                                    print(_firstTotalTime);

                                  }else{
                                    ref.child('devices')
                                        .child('device1')
                                        .set(1);
                                    firstButton = true;
                                    setState((){
                                      _firststartTime = DateTime.now();
                                    });
                                  }
                                });
                              },
                              child: (firstButton == false)?const Text(
                                'ON',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              )
                                  :
                              const Text(
                                'OFF',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.transparent
                            ),
                            alignment: Alignment.center,
                            child:  Icon(
                                Icons.laptop_mac_outlined,
                              size: 50,
                              color: (secondButton == false)?Colors.grey:Colors.blue,
                            ),
                          ),
                          const Text(
                            'Device 2',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Current usage :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                   ),
                              ),
                              Text(
                                secondDevice,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.all(3),
                            alignment: Alignment.center,
                            color: Colors.transparent,
                            child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      (secondButton == false)?Colors.green:Colors.red),
                                  shape:
                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                  )),
                              onPressed: () {
                                setState((){
                                  if( secondButton == true){
                                    ref.child('devices')
                                        .child('device2')
                                        .set(0);
                                    secondButton = false;
                                    _secondstartTime = DateTime.now();
                                  }else{
                                    ref.child('devices')
                                        .child('device2')
                                        .set(1);
                                    secondButton = true;
                                    _secondendTime = DateTime.now();
                                    double secondtimeDiff = (_secondendTime.minute + (_secondendTime.second / 60)) -
                                        (_secondstartTime.minute + (_secondstartTime.second / 60));
                                    _secondTotalTime = _secondTotalTime + secondtimeDiff;
                                  }
                                });
                              },
                              child: (secondButton == false)?const Text(
                                'ON',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              )
                                  :
                              const Text(
                                'OFF',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.transparent
                        ),
                        alignment: Alignment.center,
                        child:  Icon(
                          Icons.flourescent,
                          size: 50,
                          color: (thirdButton == false)?Colors.grey:Colors.blue,
                        ),
                      ),
                      const Text(
                        'Device 3',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Current usage :',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                ),
                          ),
                          Text(
                            thirdDevice,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 11,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(3),
                        alignment: Alignment.center,
                        color: Colors.transparent,
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  (thirdButton == false)?Colors.green:Colors.red),
                              shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              )),
                          onPressed: () {
                            setState((){
                              if( thirdButton == true){
                                ref.child('devices')
                                    .child('device3')
                                    .set(0);
                                thirdButton = false;
                                _thirdstartTime = DateTime.now();
                              }else{
                                ref.child('devices')
                                    .child('device3')
                                    .set(1);
                                thirdButton = true;
                                _thirdendTime = DateTime.now();
                                double thirdtimeDiff = (_thirdendTime.minute + (_thirdendTime.second / 60)) -
                                    (_thirdstartTime.minute + (_thirdstartTime.second / 60));
                                _thirdTotalTime = _thirdTotalTime + thirdtimeDiff;
                              }
                            });
                          },
                          child: (thirdButton == false)?const Text(
                            'ON',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )
                              :
                          const Text(
                            'OFF',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.8,
                color: Colors.transparent,
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blue.shade900),
                      shape:
                      MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )),
                  onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> Bill(
                     firstTotalTime: _firstTotalTime,
                     secondTotalTime: _secondTotalTime,
                     thirdTotalTime: _thirdTotalTime,
                     firstcurrent: double.parse(firstDevice),
                     secondcurrent: double.parse(secondDevice),
                     thirdcurrent: double.parse(thirdDevice),
                     voltage: exactVoltage,

                   )
                   )
                   );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.63,
                    child: const Center(
                      child: Text(
                        'BILL',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

