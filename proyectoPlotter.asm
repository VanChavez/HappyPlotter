
_main:

;proyectoPlotter.c,25 :: 		void main() {
;proyectoPlotter.c,26 :: 		A1 = 0x08;
	MOVLW      8
	MOVWF      _A1+0
;proyectoPlotter.c,27 :: 		BB1 = 0x04;
	MOVLW      4
	MOVWF      _BB1+0
;proyectoPlotter.c,28 :: 		C1 = 0x02;
	MOVLW      2
	MOVWF      _C1+0
;proyectoPlotter.c,29 :: 		D1 = 0x01;
	MOVLW      1
	MOVWF      _D1+0
;proyectoPlotter.c,30 :: 		configuraPuertos();
	CALL       _configuraPuertos+0
;proyectoPlotter.c,32 :: 		while(1){
L_main0:
;proyectoPlotter.c,33 :: 		Fcirculo();
	CALL       _Fcirculo+0
;proyectoPlotter.c,34 :: 		}
	GOTO       L_main0
;proyectoPlotter.c,35 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_configuraPuertos:

;proyectoPlotter.c,37 :: 		void configuraPuertos(){
;proyectoPlotter.c,38 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;proyectoPlotter.c,39 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;proyectoPlotter.c,40 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;proyectoPlotter.c,41 :: 		TRISA = 0xFF;
	MOVLW      255
	MOVWF      TRISA+0
;proyectoPlotter.c,42 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;proyectoPlotter.c,43 :: 		}
L_end_configuraPuertos:
	RETURN
; end of _configuraPuertos

_Pintar_pixel:

;proyectoPlotter.c,44 :: 		void Pintar_pixel(){
;proyectoPlotter.c,45 :: 		for(k=0;k<8;k++){
	CLRF       _k+0
	CLRF       _k+1
L_Pintar_pixel2:
	MOVLW      128
	XORWF      _k+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Pintar_pixel32
	MOVLW      8
	SUBWF      _k+0, 0
L__Pintar_pixel32:
	BTFSC      STATUS+0, 0
	GOTO       L_Pintar_pixel3
;proyectoPlotter.c,46 :: 		Avanzaxp();
	CALL       _Avanzaxp+0
;proyectoPlotter.c,47 :: 		Bajay();
	CALL       _Bajay+0
;proyectoPlotter.c,48 :: 		Avanzaxn();
	CALL       _Avanzaxn+0
;proyectoPlotter.c,49 :: 		Bajay();
	CALL       _Bajay+0
;proyectoPlotter.c,45 :: 		for(k=0;k<8;k++){
	INCF       _k+0, 1
	BTFSC      STATUS+0, 2
	INCF       _k+1, 1
;proyectoPlotter.c,50 :: 		}
	GOTO       L_Pintar_pixel2
L_Pintar_pixel3:
;proyectoPlotter.c,51 :: 		Avanzaxp();
	CALL       _Avanzaxp+0
;proyectoPlotter.c,52 :: 		Avanzayp();
	CALL       _Avanzayp+0
;proyectoPlotter.c,53 :: 		}
L_end_Pintar_pixel:
	RETURN
; end of _Pintar_pixel

_Pintar_Cuadro:

;proyectoPlotter.c,54 :: 		void Pintar_Cuadro(){
;proyectoPlotter.c,55 :: 		Avanzaxp();
	CALL       _Avanzaxp+0
;proyectoPlotter.c,56 :: 		Avanzayn();
	CALL       _Avanzayn+0
;proyectoPlotter.c,57 :: 		Avanzaxn();
	CALL       _Avanzaxn+0
;proyectoPlotter.c,58 :: 		Avanzayp();
	CALL       _Avanzayp+0
;proyectoPlotter.c,59 :: 		Avanzaxp();
	CALL       _Avanzaxp+0
;proyectoPlotter.c,60 :: 		}
L_end_Pintar_Cuadro:
	RETURN
; end of _Pintar_Cuadro

_Fcirculo:

;proyectoPlotter.c,62 :: 		void Fcirculo(){
;proyectoPlotter.c,63 :: 		for(y=0;y<10;y++){
	CLRF       _y+0
	CLRF       _y+1
L_Fcirculo5:
	MOVLW      128
	XORWF      _y+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Fcirculo35
	MOVLW      10
	SUBWF      _y+0, 0
L__Fcirculo35:
	BTFSC      STATUS+0, 0
	GOTO       L_Fcirculo6
;proyectoPlotter.c,64 :: 		for(x=0;x<10;x++){
	CLRF       _x+0
	CLRF       _x+1
L_Fcirculo8:
	MOVLW      128
	XORWF      _x+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Fcirculo36
	MOVLW      10
	SUBWF      _x+0, 0
L__Fcirculo36:
	BTFSC      STATUS+0, 0
	GOTO       L_Fcirculo9
;proyectoPlotter.c,65 :: 		if(circulo[y][x] == 1){
	MOVLW      10
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       _y+0, 0
	MOVWF      R4+0
	MOVF       _y+1, 0
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	MOVLW      _circulo+0
	ADDWF      R0+0, 1
	MOVLW      hi_addr(_circulo+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       _x+0, 0
	ADDWF      R0+0, 1
	MOVF       _x+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_Fcirculo11
;proyectoPlotter.c,66 :: 		Pintar_Cuadro(); //pinta el pixel
	CALL       _Pintar_Cuadro+0
;proyectoPlotter.c,67 :: 		}
	GOTO       L_Fcirculo12
L_Fcirculo11:
;proyectoPlotter.c,69 :: 		Avanzaxp();
	CALL       _Avanzaxp+0
L_Fcirculo12:
;proyectoPlotter.c,64 :: 		for(x=0;x<10;x++){
	INCF       _x+0, 1
	BTFSC      STATUS+0, 2
	INCF       _x+1, 1
;proyectoPlotter.c,70 :: 		}
	GOTO       L_Fcirculo8
L_Fcirculo9:
;proyectoPlotter.c,71 :: 		Regresax();
	CALL       _Regresax+0
;proyectoPlotter.c,72 :: 		Avanzayn();
	CALL       _Avanzayn+0
;proyectoPlotter.c,63 :: 		for(y=0;y<10;y++){
	INCF       _y+0, 1
	BTFSC      STATUS+0, 2
	INCF       _y+1, 1
;proyectoPlotter.c,73 :: 		}
	GOTO       L_Fcirculo5
L_Fcirculo6:
;proyectoPlotter.c,74 :: 		}
L_end_Fcirculo:
	RETURN
; end of _Fcirculo

_Avanzaxp:

;proyectoPlotter.c,76 :: 		void Avanzaxp(){        //Avanza 1 cuadro X+
;proyectoPlotter.c,77 :: 		for(i = 3;i>0;i--){
	MOVLW      3
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
L_Avanzaxp13:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Avanzaxp38
	MOVF       _i+0, 0
	SUBLW      0
L__Avanzaxp38:
	BTFSC      STATUS+0, 0
	GOTO       L_Avanzaxp14
;proyectoPlotter.c,78 :: 		PORTC = A1; // A
	MOVF       _A1+0, 0
	MOVWF      PORTC+0
;proyectoPlotter.c,79 :: 		delay();
	CALL       _delay+0
;proyectoPlotter.c,80 :: 		PORTC = BB1; // B
	MOVF       _BB1+0, 0
	MOVWF      PORTC+0
;proyectoPlotter.c,81 :: 		delay();
	CALL       _delay+0
;proyectoPlotter.c,82 :: 		PORTC = C1; // C
	MOVF       _C1+0, 0
	MOVWF      PORTC+0
;proyectoPlotter.c,83 :: 		delay();
	CALL       _delay+0
;proyectoPlotter.c,84 :: 		PORTC = D1; // D
	MOVF       _D1+0, 0
	MOVWF      PORTC+0
;proyectoPlotter.c,85 :: 		delay();
	CALL       _delay+0
;proyectoPlotter.c,86 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;proyectoPlotter.c,77 :: 		for(i = 3;i>0;i--){
	MOVLW      1
	SUBWF      _i+0, 1
	BTFSS      STATUS+0, 0
	DECF       _i+1, 1
;proyectoPlotter.c,87 :: 		}
	GOTO       L_Avanzaxp13
L_Avanzaxp14:
;proyectoPlotter.c,88 :: 		}
L_end_Avanzaxp:
	RETURN
; end of _Avanzaxp

_Avanzayp:

;proyectoPlotter.c,89 :: 		void Avanzayp(){        //Avanza 1 cuadro Y+
;proyectoPlotter.c,90 :: 		for(i = 16;i>0;i--){
	MOVLW      16
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
L_Avanzayp16:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Avanzayp40
	MOVF       _i+0, 0
	SUBLW      0
L__Avanzayp40:
	BTFSC      STATUS+0, 0
	GOTO       L_Avanzayp17
;proyectoPlotter.c,91 :: 		PORTD = A1; // A
	MOVF       _A1+0, 0
	MOVWF      PORTD+0
;proyectoPlotter.c,92 :: 		delay();
	CALL       _delay+0
;proyectoPlotter.c,93 :: 		PORTD = BB1; // B
	MOVF       _BB1+0, 0
	MOVWF      PORTD+0
;proyectoPlotter.c,94 :: 		delay();
	CALL       _delay+0
;proyectoPlotter.c,95 :: 		PORTD = C1; // C
	MOVF       _C1+0, 0
	MOVWF      PORTD+0
;proyectoPlotter.c,96 :: 		delay();
	CALL       _delay+0
;proyectoPlotter.c,97 :: 		PORTD = D1; // D
	MOVF       _D1+0, 0
	MOVWF      PORTD+0
;proyectoPlotter.c,98 :: 		delay();
	CALL       _delay+0
;proyectoPlotter.c,99 :: 		PORTD = 0x00;
	CLRF       PORTD+0
;proyectoPlotter.c,90 :: 		for(i = 16;i>0;i--){
	MOVLW      1
	SUBWF      _i+0, 1
	BTFSS      STATUS+0, 0
	DECF       _i+1, 1
;proyectoPlotter.c,100 :: 		}
	GOTO       L_Avanzayp16
L_Avanzayp17:
;proyectoPlotter.c,101 :: 		}
L_end_Avanzayp:
	RETURN
; end of _Avanzayp

_Avanzaxn:

;proyectoPlotter.c,102 :: 		void Avanzaxn(){        //Avanza 1 cuadro X-
;proyectoPlotter.c,103 :: 		for(i=0;i<3;i++){
	CLRF       _i+0
	CLRF       _i+1
L_Avanzaxn19:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Avanzaxn42
	MOVLW      3
	SUBWF      _i+0, 0
L__Avanzaxn42:
	BTFSC      STATUS+0, 0
	GOTO       L_Avanzaxn20
;proyectoPlotter.c,104 :: 		PORTC = D1; // D  //X en reversa
	MOVF       _D1+0, 0
	MOVWF      PORTC+0
;proyectoPlotter.c,105 :: 		delay();
	CALL       _delay+0
;proyectoPlotter.c,106 :: 		PORTC = C1; // C
	MOVF       _C1+0, 0
	MOVWF      PORTC+0
;proyectoPlotter.c,107 :: 		delay();
	CALL       _delay+0
;proyectoPlotter.c,108 :: 		PORTC = BB1; // B
	MOVF       _BB1+0, 0
	MOVWF      PORTC+0
;proyectoPlotter.c,109 :: 		delay();
	CALL       _delay+0
;proyectoPlotter.c,110 :: 		PORTC = A1; // A
	MOVF       _A1+0, 0
	MOVWF      PORTC+0
;proyectoPlotter.c,111 :: 		delay();
	CALL       _delay+0
;proyectoPlotter.c,112 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;proyectoPlotter.c,103 :: 		for(i=0;i<3;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;proyectoPlotter.c,113 :: 		}
	GOTO       L_Avanzaxn19
L_Avanzaxn20:
;proyectoPlotter.c,114 :: 		}
L_end_Avanzaxn:
	RETURN
; end of _Avanzaxn

_Avanzayn:

;proyectoPlotter.c,115 :: 		void Avanzayn(){       //Avanza 1 cuadro Y-
;proyectoPlotter.c,116 :: 		for(i=0;i<16;i++){
	CLRF       _i+0
	CLRF       _i+1
L_Avanzayn22:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Avanzayn44
	MOVLW      16
	SUBWF      _i+0, 0
L__Avanzayn44:
	BTFSC      STATUS+0, 0
	GOTO       L_Avanzayn23
;proyectoPlotter.c,117 :: 		PORTD = D1; // D
	MOVF       _D1+0, 0
	MOVWF      PORTD+0
;proyectoPlotter.c,118 :: 		delay();
	CALL       _delay+0
;proyectoPlotter.c,119 :: 		PORTD = C1; // C
	MOVF       _C1+0, 0
	MOVWF      PORTD+0
;proyectoPlotter.c,120 :: 		delay();
	CALL       _delay+0
;proyectoPlotter.c,121 :: 		PORTD = BB1; // B
	MOVF       _BB1+0, 0
	MOVWF      PORTD+0
;proyectoPlotter.c,122 :: 		delay();
	CALL       _delay+0
;proyectoPlotter.c,123 :: 		PORTD = A1; // A
	MOVF       _A1+0, 0
	MOVWF      PORTD+0
;proyectoPlotter.c,124 :: 		delay();
	CALL       _delay+0
;proyectoPlotter.c,125 :: 		PORTD = 0x00;
	CLRF       PORTD+0
;proyectoPlotter.c,116 :: 		for(i=0;i<16;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;proyectoPlotter.c,126 :: 		}
	GOTO       L_Avanzayn22
L_Avanzayn23:
;proyectoPlotter.c,127 :: 		}
L_end_Avanzayn:
	RETURN
; end of _Avanzayn

_Bajay:

;proyectoPlotter.c,128 :: 		void Bajay(){          //Baja 1 en Y (Avance minimo)
;proyectoPlotter.c,129 :: 		PORTD = D1; // D
	MOVF       _D1+0, 0
	MOVWF      PORTD+0
;proyectoPlotter.c,130 :: 		delay();
	CALL       _delay+0
;proyectoPlotter.c,131 :: 		PORTD = C1; // C
	MOVF       _C1+0, 0
	MOVWF      PORTD+0
;proyectoPlotter.c,132 :: 		delay();
	CALL       _delay+0
;proyectoPlotter.c,133 :: 		PORTD = BB1; // B
	MOVF       _BB1+0, 0
	MOVWF      PORTD+0
;proyectoPlotter.c,134 :: 		delay();
	CALL       _delay+0
;proyectoPlotter.c,135 :: 		PORTD = A1; // A
	MOVF       _A1+0, 0
	MOVWF      PORTD+0
;proyectoPlotter.c,136 :: 		delay();
	CALL       _delay+0
;proyectoPlotter.c,137 :: 		PORTD = 0x00;
	CLRF       PORTD+0
;proyectoPlotter.c,138 :: 		}
L_end_Bajay:
	RETURN
; end of _Bajay

_Regresax:

;proyectoPlotter.c,139 :: 		void Regresax(){         //Regresa 10 cuadros en X-
;proyectoPlotter.c,140 :: 		for(i=30;i>0;i--){
	MOVLW      30
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
L_Regresax25:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Regresax47
	MOVF       _i+0, 0
	SUBLW      0
L__Regresax47:
	BTFSC      STATUS+0, 0
	GOTO       L_Regresax26
;proyectoPlotter.c,141 :: 		PORTC = D1; // D
	MOVF       _D1+0, 0
	MOVWF      PORTC+0
;proyectoPlotter.c,142 :: 		delay();
	CALL       _delay+0
;proyectoPlotter.c,143 :: 		PORTC = C1; // C
	MOVF       _C1+0, 0
	MOVWF      PORTC+0
;proyectoPlotter.c,144 :: 		delay();
	CALL       _delay+0
;proyectoPlotter.c,145 :: 		PORTC = BB1; // B
	MOVF       _BB1+0, 0
	MOVWF      PORTC+0
;proyectoPlotter.c,146 :: 		delay();
	CALL       _delay+0
;proyectoPlotter.c,147 :: 		PORTC = A1; // A
	MOVF       _A1+0, 0
	MOVWF      PORTC+0
;proyectoPlotter.c,148 :: 		delay();
	CALL       _delay+0
;proyectoPlotter.c,149 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;proyectoPlotter.c,140 :: 		for(i=30;i>0;i--){
	MOVLW      1
	SUBWF      _i+0, 1
	BTFSS      STATUS+0, 0
	DECF       _i+1, 1
;proyectoPlotter.c,150 :: 		}
	GOTO       L_Regresax25
L_Regresax26:
;proyectoPlotter.c,151 :: 		}
L_end_Regresax:
	RETURN
; end of _Regresax

_delay:

;proyectoPlotter.c,154 :: 		void delay(){
;proyectoPlotter.c,155 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_delay28:
	DECFSZ     R13+0, 1
	GOTO       L_delay28
	DECFSZ     R12+0, 1
	GOTO       L_delay28
	NOP
	NOP
;proyectoPlotter.c,156 :: 		}
L_end_delay:
	RETURN
; end of _delay
