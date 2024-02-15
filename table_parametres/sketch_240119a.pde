PImage img; 
PImage lum; 

boolean Langues; 
boolean Luminosite; 
boolean WIFI; 

boolean LanguesPressed = false ; 
boolean LuminositePressed = false; 
boolean WIFIPressed = false; 

boolean boule = false; 
float barreX; 
float balleX; 

int decalageLangues = 0; 
int decalageLuminosite = 0; 

void setup(){
  size(720,900); 
  img = loadImage("./Images/retour.png");
  lum = loadImage("./Images/luminosite.png"); 
  
  barreX = width/2; // Position initiale de la barre au centre
  balleX = barreX; // Position initiale de la boule alignée avec la barre
  
}

void draw(){
  background(255); 
  
  fill(0);
  textSize(45);
  text("Paramètres", 250, 90);
  
  image(img, 40,40, 50, 50); 
  
  creerRectangle("Langues", 0, 255, Langues); 
  
  if(!LanguesPressed && !LuminositePressed){
     creerRectangle("Luminosité", 60 ,255, Luminosite); 
    creerRectangle("WIFI", 120 ,255,WIFI ); 
  }
  
  if(LanguesPressed && !LuminositePressed){
    creerRectangle("Luminosité", 60 + decalageLangues ,255, Luminosite); 
    creerRectangle("WIFI", 120 + decalageLangues ,255,WIFI ); 
    MenuLangues(); 
  }
  
  if(!LanguesPressed && LuminositePressed){
    creerRectangle("Luminosité", 60 ,255, Luminosite); 
    creerRectangle("WIFI", 120 + decalageLuminosite ,255,WIFI ); 
    MenuLuminosite(); 
  }
  
  if(LanguesPressed && LuminositePressed){
    creerRectangle("Luminosité", 60+decalageLangues ,255, Luminosite); 
    creerRectangle("WIFI", 120 + decalageLangues+decalageLuminosite ,255,WIFI ); 
    MenuLangues();
    MenuLuminosite(); 
  }
  
  if(WIFIPressed){
    MenuWIFI(); 
  }
  
}

void creerRectangle(String string, int position, int couleur, boolean actif){
  fill(couleur);
  if (actif){
    fill(200); }
  rect(50, 150+position, 300, 30);
  fill(0);
  textSize(20);
  text(string,65,170+position);
  
}

void MenuLangues() {

  fill(0);
  textSize(20);
  text("Choisisez votre langue : ", 65, 210); 
  text("Anglais", 65, 240);
  text("Français", 160, 240);
  text("Espagnol", 300, 240);
}

void MenuLuminosite() {
  //Symbole luminosite 
  image(lum, 90, 272+decalageLangues, 35, 35);
  image(lum, width-130, 265+decalageLangues, 50, 50);
  
  // Dessiner la barre
  stroke(0);
  line(150, 290+decalageLangues , width-150, 290+decalageLangues);
  
  // Dessiner la boule
  fill(150);
  ellipse(balleX, 290+decalageLangues, 20, 20);
  
  // Si la boule est en train d'être déplacée, la mettre à la position de la souris
  if (boule) {
    balleX = constrain(mouseX, 150+20/2, width-150-20/2);
  }
}


void MenuWIFI() {

  fill(0);
  textSize(20);
  text("Box-203", 75, 330+decalageLangues+decalageLuminosite); 
  text("Code WIFI : ZDKB 7526 NCJD", 75, 360+decalageLangues+decalageLuminosite);
}


void mousePressed(){
  //Vérifier si la souris est sur le bouton retour (l'image)
  if (mouseX > 40 && mouseX < 90 && mouseY > 40 && mouseY < 90) {
    println("Bouton retour");
  }
  
  //Vérifier si la souris est sur le bouton Langues
  if (mouseX > 50 && mouseX < 350 && mouseY > 150 && mouseY < 180) {
    LanguesPressed = !LanguesPressed;
   
   if (LanguesPressed) {
      decalageLangues = 80;
    } else {
      decalageLangues = 0;
    }
  }
  
  //Vérifier si la souris est sur le bouton Luminosite
  if (mouseX > 50 && mouseX < 350 && mouseY > 210+decalageLangues && mouseY < 240+decalageLangues){
    LuminositePressed = !LuminositePressed;
   
   if (LuminositePressed) {
      decalageLuminosite = 80;
    } else {
      decalageLuminosite = 0;
    }
  }
  
  //Vérifier si la souris est sur le bouton WIFI
  if(mouseX > 50 && mouseX < 350 && mouseY > 270+decalageLangues+decalageLuminosite && mouseY < 300+decalageLangues+decalageLuminosite){
    WIFIPressed = !WIFIPressed;
  }
  
  // Vérifier si la souris est sur la boule
  if ((dist(mouseX, mouseY, balleX, 290+decalageLangues)) < 20/2) {
    boule = true;
  }
  
}

void mouseMoved() {
  // Vérifier si la souris est sur les rectangles
  Langues = mouseX > 50 && mouseX < 350 && mouseY > 150 && mouseY < 180;
  Luminosite = mouseX > 50 && mouseX < 350 && mouseY > 210+decalageLangues && mouseY < 240+decalageLangues;
  WIFI = mouseX > 50 && mouseX < 350 && mouseY > 270+decalageLangues+decalageLuminosite && mouseY < 300+decalageLangues+decalageLuminosite ;
}

void mouseReleased() {
  boule = false; // Arrêter de déplacer la boule
}
