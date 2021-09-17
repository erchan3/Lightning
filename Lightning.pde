import java.util.ArrayList;


class Lightning {
  int x, y;
  float thickness;
  
  public Lightning() {
    x = (int)(Math.random() * width - 100) + 50;
    y = 0;
    thickness = 12;
  }
  
  public void drawNext() {
    int dx = (int)(Math.random() * 73) - 36;
    int dy = (int)(Math.random() * 60) + 1;
    strokeWeight(thickness);
    line(x, y, x + dx, y + dy);
    x += dx;
    y += dy;
    thickness -= dy*9.0/height;
  }
}

ArrayList<Lightning> strikes = new ArrayList<Lightning>();

void setup() {
  size(400, 400);
}

void draw() {
  fill(0, 20);
  noStroke();
  rect(0, 0, width, height);

  stroke(200, 200, 255);
  for (int i = strikes.size() - 1; i >= 0; i--) {
    strikes.get(i).drawNext();
    if (strikes.get(i).y > height)
      strikes.remove(i);
  }
  
}

void mouseClicked() {
  strikes.add(new Lightning());
}
