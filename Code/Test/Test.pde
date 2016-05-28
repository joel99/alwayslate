void setup() {
  PImage img = loadImage("lumberjack-workout.jpg");
  size(1000,1000);
  image(img,0,0);
  textSize(32);
  fill(256,0,0);
  text("Lumberjack",0,32);
  text("Reps: 10",0,64);
  text("Sets: 3",0,96);
}