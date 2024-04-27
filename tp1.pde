PImage imagendepalta;
void setup()
{
  size(800,400);
  imagendepalta = loadImage("palta.jpg");
  
background (255);

}


void draw(){
  noStroke();
 fill(#4B5725);
  circle(590,220,220);
 circle(590,130,150);
beginShape();
  vertex(486,182);
  vertex(518,109);
  vertex(565,182);
    vertex(691,175);
    vertex(661,105);
  endShape();
  
  fill(#A4BF41);
  circle(590,220,200);
circle(590,130,135);
beginShape();
  vertex(500,179);
  vertex(525,110);
  vertex(565,182);
    vertex(680,177);
    vertex(653,105);
  endShape();

 fill(#BAD433);
circle(590,220,180);
circle(590,130,120);
beginShape();
vertex(507,185);
vertex(532,115);
vertex(622,114);
vertex(647,111);
vertex(671,181);
endShape();

fill(#5C3013);
circle(590,220,110);


  pushMatrix();
  translate(590, 220);
  rotate(radians(40));

  fill(#78441C);
  ellipse(0, 0, 80, 110);

  
  fill(#78441C); 
  arc(0, 0, 110, 110, PI / 2,  3 * PI / 2); 

  popMatrix();

  
  println(mouseX, mouseY);
  image(imagendepalta, 0, 0, 400, 400);

fill(#B6822C);
  float angle = radians(30); 
  translate(560, 201);
  rotate(angle);
  ellipse(0, 0, 22, 30);

  
  
  
}
