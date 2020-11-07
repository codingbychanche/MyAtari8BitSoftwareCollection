; DIRSORTPROGRAMM; (ZUM NEUORDNEN DES DIRECTORYS;			   					BF'88;-----------------------------------------; Original:			1988; †berarbeite: 		13.6.2014; Original: 		EMEINE.ATR; Original Source:	DIRSORT.SRC ;-----------------------------------------;; DISK IO EQUATES;DBUFLO	EQU 772   			;BUFFER LOW DBUFHI	EQU 773   			;BUFFER HIDAUX1	EQU 778   			;SEKTORNUMMER LOWDAUX2	EQU 779   			;SEKTORNUMMER HIDCOMND	EQU 770	 			;KOMMANDODSKINV	EQU 58451 			;IO ROTINEDIR		EQU 205   			;ZEIGER AUF DIR.BRAM	EQU 207   			;ZEIGER AUF BILDRAM.NDIR	EQU 203;; START;	ORG $A800	JMP STARTANZAHL		.byte 1ZEILE		.byte 1ZEILE2		.byte 16SEKTOREN	.byte 0EINTRAG		.byte 1BUFF		.byte 0,0,0DLIST	.byte 112		.byte 6+64		.word TITEL		.byte 112		.byte 2+64		.word WAHL		.byte 0		.byte 2+64		.word SCREEN		.byte 2,2,2,2,2,2,2,2,2,2,2,2		.byte 2,2,2,0		.byte 2+64		.word MENUE		.byte 0,2,0,2,0,2,0,2,65		.word DLIST ;TITEL	.byte "      DIRSORTER     "WAHL	.byte "     Altes Dir.          Neues Dir.     "MENUE	.byte "STICK AUF AB:Auswahl eines eintrages    "		.byte "TRIGGER     :Eintrag uebernehmen        "		.byte "OPTION TASTE:Leerstelle einfuegen       "		.byte "START TASTE :Neues Directory schreiben  "		.byte "SELECT TASTE:Dos                        "B		ORG *+20SCREEN	ORG *+1000SEKBUFF	ORG *+1200TABELLE	ORG *+64;; START PROGRAMM.; INIT;START 	LDA #<DLIST  		;DISPLAYLIST EIN.	STA 560	LDA #>DLIST	STA 561;	LDA #1      		;PLAYER	STA 53261   		;ALS TRENNSTRICH	LDA #121    		;DARSTELLEN	STA 53248;	LDA #<SCREEN 		;BILDRAMADRESSE	STA BRAM      		;EINTRAGEN.	LDA #>SCREEN	STA BRAM+1	LDA #<SEKBUFF-16 	;ZEIGER AUF	STA DIR        		;DIRECTORY.	LDA #>SEKBUFF-16 	STA DIR+1	LDA #<NBUFF-16	STA NDIR	LDA #>NBUFF-16	STA NDIR+1	LDY #2        		;PFEIL	LDA #$3D-32   		;AUSGEBEN.	STA (BRAM),Y	INY	LDA #$3E-32	STA (BRAM),Y;	LDX #0FILL		LDA #'.'	STA SEKBUFF,X	STA BLKBUFF,X	INX	BNE FILL	LDX #0FILL2		STA SEKBUFF+255,X	STA BLKBUFF+255,X	INX	BNE FILL2		LDX #0CLEAR	LDA #0	STA TABELLE,X	INX	CPX #64	BNE CLEAR	;	JSR READDIR	JSR BREENTR   	;ADR BERECHNEN	JSR OUTCHR    	;AUSGABE;; MAINPRG.; -ABFRAGE DER TASTATUR; -NEUORDNEN DES DIRS;STICK		LDA 632	CMP #14	BNE NOT14	JSR SCRUP	JMP STICKNOT14		CMP #13	BNE NOT13	JSR SCRDWNNOT13		LDA 644	CMP #0	BNE NOT0	JSR COPY	JSR WAIT	JMP STICKNOT0		LDA 53279	CMP #6	BNE NOT4	JSR SAVE	JSR WAITNOT4		JMP STICK;; SCROLL DIR UP;SCRUP		LDA ZEILE	CMP #64	BNE NOT64	JMP STICKNOT64		INC ZEILE	INC EINTRAG	JSR BREENTR	JSR OUTCHR	JSR WAIT	RTS;; SCROLL DIR DOWN;SCRDWN		LDA ZEILE	CMP #1	BNE NOT1	JMP STICK;NOT1		DEC ZEILE	DEC EINTRAG	JSR BREENTR	JSR OUTCHR	JSR WAIT	RTS;; LEERZEILE EINFUEGEN;BLANK		RTS;; UEBERNAHME EINES EINTRAGES;COPY		LDX EINTRAG   		;PRUEFEN	LDA TABELLE,X 		;OB EINTRAG 	CMP #1        		;SCHON IN	BNE NOTUSED   		;DAS NEUE DIR	LDA #55       		;UEBERNOMMEN	STA 712       		;WURDE.	JSR WAIT      		;WENN JA RAND	LDA #0        		;BLINKEN LASSEN	STA 712       		;UND RTS.	RTS;NOTUSED		JSR BREENTR 		;ADR BERECHNEN	LDY #0COPYLOP		LDA (DIR),Y	STA (NDIR),Y	INY	CPY #16	BNE COPYLOP;	CLC	LDA BRAM	ADC #20	STA BRAM	LDA BRAM+1	ADC #0	STA BRAM+1	LDA DIR	STA BUFF	LDA DIR+1	STA BUFF+1	LDA ZEILE	STA BUFF+2	LDA ZEILE2	STA ZEILE	SEC	LDA NDIR	SBC #240	STA DIR	LDA NDIR+1	SBC #0	STA DIR+1	DEC ZEILE;	JSR BREENTR	JSR OUTCHR	CLC	LDA NDIR	ADC #16	STA NDIR	LDA NDIR+1	ADC #0	STA NDIR+1	LDA BUFF	STA DIR	LDA BUFF+1	STA DIR+1	LDA ZEILE	STA ZEILE2	LDA BUFF+2	STA ZEILE	LDA #<SCREEN	STA BRAM	LDA #>SCREEN	STA BRAM+1;		LDY #5INVERT		LDA (DIR),Y 			;AUSGEWAEHLTEN	ORA #128    			;EINTRAG 	STA (DIR),Y 			;INVERTIEREN.	INY	CPY #16	BNE INVERT	JSR OUTCHR  			;AUSGABE	LDX EINTRAG	LDA #1        			;KENNZEICHENUNG	STA TABELLE,X 			;FUER UEBERNAME.	RTS;; SUBROTINES;; LESE DIRECTORY;READDIR		LDA #0	STA SEKTOREN	LDA #<361	STA DAUX1	LDA #>361	STA DAUX2	LDA #<SEKBUFF	STA DBUFLO	LDA #>SEKBUFF	STA DBUFHI	LDA #'R'	STA DCOMNDLESE		JSR DSKINV	JSR BUFFER	JSR SEKTOR	LDA SEKTOREN	CMP #4	BNE LESE	RTS;; NEUES DIRECTORY SCHREIBEN;SAVE		LDA #<361	STA DAUX1	LDA #>361	STA DAUX2	LDA #<NBUFF	STA DBUFLO	LDA #>NBUFF	STA DBUFHI	LDA #'W'	STA DCOMND	LDA #1	STA SEKTORENSAVELOP		JSR DSKINV	JSR BUFFER	JSR SEKTOR	LDA SEKTOREN	CMP #4	BNE SAVELOP	RTS;; ADRESSE EINES DIREINTRAGES IM; BUFFER ERRECNHEN;BREENTR		LDX #0NEXTENTR		LDY #5      			;ZEILE*16	CLC	LDA DIR	ADC #16	STA DIR	LDA DIR+1	ADC #0	STA DIR+1	INX	CPX ZEILE	BNE NEXTENTR	RTS;; AUSGABE DES DIRECTORYS AUF DEM ; BILDSCHIRM;OUTCHR		LDY #0      			;PRUEFEN OB 	LDA (DIR),Y 			;EINTRAG GELOESCHT	CMP #128    			;ODER DIR 	BNE OUTOK   			;ZUE ENDE IST.	JMP NOUT	;OUTOK		LDY #5OUTPUT		SEC          			;15 ZEILEN	LDA (DIR),Y  			;AB ANZAHL*16	SBC #32      			;AUSGEBEN.	STA (BRAM),Y	INY	CPY #16	BNE OUTPUT;NOUT		LDA ANZAHL  			;FERTIG ?	CMP #16	BNE NOTEND;; ENDE AUSGABE;	LDA #<SCREEN			;BILDRAMADRESSE	STA BRAM	     		;ZUREUCKSETZEN.	LDA #>SCREEN	STA BRAM+1	LDA #<SEKBUFF 			;ZEIGER AUF	STA DIR	      			;DIR.		LDA #>SEKBUFF 			;ZUREUCK-	STA DIR+1      			;SETZEN	LDA #1	STA ANZAHL	RTS	     				;RETURN.;NOTEND		CLC         			;BILDRAM+40	LDA BRAM	ADC #40	STA BRAM	LDA BRAM+1	ADC #0	STA BRAM+1	INC ANZAHL	LDY #5	CLC	LDA DIR  				; ZEIGER AUF DIR+16	ADC #16	STA DIR	LDA DIR+1	ADC #0	STA DIR+1	JMP OUTPUT 				;NAECHSTER->;; SUBROTINE SEKTOREN ERHOHEN;SEKTOR		CLC	LDA DAUX1	ADC #1	STA DAUX1	LDA DAUX2	ADC #0	STA DAUX2	INC SEKTOREN	RTS;; SUBROTINE BUFFER+125;BUFFER		CLC	LDA DBUFLO	ADC #128	STA DBUFLO	LDA DBUFHI	ADC #0	STA DBUFHI	RTS;; WARTESCHLEIFE;WAIT		LDA #250	STA $14LOOP	LDA $14	BNE LOOP	RTSBLKBUFF		ORG *+230NBUFF		ORG *+1000