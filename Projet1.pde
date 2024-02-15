ArrayList<String>[] messagesHistory = new ArrayList[10]; // Historique des messages pour 10 tables
PImage img;
PImage retourButton;
int selectedTable = -1;
String currentMessage = ""; // Message actuellement saisi
boolean isEnteringMessage = false; // Si l'utilisateur est en train de saisir un message

void setup() {
  size(720, 900);
  img = loadImage("user.png");
  retourButton = loadImage("back.png");
  for (int i = 0; i < messagesHistory.length; i++) {
    messagesHistory[i] = new ArrayList<String>();
  }
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
    drawMessage(50, 100 + 80 * i, "Table " + (i + 1), messagesHistory[i].isEmpty() ? "Pas de message" : messagesHistory[i].get(messagesHistory[i].size() - 1));
  }
}

void drawMessage(int x, int y, String name, String message) {
  fill(200);
  ellipse(x, y, 40, 40);
  imageMode(CENTER);
  image(img, x, y, 40, 40);
  fill(230);
  rect(x + 50, y - 20, 300, 60);
  fill(0);
  textAlign(LEFT);
  text(name, x + 60, y + 10);
  text(message, x + 60, y + 30);
}

void drawBackButton() {
  imageMode(CENTER);
  image(retourButton, 40, 40, 50, 50);
}

void drawMenu(int tableNumber) {
  fill(240);
  rect(480, 0, 240, height);
  fill(0);
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
  if (dist(mouseX, mouseY, 40, 40) < 25) {
    println("Bouton Retour cliqué");
    isEnteringMessage = false;
    currentMessage = "";
  }
  for (int i = 0; i < 10; i++) {
    int x = 50;
    int y = 100 + 80 * i;
    if (mouseX >= x + 50 && mouseX <= x + 350 && mouseY >= y - 20 && mouseY <= y + 40) {
      selectedTable = i + 1;
      isEnteringMessage = true; // Activer la saisie de message
      break;
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
        currentMessage = ""; // Réinitialiser le message après l'envoi
        isEnteringMessage = false; // Désactiver la saisie après l'envoi
      }
    } else if (key >= 32 && key <= 126) {
      currentMessage += key;
    }
  }
}
