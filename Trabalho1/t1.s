.global _start @rotulo para o ligador

_start: @inicio do programa

@vamos ler a frase para ser criptografada
mov r0, #0 @No site diz que para leitura, r0 tem que ter o valor 0 (stdin)
ldr r1, =buffer @reg1 deve conter o endereço inicial de um vetor onde serão armazenados os bytes lidos
ldr r2, =len @reg2 deve conter o número de bytes a serem lidos
mov r7, #3 @No site diz que para escrita, r7 tem que estar com #3 para leitura
svc #0x55 @executa a syscall
mov	r2, r0 @ número de bytes a serem lidos

@Criptografar a mensagem -- TUDO ERRADO!!!!
@ldr r1, =buffer @reg1 contém o endereço inicial da mensagem
@ldr r2, [r1]
@add r2, #2 @teste



@vamos escrever a mensagem no display para testar
mov     r0, #1      @r0 agora é stdout, ou seja, write
ldr     r1, =buffer @endereço inicial da frase
mov     r7, #4      @write é syscall #4
svc     0x55        @executa syscall

@precisamos de um espaço na memória para armazenar os caracteres lidos
buffer: .skip 256 @reserva 256 bytes na memória para o buffer (posso escrever uma frase até 256 dígitos)
len = . - buffer
