// essa biblioteca diz que o PORTB eh endereco tal, o DDRB eh endereco tal...
#include <avr/io.h>
#include <avr/
// o programa executa o main em loop eterno
int main()
{
    // inicializacao
    DDRB = 0xff;

    while (1) {
        // loop infinito
        /*  a primeira coisa eh configurar o que eh entrada e saida
        *   usamos o DDRB para configurar a direcao dos pinos do B
        *   DDRB = _ _ _ _ _ _ _ _
        *                1  2 3 4 5 6 7 8
        *
        *   se quisessemos tornar todos saidas (tem 1 LED em cada saida)
        *   DDRB = 1  1  1  1 1 1 1 1 = 0xFF
        *                1  2 3 4 5 6 7 8
        *
        *   PORTB = _ _ _ _ _ _ _ _ = 0x00   
        *   se quisermos ligar os LEDs
        */
       PORTB = 0x00;
       _delay_ms(100);
       PORTB = 0xff;
       _delay_ms(100);
    }

    return 0;  // retorna esse valor 
}