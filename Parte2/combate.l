
%{
    FILE *yyin;
    int num = 0;
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
Distancia [0-9]
JohnnyCage [J][o][h][n][n][y][ ][C][a][g][e]
Kano [K][a][n][o]
LiuKang [L][i][u][ ][K][a][n][g]
SubZero [S][u][b][-][Z][e][r][o]
SonyaBlade [S][o][n][y][a][ ][B][l][a][d][e]
Jade [J][a][d][e]
LiMei [L][i][ ][M][e][i]
Skarlet [S][k][a][r][l][e][t]
Personajes {JohnnyCage}|{Kano}|{LiuKang}|{SubZero}|{SonyaBlade}|{Jade}|{LiMei}|{Skarlet}
Jugada {Personajes}:({Movimientos})*({Bloqueo})*({MovimientosBasicos})*

%%

{Distancia} {printf("\nEsto es la distancia de los jugadores ");} 
{Jugada} {printf("\nEsto es una jugada");} 
. {printf("\nEsto no se que es");} 

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
    printf("FLEX finalizo la lectura del archivo %s \n", argv[1]);
    fclose(yyin);
    return 0;
}