import processing.core.PApplet; 
import processing.core.PImage; 

public interface enumerations {
    public enum CARTE_STATS {
      CARTE, STATS, RESUMEE, VALIDER;
    }
    
    public enum CATEG_CARTE {
      PLATJ, ENTREES, PLATS, DESSERTS,BOISSONS;
    }
    
    public enum CATEG_STATS {
      TOUT, PLATJ, ENTREES, PLATS, DESSERTS, BOISSONS;
    }
}

public class LaCarte extends PApplet  {


enumerations.CARTE_STATS carteStats;
enumerations.CATEG_CARTE categCarte;
enumerations.CATEG_STATS categStats;


  color bg=color(34, 38, 41);
  color fondBtn=color(134, 194, 50);
  color couleurTexte=color(255,255,255);
  color fondOnglet=color(107, 110, 112);
  color fontBtnGrayedOut=color(58, 79, 31);
   
  int tailleBtn=100;
  int tailleTab=200;
  int espaceLigne=70;
  List<String> selection = new ArrayList<>();
  
  PImage QRCode;
  
  String[] listePlatJ={"Plat du jour\t5,00€"};
  String[] listeEntrees={"Melon\t2,50€", "Jambon blanc\t3,00€", "Jambon du pays\t3,00€", "Salade\t1,00€", "Tomates\t2,00€"};
  String[] listePlats={"Plat1\t10,00€", "Plat2\t12,00€", "Plat3\t16,00€", "Plat4\t15,00€", "Plat5\t13,25€"};
  String[] listeDesserts={"Dessert1\t10,00€", "Dessert2\t8,00€", "Dessert3\t5,00€", "Dessert4\t7,00€", "Dessert5\t11,00€"};
  String[] listeBoissons={"Boisson1\t2,00€", "Boisson2\t5,00€", "Boisson3\t1,00€", "Boisson4\t0,50€", "Boisson5\t0,75€"};


void settings() {
 size(720,900);
}
void setup(){
 background(bg);
 
 carteStats=enumerations.CARTE_STATS.CARTE;
 categCarte=enumerations.CATEG_CARTE.PLATJ;
 categStats=enumerations.CATEG_STATS.TOUT;
 
 textSize(20);
 tailleBtn=(height-20)/10;

}

void affichageTexteTabule(String texte, int xPosMin, int yPos, int xPosMax, color couleur){
  fill(couleur);
  String [] texteScinde=texte.split("\t");
  textAlign(CENTER);
  text(texteScinde[0], xPosMin, yPos, xPosMax, yPos+50);
  text(texteScinde[1], xPosMin+tailleTab, yPos, xPosMax+tailleTab, yPos+50);

}

void affichageTexte(String texte, int xPosMin, int yPos, int xPosMax, List<String> selection){
  color couleur;
  if (selection.contains(texte)){
    couleur=fondBtn;
  }
  else {
    couleur=couleurTexte;
}
    affichageTexteTabule(texte, xPosMin, yPos, xPosMax, couleur);
}

void ongletsCarte(){
  
  fill(fondOnglet);
  rect(0,40,140, height-100);
  
  fill(fondBtn);
  
  //PlatJ
  rect(0,60,140, tailleBtn);
  fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Plat du Jour", 10,60,140,tailleBtn);
  
  fill(fondBtn);
  // Entrees
  rect(0,80+tailleBtn,140, tailleBtn);
  fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Entrees", 10,80+tailleBtn,140, tailleBtn);
  
  fill(fondBtn);
  
  //Plats
  rect(0,100+2*tailleBtn,140, tailleBtn);
  fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Plats", 10,100+2*tailleBtn,140, tailleBtn);
  
   fill(fondBtn);
  
  // Desserts
  rect(0,120+3*tailleBtn,140, tailleBtn);
  fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Dessert", 10,120+3*tailleBtn,140, tailleBtn);
  
  fill(fondBtn);
  
  // Boissons
  rect(0,140+4*tailleBtn,140, tailleBtn);
   fill(fondBtn);
   fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Boissons", 10,140+4*tailleBtn,140, tailleBtn);
  
  if (selection.size()!=0){
  fill(fondBtn);
  }
  else {
  fill(fontBtnGrayedOut);
  }
  
   // Valider
  rect(0,height-100,140, tailleBtn);
  fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Valider", 10,height-100,140, tailleBtn);
  
  fill(fondBtn);
  
  // Stats
  rect(0,height-120-tailleBtn,140, tailleBtn);
   fill(fondBtn);
   fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Stats", 10,height-120-tailleBtn,140, tailleBtn);
  
  fill(fondBtn);
  
}


void ongletsStat(){
  
  fill(fondOnglet);
  rect(0,40,140, height-100);
  fill(fondBtn);
  
  // Retour
  rect(0,10,80,30);
  fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Retour", 10,10,60,20);
  
  fill(fondBtn);
  
  //Tout
  rect(0,60,140, tailleBtn);
  fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Tout", 10,60,140,tailleBtn);
  
  fill(fondBtn);
  // PlatsJ
  rect(0,80+tailleBtn,140, tailleBtn);
  fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Plats du jour", 10,80+tailleBtn,140, tailleBtn);
  
  fill(fondBtn);
  
  //Entrees
  rect(0,100+2*tailleBtn,140, tailleBtn);
  fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Entrees", 10,100+2*tailleBtn,140, tailleBtn);
  
   fill(fondBtn);
  
  // Plats
  rect(0,120+3*tailleBtn,140, tailleBtn);
  fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Plats", 10,120+3*tailleBtn,140, tailleBtn);
  
  fill(fondBtn);
  
  // Desserts
  rect(0,140+4*tailleBtn,140, tailleBtn);
   fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Desserts", 10,140+4*tailleBtn,140, tailleBtn);
  
  fill(fondBtn);
    
   // Boissons
  rect(0,160+5*tailleBtn,140, tailleBtn);
  fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Boissons", 10,140+5*tailleBtn,140, tailleBtn);
  
  
}

void resumee (List<String> selection){
   String texteResumeeQRCode="";
   String textePrix="";
   float prixTotal=0;
   float prixItem=0;
  
  fill(fondOnglet);
  rect(0,40,140, height-100);
  fill(fondBtn);
  
  // Retour
  rect(0,10,80,30);
  fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Retour", 10,10,60,20);
  
  fill(fondBtn);
  
   // Valider
  rect(0,height-100,140, tailleBtn);
  fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Valider", 10,height-100,140, tailleBtn);
  
  fill(fondBtn);
  
  
  fill(couleurTexte);
 textSize(50);
 textAlign(CENTER);
 text("Resumee", 20, 50, width-20, 100);
 textAlign(LEFT);
 text("Total", 200, height-250, width-20, 100);
 
 textSize(20);
 
 for (int i=0; i<selection.size();i++){
     
    texteResumeeQRCode+=selection.get(i).substring(0, selection.get(i).length() - 1)+" EUR";
    texteResumeeQRCode+="\n\n";
    
    affichageTexteTabule(selection.get(i), -100,150+i*espaceLigne, width-20,couleurTexte);
    
    // Extraction de ligne entiere (nom+prix+€)
    textePrix=selection.get(i);
    
    // Extraction de prix+€
    textePrix=(textePrix.split("\t")[1]);
    
    // Extraction de prix
    textePrix=textePrix.substring(0, textePrix.length()-1);
    
    // Remplacement de la , par un .
    prixItem=Float.valueOf(textePrix.replace(",", ".").toString());
    prixTotal+=prixItem;
 }
 text(String.format("%.02f",prixTotal)+"€", width/2-10+tailleTab,height-225);
 
 texteResumeeQRCode+="Total:\t"+String.format("%.02f",prixTotal)+" EUR";
 QRCode=writeQR(texteResumeeQRCode);
 image(QRCode, width/2-10,height-130);
}

void draw(){
  
  switch (carteStats){
    
     case CARTE:
     
     switch(categCarte){
       case PLATJ:
        background(bg);
       ongletsCarte();
       for (int i=0; i<listePlatJ.length;i++){
       affichageTexte(listePlatJ[i], 200,(i+1)*espaceLigne,250, selection);
       }
       
       break;
       
       case ENTREES:
        background(bg);
        ongletsCarte();
       
      for (int i=0; i<listeEntrees.length;i++){
        affichageTexte(listeEntrees[i], 200,(i+1)*espaceLigne,250, selection);
       }
       
       /*
       affichageTexte("Entree6", 200,70+70*5, selection);
       affichageTexte("Entree7", 200,70+70*6, selection);
       affichageTexte("Entree8", 200,70+70*7, selection);
       affichageTexte("Entree9", 200,70+70*8, selection);
       affichageTexte("Entree10", 200,70+70*9, selection);
       */
       
       
       break;
       
       case PLATS:
        background(bg);
        ongletsCarte();
        
       for (int i=0; i<listePlats.length;i++){
         affichageTexte(listePlats[i], 200,(i+1)*espaceLigne,250, selection);
       }
        
       
       break;
       
       case DESSERTS:
        background(bg);
        ongletsCarte();
        
       for (int i=0; i<listeDesserts.length;i++){
         affichageTexte(listeDesserts[i], 200,(i+1)*espaceLigne,250, selection);
       }
       
       break;
       
       case BOISSONS:
       background(bg);
       ongletsCarte();
       
       for (int i=0; i<listeBoissons.length;i++){
         affichageTexte(listeBoissons[i], 200,(i+1)*espaceLigne,250, selection);
       }
       
       break;
       
   }
   break;
   
   case STATS:
   switch(categStats){
     
     case TOUT:
        background(bg);
       ongletsStat();
       
       text("STAT TOUT", 200,70);
       break;
     
       case PLATJ:
        background(bg);
       ongletsStat();
       
       text("STAT PlatJ", 200,70);
       break;
       
       case ENTREES:
        background(bg);
        ongletsStat();
        
       fill(couleurTexte);
       text("STAT1", 200,70);
       text("STATS", 200,70+50);
       
       
       break;
       
       case PLATS:
        background(bg);
        ongletsStat();
        
        text("STAT Plats", 200,70);
        
       
       break;
       
       case DESSERTS:
        background(bg);
        ongletsStat();
        
        text("STAT dessert", 200,70);
       
       break;
       
       case BOISSONS:
       background(bg);
       ongletsStat();
       
       text("STAT boissons", 200,70);
       break;
       
   }
   break;
   
   case RESUMEE:
   background(bg);
   resumee(selection);
   break;
   
   case VALIDER:
   
      System.out.println("FIN");
   break;
  }
 
}
void selectionItem(String texteItem){
  int indexElement=selection.indexOf(texteItem);
   if (indexElement!=-1){
       selection.remove(indexElement);
     }
     else{
       selection.add(texteItem);
     }
}

