import java.awt.image.BufferedImage;

CARTE_STATS carteStats;
CATEG_CARTE categCarte;
CATEG_STATS categStats;

public enum CARTE_STATS{
  INITIAL,
  CARTE,
  STATS,
  RESUMEE,
  VALIDER
}

public enum CATEG_CARTE {
  PLATJ, 
  ENTREES,
  PLATS,
  DESSERTS,
  BOISSONS
}
public enum CATEG_STATS {
  TOUT,
  PLATJ, 
  ENTREES,
  PLATS,
  DESSERTS,
  BOISSONS,
  RETOUR
}
  color bg=color(34, 38, 41);
  color fondBtn=color(134, 194, 50);
  color couleurTexte=color(255,255,255);
  color fondOnglet=color(107, 110, 112);
  color fontBtnGrayedOut=color(58, 79, 31);
   
  int tailleBtn=100;
  int tailleTab=250;
  int espaceLigne=70;
  List<String> selection = new ArrayList<>();
  
  PImage QRCode;

void setup() {
 size(780,1000);
 background(bg);;
 
 carteStats=CARTE_STATS.CARTE;
 categCarte=CATEG_CARTE.PLATJ;
 categStats=CATEG_STATS.TOUT;
 
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
  
  // Retour
  rect(0,10,80,30);
  fill(couleurTexte);
  textAlign(LEFT,CENTER);
  text("Retour", 10,10,60,20);
  
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
   int prixTotal=0;
   int prixItem=0;
  
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
   if (i!=0){
     texteResumeeQRCode+="\n\n";
   }
    texteResumeeQRCode+=selection.get(i).substring(0, selection.get(i).length() - 1)+" EUR";
    affichageTexteTabule(selection.get(i), -100,150+i*espaceLigne, width-20,couleurTexte);
    textePrix=selection.get(i).split("\t");
    prixItem=textePrix.substring(0, textePrix.size()-1);
 }
   
   QRCode=writeQR(texteResumeeQRCode);
   image(QRCode, width/2-10,height-130);
}

