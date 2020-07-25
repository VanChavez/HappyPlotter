#line 1 "C:/Users/Carlos/Documents/MILAB Proyects/ProyectoPloter/proyectoPlotter.c"
int x, y, i, j, k;



char A1, BB1, C1, D1;
const char circulo[10][10] = {{0,0,0,1,1,1,0,0,0,0},{0,0,1,0,0,0,1,0,0,0},{0,1,0,0,0,0,0,1,0,0},{1,0,0,0,0,0,0,0,1,0},{1,0,0,0,0,0,0,0,1,0},{1,0,0,0,0,0,0,0,1,0},{0,1,0,0,0,0,0,1,0,0},{0,0,1,0,0,0,1,0,0,0},{0,0,0,1,1,1,0,0,0,0},{0,0,0,0,0,0,0,0,0,0}};
const char rectangulo[10][10] = {{0,0,1,1,1,1,1,1,0,0},{0,0,1,0,0,0,0,1,0,0},{0,0,1,0,0,0,0,1,0,0},{0,0,1,0,0,0,0,1,0,0},{0,0,1,0,0,0,0,1,0,0},{0,0,1,0,0,0,0,1,0,0},{0,0,1,0,0,0,0,1,0,0},{0,0,1,0,0,0,1,1,0,0},{0,0,1,0,0,0,0,1,0,0},{0,0,1,1,1,1,1,1,0,0}};
const char cuadrado[10][10] = {{1,1,1,1,1,1,1,1,1,1},{1,0,0,0,0,0,0,0,0,1},{1,0,0,0,0,0,0,0,0,1},{1,0,0,0,0,0,0,0,0,1},{1,0,0,0,0,0,0,0,0,1},{1,0,0,0,0,0,0,0,0,1},{1,0,0,0,0,0,0,0,0,1},{1,0,0,0,0,0,0,0,0,1},{1,0,0,0,0,0,0,0,0,1},{1,1,1,1,1,1,1,1,1,1}};
const char triangulo[10][10] = {{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0},{0,0,0,0,1,0,0,0,0,0},{0,0,0,1,0,1,0,0,0,0},{0,0,1,0,0,0,1,0,0,0},{0,1,0,0,0,0,0,1,0,0},{1,1,1,1,1,1,1,1,1,0}};

void configuraPuertos();
void interrupt();
void Fcirculo();
void Pintar_pixel();
void delay();
void Avanzaxp();
void Avanzayp();
void Avanzaxn();
void Avanzayn();
void Bajay();
void Regresax();
void Pintar_Cuadro();
void AvanceYparcial();

void main() {
 A1 = 0x08;
 BB1 = 0x04;
 C1 = 0x02;
 D1 = 0x01;
 configuraPuertos();

while(1){
 Fcirculo();
}
}

void configuraPuertos(){
 ANSELH = 0;
 ANSEL = 0;
 TRISD = 0x00;
 TRISA = 0xFF;
 TRISC = 0x00;
}
void Pintar_pixel(){
 for(k=0;k<8;k++){
 Avanzaxp();
 Bajay();
 Avanzaxn();
 Bajay();
 }
 Avanzaxp();
 Avanzayp();
}
void Pintar_Cuadro(){
 Avanzaxp();
 Avanzayn();
 Avanzaxn();
 Avanzayp();
 Avanzaxp();
}

 void Fcirculo(){
 for(y=0;y<10;y++){
 for(x=0;x<10;x++){
 if(circulo[y][x] == 1){
 Pintar_Cuadro();
 }
 else
 Avanzaxp();
 }
 Regresax();
 Avanzayn();
 }
 }

void Avanzaxp(){
for(i = 3;i>0;i--){
 PORTC = A1;
 delay();
 PORTC = BB1;
 delay();
 PORTC = C1;
 delay();
 PORTC = D1;
 delay();
 PORTC = 0x00;
 }
}
void Avanzayp(){
for(i = 16;i>0;i--){
 PORTD = A1;
 delay();
 PORTD = BB1;
 delay();
 PORTD = C1;
 delay();
 PORTD = D1;
 delay();
 PORTD = 0x00;
 }
}
void Avanzaxn(){
for(i=0;i<3;i++){
 PORTC = D1;
 delay();
 PORTC = C1;
 delay();
 PORTC = BB1;
 delay();
 PORTC = A1;
 delay();
 PORTC = 0x00;
 }
}
void Avanzayn(){
 for(i=0;i<16;i++){
 PORTD = D1;
 delay();
 PORTD = C1;
 delay();
 PORTD = BB1;
 delay();
 PORTD = A1;
 delay();
 PORTD = 0x00;
 }
}
void Bajay(){
 PORTD = D1;
 delay();
 PORTD = C1;
 delay();
 PORTD = BB1;
 delay();
 PORTD = A1;
 delay();
 PORTD = 0x00;
 }
void Regresax(){
for(i=30;i>0;i--){
 PORTC = D1;
 delay();
 PORTC = C1;
 delay();
 PORTC = BB1;
 delay();
 PORTC = A1;
 delay();
 PORTC = 0x00;
 }
}


void delay(){
 delay_ms(50);
}
