; Show Pic
;
; This as not part of the original data
;

	org $a800
	lda #<dlist8
	sta 560
	lda #>dlist8
	sta 561
l
	jmp l

; Graphics 8 Display- list

	dc8 = $0f	
dlist8	
	.byte $70,$70,$70
	.byte $40+dc8,a(screen)
:46	.byte dc8
	.byte $40+dc8,a(screen+2000)
:90 .byte dc8
	.byte dc8+128
	.byte $40+$02
	.byte $41,a(dlist8)
	
;____________________________________
; This was suposed to be the 
; main titel for 'legende'
;____________________________________
;
; Source Disk: BMEINE.ATR	
; Dump of	:	PICTURE.
; Format	:	Gr.8 / 62 Sektors / 8kB
; 
screen
	.byte	$00,$00,$00,$00,$00,$00,$00,$00,$00
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
	.byte	$00,$00,$00,$00,$00,$00,$00,$ee
	.byte	$fe,$00,$7c,$7c,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$ee
	.byte	$fe,$00,$7c,$7c,$3f,$fc,$3f,$3f
	.byte	$0f,$f0,$03,$f3,$3f,$ff,$3c,$0f
	.byte	$3f,$ff,$03,$c0,$3f,$ff,$3f,$3f
	.byte	$3f,$ff,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$73
	.byte	$66,$18,$ce,$ce,$0f,$0f,$0f,$c3
	.byte	$f0,$fc,$0f,$0f,$0f,$0f,$3c,$0f
	.byte	$03,$c0,$00,$f0,$0f,$0f,$0f,$c3
	.byte	$c3,$c0,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$73
	.byte	$66,$18,$ce,$ce,$0f,$0f,$0f,$0f
	.byte	$03,$fc,$0f,$00,$0f,$00,$3f,$0f
	.byte	$0f,$00,$00,$f0,$0f,$00,$0f,$0f
	.byte	$0f,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$63
	.byte	$60,$18,$e6,$e6,$0f,$0f,$0f,$3c
	.byte	$03,$cf,$03,$fc,$0f,$f0,$3f,$cf
	.byte	$3c,$00,$00,$f0,$0f,$f0,$0f,$3c
	.byte	$3c,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$63
	.byte	$60,$18,$e6,$e6,$0f,$3c,$0f,$0f
	.byte	$03,$ff,$00,$0f,$0f,$00,$3c,$ff
	.byte	$3c,$00,$00,$f0,$0f,$00,$0f,$0f
	.byte	$3c,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$63
	.byte	$78,$18,$7c,$7c,$0f,$00,$0f,$0f
	.byte	$0f,$0f,$00,$0f,$0f,$03,$fc,$3f
	.byte	$3c,$03,$00,$f0,$0f,$03,$cf,$0f
	.byte	$3c,$03,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$63
	.byte	$78,$18,$7c,$7c,$0f,$00,$0f,$03
	.byte	$cf,$0f,$0f,$0f,$0f,$0f,$3c,$0f
	.byte	$3c,$0f,$00,$f0,$0f,$0f,$0f,$03
	.byte	$fc,$0f,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$6e
	.byte	$60,$00,$ce,$ce,$3c,$00,$3c,$03
	.byte	$fc,$03,$cc,$fc,$0f,$fc,$3c,$0f
	.byte	$0f,$fc,$00,$3c,$0f,$fc,$3c,$03
	.byte	$cf,$fc,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$6e
	.byte	$60,$00,$ce,$ce,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$63
	.byte	$60,$00,$e6,$e6,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$20,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$63
	.byte	$60,$00,$e6,$e6,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$dc,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$63
	.byte	$60,$00,$7c,$7c,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$83,$80,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$63
	.byte	$60,$00,$7c,$7c,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$80,$40,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$de
	.byte	$60,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$07
	.byte	$80,$20,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$de
	.byte	$60,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$78
	.byte	$80,$1c,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$de
	.byte	$60,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$0f,$80
	.byte	$80,$02,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$01,$ff,$c0
	.byte	$80,$01,$bf,$80,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$3f,$ff,$b0
	.byte	$80,$00,$7f,$e0,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$07,$ff,$f0,$8c
	.byte	$80,$00,$3f,$f8,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$01,$ff,$ff,$80,$82
	.byte	$80,$00,$11,$fe,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$3f,$ff,$f0,$00,$81
	.byte	$00,$00,$0c,$7f,$80,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$07,$ff,$fe,$00,$00,$82
	.byte	$80,$00,$02,$1f,$e0,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$3f,$ff,$80,$00,$00,$86
	.byte	$40,$00,$01,$07,$f8,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$7f,$f0,$00,$00,$00,$84
	.byte	$40,$00,$01,$81,$fe,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$fe,$00,$00,$00,$20,$48
	.byte	$20,$00,$00,$80,$7f,$80,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$f0,$00,$00,$00,$58,$30
	.byte	$10,$00,$00,$40,$1f,$f0,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$01,$e0,$00,$00,$00,$47,$60
	.byte	$08,$00,$00,$40,$07,$fc,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$03,$e0,$00,$00,$00,$40,$e0
	.byte	$08,$00,$00,$60,$01,$ff,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$07,$c0,$00,$00,$e0,$80,$10
	.byte	$04,$00,$00,$20,$00,$3f,$c0,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$0f,$80,$00,$1e,$18,$80,$08
	.byte	$02,$00,$00,$10,$00,$0f,$f0,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$1f,$00,$03,$c0,$05,$c0,$04
	.byte	$01,$00,$00,$08,$00,$03,$fc,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$1e,$00,$04,$00,$02,$30,$02
	.byte	$00,$80,$00,$04,$00,$00,$ff,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$3c,$00,$38,$00,$00,$08,$01
	.byte	$00,$40,$00,$04,$00,$00,$3f,$c0
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$01,$ff
	.byte	$00,$7c,$00,$40,$00,$00,$06,$00
	.byte	$80,$20,$00,$04,$00,$00,$0f,$f0
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$03,$ff
	.byte	$00,$f8,$03,$80,$00,$00,$01,$00
	.byte	$40,$13,$80,$04,$00,$00,$03,$fc
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$07,$ff
	.byte	$01,$f0,$04,$03,$c0,$c0,$00,$c0
	.byte	$20,$0c,$60,$04,$00,$00,$00,$fe
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$1f,$87
	.byte	$03,$e0,$0c,$04,$30,$30,$00,$20
	.byte	$10,$14,$1c,$1c,$00,$00,$00,$3e
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$7f,$1f
	.byte	$03,$c0,$10,$08,$4c,$0c,$10,$10
	.byte	$0e,$24,$03,$e0,$00,$00,$00,$0f
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$07,$ff,$ff,$ff,$ff,$ff,$ff
	.byte	$ff,$ff,$ff,$ff,$ff,$ff,$fe,$3f
	.byte	$07,$80,$20,$71,$ca,$03,$08,$10
	.byte	$0d,$c2,$00,$00,$00,$00,$00,$0f
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$07,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte	$ff,$ff,$ff,$ff,$ff,$ff,$f8,$7e
	.byte	$0f,$80,$20,$42,$d1,$08,$84,$0c
	.byte	$0c,$01,$00,$00,$00,$00,$00,$07
	.byte	$80,$00,$00,$00,$00,$00,$00,$00
	.byte	$3f,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte	$ff,$ff,$ff,$ff,$ff,$ff,$e0,$f8
	.byte	$1f,$00,$20,$44,$60,$d4,$42,$0a
	.byte	$12,$00,$80,$00,$00,$00,$00,$07
	.byte	$c0,$00,$00,$00,$00,$00,$00,$00
	.byte	$ff,$ff,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$f0
	.byte	$3e,$00,$40,$8a,$87,$22,$22,$09
	.byte	$22,$00,$40,$00,$00,$00,$00,$03
	.byte	$c0,$00,$00,$00,$00,$00,$00,$01
	.byte	$fe,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$01,$e0
	.byte	$7c,$00,$81,$13,$0b,$01,$13,$0c
	.byte	$c1,$00,$20,$00,$00,$00,$00,$01
	.byte	$e0,$00,$00,$00,$00,$00,$00,$01
	.byte	$e0,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$01,$c0
	.byte	$78,$00,$81,$24,$16,$00,$80,$84
	.byte	$40,$80,$10,$00,$00,$00,$00,$01
	.byte	$e0,$00,$00,$00,$00,$00,$00,$01
	.byte	$c0,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$01,$c0
	.byte	$f0,$00,$42,$59,$9c,$00,$40,$84
	.byte	$00,$60,$08,$00,$00,$00,$00,$00
	.byte	$f0,$00,$00,$00,$00,$00,$00,$01
	.byte	$df,$00,$3f,$ff,$03,$fc,$3f,$ff
	.byte	$3c,$0f,$3f,$3f,$3f,$ff,$01,$c1
	.byte	$f0,$00,$22,$90,$40,$00,$20,$43
	.byte	$00,$20,$08,$00,$00,$00,$00,$00
	.byte	$f8,$00,$00,$00,$00,$00,$00,$01
	.byte	$df,$00,$3f,$ff,$03,$fc,$3f,$ff
	.byte	$3c,$0f,$3f,$3f,$3f,$ff,$01,$c3
	.byte	$e0,$00,$33,$a6,$80,$00,$40,$01
	.byte	$80,$20,$04,$00,$00,$00,$00,$00
	.byte	$78,$00,$00,$00,$00,$00,$00,$01
	.byte	$df,$00,$3f,$ff,$03,$fc,$3f,$ff
	.byte	$3c,$0f,$3f,$3f,$3f,$ff,$01,$c7
	.byte	$c0,$00,$09,$4a,$b0,$00,$20,$00
	.byte	$40,$10,$1f,$00,$00,$00,$00,$00
	.byte	$3c,$00,$00,$00,$00,$00,$00,$01
	.byte	$cf,$00,$0f,$0f,$0f,$0f,$0f,$0f
	.byte	$3c,$0f,$0f,$c3,$cf,$0f,$01,$cf
	.byte	$80,$00,$05,$56,$c0,$00,$10,$00
	.byte	$40,$08,$e0,$c0,$00,$00,$00,$00
	.byte	$3e,$00,$00,$00,$00,$00,$00,$01
	.byte	$cf,$00,$0f,$0f,$0f,$0f,$0f,$0f
	.byte	$3c,$0f,$0f,$c3,$cf,$0f,$01,$cf
	.byte	$00,$00,$04,$9c,$38,$00,$08,$00
	.byte	$40,$02,$00,$e0,$00,$00,$00,$00
	.byte	$1e,$00,$00,$00,$00,$00,$00,$01
	.byte	$cf,$00,$0f,$0f,$0f,$0f,$0f,$0f
	.byte	$3c,$0f,$0f,$c3,$cf,$0f,$01,$de
	.byte	$00,$00,$02,$40,$54,$00,$04,$00
	.byte	$40,$0c,$03,$30,$00,$00,$00,$00
	.byte	$0f,$00,$00,$00,$00,$00,$00,$01
	.byte	$cf,$00,$0f,$00,$3c,$0f,$0f,$00
	.byte	$3f,$0f,$0f,$03,$cf,$00,$01,$fe
	.byte	$00,$00,$02,$40,$d8,$00,$02,$00
	.byte	$23,$90,$04,$08,$00,$00,$00,$00
	.byte	$0f,$00,$00,$00,$00,$00,$00,$01
	.byte	$cf,$00,$0f,$00,$3c,$0f,$0f,$00
	.byte	$3f,$0f,$0f,$03,$cf,$00,$01,$fc
	.byte	$00,$00,$02,$40,$d0,$00,$01,$00
	.byte	$3c,$60,$08,$6c,$00,$00,$00,$00
	.byte	$07,$80,$00,$00,$00,$00,$00,$01
	.byte	$cf,$00,$0f,$00,$3c,$0f,$0f,$00
	.byte	$3f,$0f,$0f,$03,$cf,$00,$01,$f8
	.byte	$00,$00,$01,$41,$70,$00,$00,$80
	.byte	$20,$38,$01,$de,$00,$00,$00,$00
	.byte	$07,$c0,$00,$00,$00,$00,$00,$01
	.byte	$cf,$00,$0f,$f0,$3c,$00,$0f,$f0
	.byte	$3f,$cf,$0f,$03,$cf,$f0,$01,$f0
	.byte	$00,$00,$3f,$82,$c0,$00,$00,$80
	.byte	$40,$04,$02,$01,$00,$00,$00,$00
	.byte	$03,$c0,$00,$00,$00,$00,$00,$01
	.byte	$cf,$00,$0f,$f0,$3c,$00,$0f,$f0
	.byte	$3f,$cf,$0f,$03,$cf,$f0,$01,$c0
	.byte	$00,$00,$c1,$f1,$00,$00,$00,$81
	.byte	$80,$02,$00,$00,$80,$00,$00,$00
	.byte	$01,$e0,$00,$00,$00,$00,$00,$01
	.byte	$cf,$00,$0f,$f0,$3c,$00,$0f,$f0
	.byte	$3f,$cf,$0f,$03,$cf,$f0,$01,$c0
	.byte	$00,$01,$00,$0e,$0e,$00,$03,$f3
	.byte	$80,$01,$00,$04,$80,$00,$00,$00
	.byte	$01,$e0,$00,$00,$00,$00,$00,$01
	.byte	$cf,$00,$0f,$00,$3c,$ff,$0f,$00
	.byte	$3c,$ff,$0f,$03,$cf,$00,$01,$c0
	.byte	$00,$01,$00,$01,$f1,$00,$1c,$0c
	.byte	$40,$00,$80,$0b,$80,$00,$00,$00
	.byte	$00,$f0,$00,$00,$00,$00,$00,$01
	.byte	$cf,$00,$0f,$00,$3c,$ff,$0f,$00
	.byte	$3c,$ff,$0f,$03,$cf,$00,$01,$c0
	.byte	$00,$01,$00,$00,$00,$e0,$20,$00
	.byte	$20,$00,$40,$f2,$00,$00,$00,$00
	.byte	$00,$f8,$00,$00,$00,$00,$00,$01
	.byte	$cf,$00,$0f,$00,$3c,$ff,$0f,$00
	.byte	$3c,$ff,$0f,$03,$cf,$00,$01,$c0
	.byte	$00,$02,$00,$00,$00,$21,$c0,$00
	.byte	$20,$00,$21,$21,$00,$00,$00,$00
	.byte	$00,$78,$00,$00,$00,$00,$00,$01
	.byte	$cf,$0f,$0f,$03,$fc,$0f,$0f,$03
	.byte	$fc,$3f,$0f,$03,$cf,$03,$f7,$c0
	.byte	$00,$04,$00,$00,$00,$22,$00,$00
	.byte	$20,$00,$22,$00,$80,$00,$00,$00
	.byte	$00,$3c,$00,$00,$00,$00,$00,$01
	.byte	$cf,$0f,$0f,$03,$fc,$0f,$0f,$03
	.byte	$fc,$3f,$0f,$03,$cf,$03,$f7,$c0
	.byte	$00,$04,$00,$00,$00,$1c,$00,$00
	.byte	$10,$00,$25,$00,$7c,$00,$00,$00
	.byte	$00,$3c,$00,$00,$00,$00,$00,$01
	.byte	$cf,$0f,$0f,$03,$fc,$0f,$0f,$03
	.byte	$fc,$3f,$0f,$03,$cf,$03,$f7,$c0
	.byte	$00,$04,$00,$00,$00,$00,$00,$00
	.byte	$08,$00,$28,$80,$24,$00,$00,$00
	.byte	$00,$1e,$00,$00,$00,$00,$00,$01
	.byte	$cf,$ff,$0f,$0f,$0f,$0f,$0f,$0f
	.byte	$3c,$0f,$0f,$03,$cf,$0f,$07,$80
	.byte	$00,$08,$00,$00,$00,$00,$00,$00
	.byte	$04,$00,$70,$40,$12,$00,$00,$00
	.byte	$00,$1f,$00,$00,$00,$00,$00,$03
	.byte	$cf,$ff,$0f,$0f,$0f,$0f,$0f,$0f
	.byte	$3c,$0f,$0f,$03,$cf,$0f,$07,$80
	.byte	$00,$10,$00,$00,$00,$00,$00,$00
	.byte	$04,$00,$80,$30,$0a,$00,$00,$00
	.byte	$00,$0f,$00,$00,$00,$00,$00,$07
	.byte	$cf,$ff,$0f,$0f,$0f,$0f,$0f,$0f
	.byte	$3c,$0f,$0f,$03,$cf,$0f,$07,$00
	.byte	$00,$20,$00,$00,$00,$00,$00,$00
	.byte	$04,$01,$00,$08,$11,$00,$00,$00
	.byte	$00,$07,$80,$00,$00,$00,$00,$07
	.byte	$8f,$f0,$0f,$fc,$03,$fc,$0f,$fc
	.byte	$3c,$0f,$3c,$ff,$0f,$fc,$0f,$00
	.byte	$00,$20,$00,$00,$00,$00,$00,$00
	.byte	$08,$06,$00,$06,$21,$00,$00,$00
	.byte	$00,$07,$c0,$00,$00,$00,$00,$07
	.byte	$0f,$f0,$0f,$fc,$03,$fc,$0f,$fc
	.byte	$3c,$0f,$3c,$ff,$0f,$fc,$1f,$00
	.byte	$00,$20,$00,$00,$00,$00,$00,$00
	.byte	$08,$08,$00,$05,$42,$00,$00,$00
	.byte	$00,$03,$c0,$00,$00,$00,$00,$0f
	.byte	$0f,$f0,$0f,$fc,$03,$fc,$0f,$fc
	.byte	$3c,$0f,$3c,$ff,$0f,$fc,$3e,$00
	.byte	$00,$20,$00,$00,$00,$00,$00,$00
	.byte	$08,$30,$00,$04,$82,$00,$00,$00
	.byte	$00,$01,$e0,$00,$00,$00,$00,$1f
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$fc,$00
	.byte	$00,$40,$00,$00,$00,$00,$00,$00
	.byte	$0b,$c0,$00,$02,$04,$08,$00,$02
	.byte	$00,$01,$e0,$00,$00,$00,$00,$1e
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$1f,$ff,$f8,$00
	.byte	$00,$80,$00,$00,$00,$00,$00,$00
	.byte	$0c,$00,$00,$02,$3c,$0e,$00,$03
	.byte	$00,$00,$f0,$00,$00,$00,$00,$1c
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$07,$ff,$ff,$f0,$00
	.byte	$00,$80,$00,$00,$00,$00,$00,$00
	.byte	$71,$00,$00,$03,$c0,$09,$00,$01
	.byte	$80,$00,$f8,$00,$00,$00,$00,$3c
	.byte	$01,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte	$ff,$ff,$ff,$ff,$ff,$ff,$d0,$00
	.byte	$00,$80,$78,$00,$00,$00,$00,$00
	.byte	$80,$80,$00,$00,$00,$10,$80,$01
	.byte	$40,$00,$78,$00,$00,$00,$00,$38
	.byte	$03,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte	$ff,$ff,$ff,$ff,$fc,$00,$0c,$00
	.byte	$01,$80,$84,$00,$00,$00,$00,$01
	.byte	$00,$40,$00,$00,$00,$10,$60,$00
	.byte	$a0,$00,$3e,$00,$00,$00,$00,$38
	.byte	$0f,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte	$ff,$ff,$ff,$ff,$00,$00,$02,$00
	.byte	$01,$01,$06,$00,$00,$00,$00,$0e
	.byte	$00,$20,$00,$00,$00,$10,$10,$00
	.byte	$90,$00,$3f,$80,$00,$00,$00,$3c
	.byte	$1f,$80,$00,$00,$00,$00,$00,$00
	.byte	$00,$1f,$80,$00,$00,$00,$01,$80
	.byte	$01,$00,$11,$00,$00,$00,$00,$70
	.byte	$00,$10,$00,$00,$00,$10,$08,$00
	.byte	$48,$00,$1f,$e0,$00,$00,$00,$3c
	.byte	$ff,$80,$00,$00,$00,$00,$00,$00
	.byte	$00,$ff,$80,$00,$00,$00,$00,$40
	.byte	$01,$00,$60,$c0,$00,$7f,$e0,$80
	.byte	$00,$10,$00,$00,$00,$20,$06,$00
	.byte	$48,$00,$1f,$f0,$00,$00,$00,$3d
	.byte	$fc,$00,$00,$00,$00,$00,$00,$00
	.byte	$07,$fe,$00,$00,$00,$00,$00,$20
	.byte	$01,$00,$80,$b8,$3f,$80,$1f,$00
	.byte	$00,$10,$00,$00,$00,$20,$01,$00
	.byte	$44,$00,$0f,$fc,$00,$00,$00,$3f
	.byte	$f8,$00,$00,$00,$00,$00,$00,$00
	.byte	$1f,$f8,$00,$00,$00,$00,$00,$18
	.byte	$01,$01,$00,$43,$c0,$00,$00,$00
	.byte	$00,$08,$00,$00,$00,$20,$00,$80
	.byte	$22,$00,$02,$7e,$00,$00,$00,$3f
	.byte	$c0,$00,$00,$00,$00,$00,$00,$00
	.byte	$ff,$c0,$00,$00,$00,$00,$00,$04
	.byte	$02,$02,$00,$70,$c0,$00,$00,$00
	.byte	$00,$08,$00,$00,$00,$20,$00,$60
	.byte	$21,$00,$02,$3f,$80,$00,$00,$07
	.byte	$80,$00,$00,$00,$00,$00,$00,$0f
	.byte	$fe,$00,$00,$00,$00,$00,$00,$03
	.byte	$04,$00,$00,$0f,$00,$00,$00,$00
	.byte	$00,$04,$00,$00,$00,$20,$00,$10
	.byte	$10,$80,$02,$0f,$e0,$00,$00,$07
	.byte	$00,$00,$00,$00,$00,$00,$00,$ff
	.byte	$f8,$00,$00,$00,$00,$00,$00,$00
	.byte	$84,$00,$00,$00,$00,$18,$00,$00
	.byte	$00,$04,$00,$00,$00,$40,$00,$0c
	.byte	$10,$40,$02,$07,$f0,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$0f,$ff
	.byte	$c0,$00,$00,$00,$00,$00,$00,$00
	.byte	$64,$00,$00,$00,$00,$0c,$00,$00
	.byte	$00,$04,$00,$00,$00,$40,$00,$02
	.byte	$10,$20,$02,$01,$fc,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$ff,$fc
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$18,$00,$00,$00,$00,$03,$00,$00
	.byte	$00,$05,$80,$00,$00,$40,$00,$01
	.byte	$08,$10,$02,$00,$7e,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$07,$ff,$c0
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$10,$00,$00,$00,$00,$00,$80,$80
	.byte	$00,$04,$70,$00,$00,$40,$00,$00
	.byte	$c8,$08,$02,$00,$3f,$80,$00,$00
	.byte	$00,$00,$00,$00,$00,$7f,$fc,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$10,$00,$00,$00,$00,$00,$63,$00
	.byte	$00,$04,$0e,$00,$00,$80,$00,$00
	.byte	$24,$04,$02,$00,$0f,$e0,$00,$00
	.byte	$00,$00,$00,$00,$07,$ff,$c0,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$20,$00,$00,$00,$00,$00,$1c,$00
	.byte	$00,$04,$01,$c0,$00,$80,$00,$00
	.byte	$14,$02,$02,$00,$07,$f0,$00,$00
	.byte	$00,$00,$00,$00,$7f,$fe,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$20,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$04,$00,$38,$00,$80,$00,$00
	.byte	$0e,$01,$02,$00,$01,$fc,$00,$00
	.byte	$00,$00,$00,$01,$ff,$e0,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$20,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$02,$00,$07,$00,$80,$00,$00
	.byte	$02,$00,$82,$00,$00,$7f,$00,$00
	.byte	$00,$00,$00,$07,$fe,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$20,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$01,$00,$00,$e1,$00,$00,$00
	.byte	$00,$00,$82,$00,$00,$3f,$80,$00
	.byte	$00,$00,$00,$0f,$e0,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$10,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$01,$00,$00,$1d,$00,$00,$00
	.byte	$00,$00,$42,$00,$00,$0f,$e0,$00
	.byte	$00,$00,$00,$3f,$80,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$10,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$01,$80,$00,$03,$00,$00,$00
	.byte	$00,$00,$22,$00,$00,$03,$f0,$00
	.byte	$00,$00,$00,$7e,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$10,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$80,$00,$00,$00,$00,$00
	.byte	$00,$00,$12,$00,$00,$01,$fc,$00
	.byte	$00,$00,$01,$fc,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$10,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$c0,$00,$00,$00,$00,$00
	.byte	$00,$00,$0a,$00,$00,$00,$7f,$00
	.byte	$00,$00,$03,$f0,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$10,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$40,$00,$00,$00,$00,$00
	.byte	$00,$00,$06,$00,$00,$00,$3f,$00
	.byte	$00,$00,$0f,$e0,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$10,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$40,$00,$00,$00,$00,$00
	.byte	$00,$00,$02,$00,$00,$00,$0f,$00
	.byte	$00,$00,$1f,$80,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$10,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$40,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$03,$00
	.byte	$00,$00,$7f,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$10,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$40,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$fc,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$10,$00,$00,$00,$00,$00,$00,$70
	.byte	$00,$00,$40,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$03,$f8,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$08,$00,$7e,$00,$00,$00,$00,$88
	.byte	$00,$00,$40,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$07,$e0,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$08,$01,$83,$80,$00,$00,$0f,$04
	.byte	$00,$00,$20,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$1f,$c0,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$08,$02,$00,$c0,$00,$00,$10,$04
	.byte	$00,$00,$10,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$3f,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$0b,$fc,$00,$20,$00,$00,$60,$42
	.byte	$00,$00,$10,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$7e,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$08,$00,$3c,$1f,$00,$00,$80,$a1
	.byte	$00,$00,$10,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$01,$f8,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$08,$00,$64,$00,$ff,$01,$01,$19
	.byte	$00,$00,$10,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$03,$f0,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$08,$00,$82,$00,$00,$c1,$0e,$09
	.byte	$80,$00,$10,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$0f,$e0,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$10,$00,$83,$00,$00,$22,$08,$18
	.byte	$40,$00,$08,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$1f,$80,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$20,$00,$81,$00,$00,$10,$18,$20
	.byte	$40,$00,$04,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$7f,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$40,$01,$81,$00,$00,$08,$26,$20
	.byte	$40,$00,$02,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$fc,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$c0,$00,$81,$00,$00,$09,$31,$20
	.byte	$20,$00,$01,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$03
	.byte	$f8,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$80,$00,$42,$00,$00,$09,$a8,$e0
	.byte	$10,$00,$01,$00,$1e,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$07
	.byte	$e0,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$80,$00,$7c,$00,$00,$09,$64,$40
	.byte	$08,$00,$72,$07,$e1,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$1f
	.byte	$c0,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$9f,$c0,$00,$00,$00,$1a,$03,$80
	.byte	$08,$01,$8f,$b8,$00,$e0,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$3f
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$84,$20,$00,$0f,$f0,$66,$00,$80
	.byte	$08,$06,$00,$40,$00,$1c,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$fe
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$01
	.byte	$84,$10,$00,$70,$0f,$b1,$01,$00
	.byte	$08,$18,$00,$20,$7e,$02,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$f8
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$01
	.byte	$04,$0c,$03,$80,$00,$20,$81,$00
	.byte	$0c,$20,$00,$1f,$81,$01,$80,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$f0
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$03
	.byte	$04,$03,$fc,$00,$00,$20,$81,$00
	.byte	$02,$41,$f8,$08,$00,$e0,$40,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$c0
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$04
	.byte	$04,$00,$00,$00,$00,$20,$c0,$80
	.byte	$0c,$86,$07,$04,$00,$10,$20,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$38
	.byte	$0c,$00,$00,$00,$00,$21,$20,$40
	.byte	$1b,$08,$00,$84,$00,$08,$10,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$c0
	.byte	$34,$00,$00,$00,$00,$22,$18,$20
	.byte	$2c,$30,$00,$34,$00,$04,$10,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$01,$00
	.byte	$20,$00,$08,$00,$00,$14,$04,$20
	.byte	$54,$40,$00,$48,$00,$04,$10,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$07,$00
	.byte	$20,$80,$10,$00,$fe,$18,$06,$41
	.byte	$90,$a0,$00,$40,$00,$02,$10,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$08,$00
	.byte	$40,$80,$20,$03,$01,$98,$02,$82
	.byte	$21,$08,$00,$20,$00,$01,$08,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$10,$00
	.byte	$41,$00,$20,$1c,$00,$68,$03,$04
	.byte	$62,$04,$01,$10,$00,$01,$08,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$20,$00
	.byte	$41,$00,$40,$20,$00,$10,$04,$08
	.byte	$c4,$02,$00,$cc,$00,$01,$08,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$40,$00
	.byte	$41,$00,$c0,$40,$00,$08,$08,$11
	.byte	$08,$02,$00,$42,$00,$01,$08,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$80,$00
	.byte	$81,$00,$80,$80,$00,$04,$10,$22
	.byte	$18,$02,$00,$42,$00,$01,$08,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$03,$00,$00
	.byte	$80,$80,$81,$00,$00,$02,$20,$24
	.byte	$20,$01,$00,$84,$00,$01,$08,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$04,$00,$00
	.byte	$80,$80,$81,$00,$00,$02,$20,$46
	.byte	$40,$01,$01,$0c,$00,$01,$10,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$08,$00,$00
	.byte	$80,$81,$01,$00,$00,$02,$20,$8d
	.byte	$80,$01,$00,$b0,$00,$02,$10,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$10,$00,$00
	.byte	$80,$41,$01,$00,$00,$01,$40,$88
	.byte	$00,$00,$00,$44,$00,$04,$10,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$20,$00,$00
	.byte	$40,$21,$02,$00,$00,$01,$81,$10
	.byte	$00,$02,$01,$fb,$00,$04,$10,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$40,$00,$00
	.byte	$20,$21,$02,$00,$00,$01,$82,$10
	.byte	$00,$02,$1e,$00,$f0,$08,$10,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$80,$00,$00
	.byte	$30,$21,$82,$00,$00,$00,$82,$10
	.byte	$00,$02,$60,$18,$08,$08,$30,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$01,$00,$00,$00
	.byte	$10,$30,$82,$00,$00,$00,$84,$10
	.byte	$00,$01,$80,$47,$c8,$08,$40,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$01,$00,$00,$00
	.byte	$08,$10,$82,$00,$00,$00,$84,$10
	.byte	$00,$03,$01,$90,$30,$10,$40,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$06,$00,$00,$00
	.byte	$0c,$10,$82,$00,$00,$00,$84,$08
	.byte	$00,$0c,$02,$50,$00,$20,$40,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$04,$00,$00,$00
	.byte	$04,$08,$42,$00,$00,$00,$84,$08
	.byte	$00,$10,$fd,$60,$00,$c0,$80,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$08,$00,$00,$00
	.byte	$04,$04,$41,$00,$00,$01,$02,$04
	.byte	$00,$21,$10,$80,$01,$01,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$08,$00,$00,$00
	.byte	$02,$00,$01,$00,$00,$00,$81,$02
	.byte	$00,$42,$7f,$00,$06,$02,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$10,$00,$00,$00
	.byte	$01,$00,$00,$80,$00,$00,$c0,$81
	.byte	$00,$88,$00,$00,$08,$04,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$20,$00,$00,$00
	.byte	$00,$80,$00,$80,$00,$00,$20,$40
	.byte	$81,$10,$00,$00,$70,$08,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$40,$00,$00,$00
	.byte	$00,$7c,$00,$80,$00,$00,$10,$30
	.byte	$60,$a0,$00,$01,$80,$10,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$80,$00,$00,$00
	.byte	$00,$43,$80,$80,$00,$00,$08,$08
	.byte	$10,$40,$00,$02,$00,$60,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$01,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$01,$00,$00,$00,$00
	.byte	$00,$80,$61,$00,$00,$00,$04,$04
	.byte	$08,$00,$00,$0c,$01,$80,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$06,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$02,$00,$00,$00,$00
	.byte	$01,$00,$13,$00,$00,$00,$03,$02
	.byte	$07,$c0,$00,$30,$06,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$18,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$02,$00,$00,$00,$00
	.byte	$06,$00,$0c,$80,$00,$00,$01,$01
	.byte	$00,$20,$1f,$c0,$08,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$60,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$04,$00,$00,$00,$00
	.byte	$18,$00,$00,$40,$00,$00,$00,$e0
	.byte	$e0,$10,$e0,$00,$30,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$01,$80,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$08,$00,$00,$00,$00
	.byte	$f0,$00,$00,$20,$00,$00,$00,$10
	.byte	$10,$0f,$00,$03,$c0,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$06,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$10,$00,$00,$00,$0f
	.byte	$80,$00,$00,$10,$00,$00,$00,$08
	.byte	$0f,$80,$00,$18,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$18,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$20,$00,$00,$00,$10
	.byte	$00,$00,$00,$0f,$00,$00,$00,$04
	.byte	$00,$40,$0f,$e0,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$60,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$40,$00,$00,$00,$60
	.byte	$00,$00,$00,$10,$c0,$00,$00,$02
	.byte	$00,$20,$10,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$01,$80,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$80,$00,$00,$07,$c0
	.byte	$00,$00,$00,$10,$60,$00,$00,$01
	.byte	$80,$1f,$e0,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$06,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$01,$00,$00,$00,$18,$00
	.byte	$00,$00,$00,$10,$10,$00,$00,$00
	.byte	$fc,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$18,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$02,$00,$00,$00,$60,$00
	.byte	$00,$00,$00,$20,$0c,$00,$00,$00
	.byte	$83,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$60,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$02,$00,$00,$01,$80,$00
	.byte	$00,$00,$00,$40,$06,$00,$00,$00
	.byte	$80,$c0,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$01,$80,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$02,$00,$00,$02,$00,$00
	.byte	$00,$00,$00,$40,$09,$00,$00,$01
	.byte	$00,$20,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$06,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$04,$00,$00,$06,$00,$00
	.byte	$00,$00,$00,$40,$10,$c0,$00,$01
	.byte	$00,$10,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$18,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$08,$00,$00,$04,$00,$00
	.byte	$00,$00,$00,$80,$20,$70,$00,$02
	.byte	$00,$10,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$60,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$08,$00,$00,$0c,$00,$00
	.byte	$00,$00,$01,$00,$40,$10,$00,$04
	.byte	$00,$10,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$01,$80,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$08,$00,$00,$08,$00,$00
	.byte	$00,$00,$02,$00,$40,$08,$00,$04
	.byte	$00,$10,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$06,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$08,$00,$00,$10,$00,$00
	.byte	$00,$00,$04,$00,$80,$04,$00,$04
	.byte	$00,$10,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$08,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$08,$00,$00,$20,$00,$00
	.byte	$00,$00,$04,$01,$00,$02,$00,$08
	.byte	$00,$10,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$10,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$08,$00,$00,$c0,$00,$00
	.byte	$00,$00,$04,$02,$00,$02,$00,$00
	.byte	$00,$20,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$10,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$08,$00,$00,$80,$00,$00
	.byte	$00,$00,$08,$04,$00,$01,$80,$10
	.byte	$00,$30,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$20,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$08,$00,$01,$00,$00,$00
	.byte	$00,$00,$10,$08,$00,$00,$c0,$20
	.byte	$00,$28,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$40,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$10,$00,$00,$80,$00,$00
	.byte	$00,$00,$10,$08,$00,$00,$20,$40
	.byte	$00,$24,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$80,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$10,$00,$00,$80,$00,$00
	.byte	$00,$00,$10,$08,$00,$00,$18,$80
	.byte	$00,$42,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$80,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$20,$00,$00,$80,$00,$00
	.byte	$00,$00,$20,$10,$00,$00,$05,$00
	.byte	$00,$81,$00,$00,$00,$00,$00,$00
	.byte	$00,$01,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$20,$00,$00,$80,$00,$00
	.byte	$00,$00,$40,$10,$00,$00,$03,$00
	.byte	$01,$00,$80,$00,$00,$00,$00,$00
	.byte	$00,$02,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$20,$00,$00,$40,$00,$00
	.byte	$00,$00,$80,$20,$00,$00,$02,$00
	.byte	$03,$00,$40,$00,$00,$00,$00,$00
	.byte	$00,$02,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$50,$00,$00,$20,$00,$00
	.byte	$00,$00,$80,$40,$00,$00,$01,$00
	.byte	$04,$00,$20,$00,$00,$00,$00,$00
	.byte	$00,$04,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$88,$00,$00,$10,$00,$00
	.byte	$00,$00,$81,$80,$00,$00,$00,$80
	.byte	$18,$00,$10,$00,$00,$00,$00,$00
	.byte	$00,$08,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$84,$00,$00,$10,$00,$00
	.byte	$00,$01,$02,$00,$00,$00,$00,$63
	.byte	$e0,$00,$08,$00,$00,$00,$00,$00
	.byte	$00,$08,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$83,$c0,$00,$70,$00,$00
	.byte	$00,$02,$04,$00,$00,$00,$00,$1c
	.byte	$70,$00,$04,$00,$00,$00,$00,$00
	.byte	$00,$10,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$80,$30,$7f,$88,$00,$00
	.byte	$00,$04,$04,$00,$00,$00,$00,$00
	.byte	$0c,$00,$02,$00,$00,$00,$00,$00
	.byte	$00,$20,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$01,$00,$0f,$00,$08,$00,$00
	.byte	$00,$08,$08,$00,$00,$00,$00,$00
	.byte	$02,$00,$03,$00,$00,$00,$00,$00
	.byte	$00,$40,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$01,$00,$00,$00,$08,$00,$00
	.byte	$00,$08,$30,$00,$00,$00,$00,$00
	.byte	$01,$00,$00,$80,$00,$00,$00,$00
	.byte	$00,$40,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$01,$00,$00,$00,$08,$00,$00
	.byte	$00,$04,$40,$00,$00,$00,$00,$00
	.byte	$00,$c0,$00,$80,$00,$00,$00,$00
	.byte	$03,$80,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$01,$00,$00,$00,$08,$00,$00
	.byte	$00,$02,$80,$00,$00,$00,$00,$00
	.byte	$00,$30,$00,$40,$00,$00,$00,$00
	.byte	$3c,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$01,$00,$00,$00,$08,$00,$00
	.byte	$00,$03,$00,$00,$00,$00,$00,$00
	.byte	$00,$10,$00,$40,$00,$00,$00,$07
	.byte	$c0,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$80,$00,$00,$08,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$08,$00,$40,$00,$00,$00,$78
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$e0,$00,$00,$08,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$04,$00,$40,$00,$00,$0f,$80
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$10,$00,$00,$08,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$02,$00,$20,$00,$00,$f0,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$00,$00,$00,$0f,$ff,$ff,$00
	.byte	$00,$00,$0c,$00,$00,$10,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$04,$00,$10,$00,$1f,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$01,$ff,$ff,$ff,$f0,$00,$00,$ff
	.byte	$c0,$00,$02,$00,$03,$e0,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$00
	.byte	$00,$08,$00,$10,$01,$e0,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00,$ff
	.byte	$fe,$00,$00,$00,$00,$00,$00,$00
	.byte	$3f,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte	$ff,$ff,$ff,$ff,$fe,$00,$00,$00
	.byte	$00,$00,$00,$00,$00,$00,$00