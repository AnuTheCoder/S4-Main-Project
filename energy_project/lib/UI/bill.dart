import 'dart:typed_data';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';


class Bill extends StatefulWidget {

  final firstTotalTime;
  final secondTotalTime;
  final thirdTotalTime;
  final firstcurrent;
  final secondcurrent;
  final thirdcurrent;
  final voltage;

  const Bill({Key? key, required this.firstTotalTime, required this.secondTotalTime, required this.thirdTotalTime, required this.firstcurrent, required this.secondcurrent, required this.thirdcurrent, required this.voltage})
      : super(key: key);

  @override
  State<Bill> createState() => _BillState();
}

class _BillState extends State<Bill> {

  double firstunit = 0.0;
  double secondunit = 0.0;
  double thirdunit = 0.0;

  @override
  void initState(){
    setState((){
      firstunit = ((widget.voltage * widget.firstcurrent * widget.firstTotalTime)/1000);
      secondunit = ((widget.voltage * widget.secondcurrent * widget.secondTotalTime)/1000);
      thirdunit = ((widget.voltage * widget.thirdcurrent * widget.thirdTotalTime)/1000);
    });
    super.initState();
  }

  List downloadBill = [ 8,9,10,11,12,13,14,15,29,30,31 ];

  Uint8List? image;

  bool billsaved = false;

  _saved() async {
    final result = await ImageGallerySaver.saveImage(image!);
    print("File Saved to Gallery");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('BILL',
          style: TextStyle(
              color:  Colors.white,
              fontSize: 20
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Card(
          child:
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width * 0.9,
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(15),
            child: Column(
              children:  [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Voltage : ',
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${widget.voltage}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Text(
                  'Device 1',
                  style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Text(
                      'Time Duration : ',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Text(
                      widget.firstTotalTime.toStringAsFixed(5),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    Text(
                      'Current Consumption :',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Text(
                      widget.firstcurrent.toStringAsFixed(5),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    Text(
                      'Power Consumption (WHRS) : ',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Text(
                      (widget.voltage * widget.firstcurrent * widget.firstTotalTime).toStringAsFixed(5),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    Text(
                      'Unit Power : ',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Text(
                      firstunit.toStringAsFixed(5),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Text(
                  'Device 2',
                  style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Text(
                      'Time Duration : ',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Text(
                      widget.secondTotalTime.toStringAsFixed(5),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    Text(
                      'Current Consumption :',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Text(
                      widget.secondcurrent.toStringAsFixed(5),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    Text(
                      'Power Consumption (WHRS) : ',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Text(
                      (widget.voltage * widget.secondcurrent * widget.secondTotalTime).toStringAsFixed(5),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    Text(
                      'Unit Power : ',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Text(
                      secondunit.toStringAsFixed(5),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Text(
                  'Device 3',
                  style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Text(
                      'Time Duration : ',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Text(
                      widget.thirdTotalTime.toStringAsFixed(5),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    Text(
                      'Current Consumption :',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(width: 5,),
                    Text(
                      widget.thirdcurrent.toStringAsFixed(5),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    Text(
                      'Power Consumption (WHRS) : ',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Text(
                      (widget.voltage * widget.thirdcurrent * widget.thirdTotalTime).toStringAsFixed(5),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    Text(
                      'Unit Power : ',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Text(
                      thirdunit.toStringAsFixed(5),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total Cost (rupees) : ',
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      (((firstunit + secondunit + thirdunit)* 3.15) + 71.94 ).toStringAsFixed(5),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
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
                    child: const Center(
                      child: Text(
                        'Download Bill',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    onPressed: () async{
                      final controller = ScreenshotController();
                      final bytes = await controller.captureFromWidget(
                          Material(
                              child:   Container(
                                margin: EdgeInsets.all(40),
                                alignment: Alignment.center,
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Supply :',
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 13,
                                          ),
                                        ),
                                        const SizedBox(width: 5,),
                                        const Text(
                                          '1 phase',
                                          style:  TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Total Energy Consumption : ',
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 13,
                                          ),
                                        ),
                                        const SizedBox(width: 5,),
                                        Text(
                                          (firstunit + secondunit + thirdunit).toStringAsFixed(5),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Device 1 : ',
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 13,
                                          ),
                                        ),
                                        const SizedBox(width: 5,),
                                        Text(
                                          firstunit.toStringAsFixed(5),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Device 2 : ',
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 13,
                                          ),
                                        ),
                                        const SizedBox(width: 5,),
                                        Text(
                                          secondunit.toStringAsFixed(5),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Device 3 : ',
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 13,
                                          ),
                                        ),
                                        const SizedBox(width: 5,),
                                        Text(
                                          thirdunit.toStringAsFixed(5),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Total Energy Charges : ',
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 13,
                                          ),
                                        ),
                                        const SizedBox(width: 5,),
                                        Text(
                                          ((firstunit + secondunit + thirdunit) * 3.15).toStringAsFixed(5),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Fixed Charge Amount : ',
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 13,
                                          ),
                                        ),
                                        const SizedBox(width: 5,),
                                        const Text(
                                          '70',
                                          style:  TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Electricity Duty Amount : ',
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 13,
                                          ),
                                        ),
                                        const SizedBox(width: 5,),
                                        const Text(
                                          '0.32',
                                          style:  TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Electricity Surcharge Amount : ',
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 13,
                                          ),
                                        ),
                                        const SizedBox(width: 5,),
                                        const Text(
                                          '0.05',
                                          style:  TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Meter Rent Amount : ',
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 13,
                                          ),
                                        ),
                                        const SizedBox(width: 5,),
                                        const Text(
                                          '14.28',
                                          style:  TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Total Bill Amount : ',
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 13,
                                          ),
                                        ),
                                        const SizedBox(width: 5,),
                                        Text(
                                          (((firstunit + secondunit + thirdunit) * 3.15) + 71.94).toStringAsFixed(5),
                                          style:  TextStyle(
                                              color: Colors.blue.shade900,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Date : ',
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 11,
                                          ),
                                        ),
                                        const SizedBox(width: 5,),
                                        Text('${DateTime.now().day}' + '-' + '${DateTime.now().month}' + '-' '${DateTime.now().year}',
                                          style:  TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                          )
                      );
                      setState(() {
                        this.image = bytes;
                        billsaved = true;
                      });
                      _saved();
                      Navigator.pop(context, billsaved);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}