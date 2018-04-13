

void setup()
{
  bg = loadImage("hill.jpg");
  img = loadImage("win.png");
  col = loadImage("colour.png");
  joke = loadImage("xp.png");
  background(bg);
  size(600, 600);

  stroke(0, 0, 0);
  strokeWeight(lineThicknes);

  fill(255, 255, 255);
  rect(0, 0, 599, 55);
}
PImage img;
PImage joke;
PImage col;
PImage bg;
float t = 0;
int lineThicknes;
color c = #FAFAFA;
int strokeRadius = 15;
float n = noise(t);
float V =(strokeRadius);
boolean pic = false;
void keyReleased() {
  if (int(keyCode) == 38) //up
  {
    if (strokeRadius < 200)
    {
      strokeRadius = strokeRadius + 25;
    } else
    {
      strokeRadius = 200;
    }
  }
  if (int(keyCode) == 40) //down
  {
    if (strokeRadius >= 50)
    {
      strokeRadius = strokeRadius - 25;
    } else
    {
      strokeRadius = 25;
    }
  }
  if (key == 'r')// reset if R is pushed 
  {
    println("enter");
    setup();
  }
}
void draw()
{
  stroke(0, 0, 0);
  strokeWeight(3);
  fill(255, 255, 255);
  rect(0, 0, 599, 55);
  //  Perlin noise
  float n = noise(t);
  float x = map(n, 0, 1, 40, 50);
  t += 0.1;
  stroke(0, 0, 0);
  strokeWeight(3);
  image(col, 0, 0, 367, 55);
  image(img, 368, 3, 130, 50);
  image(joke, 498, 3, 90, 50);
}
void mousePressed() {
  {
    if ((mouseY<55)&&(mouseX<370)) //if the mouse is in the top bar
    {    
      c = get(mouseX, mouseY); //getting the colour form the top bar
      println(mouseX, mouseY);
      pic = false;
    }
  }
  if ((mouseY<55)&&(mouseX>370)&&(mouseX<488))
  {
    pic = true;
  }
}
void mouseDragged () {

  noStroke();

  if ((mouseY>55)&&(pic==true)) {
    image(img, mouseX, mouseY, width/5, height/12);
  } else if ((mouseY>55)&&(pic==false)) {
    fill(c);
    ellipse(mouseX, mouseY, strokeRadius, 20 );
  }
}
