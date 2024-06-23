//Link: 
int cols = 40;  // número de columnas
int rows = 20;  // número de filas
float circleSize;
color startColor = color(0, 255, 0); // Color verde
color endColor = color(255, 0, 0); // Color rojo
color borderColor = color(0, 100, 0); // Color verde oscuro para el borde
color originalStartColor;
color originalEndColor;

void setup() {
  size(800, 400);
  circleSize = width / cols;
  originalStartColor = startColor;
  originalEndColor = endColor;
  noLoop();
}

void draw() {
  background(#365E32);
  image(loadImage("fondo.jpg"), 0, 0, width / 2, height);
  drawGrid();
}

void drawGrid() {
  ellipseMode(CENTER);
  
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      float lerpFactor = dist(x * circleSize, y * circleSize, width / 2, height / 2) / dist(0, 0, width / 2, height / 2);
      fill(lerpColor(startColor, endColor, lerpFactor));
      stroke(borderColor); // Establece el color del borde

      // Guardar la matriz de transformación actual
      pushMatrix();
      
      // Trasladar el punto de origen al centro del círculo
      translate(x * circleSize + circleSize / 2 + width / 2, y * circleSize + circleSize / 2);

      // Rotar el círculo sobre su propio eje diagonal
      rotate(radians(45));

      // Dibujar el elipse (geoide)
      ellipse(0, 0, circleSize * 1.2, circleSize * 0.8); // Geoide

      // Restaurar la matriz de transformación original
      popMatrix();
    }
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    resetColors();
  }
}

void mousePressed() {
  startColor = color(random(255), random(255), random(255));
  endColor = color(random(255), random(255), random(255));
  redraw();
}

void resetColors() {
  startColor = originalStartColor;
  endColor = originalEndColor;
  redraw();
}