void draw(){

  switch (carteStats){
    case INITIAL:
    background(bg);
     break;
     
     case CARTE:
     
     switch(categCarte){
       case PLATJ:
        background(bg);
       ongletsCarte();
       affichageTexte("Plat du jour\t5.00€", 200,70,250, selection);
       
       break;
       
       case ENTREES:
        background(bg);
        ongletsCarte();
       
       affichageTexte("Melon\t2.50€", 200,70, 250, selection);
       affichageTexte("Jambon blanc\t3.00€", 200,70+70, 250, selection);
       affichageTexte("Jambon du pays\t3.00€", 200,70+70*2,250, selection);
       affichageTexte("Salade\t1.00€", 200,70+70*3,250, selection);
       affichageTexte("Tomates\t2.00€", 200,70+70*4,250, selection);
       
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
        
       affichageTexte("Plat1\t10.00€", 200,70,250, selection);
       affichageTexte("Plat2\t12.00€", 200,70+70,250, selection);
       affichageTexte("Plat3\t16.00€", 200,70+70*2,250, selection);
       affichageTexte("Plat4\t15.00€", 200,70+70*3, 250, selection);
       affichageTexte("Plat5\t13.25€", 200,70+70*4, 250,selection);
        
       
       break;
       
       case DESSERTS:
        background(bg);
        ongletsCarte();
        
       affichageTexte("Dessert1\t10€", 200,70,250, selection);
       affichageTexte("Dessert2\t8.00€", 200,70+70,250, selection);
       affichageTexte("Dessert3\t5.00€", 200,70+70*2, 250, selection);
       affichageTexte("Dessert4\t7.00€", 200,70+70*3,250, selection);
       affichageTexte("Dessert5\t11€", 200,70+70*4,250, selection);
       
       break;
       
       case BOISSONS:
       background(bg);
       ongletsCarte();
       
       affichageTexte("Boisson1\t2.00€", 200,70, 250, selection);
       affichageTexte("Boisson2\t5.00€", 200,70+70, 250, selection);
       affichageTexte("Boisson3\t1.00€", 200,70+70*2, 250, selection);
       affichageTexte("Boisson4\t0.50€", 200,70+70*3, 250, selection);
       affichageTexte("Boisson5\t0.75€", 200,70+70*4, 250, selection);
       
       break;
       
   }
   break;
   
   case STATS:
   switch(categStats){
     case RETOUR:
        
       carteStats=CARTE_STATS.CARTE;
       break;
     
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
   carteStats=CARTE_STATS.INITIAL;
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
     
     case INITIAL:
     break;
     
     case CARTE:
     // Retour
     if (mouseY>=10 && mouseX<=60 && mouseY<=30 ){
      carteStats=CARTE_STATS.INITIAL;
      System.out.println("test retour carte");
     }
     
     // PlatJ
     else if (mouseY>=60 && mouseX<=140 && mouseY<=(tailleBtn+60)){
       categCarte=CATEG_CARTE.PLATJ;
           System.out.println("test platJ carte");
     }
     
     // Entrees
     else if (mouseY>=80+tailleBtn && mouseX<=140 && mouseY<=(2*tailleBtn+80)){
       categCarte=CATEG_CARTE.ENTREES;
           System.out.println("test entrees carte");
        
     }
     
      //Plats
      else if (mouseY>=100+2*tailleBtn && mouseX<=140 && mouseY<=(3*tailleBtn+100)){
        categCarte=CATEG_CARTE.PLATS;
            System.out.println("test Plat carte");
     }
     
      //Desserts
      else if (mouseY>=120+3*tailleBtn && mouseX<=140 && mouseY<=(4*tailleBtn+120)){
        categCarte=CATEG_CARTE.DESSERTS;
            System.out.println("test Dessert carte");
     }
     
       else if (mouseY>=140+4*tailleBtn && mouseX<=140 && mouseY<=(5*tailleBtn+140)){
         categCarte=CATEG_CARTE.BOISSONS;
             System.out.println("test boissons carte");
     }
     
      else if (mouseY>=height-100 && mouseX<=140 && mouseY<=height-24 && selection.size()!=0){
         carteStats=CARTE_STATS.RESUMEE;
             System.out.println("test valider carte");
     }
     
      else if (mouseY>=height-120-tailleBtn && mouseX<=140 && mouseY<=height-120-tailleBtn+126){
         carteStats=CARTE_STATS.STATS;
             System.out.println("test stat");
   }
   break;
   
    case STATS:
     // Retour
     if (mouseY>=10 && mouseX<=60 && mouseY<=30 ){
      categStats=CATEG_STATS.RETOUR;
      System.out.println("test retour stat");
     }
     
     // Tout
     else if (mouseY>=60 && mouseX<=140 && mouseY<=(tailleBtn+60)){
       categStats=CATEG_STATS.TOUT;
           System.out.println("test tout Stats");
     }
     
     // PlatsJ
     else if (mouseY>=80+tailleBtn && mouseX<=140 && mouseY<=(2*tailleBtn+80)){
       categStats=CATEG_STATS.PLATJ;
           System.out.println("test PlatJ stat");
     }
     
      //Entrees
      else if (mouseY>=100+2*tailleBtn && mouseX<=140 && mouseY<=(3*tailleBtn+100)){
        categStats=CATEG_STATS.ENTREES;
            System.out.println("test Entrees stat");
     }
     
      //Plats
      else if (mouseY>=120+3*tailleBtn && mouseX<=140 && mouseY<=(4*tailleBtn+120)){
        categStats=CATEG_STATS.PLATS;
            System.out.println("test Plats stat");
     }
     
       else if (mouseY>=140+4*tailleBtn && mouseX<=140 && mouseY<=(5*tailleBtn+140)){
         categStats=CATEG_STATS.DESSERTS;
             System.out.println("test Desserts stat");
     }
     
     else if (mouseY>=160+5*tailleBtn && mouseX<=140 && mouseY<=(6*tailleBtn+140)){
         categStats=CATEG_STATS.BOISSONS;
             System.out.println("test Boissons stat");
     }
   break;
   
    case RESUMEE:
     // Retour
     if (mouseY>=10 && mouseX<=60 && mouseY<=30 ){
      carteStats=CARTE_STATS.CARTE;
      System.out.println("test retour resumee");
     }
     
      else if (mouseY>=height-100 && mouseX<=140 && mouseY<=height-24){
         carteStats=CARTE_STATS.VALIDER;
             System.out.println("test valider resumee");
              carteStats=CARTE_STATS.VALIDER;
              
     }
     
     
   break;
   
    case VALIDER:
     break;
   }
   System.out.println("X: "+mouseX);
   System.out.println("Y: "+mouseY);
   // Selection et deselection d'item
   if (categCarte==CATEG_CARTE.PLATJ && mouseY>=espaceLigne-20 && mouseX<=735 && mouseY<=espaceLigne+20 && mouseX>=200-20){
     selectionItem("Plat du jour\t5.00€");
     System.out.println("PlatJ");
      }
   
   else if (categCarte==CATEG_CARTE.ENTREES && mouseY>=-20 && mouseX<=735 && mouseY<=espaceLigne+20 && mouseX>=200-20){
        selectionItem("Melon\t2.50€");
        System.out.println("Melon");
      }
      
     else if (categCarte==CATEG_CARTE.ENTREES &&  mouseY>=2*espaceLigne-20 && mouseX<=735 && mouseY<=2*espaceLigne+20 && mouseX>=200-20){
       selectionItem("Jambon blanc\t3.00€");
       System.out.println("JB");
        
      }
      
      else if (categCarte==CATEG_CARTE.ENTREES &&  mouseY>=3*espaceLigne-20 && mouseX<=735 && mouseY<=3*espaceLigne+20 && mouseX>=200-20){
       selectionItem("Jambon du pays\t3.00€");
       System.out.println("JP");
      }
       
     else if (categCarte==CATEG_CARTE.ENTREES &&  mouseY>=4*espaceLigne-20 && mouseX<=735 && mouseY<=4*espaceLigne+20 && mouseX>=200-20){
       selectionItem("Salade\t1.00€");
       System.out.println("Salade");
        
      }
      
      else if (categCarte==CATEG_CARTE.ENTREES &&  mouseY>=5*espaceLigne-20 && mouseX<=735 && mouseY<=5*espaceLigne+20 && mouseX>=200-20){
       selectionItem("Tomates\t2.00€");
       System.out.println("Tomates");
        
      }
      
      else if (categCarte==CATEG_CARTE.PLATS && mouseY>=espaceLigne-20 && mouseX<=735 && mouseY<=espaceLigne+20 && mouseX>=200-20){
       selectionItem("Plat1\t10.00€");
       System.out.println("Plat1");
        
      }
      
     else if (categCarte==CATEG_CARTE.PLATS &&  mouseY>=2*espaceLigne-20 && mouseX<=735 && mouseY<=2*espaceLigne+20 && mouseX>=200-20){
       selectionItem("Plat2\t12.00€");
       System.out.println("Plat2");
        
      }
      
      else if (categCarte==CATEG_CARTE.PLATS &&  mouseY>=3*espaceLigne-20 && mouseX<=735 && mouseY<=3*espaceLigne+20 && mouseX>=200-20){
       selectionItem("Plat3\t16.00€");
       System.out.println("Plat3");
      }
       
     else if (categCarte==CATEG_CARTE.PLATS &&  mouseY>=4*espaceLigne-20 && mouseX<=735 && mouseY<=4*espaceLigne+20 && mouseX>=200-20){
       selectionItem("Plat4\t15.00€");
       System.out.println("Plat4");
        
      }
      
      else if (categCarte==CATEG_CARTE.PLATS &&  mouseY>=5*espaceLigne-20 && mouseX<=735 && mouseY<=5*espaceLigne+20 && mouseX>=200-20){
      selectionItem("Plat5\t13.25€");
      System.out.println("Plat5");
        
      }
      
      else if (categCarte==CATEG_CARTE.DESSERTS && mouseY>=espaceLigne-20 && mouseX<=735 && mouseY<=espaceLigne+20 && mouseX>=200-20){
       selectionItem("Dessert1\t10€");
       System.out.println("Dessert1");
        
      }
      
     else if (categCarte==CATEG_CARTE.DESSERTS &&  mouseY>=2*espaceLigne-20 && mouseX<=735 && mouseY<=2*espaceLigne+20 && mouseX>=200-20){
       selectionItem("Dessert2\t8.00€");
       System.out.println("Dessert2");
        
      }
      
      else if (categCarte==CATEG_CARTE.DESSERTS &&  mouseY>=3*espaceLigne-20 && mouseX<=735 && mouseY<=3*espaceLigne+20 && mouseX>=200-20){
       selectionItem("Dessert3\t5.00€");
       System.out.println("Dessert3");
      }
       
     else if (categCarte==CATEG_CARTE.DESSERTS &&  mouseY>=4*espaceLigne-20 && mouseX<=735 && mouseY<=4*espaceLigne+20 && mouseX>=200-20){
       selectionItem("Dessert4\t7.00€");
       System.out.println("Dessert4");
        
      }
      
      else if (categCarte==CATEG_CARTE.DESSERTS &&  mouseY>=5*espaceLigne-20 && mouseX<=735 && mouseY<=5*espaceLigne+20 && mouseX>=200-20){
      selectionItem("Dessert5\t11€");
      System.out.println("Dessert5");
        
      }
      
      else if (categCarte==CATEG_CARTE.BOISSONS && mouseY>=espaceLigne-20 && mouseX<=735 && mouseY<=espaceLigne+20 && mouseX>=200-20){
       selectionItem("Boisson1\t2.00€");
       System.out.println("Boisson1"); 
      }
      
     else if (categCarte==CATEG_CARTE.BOISSONS &&  mouseY>=2*espaceLigne-20 && mouseX<=735 && mouseY<=2*espaceLigne+20 && mouseX>=200-20){
       selectionItem("Boisson2\t5.00€");
       System.out.println("Boisson2");
        
      }
      
      else if (categCarte==CATEG_CARTE.BOISSONS &&  mouseY>=3*espaceLigne-20 && mouseX<=735 && mouseY<=3*espaceLigne+20 && mouseX>=200-20){
       selectionItem("Boisson3\t1.00€");
       System.out.println("Boisson3");
      }
       
     else if (categCarte==CATEG_CARTE.BOISSONS &&  mouseY>=4*espaceLigne-20 && mouseX<=735 && mouseY<=4*espaceLigne+20 && mouseX>=200-20){
       selectionItem("Boisson4\t0.50€");
       System.out.println("Boisson4");
        
      }
      
      else if (categCarte==CATEG_CARTE.BOISSONS &&  mouseY>=5*espaceLigne-20 && mouseX<=735 && mouseY<=5*espaceLigne+20 && mouseX>=200-20){
      selectionItem("Boisson5\t0.75€");
      System.out.println("Boisson5");
        
      }
      
}
