.equ PINC, 0x06		; PINC = buttom
.equ DDRC, 0x07
.equ PORTC, 0x08	; PORTC = LED


ldi r16, 0x20
out DDRC, r16		; define DDRC as out

ldi r20, 0x00		; conteudo que tera no LED

loop:
    call delay  ; nao eh uma funcao, eh um procedimento
    call delay  ; colocamos varios delays para atrasar a troca de estados do LED
    call delay
	; Leitura do estado atual do PORTC
	in r16, PINC	; buttom

	; Operacao AND bit a bit para isolar o bit 4
	andi r16, 0x10

	; Testa a linha anterior. Se == 0, loop eterno. Se == 1, click
	brne click
	jmp loop

click:
	ldi r17, 0x20
	eor r20, r17	; na operacao xor nao podemos colocar direto o valor, por isso usamos o registrador r17

    ; escrita no PORT C
    out PORTC, r20
    jmp loop

; Load r17 with counter valeu
delay:
    ldi r17, 0xff ; carrega o r17 com 255
label1:
    dec r17
    brne label1
    ret