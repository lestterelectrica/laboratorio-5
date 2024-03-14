void setup() {
  pinMode(1, OUTPUT);
  Serial.begin(9600);
}

void loop(){
  if (Serial.available()>0){
    char estadoLed = Serial.read();
    if (estadoLed == '1'){
      digitalWrite(1, HIGH);  
      Serial.println("LED encendido");
    }else if (estadoLed == '0'){
      digitalWrite(1, LOW);  
      Serial.println("LED apagado");
    }
  }
}