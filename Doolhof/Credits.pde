class Credits {

  Screen screen;
  Button button;

  Credits(Screen screen) {
    this.screen = screen;
    addCreditToList();
  }

  void addCreditToList() {
    button = new Button(screen);
    button.fillButtonList("credit", "Main Menu", "mainMenu", (screen.getWidthScreen() * 3 / 2) - 100, 300, 200, 50, color(0, 0, 80), color(255, 255, 255), 20, 0, -5, "Arial", true, true);
  }

  void render() {
    makeText("Arial", 20, color(255, 255, 255), "Creators", 10, 40);
    makeText("Arial", 16, color(255, 255, 255), " - Putman Alisio", 10, 90);
    makeText("Arial", 16, color(255, 255, 255), " - Butseraen Jim", 10, 120);

    makeText("Arial", 20, color(255, 255, 255), "Music", 200, 40);
    makeText("Arial", 16, color(255, 255, 255), "The Black Parrot", 200, 90);
    makeText("Arial", 16, color(255, 255, 255), "Divergence", 200, 120);
    
    makeText("Arial", 20, color(255, 255, 255), "Character Sprites", 390, 40);
    makeText("Arial", 16, color(255, 255, 255), "By", 390, 90);
    makeText("Arial", 16, color(255, 255, 255), "ShadowLeggy v1.0", 390, 120);
    
    button.render("credit");
  }

  void makeText(String font, int size, color col, String tekst, int xTekst, int yTekst) {
    PFont f = createFont(font, size, false);
    textFont(f, size);
    fill(col);
    textAlign(LEFT);
    text(tekst, xTekst, yTekst);
  }
}

