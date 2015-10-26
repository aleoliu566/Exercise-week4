float x = TWO_PI/300;
float a; 
final int GAME_TIME=1;
final int GAME_OVER=2;
int gameState;
void setup(){
  size(480,480);
  gameState = GAME_TIME;
}
void draw(){
  switch(gameState){
    case GAME_TIME:
        background(255);
        ellipse(mouseX, mouseY, 25, 25);
        float mousex1 = mouseX+12;
        float mousex2 = mouseX-12;
        float mousey1 = mouseY+12;
        float mousey2 = mouseY-12;
        for(int x = 40 ; x<width-40 ; x=x+40){
          stroke(2);
          fill(0,255,255);
          rect(x,0, 40,200+sin(x/40-a)*20.0);
          rect(x,height,40,-200+sin(x/40-a)*20.0);
          if(mousex1 >= x && mousex2 <= x+40){
            if(mousey2 <= 200+sin(x/40-a)*20.0)
              gameState = GAME_OVER;
          }
          if(mousex1 >= x && mousex2 <= x+40){
            if(mousey1 >= 200+sin(x/40-a)*20.0+80)
              gameState = GAME_OVER;
          }
          //println(200+sin(x/40-a)*20.0);
          //println(-200+sin(x/40-a)*20.0);
        }
        a = a+x;
     break;
     case GAME_OVER:
        background(255);
        if (mouseX>=0 && mouseX<=70){
          if(mouseY>=230 && mouseY<=250){
             if(mousePressed == true){
                gameState=GAME_TIME;
             }
          }
        }
        fill(255);
        rect(0, 230, 70, 20);
        fill(0);
        text("start over",2,240);
     break;
  }

}
