#if defined(ESP32) 
#include <WiFi.h> 
#include <FirebaseESP32.h> 
#elif defined(ESP8266) 
#include <ESP8266WiFi.h> 
#include <FirebaseESP8266.h> 
#endif 
#include <addons/RTDBHelper.h> 
 
#define WIFI_SSID "Redmi 9A" 
#define WIFI_PASSWORD "123456780" 
#define DATABASE_URL "fir-a46ee-default-rtdb.firebaseio.com" 
FirebaseData fbdo; 
FirebaseAuth auth; 
FirebaseConfig config; 
unsigned long dataMillis = 0; 
String prev_data1 = "0"; 
String prev_data2 = "0"; 
String prev_data3 = "0"; 
String d1; 
String d2; 
String d3; 
String out; 
void setup() { 
  Serial.begin(4800); 
  pinMode(D1, OUTPUT); 
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD); 
  Serial.print("Connecting to Wi-Fi"); 
  while (WiFi.status() != WL_CONNECTED) 
  { 
    Serial.print("."); 
    delay(300); 
  } 
  Serial.println(); 
  Serial.print("Connected with IP: "); 
  Serial.println(WiFi.localIP()); 
  Serial.println(); 
  digitalWrite(D1, HIGH); 
  delay(1000); 
  digitalWrite(D1, LOW); 
  delay(1000); 
  config.database_url = DATABASE_URL; 
  config.signer.test_mode = true; 
  Firebase.reconnectWiFi(true); 
  Firebase.begin(&config, &auth); 
 
} 
 
void loop() { 
  //  Firebase.getInt(fbdo, F("/test/int")) ? String(fbdo.to<int>()).c_str() 
  if (Firebase.getInt(fbdo, F("/devices/device1"))) { 
    d1 = String(fbdo.to<int>()).c_str() ; 
  } 
  delay(100); 
  if (Firebase.getInt(fbdo, F("/devices/device2"))) { 
    d2 = String(fbdo.to<int>()).c_str() ; 
  } 
  delay(100); 
  if (Firebase.getInt(fbdo, F("/devices/device3"))) { 
 
    d3 = String(fbdo.to<int>()).c_str() ; 
  } 
  else { 
    Serial.println( fbdo.errorReason().c_str()); 
  } 
 
  delay(1000); 
  if (prev_data1 != d1 or  prev_data2 != d2 or  prev_data3 != d3) { 
    out = "*a" + d1 + "b" + d2 + "c" + d3 + "*"; 
    //Serial.println(out.length()); 
    if (out.length() >= 8) { 
      Serial.println(out); 
    } 
    prev_data1 = d1; 
    prev_data2 = d2; 
    prev_data3 = d3; 
    delay(10); 
  } 
 
 
  if (Serial.available() > 0) { 
 
    String data = Serial.readStringUntil('\n'); 
    data.replace("\n", ""); 
    data.trim(); 
    int startIndx = data.indexOf('v'); 
    if (startIndx == 0) { 
      if ( !Firebase.setString(fbdo, "/sensorData/sensor", data)) { 
        Serial.println( fbdo.errorReason().c_str()); 
      } 
    } 
    else if (data.length() > 4) { 
       
      if (!Firebase.setString(fbdo, "/info/device", data)) { 
        Serial.println( fbdo.errorReason().c_str()); 
      } 
    } 
    delay(10); 
  } 
 
}
