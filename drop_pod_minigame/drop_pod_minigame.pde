Droppod player, enemy;
ArrayList<Pickup> playerPickups = new ArrayList<Pickup>(); 

final float dropSize = 20, dropSpeed = 10;
int playerScore = 0;

final float pickupSpeed = -0.1;


void setup() {
  size(600, 800);
  player = new Droppod(width/4, height/4, width/2-dropSize, dropSize); //<>//
  enemy = new Droppod(width/2 + width/4, height/4, width-dropSize, width/2+dropSize);
  
  for (int i = height/3; i <= 10000; i += 50) {
    playerPickups.add(new Pickup(random(width/2) ,i));
  }
}


void keyTyped() {
  if (keyCode == 'A' || keyCode == 'a') {
    player.addForce(-dropSpeed, 0);
  }
  else if (keyCode == 'D' || keyCode == 'd') {
    player.addForce(dropSpeed, 0);
  }
}

void keyPressed() {
  if (keyCode == 'A' || keyCode == 'a') {
    player.addForce(-dropSpeed, 0);
  }
  else if (keyCode == 'D' || keyCode == 'd') {
    player.addForce(dropSpeed, 0);
  }
}


void draw() {
  background(150);
  line(width/2, 0, width/2, height);
  
  player.update();
  
  fill(255);
  player.show();
  enemy.show();
  
  fill(#F9FF58);
  for (int i = 0; i < playerPickups.size(); i++) {
    Pickup p = playerPickups.get(i);
    p.acc.set(0, pickupSpeed);
    if (p.scored(player)) {
      playerScore++;
      playerPickups.remove(i);
      println(playerScore);
    }
    p.update();
    p.show();
  }
}