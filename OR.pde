/* Red neuronal para reconocer la disyunción lógica */

Neurona Cerebro;
float p11,p10,p01,p00;
int Epoca;

void setup()
{
  size(500,500);
  background(200);
  fill(0);
  textSize(30);
  p11 = p10 = p01 = p00 = .5;
  Cerebro = new Neurona(2,.1);
  Epoca = 0;
}

void draw()
{
  float caso;
  background(200);
  float Respuesta;
  
  Epoca++;
  
  float x = random(0,1);
  float y = random(0,1);
  
  x =  x<=.5 ? 0 : 1;
  y =  y<=.5 ? 0 : 1;
  caso = 10*x+y;
  
  Respuesta = Cerebro.Clasificar(x,y);
  
  switch ( int(caso) ) {
    case 11:
      p11 = Respuesta;
      break;
    case 10:
      p10 = Respuesta;
      break;    
    case 01:
      p01 = Respuesta;
      break;    
    case 00:
      p00 = Respuesta;
      break;
  }

  stroke(50);
  fill(200);   rect(240, 70,50,50);
  fill(100);   rect(240, 70,50,50*p11);

  fill(200);   rect(240, 170,50,50);
  fill(100);   rect(240, 170,50,50*p10);

  fill(200);   rect(240, 270,50,50);
  fill(100);   rect(240, 270,50,50*p01);

  fill(200);   rect(240, 370,50,50);
  fill(100);   rect(240, 370,50,50*p00);

  Tabla();
  
  Cerebro.Entrenamiento(x, y, x==0  &&  y==0 ? 0 : 1 );
}

void Tabla()
{
  textSize(30);
  text("  x      y      xVy",50,50);
  line(40,60,350,60);
  text("  1      1",50,100);
  text("  1      0",50,200);
  text("  0      1",50,300);
  text("  0      0",50,400);
}

void mousePressed()
{
  print(Epoca+" ");
  for ( int i=0 ; i<Cerebro.Pesos.length ; i++ )
    print(Cerebro.Pesos[i]+" ");
  println(" ");
  redraw();
}

/* Fin de archivo */
