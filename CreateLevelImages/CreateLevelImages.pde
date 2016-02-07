void setup() {
  size(160,160);
  print("hello world");
}

void draw () {
  background(255,0,0);
  fill(128);
  rect(50,50,width-100,height-100);
  if (mousePressed) {
    fill(0,255,0);
    rect(100,100,100,100);
  }
}