import 'package:flutter/material.dart';

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
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.8,
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
                      '${widget.firstTotalTime}',
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
                      '${widget.firstcurrent}',
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
                      '${widget.voltage * widget.firstcurrent * widget.firstTotalTime}',
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
                      '${(widget.voltage * widget.firstcurrent * widget.firstTotalTime)/100}',
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
                      '${widget.secondTotalTime}',
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
                      '${widget.secondcurrent}',
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
                      '${widget.voltage * widget.secondcurrent * widget.secondTotalTime}',
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
                      '${(widget.voltage * widget.secondcurrent * widget.secondTotalTime)/100}',
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
                      '${widget.thirdTotalTime}',
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
                      '${widget.thirdcurrent}',
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
                      '${widget.voltage * widget.thirdcurrent * widget.thirdTotalTime}',
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
                      '${(widget.voltage * widget.thirdcurrent * widget.thirdTotalTime)/100}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 15,),
                Row(
                  children: [
                    Text(
                      'Fixed Charge : ',
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 13,
                          ),
                    ),
                 const    SizedBox(width: 5,),
                    const Text(
                      '35',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Text(
                  'Total Cost (rupees) : ',
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '',
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
