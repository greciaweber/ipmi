// Grecia Weber 119170/0 
// Link al video de YouTube https://youtu.be/vLBDStO1SMg
// TRABAJO PRÁCTICO N°3 - "OpArt con Funciones y Ciclo For" 
// COMISIÓN 5 
// Obra seleccionada: Serie 14 N - 4E - Julio Le Parc

PImage obra;
int[] coloresOriginales = {
  color(0, 100, 0),      
  color(0, 50, 0),       
  color(0, 0, 100),      
  color(100, 0, 100),    
  color(100, 0, 0),      
  color(255, 0, 0),      
  color(255, 150, 0),    
  color(255, 200, 0),    
  color(255, 255, 0),    
  color(0, 255, 0),      
  color(0, 200, 0),      
  color(0, 100, 0),      
  color(0, 100, 100),    
  color(0, 255, 255)     
};

int[] colores;
int maxSize = 395; // Tamaño máximo de los círculos (ajustado)
int numCircles = 14; // Número de círculos concéntricos
int centerX, centerY;

void setup() {
  size(800, 400);  
  ellipseMode(CENTER);
  noStroke();  
  
  obra = loadImage("leparc.jpg");  // Carga la imagen desde la carpeta 'data'
  obra.resize(width / 2, height);  // Escala la imagen para que cubra la mitad izquierda de la pantalla
  colores = coloresOriginales.clone(); // Inicializa los colores actuales con los originales
  
  centerX = width / 2 + 200; // Coordenada X para centrar el patrón en la parte derecha
  centerY = height / 2; // Coordenada Y para centrar el patrón
  
  background(255);  // Fondo blanco
  image(obra, 0, 0);  // Dibuja la imagen en la posición (0, 0)
}

void draw() {
  background(255);  // Fondo blanco
  image(obra, 0, 0);  // Dibuja la imagen de referencia
  
  drawInteractivePattern();  // Llama a la función para dibujar el patrón interactivo
}

void drawInteractivePattern() {
  for (int i = 0; i < numCircles; i++) {
    int size = calculateCircleSize(i);
    fill(colores[i % colores.length]); 
    ellipse(centerX, centerY, size, size); // Dibuja el círculo
  }
}

void mouseMoved() {
  for (int i = 0; i < numCircles; i++) {
    int size = calculateCircleSize(i);
    float distance = dist(mouseX, mouseY, centerX, centerY);
    if (distance < size / 2) {
      colores[i] = color(random(255), random(255), random(255));  // Cambia a un color aleatorio
    }
  }
  redraw();  // Redibuja los círculos interactivos
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    // Reinicia el programa al presionar la tecla 'r' o 'R'
    colores = coloresOriginales.clone(); // Reinicia los colores a sus valores originales
    redraw();  // Redibuja los círculos interactivos
  }
}

// Función propia con parámetro que retorna un valor
int calculateCircleSize(int index) {
  return maxSize - index * (maxSize / (numCircles - 1));
}
