void setup() {
  size(768, 1105); // Taille basée sur la dimension de l'image
  background(135, 206, 235); // Couleur de fond bleu clair pour un ciel ensoleillé
}

void draw() {
  drawSidebar();
  drawWeatherPanel();
  noLoop(); // Arrête la boucle draw après la première itération
}

void drawSidebar() {
  fill(255); // Couleur de fond blanc pour la liste des villes
  noStroke();
  rect(0, 0, 150, height); // Dessine la barre latérale
  
  // Ajouter des éléments de la liste de villes
  fill(0); // Texte noir
  textSize(14);
  text("My Location", 10, 30);
  text("Casablanca", 10, 60);
  text("Grenoble", 10, 90);
  text("Paris", 10, 120);
  // Ajouter d'autres villes ici selon besoin
  
  // Bouton pour ajouter une ville
  fill(200); // Couleur du bouton
  rect(10, height - 60, 130, 40, 20); // Dessine le bouton avec des coins arrondis
  fill(0); // Texte noir pour le "+"
  textSize(32);
  text("+", 55, height - 25); // Positionne le "+"
}

void drawWeatherPanel() {
  // Panneau d'affichage météo
  fill(255); // Fond blanc pour la zone de détails
  rect(160, 0, width - 160, height); // Dessine le panneau d'affichage
  
  // Informations météo pour la ville sélectionnée
  fill(0); // Texte noir
  textSize(30);
  text("15°C", 180, 50);
  textSize(20);
  text("Mostly Cloudy", 180, 80);
  textSize(16);
  text("H:16° L:10°", 180, 105);
  
  // Prévisions horaires (exemple statique)
  textSize(14);
  text("Now", 180, 140);
  text("18:15", 230, 140);
  // Ajouter d'autres heures et températures
  
  // Prévisions pour les 10 prochains jours (exemple statique)
  textSize(14);
  fill(0); // Texte noir pour les jours
  for (int i = 0; i < 10; i++) {
    int y = 180 + i * 60; // Position verticale de chaque entrée
    text("Day " + (i + 1), 180, y);
    if (i % 2 == 0) { // Condition pour alterner entre ensoleillé et nuageux
      drawSunIcon(240, y - 15);
    } else {
      drawCloudIcon(240, y - 15);
    }
    // Ajouter les températures min et max ici
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
