ArrayList<String>[] messagesHistory = new ArrayList[10]; // Historique des messages pour 10 tables
PImage retourButton;
int selectedTable = -1; // Table actuellement sélectionnée
String currentMessage = ""; // Message actuellement saisi
boolean isEnteringMessage = false; // Si l'utilisateur est en train de saisir un message

void setup() {
  size(720, 900);
  
  // Initialisation des ArrayLists pour l'historique des messages
  for (int i = 0; i < messagesHistory.length; i++) {
    messagesHistory[i] = new ArrayList<String>();
  }
  retourButton = loadImage("back.png");
}

void draw() {
  background(255);
  drawHeader();
  drawMessages();
  drawBackButton();
  if (selectedTable != -1) {
    drawMenu(selectedTable);
    if (isEnteringMessage) {
      drawTextInput();
    }
  }
}

void drawHeader() {
  fill(0);
  textAlign(CENTER);
  textSize(24);
  text("Restaurant", width / 2, 50);
  noFill();
  rect(width / 2 - 100, 20, 200, 40);
}

void drawMessages() {
  for (int i = 0; i < 10; i++) {
    drawMessage(50, 100 + 80 * i, "Table " + (i + 1), messagesHistory[i].isEmpty() ? "Pas de message" : messagesHistory[i].get(messagesHistory[i].size() - 1), i);
  }
}

void drawMessage(int x, int y, String name, String message, int tableIndex) {
  fill(200);
  ellipse(x, y, 40, 40); // Dessine un cercle pour la "photo de profil"
  fill(0);
  textSize(16);
  textAlign(CENTER, CENTER);
  text(tableIndex + 1, x, y); // Affiche le numéro de la table au centre du cercle
  fill(230);
  rect(x + 50, y - 20, 300, 60);
  fill(0);
  textAlign(LEFT);
  textSize(12);
  text(name, x + 60, y - 10);
  textSize(10);
  text(message, x + 60, y + 10);
}

void drawBackButton() {
  imageMode(CENTER);
  image(retourButton, 40, 40, 50, 50);
}

void drawMenu(int tableNumber) {
  fill(240);
  rect(480, 0, 240, height);
  fill(0);
  textSize(12);
  text("X", 490, 20);
  text("Messages de la Table " + tableNumber, 490, 40);
  for (int i = 0; i < messagesHistory[tableNumber - 1].size(); i++) {
    text(messagesHistory[tableNumber - 1].get(i), 490, 60 + i * 20);
  }
}

void drawTextInput() {
  fill(255);
  rect(480, height - 40, 240, 30);
  fill(0);
  text(currentMessage, 485, height - 20);
}

void mousePressed() {
  // Vérifier si le clic est sur le bouton de retour
  if (dist(mouseX, mouseY, 40, 40) < 25) {
    selectedTable = -1; // Désélectionne la table actuelle et ferme le menu
    isEnteringMessage = false; // Désactive la saisie de message
    currentMessage = ""; // Réinitialise le message en cours
  }
  // Vérifier si le clic est sur la croix pour fermer l'historique des messages
  else if (mouseX >= 480 && mouseX <= 500 && mouseY >= 10 && mouseY <= 30 && selectedTable != -1) {
    selectedTable = -1; // Désélectionne la table actuelle et ferme l'historique des messages
    isEnteringMessage = false;
    currentMessage = "";
  }
  else {
    for (int i = 0; i < 10; i++) {
      int x = 50;
      int y = 100 + 80 * i;
      if (mouseX >= x + 50 && mouseX <= x + 350 && mouseY >= y - 20 && mouseY <= y + 40) {
        selectedTable = i + 1;
        isEnteringMessage = true; // Active la saisie de message
        break;
      }
    }
  }
}


void keyPressed() {
  if (isEnteringMessage) {
    if (keyCode == BACKSPACE && currentMessage.length() > 0) {
      currentMessage = currentMessage.substring(0, currentMessage.length() - 1);
    } else if (keyCode == ENTER || keyCode == RETURN) {
      if (!currentMessage.trim().isEmpty()) {
        messagesHistory[selectedTable - 1].add(currentMessage);
        currentMessage = ""; // Réinitialise le message après l'envoi
      }
    } else if (key >= 32 && key <= 126) { // Ajoute le caractère saisi au message
      currentMessage += key;
    }
  }
}
