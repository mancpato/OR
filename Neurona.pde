

class Neurona {
    float[] Pesos;  
    float Alfa;    // Tasa de aprendizaje

    Neurona(int n, float Tasa) {
        Pesos = new float[n+1];
        for ( int i=0 ; i<n ; i++ )
            Pesos[i] = random(-1,1);
        Alfa = Tasa;
    }

    float Clasificar(float x, float y) {
        float Suma = 0;
        Suma += x*Pesos[0] + y*Pesos[1] + Pesos[2];
        return Activacion(Suma);
    }

    float Activacion(float Suma) {
        return 1/(1+exp(-Suma)); 
    }

  // Para cada punto (x,y), se tiene el resultado correcto
  // Los pesos se actualizan considerando el error en la clasificación
  void Entrenamiento(float x, float y, int Correcto) {
    float Eval = Clasificar(x,y);
    float Error = Correcto - Eval;
    Pesos[0] = Pesos[0] + Alfa*Error*x;
    Pesos[1] = Pesos[1] + Alfa*Error*y;  
    Pesos[2] = Pesos[2] + Alfa*Error;         
  }

}

/* Fin de archivo */
