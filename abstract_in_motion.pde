float angle;
float noiseOffset = 0;

void setup() {
  size(763, 780);
  surface. setLocation(757, 0);
  noStroke();
  colorMode(HSB, 255);
}

void draw() {
  fill(0, 0, 255, 15);
rect(0, 0, width, height);

  float bg = map(noise(frameCount * 0.005), 0, 1, 230, 255);
  background(bg);
  float x = width;
  float dia = 110;
  int num = 100;

  translate(width/2, height/2);
  float noiseVal = noise(noiseOffset) * 0.05;
  float hueVal = noise(frameCount * 0.01) * 255;
  angle += noiseVal;
  for (int a=0; a<360; a+=22.5) {
    rotate(radians(a));
    pushMatrix();
    for (int i=0; i<num; i++) {
    scale(0.95);
    rotate(radians(angle));
    fill(hueVal, 180, 200, 150 + sin(frameCount * 0.05 + i) * 50);
    ellipse(x, 0, dia, dia);
    }
 popMatrix();
 
 pushMatrix();
 for (int i=0; i<num; i++) {
   scale(0.95);
   rotate(-radians(angle));
   fill(hueVal + 60, 180, 220, 120 + sin(frameCount * 0.07 + i) * 50);
   ellipse(x, 0, dia, dia);
 }
 popMatrix();
  }
  pushMatrix();
  for (int i = 0; i < 20; i++) {
    rotate(radians(i * 18));
    float r = 100 + sin(frameCount * 0.03 + i) * 30;
    fill((hueVal + 100) % 255, 180, 255, 180);
    ellipse(r, 0, 10 + sin(frameCount * 0.02 + i) * 3, 10 + sin(frameCount * 0.02 + i) * 3);
    }
  popMatrix();

  pushMatrix();
  int rectCount = 12;
  for (int i = 0; i < rectCount; i++) {
    float t = frameCount * 0.02 + i * TWO_PI / rectCount;
    float r = 300 + noise(i * 0.3 + frameCount * 0.01) * 180;
    float rectX = cos(t) * r;
    float rectY = sin(t) * r;

    float rectSize = 40 + 20 * sin(frameCount * 0.05 + i);
    float hue = (frameCount * 2 + i * 30) % 255;

    pushMatrix();
    translate(rectX, rectY);
    rotate(radians(frameCount * 3 + i * 15));
    fill(hue, 200, 255, 100);
    rect(0, 0, rectSize, rectSize);
    popMatrix();
 }
  popMatrix();

  pushMatrix();
  int dotCount = 80;
  for (int i = 0; i < dotCount; i++) {
    float angleOffset = frameCount * 0.05 + i * TWO_PI / dotCount;
    float radius = 150 + sin(frameCount * 0.02 + i) * 40;
    float dotX = cos(angleOffset) * radius;
    float dotY = sin(angleOffset) * radius;

    float hue = (frameCount * 2 + i * 5) % 255;
    fill(hue, 200, 255, 200);
    ellipse(dotX, dotY, 5, 5);
 }
  popMatrix();
  noiseOffset += 0.01;
}
