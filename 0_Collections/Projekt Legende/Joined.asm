; This file was compiled from the original source
; files in 2016.
;
; It contains all source files from
; the 1988- Disk:
;
;	- BMEINE.ATR
;		- 	DLIST.SRC
;			Playfield Graphics- Displaylist and
;			DLI's
;
;		- 	MAINPRG.SRC 
;			Game Logic 
;		
;	- CMEINE.ATR
;		- 	IMAGES.ATM
; 			Main charakter animation GFX
;			
;
; THIS SOURCE IS THE CONTINUED WORK ON THE 'Joined_1988.asm' 
; VERSION.
;
; All added parts of the code are written in lower case.
; All added comments are written in english....
;
; This source can be compiled and run on an emulator
; or the real machine!
;
;------------------------------------------------------
; Instructions:
; Compile and start. In the emulator
; open the 'media' window. Switch diskdrive #1
; on. Insert Disk 'SMEINE.ATR' Press Fire.
; The First Level will be loaded and displayed.
; 
; Player data will not be loaded. This still 
; has to be added in this code (8.5.2016)
;------------------------------------------------------
; BMeine.atr
;
; Dlist.src
; DISPLAYIST FUER PLAYFIELD
; (LEGENDE)
;------------------------------------------------------
; Original:			1988
; †berarbeite: 		06.05.2016
; Original: 		BMEINE.ATR
; Original Source:	DLIST.SRC 
; IDE: ATMASSII (Hofacker)
;
; Every line after this commend remained 
; untouched and is written exactly as it
; was back in 1988 (except for the adjusted
; assembler directives)
;------------------------------------------------------
; 

		.local		;08.05.2016 Local block to avoid double lables...
		
BUFFER   EQU $5000  ;BILDRAM
;
DBUFLO	EQU 772   	;BUFFER LOW 
DBUFHI	EQU 773   	;BUFFER HI
DAUX1	EQU 778   	;SEKTORNUMMER LOW
DAUX2	EQU 779   	;SEKTORNUMMER HI
DCOMND	EQU 770	 	;KOMMANDO
DSKINV	EQU 58451 	;IO ROTINE
PLAYF 	EQU $A000 	;PLAYFIELD.
;
	ORG $A800
	JMP START
;
DLIST	
	.byte 112+128	
	.byte 2+64
	.word NAME
	.byte 32+128
	.byte 14+64
	; 59 lines of gr. 15 mode..
	.word $1000
	.byte 14+128,14,14,14+128,14,14	
	.byte 14+128,14,14,14+128,14,14
	.byte 14,14,14+128,14,14,14+128,14,14
	.byte 14,14,14+128,14,14,14+128,14,14
	.byte 14,14,14+128,14,14,14+128,14,14
	.byte 14,14,14+128,14,14,14,14,14
	.byte 14,14,14,14,14,14,14,14
	.byte 14,14,14,14,14+128
	.byte 4+64
	.word PLAYF
	.byte 4,4,4,4,4,4,4,4,4,4,4,4,4,4
	.byte 4+128
	.byte 13+128
	.byte 2+64
	.word SCORE
	.byte 2,2
	.byte 65
	.word DLIST
;
; LOADSCREEN
;
LOADSCR	
	.byte 112,112,112,112,112,112
	.byte 7+64
	.word LSCREEN
	.byte 7
	.byte 112
	.byte 6+64+32
LNAME	
	.byte 0,0
	.byte 65
	.word LOADSCR
;
; NAME DES LEVELS UND SCOREANZEIGE
;
NAME	.byte "         Die Burg des Terrors           "
SCORE	.byte "PUNKTE: 00000000         LEBEN: 01      "
		.byte "                                        "
		.byte "BF'89 SOFTWAREPROJEKTE ALLER ART!!!!    "
;
; ADRESSEN DER LEVE NAMES
;
ADR	.byte <L1,<L2,<L3,<L4
	.byte <L5,<L6
ADRH	
	.byte >L1,>L2,>L3,>L4
	.byte >L5,>L6
;
; NAMEN DER LEVEL 1-6
;
L1	.byte "GEHT ES LOS!........"
L2	.byte "GEHT WEITER IM TAKT."
L3	.byte "GET ES RUND!!!......"
L4	.byte "KOMT NOCH EIN LEVEL?"
L5	.byte "GET ES RICHTIG LOS! "
L6	.byte "DAS FINALE!(ENDLICH)"	
;
LSCREEN
	.byte "DAS SPIEL BEGINNT..."
	.byte "UND JETZT:          "
;
; SEKTORTABELLE FUER BACKGROUNG GR.
;
STAB	
	.byte <421,<462,<503,<544
	.byte <585,<626
STABH	
	.byte >421,>462,>503,>544
	.byte >585,>626
;
LAENGE	.byte 0 	;ANZAHL DER SEKTOREN
LEVEL	.byte 3
ZAELER	.byte 0 	;FUER VSCROLL
;
; LADEROTINE FUER:
; ZEICHENSATZ 1-3
; BACKGROUND GRAFIK
; UND PLAYFIELD
;
; LADE PLAYFIELD
;
START	
	JSR SLSCR
	LDX LEVEL  		;NUMMER DES LEVELS
	LDA STAB,X   	;SEKTORLOW 	
	STA DAUX1
	LDA STABH,X  	;SEKTORHI
	STA DAUX2
	LDA #<PLAYF		;BUFFERLOW
	STA DBUFLO
	LDA #>PLAYF	 	;BUFFER HI
	STA DBUFHI     
	LDA #5
	STA LAENGE
; LOAD
LOADBACK	
	JSR DSKINV
	JSR INCBUFF  	;BUFFER+128
	JSR SEKTOR
	DEC LAENGE
	LDA LAENGE   	;ENDE?
	CMP #0
	BNE LOADBACK 	;NOE ->WEITER.
;
; ZEICHENSAETZE LADEN
;
	LDA #<ZSATZ
	STA DBUFLO
	LDA #>ZSATZ
	STA DBUFHI
	LDA #18
	STA LAENGE
;
LOADCH	JSR DSKINV
	JSR SEKTOR
	JSR INCBUFF
	DEC LAENGE
	LDA LAENGE
	CMP #0
	BNE LOADCH
	JSR UPSCROLL  	;TEXT WEG
	JMP RUN
;
; BUFFER UM 128 BYTES ERHOEHEN.
;
INCBUFF	
	CLC
	LDA DBUFLO
	ADC #128
	STA DBUFLO
	LDA DBUFHI
	ADC #0
	STA DBUFHI
	RTS