 void mouseClicked() {
   
   switch(carteStats){
     
     case CARTE:
     
     // PlatJ
      if (mouseY>=60 && mouseX<=140 && mouseY<=(tailleBtn+60)){
       categCarte=enumerations.CATEG_CARTE.PLATJ;
           System.out.println("test platJ carte");
     }
     
     // Entrees
     else if (mouseY>=80+tailleBtn && mouseX<=140 && mouseY<=(2*tailleBtn+80)){
       categCarte=enumerations.CATEG_CARTE.ENTREES;
           System.out.println("test entrees carte");
        
     }
     
      //Plats
      else if (mouseY>=100+2*tailleBtn && mouseX<=140 && mouseY<=(3*tailleBtn+100)){
        categCarte=enumerations.CATEG_CARTE.PLATS;
            System.out.println("test Plat carte");
     }
     
      //Desserts
      else if (mouseY>=120+3*tailleBtn && mouseX<=140 && mouseY<=(4*tailleBtn+120)){
        categCarte=enumerations.CATEG_CARTE.DESSERTS;
            System.out.println("test Dessert carte");
     }
     
       else if (mouseY>=140+4*tailleBtn && mouseX<=140 && mouseY<=(5*tailleBtn+140)){
         categCarte=enumerations.CATEG_CARTE.BOISSONS;
             System.out.println("test boissons carte");
     }
     
      else if (mouseY>=height-100 && mouseX<=140 && mouseY<=height-24 && selection.size()!=0){
         carteStats=enumerations.CARTE_STATS.RESUMEE;
             System.out.println("test valider carte");
     }
     
      else if (mouseY>=height-120-tailleBtn && mouseX<=140 && mouseY<=height-120-tailleBtn+126){
         carteStats=enumerations.CARTE_STATS.STATS;
             System.out.println("test stat");
   }
   break;
   
    case STATS:
     // Retour
     if (mouseY>=10 && mouseX<=60 && mouseY<=30 ){
      carteStats=enumerations.CARTE_STATS.CARTE;
      System.out.println("test retour stat");
     }
     
     // Tout
     else if (mouseY>=60 && mouseX<=140 && mouseY<=(tailleBtn+60)){
       categStats=enumerations.CATEG_STATS.TOUT;
           System.out.println("test tout Stats");
     }
     
     // PlatsJ
     else if (mouseY>=80+tailleBtn && mouseX<=140 && mouseY<=(2*tailleBtn+80)){
       categStats=enumerations.CATEG_STATS.PLATJ;
           System.out.println("test PlatJ stat");
     }
     
      //Entrees
      else if (mouseY>=100+2*tailleBtn && mouseX<=140 && mouseY<=(3*tailleBtn+100)){
        categStats=enumerations.CATEG_STATS.ENTREES;
            System.out.println("test Entrees stat");
     }
     
      //Plats
      else if (mouseY>=120+3*tailleBtn && mouseX<=140 && mouseY<=(4*tailleBtn+120)){
        categStats=enumerations.CATEG_STATS.PLATS;
            System.out.println("test Plats stat");
     }
     
       else if (mouseY>=140+4*tailleBtn && mouseX<=140 && mouseY<=(5*tailleBtn+140)){
         categStats=enumerations.CATEG_STATS.DESSERTS;
             System.out.println("test Desserts stat");
     }
     
     else if (mouseY>=160+5*tailleBtn && mouseX<=140 && mouseY<=(6*tailleBtn+140)){
         categStats=enumerations.CATEG_STATS.BOISSONS;
             System.out.println("test Boissons stat");
     }
   break;
   
    case RESUMEE:
     // Retour
     if (mouseY>=10 && mouseX<=60 && mouseY<=30 ){
      carteStats=enumerations.CARTE_STATS.CARTE;
      System.out.println("test retour resumee");
     }
     
      else if (mouseY>=height-100 && mouseX<=140 && mouseY<=height-24){
         carteStats=enumerations.CARTE_STATS.VALIDER;
             System.out.println("test valider resumee");
              carteStats=enumerations.CARTE_STATS.VALIDER;
              
     }
     
     
   break;
   
    case VALIDER:
     break;
   }
   
   
   // Selection et deselection d'item
   int itemTop; // Début de l'élément avec tolérance
   int itemBottom; // Fin de l'élément avec tolérance
   int tolerance=20;
   int index=-1;
   
   if (categCarte==enumerations.CATEG_CARTE.PLATJ && mouseX<=735 && mouseX>=200-tolerance && carteStats==enumerations.CARTE_STATS.CARTE){
     
     for (int i = 0; i < listePlatJ.length; i++) {
      itemTop = i * espaceLigne - tolerance; // Début de l'élément avec tolérance
      itemBottom = itemTop + espaceLigne + tolerance*2; // Fin de l'élément avec tolérance

      if (mouseY >= itemTop && mouseY <= itemBottom) {
        index = i;
        break; // Arrête la boucle une fois l'index trouvé
      }
    }
    selectionItem(listePlatJ[index]);
    }
  
   
   else if (categCarte==enumerations.CATEG_CARTE.ENTREES && mouseX<=735 && mouseX>=200-tolerance && carteStats==enumerations.CARTE_STATS.CARTE){
     
     for (int i = 0; i < listeEntrees.length; i++) {
      itemTop = i * espaceLigne - tolerance; // Début de l'élément avec tolérance
      itemBottom = itemTop + espaceLigne + tolerance*2; // Fin de l'élément avec tolérance

      if (mouseY >= itemTop && mouseY <= itemBottom) {
        index = i;
        break; // Arrête la boucle une fois l'index trouvé
      }
    }
    selectionItem(listeEntrees[index]);
    }
      
   else if (categCarte==enumerations.CATEG_CARTE.PLATS && mouseX<=735 && mouseX>=200-tolerance && carteStats==enumerations.CARTE_STATS.CARTE){
     
     for (int i = 0; i < listePlats.length; i++) {
      itemTop = i * espaceLigne - tolerance; // Début de l'élément avec tolérance
      itemBottom = itemTop + espaceLigne + tolerance*2; // Fin de l'élément avec tolérance

      if (mouseY >= itemTop && mouseY <= itemBottom) {
        index = i;
        break; // Arrête la boucle une fois l'index trouvé
      }
    }
    selectionItem(listePlats[index]);
    }
      
   else if (categCarte==enumerations.CATEG_CARTE.DESSERTS && mouseX<=735 && mouseX>=200-tolerance && carteStats==enumerations.CARTE_STATS.CARTE){
     
     for (int i = 0; i < listeDesserts.length; i++) {
      itemTop = i * espaceLigne - tolerance; // Début de l'élément avec tolérance
      itemBottom = itemTop + espaceLigne + tolerance*2; // Fin de l'élément avec tolérance

      if (mouseY >= itemTop && mouseY <= itemBottom) {
        index = i;
        break; // Arrête la boucle une fois l'index trouvé
      }
    }
    selectionItem(listeDesserts[index]);
    }
      
    else if(categCarte==enumerations.CATEG_CARTE.BOISSONS && mouseX<=735 && mouseX>=200-tolerance && carteStats==enumerations.CARTE_STATS.CARTE){
     
     for (int i = 0; i < listeBoissons.length; i++) {
      itemTop = i * espaceLigne - tolerance; // Début de l'élément avec tolérance
      itemBottom = itemTop + espaceLigne + tolerance*2; // Fin de l'élément avec tolérance

      if (mouseY >= itemTop && mouseY <= itemBottom) {
        index = i;
        break; // Arrête la boucle une fois l'index trouvé
      }
    }
    selectionItem(listeBoissons[index]);
    }
      
}
}
