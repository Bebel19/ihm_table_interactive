PImage menu; 
PImage discu; 
PImage meteo; 
PImage jeux; 
PImage service; 
PImage parametres; 
PImage paiement; 

int selection =0; 

void setup(){
  size(900,300); 
  background(255); 
 
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
  image(menu, 20, 120, 100, 100); 
  image(discu, 140, 120, 100, 100); 
  image(meteo, 260, 120, 100, 100); 
  image(jeux, 380, 120, 100, 100); 
  image(service, 500, 120, 100, 100); 
  image(parametres, 620, 120, 100, 100);
  image(paiement, 725 ,100, 170, 170);  
  
  // Affichage des rectangles
  rect(20, 100, 100, 120);
  rect(140, 100, 100, 120);
  rect(260, 100, 100, 120);
  rect(380, 100, 100, 120);
  rect(500, 100, 100, 120);
  rect(620, 100, 100, 120);
  
  //Affichage des noms
  fill(0);
  textSize(15);
  text("Menu", 55, 115);
  text("Discussion", 160, 115);
  text("Meteo", 290, 115);
  text("Jeux", 415, 115);
  text("Service", 525, 115);
  text("Paiement", 640, 115);

println(selection); 
}

void mousePressed(){
  //Vérifier si la souris est sur le bouton Menu 
  if (mouseX > 20 && mouseX < 120 && mouseY > 100 && mouseY < 220) {
    selection = 1;
  }
    //Vérifier si la souris est sur le bouton Discussion 
  if (mouseX > 140 && mouseX < 240 && mouseY > 100 && mouseY < 220) {
    selection = 2; // Supposons que 2 représente la messagerie
    FenetreMessagerie fenetreMessagerie = new FenetreMessagerie();
    String[] args = {"Table Messagerie"};
    PApplet.runSketch(args, fenetreMessagerie);
  }
    //Vérifier si la souris est sur le bouton Meteo
  if (mouseX > 260 && mouseX < 360 && mouseY > 100 && mouseY < 220) {
    selection = 3; 
    FenetreMeteo fenetreMeteo = new FenetreMeteo();
    String[] args = {"Fenetre Meteo"};
    PApplet.runSketch(args, fenetreMeteo);
  }
    //Vérifier si la souris est sur le bouton Jeux
  if (mouseX > 380 && mouseX < 480 && mouseY > 100 && mouseY < 220) {
    selection = 4; // Sélection du jeu
    FenetreJeux fenetreJeux = new FenetreJeux();
    String[] args = {"Fenetre Jeux"};
    PApplet.runSketch(args, fenetreJeux);
  }
    //Vérifier si la souris est sur le bouton Service
  if (mouseX > 500 && mouseX < 600 && mouseY > 100 && mouseY < 220) {
    selection = 5; 
  }
    //Vérifier si la souris est sur le bouton Parametres
  if (mouseX > 620 && mouseX < 720 && mouseY > 100 && mouseY < 220) {
    selection = 6; // Supposons que 6 représente les paramètres
    FenetreParametres fenetreParametres = new FenetreParametres();
    String[] args = {"Table Paramètres"};
    PApplet.runSketch(args, fenetreParametres);
  }
}
