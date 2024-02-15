PImage menu; 
PImage discu; 
PImage meteo; 
PImage jeux; 
PImage service; 
PImage parametres; 
PImage paiement; 

int selection =0; 

void setup(){
  background(255); 
  size(900,300); 
  
  fill(0);
  textSize(20);
  text("Table 2", 400, 20);
  
  //Charger les images
  menu = loadImage("./Images/menu.png");
  discu = loadImage("./Images/discussion.jpg"); 
  meteo = loadImage("./Images/meteo.jpg"); 
  jeux = loadImage("./Images/jeux.png"); 
  service = loadImage("./Images/service.jpg"); 
  parametres =  loadImage("./Images/parametres.png"); 
  paiement =  loadImage("./Images/paiement.png"); 
  
}

void draw(){
   
  // Encadrez les images
  stroke(0); 
  noFill(); 
  
  //Afficher les images 
  image(menu, 60, 120, 70, 70); 
  image(discu, 160, 120, 70, 70); 
  image(meteo, 260, 120, 70, 70); 
  image(jeux, 360, 120, 70, 70); 
  image(service, 460, 120, 70, 70); 
  image(parametres, 560, 120, 70, 70);
  image(paiement, 650 ,100, 170, 170);  
  
  // Affichage des rectangles
  rect(60, 100, 70, 90);
  rect(160, 100, 70, 90);
  rect(260, 100, 70, 90);
  rect(360, 100, 70, 90);
  rect(460, 100, 70, 90);
  rect(560, 100, 70, 90);
  
  //Affichage des noms
  fill(0);
  textSize(15);
  text("Menu", 75, 115);
  text("Discussion", 162, 115);
  text("Meteo", 275, 115);
  text("Jeux", 375, 115);
  text("Service", 475, 115);
  text("Peiment", 570, 115);

println(selection); 
}


void mousePressed(){
  //Vérifier si la souris est sur le bouton Menu 
  if (mouseX > 60 && mouseX < 130 && mouseY > 100 && mouseY < 190) {
    selection = 1;
  }
    //Vérifier si la souris est sur le bouton Discussion 
  if (mouseX > 160 && mouseX < 230 && mouseY > 100 && mouseY < 190) {
    selection = 2;
  }
    //Vérifier si la souris est sur le bouton Meteo
  if (mouseX > 260 && mouseX < 330 && mouseY > 100 && mouseY < 190) {
    selection = 3; 
  }
    //Vérifier si la souris est sur le bouton Jeux
  if (mouseX > 360 && mouseX < 430 && mouseY > 100 && mouseY < 190) {
    selection = 4; 
  }
    //Vérifier si la souris est sur le bouton Service
  if (mouseX > 460 && mouseX < 530 && mouseY > 100 && mouseY < 190) {
    selection = 5; 
  }
    //Vérifier si la souris est sur le bouton Parametres
  if (mouseX > 560 && mouseX < 630 && mouseY > 100 && mouseY < 190) {
    selection = 6; 
  }
}
