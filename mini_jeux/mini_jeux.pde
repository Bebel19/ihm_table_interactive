int state;
String[] noms; // Tableau pour stocker les noms
PImage img; // Déclaration de la variable pour l'image
int x_retour, y_retour, largeur_retour, hauteur_retour,x_start,y_start,diametre_start; // Position et dimensions du bouton retour
void setup() {
  size(720, 900);
  background(220, 220, 231); // Couleur bleu ciel

  // Initialisation du tableau de noms (peut être rempli plus tard)
  noms = new String[]{"Puck-Man", "Space Outvider", "Monkey King", "Marius Brother", "The History of Laink", "Doomed", "Wood stick Liquid", "Solidaire"};
  x_retour = 50; // Position horizontale du bouton
  y_retour = 800; // Position verticale du bouton
  largeur_retour = 140; // Largeur du bouton
  hauteur_retour = 70; // Hauteur du bouton
  x_start =525; // Position horizontale du centre du bouton
  y_start = 525; // Position verticale du centre du bouton
  diametre_start = 150; // Diamètre du bouton
}


void draw() {
  int x = 50; // Position horizontale du tableau
  int y = 50; // Position verticale du tableau
  int largeur = width - 2 * x; // Largeur du tableau
  int hauteur = height / 2 - 2 * y; // Hauteur du tableau
  int rectHauteur = hauteur / noms.length; // Hauteur de chaque rectangle
  
  //affichage bouton start
  fill(255); // Couleur noire pour le bouton
  ellipse(x_start, y_start, diametre_start, diametre_start); // Cercle noir pour le bouton

  // Affichage du texte "Start" au centre du bouton
  fill(0); // Couleur blanche pour le texte
  textAlign(CENTER, CENTER);
  textSize(30);
  text("Start", x_start, y_start);
  
  
  // affichage bouton retour
  fill(255); // Couleur pour le bouton retour
  rect(x_retour, y_retour, largeur_retour, hauteur_retour); // Rectangle noir pour le bouton retour
  // Affichage du texte "Retour" au centre du bouton
  fill(0); // Couleur blanche pour le texte
  textAlign(CENTER, CENTER);
  textSize(20);
  text("Retour", x_retour + largeur_retour / 2, y_retour + hauteur_retour / 2);


  // Affichage du titre
  fill(0); // Couleur noire pour le texte du titre
  textAlign(CENTER, CENTER);
  textSize(24);
  text("Mini-Jeux", width / 2, y - 18); // Titre 2 pixels au-dessus du tableau
  fill(255);
  // Affichage des rectangles encadrant chaque nom
  for (int i = 0; i < noms.length; i++) {
    rect(x, y + i * rectHauteur, largeur, rectHauteur); // Rectangle noir
    fill(255); // Réinitialiser la couleur pour le texte
    textAlign(CENTER, CENTER);
    text(noms[i], x + largeur / 2, y + i * rectHauteur + rectHauteur / 2);
  }
  fill(255); // Couleur de remplissage du rectangle (rouge)
  rect(50, 410, 300, 200); // Rectangle aux coordonnées (50, 50) et dimensions 300x200
  

  
  fill(0); // Couleur blanche pour le texte des noms
  textAlign(CENTER, CENTER);
  textSize(20);

  
  // Affichage des noms à l'intérieur des rectangles
  for (int i = 0; i < noms.length; i++) {
    text(noms[i], x + largeur / 2, y + i * rectHauteur + rectHauteur / 2);
  }
  
  switch (state) {
    case 1:
      img = loadImage("1.jpg"); // Charger votre image (remplacez "nom_de_votre_image.jpg" par le chemin de votre image)
      image(img, 60, 420, 280, 180); // Image aux coordonnées (60, 60) et dimensions 280x180
      break;
    case 2:
      img = loadImage("2.png"); // Charger votre image (remplacez "nom_de_votre_image.jpg" par le chemin de votre image)
      image(img, 60, 420, 280, 180); // Image aux coordonnées (60, 60) et dimensions 280x180
      break;
    case 3:
      img = loadImage("3.jpg"); // Charger votre image (remplacez "nom_de_votre_image.jpg" par le chemin de votre image)
      image(img, 60, 420, 280, 180); // Image aux coordonnées (60, 60) et dimensions 280x180
      break;
    case 4:
      img = loadImage("4.jpg"); // Charger votre image (remplacez "nom_de_votre_image.jpg" par le chemin de votre image)
      image(img, 60, 420, 280, 180); // Image aux coordonnées (60, 60) et dimensions 280x180
      break;
    case 5:
      img = loadImage("5.jpg"); // Charger votre image (remplacez "nom_de_votre_image.jpg" par le chemin de votre image)
      image(img, 60, 420, 280, 180); // Image aux coordonnées (60, 60) et dimensions 280x180
      break;
    case 6:
      img = loadImage("6.jpg"); // Charger votre image (remplacez "nom_de_votre_image.jpg" par le chemin de votre image)
      image(img, 60, 420, 280, 180); // Image aux coordonnées (60, 60) et dimensions 280x180
      break;
    case 7:
      img = loadImage("7.jpg"); // Charger votre image (remplacez "nom_de_votre_image.jpg" par le chemin de votre image)
      image(img, 60, 420, 280, 180); // Image aux coordonnées (60, 60) et dimensions 280x180
      break;
    case 8:
      img = loadImage("8.jpg"); // Charger votre image (remplacez "nom_de_votre_image.jpg" par le chemin de votre image)
      image(img, 60, 420, 280, 180); // Image aux coordonnées (60, 60) et dimensions 280x180
      break;
    default:
      
  }

}

void mouseClicked() {
  int x = 50; // Position horizontale du tableau
  int y = 50; // Position verticale du tableau
  int largeur = width - 2 * x; // Largeur du tableau
  int hauteur = height / 2 - 2 * y; // Hauteur du tableau
  int rectHauteur = hauteur / noms.length; // Hauteur de chaque rectangle
  float distance = dist(mouseX, mouseY, x_start, y_start);
  
  // Vérifier si la souris est cliquée sur le bouton "Start" (dans le cercle)
  if (distance < diametre_start / 2) {
    // Le bouton "Start" a été cliqué
    println("Bouton Start cliqué");
    // Ajoutez ici le code que vous souhaitez exécuter lorsqu'on clique sur le bouton "Start"
  }
  
  
  
  // Vérifier si la souris est cliquée dans une des cases du tableau
  for (int i = 0; i < noms.length; i++) {
    if (mouseX > x && mouseX < x + largeur && mouseY > y + i * rectHauteur && mouseY < y + (i + 1) * rectHauteur) {
      // La case a été cliquée
      println("Case " + (i + 1) + " cliquée. Nom: " + noms[i]);
      state = (i+1);
      // Ajoutez ici le code que vous souhaitez exécuter lorsqu'une case est cliquée
    }
  }
  if (mouseX > x_retour && mouseX < x_retour + largeur_retour && mouseY > y_retour && mouseY < y_retour + hauteur_retour) {
    // Le bouton "Retour" a été cliqué
    println("Bouton Retour cliqué");
  }
}
