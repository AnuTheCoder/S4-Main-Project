const int sensorIn1 = A0; 
const int sensorIn2 = A1; 
const int sensorIn3 = A2; 
int mVperAmp = 185; 
int Watt = 0; 
double Voltage = 0; 
double VRMS = 0; 
double AmpsRMS = 0; 
double Current1 = 0; 
double Current2 = 0; 
double Current3 = 0; 
//................................................... 
double sensorValue = 0; 
int val[100]; 
int max_v = 0; 
double VmaxD = 0; 
double VeffD = 0; 
double Veff = 0; 
//......................................................... 
 
#define relay1 8 
#define relay2 9 
#define relay3 10 
String device1; 
String device2; 
String device3; 
unsigned long previousMillis = 0; 
void setup() { 
  pinMode(relay1, OUTPUT); 
  digitalWrite(relay1, HIGH); 
 
  pinMode(relay2, OUTPUT); 
  digitalWrite(relay2, HIGH); 
 
  pinMode(relay3, OUTPUT); 
  digitalWrite(relay3, HIGH); 
 
  Serial.begin (4800); 
 
} 
 
void loop() { 
 
  if (Serial.available() > 0) 
  { 
    String data = Serial.readStringUntil('\n'); 
    //Serial.println(data); 
    data.replace("\n", ""); 
    data.trim(); 
    //Serial.println(data.length()); 
    //Serial.println(data); 
    int startIndx = data.indexOf('*'); 
    if (data.length() == 8 && startIndx == 0) { 
      int startIndex = data.indexOf("a"); 
      device1 =  data.substring(startIndex + 1, startIndex + 2); 
      startIndex = data.indexOf("b"); 
      device2 = data.substring(startIndex + 1, startIndex + 2); 
      startIndex = data.indexOf("c"); 
      device3 = data.substring(startIndex + 1, startIndex + 2); 
 
 
 
      if (device1 == "1") { 
        Serial.println("relay1 on "); 
        digitalWrite(relay1, LOW); 
 
      } 
 
      if (device1 == "0" ) { 
        Serial.println("relay1 off"); 
        digitalWrite(relay1, HIGH); 
 
      } 
      if (device2 == "1") { 
        Serial.println("relay2 on"); 
        digitalWrite(relay2, LOW); 
 
      } 
      if (device2 == "0") { 
        Serial.println("relay2 off"); 
        digitalWrite(relay2, HIGH); 
 
      } 
      if (device3 == "1") { 
        Serial.println("relay3 on"); 
        digitalWrite(relay3, LOW); 
 
      } 
      if (device3 == "0") { 
        //Serial.println("relay3 off"); 
        digitalWrite(relay3, HIGH); 
 
      } 
    } 
 
 
 
 
 
    delay(10); 
 
  } 
 
  //Serial.print(analogRead(A5)) 
  unsigned long currentMillis = millis(); 
 
  if (currentMillis - previousMillis >= 15000) { 
    previousMillis = currentMillis; 
    Voltage = get_voltage(); 
    Current1 = get_current(Voltage, sensorIn1); 
    Current2 = get_current(Voltage, sensorIn2); 
    Current3 = get_current(Voltage, sensorIn3); 
 
    String sensor_data = "v" + String(Voltage) + "a" + String(Current1) + "b" + String(Current2) + "c" + String(Current3); 
 
    Serial.println(sensor_data); 
  } 
 
} 
 
 
float get_current( float line_voltage, int sensor) 
{ 
  float result; 
  int readValue; 
  int maxValue = 0; 
  int minValue = 1024; 
 
  uint32_t start_time = millis(); 
  while ((millis() - start_time) < 1000) //sample for 1 Sec 
  { 
    readValue = analogRead(sensor); 
    // see if you have a new maxValue 
    if (readValue > maxValue) 
    { 
 
      maxValue = readValue; 
    } 
    if (readValue < minValue) 
    { 
 
      minValue = readValue; 
    } 
  } 
 
  // Subtract min from max 
  result = ((maxValue - minValue) * 5.0) / 1024.0; 
  VRMS = (result / 2.0) * 0.707; 
  AmpsRMS = (VRMS * 1000) / mVperAmp; 
 
  //  Serial.print(AmpsRMS); 
  //  Serial.print(" Amps RMS  ---  "); 
  Watt = (AmpsRMS * line_voltage / 1.3); 
  //  Serial.print(Watt); 
  //  Serial.println(" W"); 
  return AmpsRMS; 
} 
 
 
float get_voltage() 
{ 
  for ( int i = 0; i < 100; i++ ) { 
    sensorValue = analogRead(A5); 
    //Serial.print(sensorValue); 
 
    if (analogRead(A5) > 511) { 
      val[i] = sensorValue; 
    } 
    else { 
      val[i] = 0; 
    } 
    delay(1); 
  } 
 
  max_v = 0; 
 
  for ( int i = 0; i < 100; i++ ) 
  { 
    if ( val[i] > max_v ) 
    { 
      max_v = val[i]; 
    } 
    val[i] = 0; 
  } 
  if (max_v != 0) { 
 
 
    VmaxD = max_v; 
    VeffD = VmaxD / sqrt(2); 
    Veff = (((VeffD - 420.76) /
    -90.24) * -210.2) + 210.2; 
  } 
  else { 
    Veff = 0; 
  } 
  // Serial.print("Voltage: "); 
  //  Serial.println(Veff); 
  VmaxD = 0; 
  delay(100); 
 
  return Veff; 
}