;
; SEKTOR +1
;
SEKTOR	
	CLC
	LDA DAUX1
	ADC #1
	STA DAUX1
	LDA DAUX2
	ADC #0
	STA DAUX2
	RTS
;
; SUBROTINE -LOADSCREEN ZEIGEN
;
SLSCR	
	LDX LEVEL  		;LEVELNAME
	LDA ADR,X  		;AUSGEBEN.
	STA LNAME
	LDA ADRH,X
	STA LNAME+1
;
	LDA #<LOADSCR 	;DLIST EIN.
	STA 560
	LDA #>LOADSCR
	STA 561
;
	LDA #8
	STA 54277   	;VSCROLL
	STA ZAELER
SCROLL	
	DEC ZAELER  	;TEXT RUNTER-
	LDA ZAELER   	;SCROLLEN
	STA 54277
	JSR WARTEN
	LDA ZAELER
	CMP #0
	BNE SCROLL
	RTS
;
UPSCROLL	
	LDA #0       	;TEXT RAUF-
	STA 54277   	;SCROLLEN.
	STA ZAELER
UPSC	
	INC ZAELER
	LDA ZAELER
	STA 54277
	JSR WARTEN
	LDA ZAELER
	CMP #7
	BNE UPSC
	RTS
;
WARTEN	
	LDA #250     	;KURZ WARTEN.
	STA $14
WART	
	LDA $14
	BNE WART
	RTS
;
; AKTIVIERE DLI UND ZEIGE PLAYFIELD
;
RUN	
	LDA #<DLIST
	STA 560
	LDA #>DLIST
	STA 561
;
	LDA #<DLI1   	;1. DLI ROTINE
	STA 512	  		; AUFRUFEN.
	LDA #>DLI1
	STA 513
	LDA #192
	STA 54286
;
	JMP $5800		;08.05.2016 => Start LegendeMain.asm!
;------------------------------------
; DISPLAY INTERUPT UNTERPROGRAMME
;
; -DLI1:GRAPHICS 0 ZEILE RAINBOW COLOR
; -DLI2:SPIELFELD BLAU (DUNKEL)
; -DLI3:SPIELFELD BLAU (HELL  )
;-------------------------------------
;
COLPF0	EQU $D016
COLPF1	EQU $D017
COLPF2	EQU $D018
COLPF3	EQU $D019
COLPF4	EQU $D01A
VCOUNT	EQU $D40B
WSYNC	EQU $D40A
ZEIGER	EQU $D409
DLIVKTL	EQU 512
DLIVKTH	EQU 513
ZSATZ	EQU 18432
;
DLI1	
	PHA        			;ALLE REG.VOM STACK
	LDA #6
	STA COLPF1
	LDA #117
	STA COLPF2	
	STA COLPF4
	LDA #224     		;BEKOMMT FEST SP.
	STA ZEIGER
	LDA #<DLI2			;ZEIGER AUF NEUHE
	STA DLIVKTL 		; ROTINE.
	LDA #>DLI2
	STA DLIVKTH
	PLA        			;RETURN F.INTERUPT.
	RTI
;
; INTERUPT 2
;
DLI2	
	PHA
	lda #12
	sta colpf1
	LDA #117
	STA COLPF4
	LDA #<DLI3	 		;ZEIGER AUF NEUHE
	STA DLIVKTL  		;ROTINE.
	LDA #>DLI3
	STA DLIVKTH
	PLA
	RTI	
;
; INTERUPT 3
;
DLI3	
	PHA
	LDA #14
	STA WSYNC
	STA COLPF2
	
	LDA #118
	STA WSYNC
	STA COLPF4
	LDA #<DLI4  		;ZEIGER AUF NEUHE
	STA DLIVKTL  		;ROTINE.
	LDA #>DLI4
	STA DLIVKTH
	PLA
	RTI
;
; INTERUPT 4 
;
DLI4	
	PHA
	
	LDA #12
	STA WSYNC
	STA COLPF2
	
	LDA #119
	STA WSYNC
	STA COLPF4
	LDA #<DLI5
	STA DLIVKTL
	LDA #>DLI5
	STA DLIVKTH
	PLA
	RTI 
;
; INTERUPT 5
;
DLI5	
	PHA
	LDA #14
	STA COLPF2
	STA WSYNC
	LDA #120
	STA COLPF4
	LDA #<DLI6 				;ZEIGER AUF NEUHE
	STA DLIVKTL  			;ROTINE.
	LDA #>DLI6
	STA DLIVKTH
	PLA
	RTI

;
; INTERUPT 6
;
DLI6	
	PHA
	STA WSYNC
	LDA #14
	STA COLPF2
	STA WSYNC
	LDA #121
	STA COLPF4
	LDA #<DLI7  			;ZEIGER AUF NEUHE
	STA DLIVKTL  			;ROTINE.
	LDA #>DLI7
	STA DLIVKTH
	PLA
	RTI
;
; INTERUPT 7
;
DLI7	
	PHA
	
	LDA #14
	STA COLPF2
	LDA #122
	STA COLPF4
	LDA #<DLI8  			;ZEIGER AUF NEUHE
	STA DLIVKTL  			;ROTINE.
	LDA #>DLI8
	STA DLIVKTH
	PLA
	RTI	
;
; INTERUPT 8
;
DLI8	
	PHA
	lda #14
	sta colpf2
	STA WSYNC
	LDA #123
	STA COLPF4
	LDA #<DLI9  			;ZEIGER AUF NEUHE
	STA DLIVKTL 			;ROTINE.
	LDA #>DLI9
	STA DLIVKTH
	PLA
	RTI
;
; INTERUPT 9 
;
DLI9	
	PHA
	lda #6
	sta colpf1
	lda #52
	STA WSYNC
	sta colpf2
	LDA #124
	STA WSYNC
	STA COLPF4
	LDA #<DLI10
	STA DLIVKTL
	LDA #>DLI10
	STA DLIVKTH
	PLA
	RTI 
;
; INTERUPT 10
;
DLI10	
	PHA

	LDA #125
	STA WSYNC
	STA COLPF4
	LDA #<DLI11  			;ZEIGER AUF NEUHE
	STA DLIVKTL  			;ROTINE.
	LDA #>DLI11
	STA DLIVKTH
	PLA
	RTI
;
; INTERUPT 11
;
DLI11	
	PHA       				;ALLE REG.VOM STACK
	
	LDA #126
	STA WSYNC
	STA COLPF4
	LDA #<DLI12 			;ZEIGER AUF NEUHE
	STA DLIVKTL  			;ROTINE.
	LDA #>DLI12
	STA DLIVKTH
	PLA       				;RETURN F.INTERUPT.
	RTI
