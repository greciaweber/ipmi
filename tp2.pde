// TRABAJO PRÁCTICO N°2 - "Variables y Condicionales"
// COMISIÓN 5 
// Grecia Weber 119170/0 


import processing.sound.*;


PFont fuenteNueva;
PImage[] imagenes; 
String[] textos; 
int pantallaActual = 0; 
int tiempo = 0; 
int tiempoTransicion = 8000; 
boolean presentacionIniciada = false; 
color colorDelBoton;
SoundFile fondoMusical;
void setup() {
  size(640, 480);
  
  // Cargo el archivo de sonido
  fondoMusical = new SoundFile(this, "metro2033song.mp3");
  
  //Play al sonido en bucle
  fondoMusical.loop();

  // Configuración de fuentes!
  fuenteNueva = loadFont("Franklin.vlw"); 
  textFont(fuenteNueva);
  textSize(16); 
  textAlign(CENTER, CENTER);

  // Configuración de imágenes y textos
  imagenes = new PImage[5];
  textos = new String[4]; 
  
  imagenes[0] = loadImage("imagen1.jpg"); 
  imagenes[1] = loadImage("imagen2.jpg");
  imagenes[2] = loadImage("imagen3.jpg");
  imagenes[3] = loadImage("imagen4.jpg");
  imagenes[4] = loadImage("imagen5.jpg"); 

  textos[0] = "TP \"Variables y Condicionales\"\nGrecia Weber 119170/0";
  textos[1] = "Metro 2033 es una novela de ciencia ficción \nescrita por Dmitry Glukhovsky. \nPublicada en 2005, es el primer libro de una trilogía que \nexplora un mundo post-apocalíptico en el metro de Moscú. \nLa trilogía se completa con Metro 2034 y Metro 2035.";
  textos[2] = "Después de una catástrofe nuclear, los supervivientes\n se refugian en el metro de Moscú. Las estaciones \nse convierten en ciudades-estado y los túneles están llenos \nde peligros inimaginables.";
  textos[3] = "Artyom, el protagonista, se embarca en una misión \npeligrosa para salvar su estación de una nueva amenaza. \nSu viaje lo lleva a través de los túneles \noscuros y peligrosos del metro.";

  
  colorDelBoton = color(0);

  
  tiempo = millis();
}

void draw() {
  background(255); 
  
  if (presentacionIniciada) {
    
    image(imagenes[pantallaActual], 0, 0, width, height);

    if (pantallaActual < 4) {
      mostrarTextoConAnimacion(pantallaActual);
    } else {
      mostrarBotonReiniciar();
    }

    if (millis() - tiempo >= tiempoTransicion && pantallaActual < 5) {
      pantallaActual++;
      tiempo = millis();
    }
  } else {
    mostrarBotonInicio();
  }
}

void mostrarTextoConAnimacion(int index) {
  float animDuration = 2000; 
  float animProgress = min(1, (millis() - tiempo) / animDuration); 
  float fadeAlpha = map(animProgress, 0, 1, 0, 255); 
  
  textSize(16); 

  if (index == 0 || index == 1) {
    fill(0, fadeAlpha); 
  } else if (index == 2 || index == 3) {
    fill(255, fadeAlpha); 
  }

  if (index == 0) {
    textAlign(LEFT);
    text(textos[index], 20, height / 2);
  } else if (index == 1) {
    textAlign(CENTER); 
    text(textos[index], width / 2, height / 4); 
  } else if (index == 2) {
    textAlign(CENTER);
    text(textos[index], width / 2, height / 2);
  } else if (index == 3) {
    textAlign(CENTER, CENTER);
    text(textos[index], width / 2, height - 100); 
  }
}

void mostrarBotonInicio() {
  boolean mouseSobreBoton = mouseX > width / 2 - 100 && mouseX < width / 2 + 100 && mouseY > height / 2 - 25 && mouseY < height / 2 + 25;
  
  if (mouseSobreBoton) {
    fill(255, 0, 0); 
  } else {
    fill(255); 
  }
  
  rect(width / 2 - 100, height / 2 - 25, 200, 50); 
  fill(0); 
  textSize(16); 
  textAlign(CENTER, CENTER); 
  text("INICIAR \nPRESENTACIÓN", width / 2, height / 2);
  
  if (mouseSobreBoton && mousePressed) {
    presentacionIniciada = true; 

  }
} 

void mostrarBotonReiniciar() {
  float offset = 200; 
  fill(255); 
  rect(width / 2 - 50 - offset, height / 2 - 25, 100, 50); 
  fill(0); 
  textAlign(CENTER, CENTER); 
  textSize(16); 
  text("Reiniciar", width / 2 - offset, height / 2); 

  if (mousePressed && mouseX > width / 2 - 50 - offset && mouseX < width / 2 + 50 - offset && mouseY > height / 2 - 25 && mouseY < height / 2 + 25) {
    pantallaActual = 0;
    tiempo = millis();
    presentacionIniciada = false; 
  }
}
