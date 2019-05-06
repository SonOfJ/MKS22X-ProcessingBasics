int MAX_VALUE = 100;
int MIN_VALUE = -100;
Visualizer v;

class Visualizer {
  float x, y;
  float [] values;
  float [] speeds;
  Visualizer(float x, float y) {
    this.x = x;
    this.y = y;
    values = new float[10];
    speeds = new float[10];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }
  void display() {
    fill(255);
    rect(x, y, 400, 200);
    line(x, y+100, x+400, y+100);
    for (int i = 0; i < values.length; i = i + 1) {
      if (values[i] >= 0 && values[i] <= 50) {
        fill(0, 255, 0); //Set to green.
      }
      if (values[i] >= 50 && values[i] <= 100) {
        fill(255, 255, 0); //Set to yellow.
      }
      if (values[i] >= 100 && values[i] <= 150) {
        fill(255, 165, 0); //Set to orange.
      }
      if (values[i] >= 150 && values[i] <= 200) {
        fill(255, 0, 0); //Set to red.
      }
      rect(x + 40 * i, y + 100, 40, values[i]);
    }
  }
  void update() {
    for (int i = 0; i < values.length; i++) {
      values[i] += speeds[i]; 
      if (values[i] < -100 || values[i] > 100) { //Goes out of range.
        speeds[i] = -1;
      }
    }
  }
}

void setup() {
  size(600, 500);
  v = new Visualizer(20, 20);
}
void draw() {
  background(255);
  v.display();
  v.update();
}
