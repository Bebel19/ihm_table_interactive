import processing.core.PApplet;
import processing.core.PImage;
import gifAnimation.*;

// Declaration pour les fenetres secondaires
LaCarte carte;
Messagerie messagerie;
Meteo meteo;
Jeux jeux;
Parametres parametres;

// bool pour que les fentres secondaires ne s'ouvrent qu'une fois

boolean menuOuvert=false;
boolean messagerieOuvert=false;
boolean meteoOuvert=false;
boolean jeuxOuvert=false;
boolean paiementOuvert=false;


// Images de l'Acueill
PImage menuIcone; 
PImage discuIcone; 
PImage meteoIcone; 
PImage jeuxIcone; 
PImage serviceIcone; 
PImage parametresIcone; 
PImage paiementIcone; 

// Images des Parametres
PImage retourParametres; 
PImage lumParametres;

// Image de Messagerie
PImage retourMsg;

// Images de Jeux
PImage jeux3;
PImage jeux4;
PImage jeux5;
PImage jeux6;
PImage jeux7;
PImage jeux8;

// GIF Jeux
Gif gif;
Gif gifJeux1;
Gif gifJeux2;

//int selectionInt =0; 

void setup(){
  size(900,300); 
  background(255); 

  
  fill(0);
  textSize(20);
  text("Table 2", 400, 20);
  
  //Charger les images
  menuIcone = loadImage("./Images/menu.png");
  discuIcone = loadImage("./Images/discussion.jpg"); 
  meteoIcone = loadImage("./Images/meteo.jpg"); 
  jeuxIcone = loadImage("./Images/jeux.png"); 
  serviceIcone = loadImage("./Images/service.jpg"); 
  parametresIcone =  loadImage("./Images/parametres.png"); 
  paiementIcone =  loadImage("./Images/paiement.png"); 
  
  retourParametres = loadImage("./Images/parametres.png");
  lumParametres = loadImage("./Images/luminosite.png"); 
  retourMsg = loadImage("./Images/back.png");
  
  jeux3 = loadImage("./Images/3.jpg");
  jeux4 = loadImage("./Images/4.jpg");
  jeux5 = loadImage("./Images/5.jpg");
  jeux6 = loadImage("./Images/6.jpg");
  jeux7 = loadImage("./Images/7.jpg");
  jeux8 = loadImage("./Images/8.jpg");
  
  gif = new Gif(this, "./Images/rick.gif"); // Charger le GIF
  gifJeux1 = new Gif(this, "./Images/1.gif");
  gifJeux2 = new Gif(this, "./Images/2.gif");
  
  carte = new LaCarte();
  messagerie = new Messagerie(); 
  meteo = new Meteo();
  jeux = new Jeux();
  parametres = new Parametres();
       
  
}

void draw(){
   
  // Encadrez les images
  stroke(0); 
  noFill(); 
  
  //Afficher les images 
  image(menuIcone, 20, 120, 100, 100); 
  image(discuIcone, 140, 120, 100, 100); 
  image(meteoIcone, 260, 120, 100, 100); 
  image(jeuxIcone, 380, 120, 100, 100); 
  image(serviceIcone, 500, 120, 100, 100); 
  image(parametresIcone, 620, 120, 100, 100);
  image(paiementIcone, 725 ,100, 170, 170);  
  
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


}

void mousePressed(){
  //Vérifier si la souris est sur le bouton Menu 
  if (mouseX > 20 && mouseX < 120 && mouseY > 100 && mouseY < 220 && !menuOuvert) {
    
    PApplet.runSketch(new String[]{"Carte"}, carte);
    menuOuvert=true;
  }
    //Vérifier si la souris est sur le bouton Discussion 
  if (mouseX > 140 && mouseX < 240 && mouseY > 100 && mouseY < 220 && !messagerieOuvert) {
    
     PApplet.runSketch(new String[]{"Messagerie"}, messagerie);
     messagerieOuvert=true;
  }
    //Vérifier si la souris est sur le bouton Meteo
  if (mouseX > 260 && mouseX < 360 && mouseY > 100 && mouseY < 220 && !meteoOuvert) {
   
    PApplet.runSketch(new String[]{"Meteo"}, meteo);
    meteoOuvert=true;
  }
    //Vérifier si la souris est sur le bouton Jeux
  if (mouseX > 380 && mouseX < 480 && mouseY > 100 && mouseY < 220 && !jeuxOuvert) {
   
    PApplet.runSketch(new String[]{"Jeux"}, jeux);
    jeuxOuvert=true;
  }
    //Vérifier si la souris est sur le bouton Service
  if (mouseX > 500 && mouseX < 600 && mouseY > 100 && mouseY < 220) {
    System.out.println("Service: Appel d'un serveur"); 
  }
    //Vérifier si la souris est sur le bouton Parametres
  if (mouseX > 620 && mouseX < 720 && mouseY > 100 && mouseY < 220 && !paiementOuvert) {
    
     PApplet.runSketch(new String[]{"Parametres"}, parametres);
     paiementOuvert=true;
  }
}
