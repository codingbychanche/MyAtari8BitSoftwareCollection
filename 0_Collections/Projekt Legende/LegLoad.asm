* BMeine.atr** Legload.src** BOOTROTINE FUER LEGENDE* DIESES PROGRAMM AB SEKTOR 1* AUF DIE BOOTDISK SCHREIBEN* ES LAED ALLE TEILE VON LEGENDE NACH* -ZEICHENSATZ* -DISPLAYLIST* -HAUPTPROGRAMM*DOSVEC	EQU 10   DOSVECTORDOSINI	EQU 12*DBUFLO	EQU 772   BUFFER LOW DBUFHI	EQU 773   BUFFER HIDAUX1	EQU 778   SEKTORNUMMER LOWDAUX2	EQU 779   SEKTORNUMMER HIDCOMND	EQU 770	 KOMMANDODSKINV	EQU 58451 IO ROTINE** BOOTDISK HEADER*	ORG $5000BEGINN	DFB 0            DUMMY BYTE	DFB (ENDE-BEGINN)/128+1 ANZ.DER SEKT	DFW $5000        LADEADRESSE	DFW INIT         INITADRESSE** TITLESCREEN ZEIGEN*	NOP	LDA #DLIST	STA 560	LDA #DLIST/256	STA 561	CLC	        ALLES OK	RTS	        BACK TO OS.** INIT DOSVECTOR*INIT	NOP	LDA #START	STA DOSVEC	STA DOSINI	LDA #START/256	STA DOSVEC+1	STA DOSINI+1	RTS              START PRG!!** DAS EIGENTLICHE PROGRAMM* NACHLADEN ALLER PROGRAMMTEILE* START    LDA #250    WARTESCHLEIFE.	STA $14LOOP	LDA $14	CMP #0	BNE LOOP*INITSIO	LDA #'R     ALLE PARAMETER	STA DCOMND  DSKINV EINSTELLEN*	LDA #100:L  STARTSEKTOR	STA DAUX1	LDA #100:H  	STA DAUX2	LDA #$A800:L	STA DBUFLO	LDA #$A800:H 	STA DBUFHI*LESE	JSR DSKINV	JSR BUFFER    BUFFER+1	JSR SEKTOR    SEKTOR+1	INC SEKTOREN  ANZ.D.GEL.SKT+1	LDA SEKTOREN	CMP #40       FERTIG?	BNE LESE      NEIN=WEITER	JMP $A800     JA START.** UNTERPROGRAMM SEKTOR UM EIN ERHOHEN*SEKTOR	CLC	LDA DAUX1	ADC #1	STA DAUX1	LDA DAUX2	ADC #0	STA DAUX2	RTS** UNTERPROGRAMM BUFFER+128*BUFFER	CLC	LDA DBUFLO	ADC #128	STA DBUFLO	LDA DBUFHI	ADC #0	STA DBUFHI	RTS** DISPLAYLIST+DATEN*DLIST	DFB 112	DFB 7+64	DFW SCREEN	DFB 65	DFW DLIST		*SCREEN	ASC %LEGENDE V1 LAED.....%*SEKTOREN	DFB 0   GELESENE SEKTORENENDE	NOP�����������������������������������������������������������������������