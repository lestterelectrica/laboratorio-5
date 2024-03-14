import processing.serial.*;

import processing.serial.*;

Serial port; // Objeto para la comunicación serial
boolean ledState = false; // Estado del LED (apagado inicialmente)
int ellipseSize = 50; // Tamaño de la elipse

void setup() {
  size(400, 200); // Tamaño del lienzo de Processing
  port = new Serial(this, Serial.list()[0], 9600); // Inicializar la comunicación serial
}

void draw() {
  background(255); // Fondo blanco
  
  // Dibujar la elipse
  fill(255, 0, 0); // Color rojo
  ellipse(width/2, height/2, ellipseSize, ellipseSize);
}

void mousePressed() {
  // Verificar si se hizo clic dentro de la elipse
  float d = dist(mouseX, mouseY, width/2, height/2);
  if (d < ellipseSize/2) {
    // Cambiar el estado del LED y enviar el comando a Arduino
    ledState =!ledState;
    if (ledState) {
      port.write('1'); // Encender el LED
    } else {
      port.write('0'); // Apagar el LED
    }
  }
}