;
; INTERUPT 12
;
DLI12	
	PHA
	
	LDA #126
	STA WSYNC
	STA COLPF4
	LDA #<DLI13 			;ZEIGER AUF NEUHE
	STA DLIVKTL  			;ROTINE.
	LDA #>DLI13
	STA DLIVKTH
	PLA
	RTI	
;
; INTERUPT 13
;
DLI13	
	PHA
	LDA #216				; Green
	STA WSYNC
	STA COLPF4
	LDA #<DLI14 			;ZEIGER AUF NEUHE
	STA DLIVKTL  			;ROTINE.
	LDA #>DLI14
	STA DLIVKTH
	PLA
	RTI
;
; INTERUPT 14 
; This is the playfield, gr. 12
;
DLI14	
	PHA
	STA WSYNC
	lda #42
	sta colpf0
	lda #20
	sta colpf1
	lda #22
	sta colpf2
	lda #204
	sta colpf3
	LDA #11
	STA COLPF4
	LDA #>ZSATZ
	STA ZEIGER
	LDA #<DLI15
	STA DLIVKTL
	LDA #>DLI15
	STA DLIVKTH
	PLA
	RTI 
;
; INTERUPT 15
;
DLI15	
	PHA
	STA WSYNC
	LDA #12
	STA COLPF4
	LDA #50
	STA COLPF2
	LDA #<DLI16
	STA DLIVKTL
	LDA #>DLI16
	STA DLIVKTH
	PLA
	RTI
;
; INTERUPT 16
;
DLI16	
	PHA
	STA WSYNC
	LDA #12
	STA COLPF2
	STA COLPF4
	LDA #224
	STA ZEIGER
	LDA #<DLI1	 			;ZEIGER AUF NEUHE
	STA DLIVKTL  			;ROTINE.
	LDA #>DLI1
	STA DLIVKTH
	PLA
	RTI
	
	.endl					;08.05.2016 Local block to avoid double lables...

; ANIMATIONSROTINE/LEGENDE FUER JACK
; 
;			   						BF'88
;-----------------------------------------
; Original:			1988
; †berarbeite: 		06.05.2016
; Original: 		BMEINE.ATR
; Original Source:	MAINPRG.SRC 
; IDE: ATMASSII (Hofacker)
;
; Every line after this commend remained 
; untouched and is written exactly as it
; was back in 1988 (except for the adjusted
; assembler directives)
;-----------------------------------------
; 
;
		.local		;08.05.2016 Local block to avoid double lables...
		
PHASEL	EQU 205 	;BEWEGUNGSPHASE LOW.
PHASEH  EQU 206 	;BEWEGUNGSPHASE HI.
PHASEL2	EQU 207    	; ''       P2 LOW
PHASEH2 EQU 208    	; ''       P2 HIGU 203
ADR		EQU 203    	;YPOS.JACK IN GR.13
;
PMTAB   EQU 18432 
PMBASE  EQU 54279
HPOSP1  EQU 53248
HPOSP2	EQU 53249
SDMCTL	EQU 559
GPRIOR	EQU 623
GRACTL	EQU 53277
PLAYER1	EQU PMTAB+1024
PLAYER2	EQU PMTAB+1280
BRAM 	EQU $A000
;
STICK0	EQU 632
TRIG0	EQU 644
;
		ORG $5800 	;FREI VERSCHIEBAR.
		JMP START
;
RICHTUNG .byte 0     	;BEWEGUNGSRICHTUNG
XPOS	 .byte 45    	;X POSITION
YPOS	 .byte 72    	;Y POSITION 
ZAELER	 .byte 0     	;16 BYTES GELESEN?
PRUEF    .byte 3     	;ZEICHEN DAS VON JACK †BERLAGERT WIRD
;
TEMP	.byte 0,0     ;TEMPONAEREGISTER.
DELAY	.byte 100   	;ZEIT FUER WAIT2
STEPNR	.byte 2     	;SCHRITTNUMMER.
ZEIT    .byte 255   	;ZEIT-WIELANGE KEINE
	    .byte 100   	;HIBYTE ZEIT BEWEGUNG AUSGEFUERT	
;
; PMGRAFIK VORBEREITEN
;
START    
	LDA #PMTAB/256
	STA PMBASE
	LDA #58
	STA SDMCTL 	
	LDA XPOS
	STA HPOSP1
	LDA #3
	STA GRACTL
	LDA #2
	STA GPRIOR
;
	LDA #221
	STA 704
	LDA #252
	STA 705
;
	LDX #0
CLEAR	LDA #0
	STA PLAYER1,X
	STA PLAYER2,X
	INX
	BNE CLEAR
;
	JSR RECHTS    	;PLAYER DAS 
	JSR POKEIN    	;ERSTE MAL
	JSR POKEIN2   	;ZEIGEN.
;
	LDA #<BRAM
	STA ADR
	LDA #>BRAM
	STA ADR+1
;
; STICKABFRAGE
;
STICKABF	
	LDA STICK0
	CMP #11
	BNE NOT11
	LDA #1      	;RICHTUNG=1-LINKS
	STA RICHTUNG
	JSR LEFT
; 
NOT11	
	CMP #7
	BNE NOT7
	LDA #2      	;RICHTUNG=2-RECHTS
	STA RICHTUNG 
	JSR RIGHT
;
NOT7	
	CMP #14    
	BNE NOT14
	LDA PRUEF   	;IST LEITERTEIL?
	CMP #6
	BNE NOTA
	JSR UP
NOTA	
	CMP #5
	BNE NOTB
	JSR UP
NOTB
	CMP #7
	BNE NOTC
	JSR UP
NOTC	
	CMP #4
	BNE NOT14   	;KEINE LEITER.
	JSR UP      	;LEITER BESTEIGEN
;
NOT14	
	LDA TRIG0   	;JUMP ?
	CMP #0
	BNE NOT0
	JSR JUMP    	;JUMP
;
NOT0	
	LDA STICK0
	CMP #15     	;KEINE STICKBEWEGUNG
	BNE NOT15   
	JSR STAND
;
NOT15	
	JSR CHECK   
	JMP STICKABF
;------------------------------------
; LINKSBEWEGUNG
; PHASE 1
;------------------------------------
LEFT	
	JSR CHECK
LEFT2	
	LDA STEPNR    	;SCHON 4    
	CMP #0        	;SCHRITTE NACH       
	BNE MOVELEFT  	;LINKS?
;
	LDA #4
	STA STEPNR
	JSR SBCBRAM 	;BRAM.ADR.-1
	JSR LINKS   	;BITMUSTER F.L.
