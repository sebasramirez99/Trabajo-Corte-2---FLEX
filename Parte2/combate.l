
%{
    #include<stdio.h>
    #include<string.h>
    #include<stdlib.h>
    FILE *yyin;
    int VidaJugador1 = 100;
    int VidaJugador2 = 100;
    int pegarse = 0;
    int quien = 0;
%}

%option noyywrap
%option yylineno


MovimientosBasicos [ABYX]
Arriba [A][r][r][i][b][a]
Abajo [A][b][a][j][o]
Izquierda [I][z][q][u][i][e][r][d][a]
Derecha [D][e][r][e][c][h][a]
Movimientos ({Arriba}|{Abajo}|{Izquierda}|{Derecha})
Bloqueo [B][l][o][q][u][e][o]
Distancia [0-9]|([0-9]+)
JohnnyCage [J][o][h][n][n][y][C][a][g][e]
Kano [K][a][n][o]


%%


{Distancia} {
                if(atoi(yytext)<41){
                    pegarse = 1;
                }else{
                    pegarse = 0;
                }
            }
{JohnnyCage} {  quien = 2;}
{Kano} {quien = 1;}
{Movimientos} {
                if(pegarse==1){
                    if(quien == 2){
                        VidaJugador2 = VidaJugador2-10;
                        printf("-10 a kano por movimiento");
                    }else{
                        VidaJugador1 = VidaJugador1-10;
                        printf("-10 a JohnnyCage por movimiento");
                    }
                }
              }
{MovimientosBasicos} {
                        if(pegarse==1){
                            if(quien == 2){
                                VidaJugador2 = VidaJugador2-10;
                                 printf("-10 a kano por basico");
                            }else{
                                VidaJugador1 = VidaJugador1-10;
                                printf("-10 a JohnnyCage por basico");
                            }
                        }
                     }
%%

int main(int argc, char *argv[]){

    /*Abro el archivo en modo lectura y dejo apuntado el puntero yyvin que nos pide FLEX alli.*/
    if((yyin=fopen(argv[1], "rt")) == NULL){
        printf("\nNo se puede abrir el archivo: %s\n", argv[1]);
        return 1;
    }else{
        printf("\nEl archivo %s se abrio correctamente\n", argv[1]);
        yylex(); 
    }
    printf("\nLa vida de los jugadores es %d %d", VidaJugador1, VidaJugador2);
    printf("\nFLEX finalizo la lectura del archivo %s \n", argv[1]);
    
    return 0;
}


