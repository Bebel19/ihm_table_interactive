//Variables
String[] meteoStatus = {"Très nuageux", "Ensoleillé", "Très ensoleillé"};
String semaine[] = {"Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi","Dimanche","Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi","Dimanche"};
// Liste des villes avec leurs données météo
Ville[] villes = {
  new Ville("Ma localisation", 10, 15),
  new Ville("Casablanca", 8, 18),
  new Ville("Comps-la-grande-ville", 8, 11),
  new Ville("Urugne", 7, 13),
  new Ville("Perpignan", 11, 16),
  new Ville("Saint-Louis", 20, 30)
};
Ville villeSelectionnee = villes[0];


//PApplet
public class FenetreMeteo extends PApplet {
    public void settings() {
        size(720, 900);
        
    }


    public void draw() {
      drawSidebar();
      drawWeatherPanel();
      noLoop(); // Arrête la boucle draw après la première itération
}
    public void mousePressed() {
        if (mouseX > 0 && mouseX < 200) { // Zone de la barre latérale
          int itemHeight = 35; // Hauteur d'un élément (nom de ville + espace)
          int tolerance = itemHeight/2; // Tolérance en pixels au-dessus et en dessous de chaque élément
      
          // Calcul de l'index en tenant compte de la tolérance
          int index = -1;
          for (int i = 0; i < villes.length; i++) {
            int itemTop = i * itemHeight - tolerance; // Début de l'élément avec tolérance
            int itemBottom = itemTop + itemHeight + tolerance * 2; // Fin de l'élément avec tolérance
      
            if (mouseY >= itemTop && mouseY <= itemBottom) {
              index = i;
              break; // Arrête la boucle une fois l'index trouvé
            }
          }
      
      
          if (index >= 0) {
            villeSelectionnee = villes[index];
            redraw();
          }
        }
      }
}





class Ville {
  String nom;
  int tempMin;
  int tempMax;
  String status;
  int temperature;
  
  Ville(String nom, int tempMin, int tempMax) {
    this.nom = nom;
    this.tempMin = tempMin;
    this.tempMax = tempMax;
    this.status = determineStatus(); // Utilisez les températures min et max pour déterminer le statut
    this.temperature = getRandomNumber(tempMin, tempMax);
  }

  // Détermine le statut météorologique en fonction des températures min et max
  String determineStatus() {
    if (this.tempMax > 25) {
      return "Très ensoleillé";
    } else if (this.tempMax > 15) {
      return "Ensoleillé";
    } else {
      return "Très nuageux";
    }
  }
}








void drawSidebar() {
// Couleur de fond bleu clair pour un ciel ensoleillé
  fill(35, 154, 199); 
  noStroke();
  rect(0, 0, 200, height); // Dessine la barre latérale
  
  // Ajouter des éléments de la liste de villes
  fill(0); // Texte noir
  textSize(14);
    for(int i =0; i < villes.length; i++){
        text(villes[i].nom, 10, (i+1)*35);
    }
  
  
  // Bouton pour ajouter une ville
  fill(200); // Couleur du bouton
  rect(10, height - 60, 130, 40, 20); // Dessine le bouton avec des coins arrondis
  fill(0); // Texte noir pour le "+"
  textSize(32);
  text("+", (130/2)-5, height - 30); // Positionne le "+"
}

void drawWeatherPanel() {
  
  // Panneau d'affichage météo
  fill(135, 206, 255); 
  rect(180, 0, width - 160, height); // Dessine le panneau d'affichage
  
  // Informations météo pour la ville sélectionnée
  fill(0); // Texte noir
  textSize(20);
  text(villeSelectionnee.nom, 400, 50);
  textSize(30);
  text(villeSelectionnee.temperature+"°C", 400, 80);
  textSize(20);
  text(villeSelectionnee.status, 400, 110);
  textSize(16);
  text("H:"+villeSelectionnee.tempMax+"°"+ "B:"+villeSelectionnee.tempMin+"°", 400, 140);
 
  // Prévisions horaires (exemple statique)
  textSize(14);
  text("Actualisé à :", 400, 200);
  text(hour()+":"+ minute(), 500, 200);
  // Ajouter d'autres heures et températures
  
  // Prévisions pour les 10 prochains jours (exemple statique)
  textSize(14);
 
  for (int i = 0; i < semaine.length; i++) {
    int y = 300 + i * 60; // Position verticale de chaque entrée
     fill(0); // Texte noir pour les jours
    text(semaine[i], 200, y);
    if (getRandomNumber(0, 9) % 2 == 0) { // Condition pour alterner entre ensoleillé et nuageux
       goodDay(y);
    } else {
        badDay(y);
    }

  }
}

void drawSunIcon(float x, float y) {
  fill(255, 215, 0); // Couleur du soleil ajustée pour un jaune doré
  noStroke();
  ellipse(x, y, 20, 20); // Dessine le soleil
  stroke(255, 215, 0); // Rayons du soleil
  strokeWeight(2);
  for (int i = 0; i < 8; i++) { // Dessiner 8 rayons
    float angle = PI / 4 * i;
    float rayLength = 10; // Longueur des rayons
    line(x + cos(angle) * 10, y + sin(angle) * 10, x + cos(angle) * (10 + rayLength), y + sin(angle) * (10 + rayLength));
  }
}

void drawCloudIcon(float x, float y) {
  fill(224, 224, 224); // Couleur gris clair pour le nuage
  noStroke();
  ellipse(x, y, 25, 20); // Dessine un nuage
  ellipse(x + 10, y + 5, 25, 20);
  ellipse(x - 10, y + 5, 20, 20);
}

void badDay(int y){
      drawCloudIcon(300, y - 15);
      fill(0);
      int max = getRandomNumber(0,20);
      text("H: "+max+"°"+ "B: "+getRandomNumber(max-10, max-7)+"°", 400, y );
      text("Humidité: "+getRandomNumber(45,80)+"%", 550, y );
}

void goodDay(int y){
      drawSunIcon(300, y - 15);
      fill(0);
      int max = getRandomNumber(20,30);
      text("H: "+max+"°"+ "B: "+getRandomNumber(max-10, max-7)+"°", 400, y );
      text("Humidité: "+getRandomNumber(10,50)+"%", 550, y );
}

public int getRandomNumber(int min, int max) {
    return (int) ((Math.random() * (max - min)) + min);
}