MOVELEFT	
	JSR POKEIN  	;PLAYER 1,
	JSR POKEIN2 	;PLAYER 2 EINLESEN
	LDX XPOS
	DEX
	STX XPOS    	;X POS PLAYER 1
	STX HPOSP1  	;UND 2 AENDERN.
	STX HPOSP2
	JSR WAIT
	JSR ADC16
	JSR ADC162  	;DATAADR.ERHOHEN.
;
	DEC STEPNR
	RTS
;------------------------------------
; RECHTSBEWEGUNG 
; PHASE 1
;------------------------------------
RIGHT	
	JSR CHECK
RIGHT2	
	LDA STEPNR
	CMP #4
	BNE MOVER 
;
	LDA #0
	STA STEPNR
	JSR ADDBRAM
	JSR RECHTS   	;BITMUSTER F.R.
MOVER	
	JSR POKEIN
	JSR POKEIN2
	LDX XPOS
	INX
	STX HPOSP1
	STX HPOSP2
	STX XPOS
	JSR ADC16
	JSR ADC162
	JSR WAIT
	INC STEPNR
;
	RTS	
;------------------------------------
; STURZ
;------------------------------------
STURZ	
	LDX #0
	LDA #<$B220
	STA PHASEL
	LDA #>$B220
	STA PHASEH
	LDA #<($B220+128)
	STA PHASEL2
	LDA #>($B220+128)
	STA PHASEH2
	LDY YPOS
;
FALL	
	LDA DELAY   	;ABFRAGE OB ZU 
	CMP #0     		;TIEF GEFALLEN
	BNE FALLOK
	JMP TOD    		;ZU TIEF=TOD
FALLOK	
	STY TEMP		;X UND Y REG 
	STX TEMP+1 		;SICHERN.
;
	JSR POKEIN
	JSR POKEIN2
	JSR WAIT2   
	LDY TEMP
	INY
	STY YPOS
	LDX TEMP+1
	INX
	DEC DELAY  		;WARTEZEIT-1
	DEC DELAY
	CPX #8
	BNE FALL
;
	JSR ADC40
	JSR CHECK
;
	LDA #100   		;ENDE STURZ
	STA DELAY
;	
	LDA #<$B220
	STA PHASEL
	LDA #>$B220
	STA PHASEH
	LDA #<($B220+128)
	STA PHASEL2
	LDA #>($B220+128)
	STA PHASEH2
;
	LDX #0
ENDST	
	STX TEMP
	JSR POKEIN
	JSR POKEIN2
	JSR ADC16
	JSR ADC162	
	JSR WAIT
	LDX TEMP
	INX
	CPX #4
	BNE ENDST
	RTS
;------------------------------------
; JACK AUF LEITER!!
;------------------------------------
UP	
	LDX #0
	STX TEMP
;
UPMOVE	
	LDA #<$B321
	STA PHASEL	
	LDA #>$B321
	STA PHASEH
	LDA #<($B321+128)
	STA PHASEL2
	LDA #>($B321+128)
	STA PHASEH2
;
	JSR POKEIN
	JSR POKEIN2
	JSR ADC16
	JSR ADC162
	JSR WAIT
	JSR POKEIN
	JSR POKEIN2
	JSR WAIT
	LDX YPOS
	DEX
	DEX
	STX YPOS	
	LDX TEMP
	INX
	STX TEMP
	CPX #4
	BNE UPMOVE
	JSR SBC40
;
	LDA #<$B220
	STA PHASEL
	LDA #>$B220
	STA PHASEH
	LDA #<($B220+128)
	STA PHASEL2
	LDA #>($B220+128)
	STA PHASEH2
	JSR POKEIN
	JSR POKEIN2 
	RTS
;------------------------------------
; SPRUNG
;------------------------------------
JUMP	
	LDX #0
	STX TEMP
	LDA #50      	;WARTESCHLEIFE
	STA DELAY    	;AUF 50
	LDA #<$B220 	;STEHENDEN
	STA PHASEL   	;PLAYER ZEIGEN.
	LDA #>$B220
	STA PHASEH
	LDA #<($B220+128)
	STA PHASEL2
	LDA #>($B220+128)
	STA PHASEH2
JMPLOOP	
	LDY YPOS     	;DER EIGENTLICHE
	DEY          	;SPRUNG.
	STY YPOS     	;YPOS-1
	JSR POKEIN   	;PLAYER 1 UND 2
	JSR POKEIN2  	;EINPOKEN
	JSR WAIT2    	;WARTEN
	INC DELAY    	;WARTESHLEIFE 
	INC DELAY    	;WENIGER 3.
	INC DELAY
	LDX TEMP
	INX
	STX TEMP
	CPX #24			; Changed this! This value means:
	BNE JMPLOOP		; Player jumps 3 times as high as hisn own boddy length

	JSR SBC40     	;BRAM -40 3 
	JSR SBC40		
	JSR SBC40
	JSR CHECK    	;WELCHES ZEICHEN?
	RTS	    		;FERTIG.		
;------------------------------------
; STEHENDEN JACK ZEIGEN
; (EINDRUCK DER DREHUNG ERWECKEN)
;------------------------------------
STAND	
	LDA #<$B220
	STA PHASEL
	LDA #>$B220
	STA PHASEH
	LDA #<($B220+128)
	STA PHASEL2
	LDA #>($B220+128)
	STA PHASEH2
;
	JSR POKEIN       	;STEHENDEN
	JSR POKEIN2      	;JACK LESEN.
;
	DEC ZEIT
	LDA ZEIT
	CMP #0	        	;ZEIT SCHON 0
	BNE RETURN       	;NEIN->RTS
;
	DEC ZEIT+1       	;HI BYTE ZEIT
	LDA ZEIT+1
	CMP #0
	BEQ WEITER	
RETURN	
	JMP RIGHTLE      	;LINKS ODER
	                    ;RECHTS?
WEITER	
	LDA #255
	STA ZEIT
	LDA #100
	STA ZEIT+1
;
	LDA #<$B3D1
	STA PHASEL
	LDA #>$B3D1
	STA PHASEH
	LDA #<($B3D1+128)
	STA PHASEL2
	LDA #>($B3D1+128)
	STA PHASEH2
;
	LDA #0
	STA TEMP
TURN	
	LDA STICK0    	;STICKBEWEGUNG?
	CMP #15
	BNE RETURN    	;JA->RETURN
;
	JSR POKEIN
	JSR POKEIN2
	JSR ADC16
	JSR ADC162
	JSR WAIT
	JSR WAIT
	JSR WAIT
	INC TEMP
	LDA TEMP
	CMP #7
	BNE TURN		
