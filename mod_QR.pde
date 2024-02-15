import java.util.*;
final PImage writeQR(String myCodeText) {
  int size = 125;
  try {
    Hashtable<EncodeHintType, ErrorCorrectionLevel> hintMap = new Hashtable<EncodeHintType, ErrorCorrectionLevel>();
    hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
    QRCodeWriter qrCodeWriter = new QRCodeWriter();
    BitMatrix byteMatrix = qrCodeWriter.encode(myCodeText, BarcodeFormat.QR_CODE, size, size, hintMap);
    int CrunchifyWidth = byteMatrix.getWidth();
    PImage image = createImage(CrunchifyWidth, CrunchifyWidth, RGB);
    image.loadPixels();
    for (int i = 0; i < image.pixels.length; i++) {
      image.pixels[i] = #FFFFFF;
    }
    image.updatePixels();

    for (int i = 0; i < CrunchifyWidth; i++) {
      for (int j = 0; j < CrunchifyWidth; j++) {
        if (byteMatrix.get(i, j)) {
          image.set(i, j, #000000);
        }
      }
    }
    return image;
  }
  catch (Exception e) {
    e.printStackTrace();
    return null;
  }
  //System.out.println("\n\nCodigo QR Creado correctamente.");
}