;
	LDA YPOS       	;FRAGEZEICHEN
	STA TEMP+1     	;AUSGEBEN.
	SBC #18
	STA YPOS
	JSR POKEIN
	JSR POKEIN2
;
W4STICK  
	LDA STICK0     ;AUF STICK-
	CMP #15        ;BEWEGUNG
	BEQ W4STICK    ;WARTEN!!
;
	LDA #<1536
	STA PHASEL
	STA PHASEL2
	LDA #>1536
	STA PHASEH
	STA PHASEH2
	JSR POKEIN	
	JSR POKEIN2
	LDA TEMP+1     ;RESTORE Y POS.
	STA YPOS
;
RIGHTLE	
	LDA STICK0
	CMP #7         ;RECHTS?
	BEQ RECHTS     ;JA!
;
; UNTERPROGRAMME UM BITMUSTER FUER
; JACK RECHTS ODER LINKS ZU STELLEN
;
LINKS	
	LDA #<$B000  
	STA PHASEL
	LDA #>$B000
	STA PHASEH
	LDA #<($B000+128)
	STA PHASEL2
	LDA #>($B000+128)
	STA PHASEH2
	RTS
;
RECHTS	
	LDA #<($B000+64)
	STA PHASEL
	LDA #>($B000+64)
	STA PHASEH
	LDA #<($B000+192)
	STA PHASEL2
	LDA #>($B000+192)
	STA PHASEH2
	RTS	
;------------------------------------
; TOD!!
; PRUEFEN OB GAME OVER
;------------------------------------
TOD	LDA $14
	STA 705
	STA 704
	STA 706
	BNE TOD
	RTS
;------------------------------------
; DIAMANT/GOLD GEFUNDEN
;------------------------------------
DIAMANT	
	LDY #0
	LDA #30
	STA (ADR),Y  	;SCORE AUSGEBEN
	INY
	LDA #29
	STA (ADR),Y
	INY
	STA (ADR),Y		
	JMP OLD
;
GOLD	
	LDY #0
	LDA #28       	;SCORE AUSGEBEN
	STA (ADR),Y
	INY
	LDA #29
	STA (ADR),Y
	INY
	STA (ADR),Y
;
OLD	JSR WAIT    	;SCORE KURZ
	JSR WAIT   		; ZEIGEN.
	JSR WAIT    	;(SPATER->SOUND).
	LDY #0     		;ALTEN BODEN
CL	LDA #56     	;WIEDER 
	STA (ADR),Y 	;HERSTELLEN.
	INY
	CPY #3
	BNE CL
;
	LDA #56     	;RESTORE PRUEF.
	STA PRUEF
	JMP STICKABF
;------------------------------------
; AB HIER SUBROTINEN:
; -POKEIN IN ZEIGT PLAYER 1 AUF SCHIRM
; -POKEIN2 ZEIGT PLAYER 2
; -ADC16  ERHOET BEWEGUNGSPHASE
; -ADC162   ''         ''       PLY.2
; -WAIT   WARTESCHLEIFE
; -ADDBRAM ADDIERT X POS.JACK IN GR 13
; -SBCBRAM SUBTRAHIERT X POS.JACK GR13
; -CHECK   WELCHES ZEICHEN WIRD
;          UEBERLAGERT?
;-------------------------------------
POKEIN   
	LDX YPOS
	LDY #0
	LDA #0
	STA PLAYER1,X
	INX
POKE
	LDA (PHASEL),Y
	STA PLAYER1,X
	INY
	INX
	INC ZAELER
	LDA ZAELER
	CMP #16
	BNE POKE	
	LDA #0
	STA ZAELER
;
	CLC        		;LETZTES BYTE
	LDA YPOS   		;PLAYER 1 LOESCHEN
	ADC #16
	TAX
	INX
	LDA #0
	STA PLAYER1,X

	RTS
;
POKEIN2	
	LDX YPOS
	LDY #0
	LDA #0
	STA PLAYER2,X
	INX
POKE2	
	LDA (PHASEL2),Y
	STA PLAYER2,X
	INY
	INX
	INC ZAELER
	LDA ZAELER
	CMP #16
	BNE POKE2
	LDA #0
	STA ZAELER
;
	CLC        		;LETZTES BYTE VON
	LDA YPOS   		;PLAYER 2 LOESCHEN
	ADC #16
	TAX
	INX
	LDA #0
	STA PLAYER2,X
;
	RTS
;------------------------------------
ADC16	
	CLC	
	LDA PHASEL
	ADC #16
	STA PHASEL
	LDA PHASEH
	ADC #0
	STA PHASEH
	RTS		
;
ADC162	
	CLC
	LDA PHASEL2
	ADC #16
	STA PHASEL2
	LDA PHASEH2
	ADC #0
	STA PHASEH2
	RTS
;------------------------------------
WAIT	
	LDX #120
LOOP	
	LDY #120
LOOP1	
	DEY
	BNE LOOP1
	DEX 
	BNE LOOP
	RTS
;------------------------------------
WAIT2	
	LDX DELAY  	;SPEZIELLE WARTE-
LOOP12	
	LDY DELAY  	;SCHLEIFE
LOOP22   
	DEY        	;DIE WARTEZEIT IST
	BNE LOOP22 	;VARIABEL UEBER 
	DEX        	;DELAY EINSTELLBAR.
	BNE LOOP12
	RTS
;------------------------------------
; ERHOEHEN DES BILDRAMZAELERS
;------------------------------------
ADDBRAM	
	CLC
	LDY #0
	LDA ADR
	ADC #1
	STA ADR
	LDA ADR+1
	ADC #0
	STA ADR+1
	LDA (ADR),Y
	STA PRUEF
	STA BRAM+38
	RTS
;------------------------------------
; ERNIEDRIGE BILDZAELER
;------------------------------------
SBCBRAM	
	LDY #0
	LDA ADR
	SBC #1
	STA ADR
	LDA ADR+1
	SBC #0
	STA ADR+1
	LDA (ADR),Y
	STA PRUEF
	STA BRAM+38
	RTS	
;-------------------------------------
; BILDZAEHLER UM 40 ERHOHEN
;-------------------------------------
ADC40	
	CLC
	LDY #0
	LDA ADR
	ADC #40
	STA ADR
	LDA ADR+1
	ADC #0
	STA ADR+1
	LDA (ADR),Y
	STA PRUEF
	RTS
;------------------------------------
; BILDZAHLER UM 40 ERNIEDRIGEN.
;------------------------------------
SBC40	
	LDY #0
	LDA ADR
	SBC #40
	STA ADR
	LDA ADR+1
	SBC #0
	STA ADR+1
	LDA (ADR),Y
	STA PRUEF
	RTS
;------------------------------------
; PRUEFE WELCHES ZEICHEN UEBERLAGERT
; WIRD.
;------------------------------------
CHECK	
	LDA PRUEF   	;LOCH?
	CMP #0
	BNE NOSTURZ 	;KEIN LOCH   
	JSR STURZ   	;JA JACK SUERZT
	JMP STICKABF
;
NOSTURZ	
	CMP #1      	;MAUERTEIL LINKS?
	BNE NOMLEFT 	;NEIN.
	JMP LEFT2   	;JA.
	JMP STICKABF
;
NOMLEFT	
	CMP #2      	;MAUERTEIL RECHTS?
	BNE NMRIGHT 	;NEIN.
	JMP RIGHT2  	;JA.
	JMP STICKABF
;
NMRIGHT	
	CMP #72     	;WIRD EIN ZEICHEN
	BNE NOT72   	;DAS TOEDLICH
	JMP TOD    		;WIRKT UEBER-
NOT72	
	CMP #119    	;LAGERT?
	BNE NOT19   
	JMP TOD
;
NOT19	
	CMP #27     	;DIAMANT ODER 
	BNE NOT27   	;GOLD?
	JMP DIAMANT
NOT27	
	CMP #57
	BNE NOT57
	JMP GOLD
;
NOT57	
	RTS
	.endl			;08.05.2016 Local block to avoid double lables...
;
;
	.local
	
;------------------
; Main Charakter animation data
;
; Source:	C_Meine.atr
; Dump of:	IMAGES.ATM

	org $B000-6

.byte	$ff,$ff,$00,$b0,$09,$b7,$00,$00,$10
.byte	$1c,$0c,$1c,$08,$08,$0c,$0c,$18
.byte	$08,$08,$14,$00,$00,$00,$20,$38
.byte	$38,$18,$08,$08,$0c,$02,$0c,$08
.byte	$1c,$04,$04,$00,$00,$00,$00,$10
.byte	$1c,$0c,$1c,$08,$08,$0c,$04,$18
.byte	$08,$1c,$10,$00,$00,$00,$10,$1c
.byte	$0c,$1c,$08,$08,$0c,$0c,$18,$08
.byte	$08,$04,$00,$00,$00,$00,$00,$08
.byte	$38,$30,$38,$10,$10,$30,$30,$18
.byte	$10,$10,$28,$00,$00,$00,$08,$38
.byte	$30,$38,$10,$10,$30,$20,$18,$10
.byte	$38,$08,$00,$00,$00,$00,$00,$04
.byte	$1c,$1c,$18,$10,$10,$30,$40,$30
.byte	$10,$38,$20,$20,$00,$00,$08,$38
.byte	$30,$38,$10,$10,$30,$30,$18,$10
.byte	$10,$20,$00,$00,$00,$00,$3c,$06
.byte	$02,$02,$00,$00,$08,$84,$f4,$38
.byte	$20,$00,$00,$12,$36,$78,$0c,$04
.byte	$04,$00,$00,$08,$44,$7e,$1c,$10
.byte	$00,$30,$00,$0c,$00,$00,$3c,$06
.byte	$02,$02,$00,$00,$08,$84,$fc,$38
.byte	$20,$00,$0c,$10,$30,$3c,$06,$02
.byte	$02,$00,$00,$08,$84,$f4,$38,$20
.byte	$00,$30,$02,$06,$00,$00,$3c,$60
.byte	$40,$40,$00,$00,$10,$21,$2f,$1c
.byte	$04,$00,$00,$48,$6c,$3c,$60,$40
.byte	$40,$00,$00,$10,$21,$3f,$1c,$04
.byte	$00,$30,$08,$0c,$00,$00,$1e,$30
.byte	$20,$20,$00,$00,$10,$22,$7e,$38
.byte	$08,$00,$0c,$00,$30,$3c,$60,$40
.byte	$40,$00,$00,$10,$21,$2f,$1c,$04
.byte	$00,$0c,$40,$60,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$10,$38,$28,$10,$10,$fe,$10,$10
.byte	$10,$28,$00,$00,$00,$00,$00,$00
.byte	$10,$38,$28,$10,$d6,$38,$10,$10
.byte	$10,$28,$00,$00,$00,$00,$00,$00
.byte	$38,$38,$28,$92,$54,$38,$10,$10
.byte	$10,$28,$00,$00,$00,$00,$00,$00
.byte	$10,$38,$38,$50,$50,$3e,$10,$10
.byte	$10,$28,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$38,$7c
.byte	$44,$00,$06,$02,$02,$ef,$02,$03
.byte	$00,$00,$24,$28,$64,$00,$38,$7c
.byte	$44,$02,$02,$02,$c7,$2a,$03,$00
.byte	$00,$00,$44,$28,$44,$00,$38,$7c
.byte	$46,$02,$02,$83,$46,$2b,$00,$00
.byte	$00,$00,$44,$28,$44,$00,$38,$7c
.byte	$44,$00,$06,$42,$42,$2f,$02,$03
.byte	$00,$00,$44,$28,$44,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$1c,$1c,$0a,$0a,$1c,$28,$28
.byte	$08,$04,$04,$00,$00,$00,$00,$00
.byte	$00,$1c,$1c,$28,$28,$1c,$0a,$0a
.byte	$08,$10,$10,$00,$00,$00,$00,$00
.byte	$00,$1c,$1c,$0a,$0a,$1c,$28,$28
.byte	$08,$04,$04,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$1c,$3e
.byte	$3e,$22,$00,$02,$02,$14,$20,$20
.byte	$00,$10,$30,$04,$06,$00,$1c,$3e
.byte	$3e,$22,$00,$20,$20,$14,$02,$02
.byte	$00,$04,$06,$10,$30,$00,$1c,$3e
.byte	$3e,$22,$00,$02,$02,$14,$20,$20
.byte	$00,$10,$30,$04,$06,$00,$00,$00
.byte	$00,$10,$38,$28,$10,$10,$38,$54
.byte	$52,$10,$28,$00,$00,$00,$00,$00
.byte	$00,$10,$38,$28,$10,$10,$38,$54
.byte	$32,$50,$28,$00,$00,$00,$00,$00
.byte	$00,$10,$38,$28,$10,$10,$38,$54
.byte	$32,$50,$28,$00,$00,$00,$00,$00
.byte	$00,$10,$38,$28,$10,$10,$38,$54
.byte	$32,$50,$28,$00,$00,$00,$00,$00
.byte	$00,$10,$38,$38,$10,$10,$38,$54
.byte	$52,$10,$28,$00,$00,$00,$00,$00
.byte	$00,$10,$38,$28,$10,$10,$38,$54
.byte	$52,$10,$28,$00,$00,$00,$00,$00
.byte	$00,$10,$38,$38,$10,$10,$38,$54
.byte	$52,$10,$28,$00,$00,$00,$3e,$63
.byte	$c1,$81,$81,$81,$83,$82,$82,$44
.byte	$24,$18,$00,$18,$00,$30,$00,$38
.byte	$7c,$44,$00,$03,$02,$02,$2a,$46
.byte	$42,$06,$00,$28,$28,$6c,$00,$38
.byte	$7c,$44,$00,$00,$01,$01,$2a,$46
.byte	$26,$42,$06,$28,$28,$6c,$00,$38
.byte	$7c,$44,$00,$00,$01,$01,$2a,$46
.byte	$22,$44,$04,$28,$68,$0c,$00,$38
.byte	$7c,$44,$00,$03,$02,$02,$2a,$46
.byte	$22,$46,$00,$28,$28,$6c,$00,$38
.byte	$7c,$44,$00,$03,$02,$02,$2a,$46
.byte	$42,$06,$00,$28,$28,$6c,$00,$38
.byte	$7c,$44,$00,$03,$02,$02,$2a,$46
.byte	$42,$06,$00,$28,$28,$6c,$00,$38
.byte	$7c,$44,$00,$03,$02,$02,$2a,$46
.byte	$42,$06,$00,$28,$28,$6c,$3e,$63
.byte	$c1,$b9,$8d,$99,$93,$92,$82,$54
.byte	$34,$18,$00,$18,$00,$30,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$24,$00,$42,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00,$00
.byte	$00,$00,$00,$00,$00,$00,$00
	.endl
	
; Background Gfx.
;

buffer
	org $1000

.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$03,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02
.byte $80,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$0B,$C0,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$2F
.byte $F0,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$02,$80,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$2F,$F0,$00,$00,$00,$00,$00,$00,$00
.byte $00,$02,$80,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$2B
.byte $E8,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$BE
.byte $FC,$00,$00,$00,$00,$00,$00,$00,$00,$0B,$F0,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$BF,$FE,$80,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$02,$BF,$FC,$00,$00,$00,$00,$00,$00,$00
.byte $00,$0B,$FC,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$2A,$FB
.byte $BF,$E8,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0B,$FB
.byte $FF,$00,$00,$00,$00,$00,$00,$00,$00,$2F,$BC,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$7F,$FF,$FF,$EE,$80,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$2B,$FF,$EF,$00,$00,$00,$00,$00,$00,$00
.byte $00,$2F,$FF,$00,$00,$00,$00,$01,$40,$00,$00,$00,$00,$05,$5F,$FB
.byte $FF,$FF,$E0,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$3F,$BF
.byte $FF,$C0,$00,$00,$00,$00,$00,$00,$00,$AF,$BF,$C0,$00,$00,$00,$15
.byte $54,$00,$00,$00,$00,$05,$57,$FF,$FE,$FF,$FA,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$BF,$FE,$FF,$C0,$00,$00,$00,$00,$00,$00
.byte $02,$BF,$FE,$F0,$00,$00,$00,$15,$54,$00,$00,$00,$00,$15,$57,$FF
.byte $FF,$FF,$FF,$80,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF
.byte $FF,$F0,$00,$00,$00,$00,$00,$00,$0A,$FB,$EF,$FC,$00,$00,$15,$55
.byte $55,$00,$00,$00,$05,$55,$57,$7F,$FF,$FF,$D5,$14,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$02,$FF,$BF,$FF,$F0,$00,$00,$00,$00,$00,$00
.byte $0B,$DF,$FF,$FF,$00,$01,$55,$55,$55,$40,$00,$00,$55,$55,$57,$7F
.byte $FD,$55,$54,$54,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0F,$FF,$FF
.byte $FF,$FC,$00,$00,$10,$00,$00,$00,$15,$57,$FF,$FF,$F0,$15,$55,$55
.byte $55,$40,$00,$01,$55,$55,$55,$5D,$55,$55,$54,$54,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$15,$55,$7F,$F5,$55,$00,$01,$55,$40,$00,$00
.byte $55,$57,$57,$FF,$50,$55,$55,$55,$55,$50,$00,$05,$55,$55,$55,$55
.byte $55,$55,$51,$55,$00,$00,$00,$00,$00,$00,$00,$00,$01,$15,$55,$55
.byte $55,$55,$00,$55,$55,$50,$00,$01,$55,$55,$57,$D5,$51,$55,$55,$55
.byte $55,$50,$00,$05,$55,$55,$55,$55,$55,$55,$45,$55,$40,$00,$00,$00
.byte $00,$00,$00,$00,$05,$15,$55,$55,$55,$55,$05,$55,$55,$55,$50,$05
.byte $55,$55,$55,$55,$51,$55,$55,$55,$55,$54,$00,$05,$55,$55,$55,$55
.byte $55,$55,$45,$55,$40,$00,$00,$00,$00,$00,$00,$00,$15,$15,$55,$55
.byte $55,$55,$45,$55,$55,$55,$54,$05,$55,$55,$55,$55,$45,$55,$55,$55
.byte $55,$54,$55,$51,$55,$55,$55,$55,$55,$55,$15,$55,$50,$00,$00,$00
.byte $00,$00,$A0,$00,$15,$45,$55,$55,$55,$55,$15,$55,$55,$55,$55,$15
.byte $55,$55,$55,$55,$45,$55,$55,$55,$55,$51,$55,$51,$55,$55,$55,$55
.byte $55,$54,$55,$55,$50,$00,$00,$00,$00,$02,$A8,$00,$15,$45,$55,$55
.byte $55,$54,$55,$55,$55,$55,$55,$15,$55,$55,$55,$55,$15,$55,$55,$55
.byte $55,$51,$55,$54,$55,$55,$55,$55,$55,$51,$55,$55,$54,$00,$00,$00
.byte $00,$00,$A0,$00,$55,$45,$55,$55,$55,$51,$55,$55,$55,$55,$55,$45
.byte $55,$55,$55,$55,$15,$55,$55,$55,$55,$45,$55,$55,$15,$55,$55,$55
.byte $55,$51,$55,$55,$54,$00,$00,$00,$00,$00,$A0,$00,$55,$45,$55,$55
.byte $55,$45,$55,$55,$55,$55,$55,$45,$55,$55,$55,$55,$15,$55,$55,$55
.byte $55,$15,$55,$55,$45,$55,$55,$55,$55,$45,$55,$55,$55,$00,$00,$00
.byte $00,$00,$A0,$01,$55,$45,$55,$55,$55,$45,$55,$55,$55,$55,$55,$51
.byte $55,$55,$55,$54,$55,$55,$55,$55,$54,$55,$55,$55,$45,$55,$55,$55
.byte $55,$15,$55,$55,$55,$40,$00,$00,$00,$00,$F0,$05,$55,$45,$55,$55
.byte $55,$15,$55,$55,$55,$55,$55,$51,$55,$55,$55,$54,$55,$55,$55,$55
.byte $54,$55,$55,$55,$51,$55,$55,$55,$55,$15,$55,$55,$55,$40,$00,$00
.byte $00,$03,$FC,$15,$55,$51,$55,$55,$54,$55,$55,$55,$55,$55,$55,$54
.byte $55,$55,$55,$51,$55,$55,$55,$55,$51,$55,$55,$55,$54,$55,$55,$55
.byte $54,$55,$55,$55,$55,$53,$C0,$00,$00,$0F,$FF,$55,$55,$51,$55,$55
.byte $51,$55,$55,$55,$55,$55,$55,$54,$55,$55,$55,$51,$55,$55,$55,$55
.byte $45,$55,$55,$55,$55,$15,$55,$55,$55,$55,$55,$55,$55,$57,$F0,$00
.byte $00,$0F,$FF,$D5,$55,$51,$55,$55,$45,$55,$55,$55,$55,$55,$55,$55
.byte $15,$55,$55,$51,$55,$55,$55,$55,$15,$55,$55,$55,$55,$15,$55,$55
.byte $51,$55,$55,$55,$55,$5F,$FC,$00,$00,$3F,$FF,$F5,$55,$51,$55,$55
.byte $55,$55,$55,$55,$55,$55,$55,$55,$15,$55,$55,$45,$55,$55,$55,$55
.byte $15,$55,$55,$55,$55,$45,$55,$55,$55,$55,$55,$55,$55,$5F,$FF,$00
.byte $00,$FF,$FF,$F5,$55,$55,$55,$55,$15,$55,$55,$55,$55,$55,$55,$55
.byte $45,$55,$55,$45,$55,$55,$55,$54,$55,$55,$55,$55,$55,$55,$55,$55
.byte $55,$55,$55,$55,$55,$7F,$FF,$00,$03,$FF,$FF,$FD,$55,$51,$55,$55
.byte $55,$55,$55,$55,$55,$55,$55,$55,$45,$55,$55,$15,$55,$55,$55,$55
.byte $55,$55,$55,$55,$55,$51,$55,$55,$15,$55,$55,$55,$55,$FF,$FF,$C0
.byte $03,$FF,$FF,$FD,$55,$51,$55,$51,$55,$55,$55,$55,$55,$55,$55,$55
.byte $55,$55,$55,$15,$55,$55,$55,$45,$55,$55,$55,$55,$55,$51,$55,$55
.byte $55,$55,$55,$55,$55,$FF,$FF,$C0,$00,$2A,$AA,$95,$55,$55,$55,$41
.byte $55,$55,$55,$55,$55,$55,$55,$55,$51,$55,$55,$55,$55,$55,$55,$55
.byte $55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$6A,$AA,$00
.byte $00,$2A,$AA,$95,$55,$51,$55,$05,$55,$55,$55,$55,$55,$55,$55,$55
.byte $55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$15,$55
.byte $55,$55,$55,$55,$55,$6A,$AA,$00,$00,$2A,$0A,$95,$55,$55,$55,$55
.byte $55,$55,$55,$55,$55,$55,$55,$55,$54,$55,$51,$55,$55,$55,$51,$55
.byte $55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$6A,$AA,$00
.byte $00,$2A,$0A,$95,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55
.byte $54,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55
.byte $55,$55,$55,$55,$55,$6A,$0A,$00,$00,$2A,$AA,$95,$55,$51,$51,$55
.byte $55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$54,$55,$55
.byte $55,$55,$55,$55,$55,$55,$45,$55,$55,$55,$55,$55,$55,$6A,$0A,$00
.byte $00,$2A,$AA,$95,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55
.byte $55,$45,$45,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55
.byte $55,$55,$55,$55,$55,$6A,$AA,$00,$00,$6A,$0A,$95,$55,$55,$55,$55
.byte $55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55
.byte $55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$6A,$AA,$00
.byte $01,$6A,$0A,$95,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55
.byte $55,$54,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55
.byte $55,$55,$55,$55,$55,$6A,$AA,$00,$01,$6A,$AA,$96,$A9,$55,$6A,$95
.byte $56,$A9,$55,$6A,$95,$56,$A9,$55,$6A,$95,$56,$A9,$55,$6A,$95,$55
.byte $AA,$55,$56,$A9,$55,$5A,$A5,$55,$5A,$A5,$55,$6A,$95,$6A,$AA,$00
.byte $05,$6A,$AA,$96,$A9,$55,$6A,$95,$56,$A9,$55,$6A,$95,$56,$A9,$55
.byte $6A,$95,$56,$A9,$55,$6A,$95,$55,$AA,$55,$56,$A9,$55,$5A,$A5,$55
.byte $5A,$A5,$55,$6A,$95,$6A,$AA,$00,$15,$6A,$0A,$96,$A9,$55,$6A,$95
.byte $56,$A9,$55,$6A,$95,$56,$A9,$55,$6A,$95,$56,$A9,$55,$6A,$95,$55
.byte $AA,$55,$56,$A9,$55,$5A,$A5,$55,$5A,$A5,$55,$6A,$95,$68,$0A,$00
.byte $15,$6A,$0A,$96,$A9,$55,$6A,$95,$56,$A9,$55,$6A,$95,$56,$A9,$55
.byte $6A,$95,$56,$A9,$55,$6A,$95,$55,$AA,$55,$56,$A9,$55,$5A,$A5,$55
.byte $5A,$A5,$55,$6A,$95,$68,$0A,$00,$15,$6A,$AA,$AA,$AA,$AA,$AA,$AA
.byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
.byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$A8,$0A,$00
.byte $55,$6A,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
.byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
.byte $AA,$AA,$AA,$AA,$AA,$A8,$0A,$00,$55,$6A,$AA,$AA,$AA,$AA,$AA,$AA
.byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
.byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$A8,$0A,$00
.byte $55,$6A,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
.byte $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
.byte $AA,$AA,$AA,$AA,$AA,$A8,$0A,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$0A,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$2E,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
