# Questão 3: Escreva um procedimento recursivo que calcule a exponencial de um número.

.data
promptBase: .asciiz "Insira o numero inteiro positivo corresponente a base: "
promptExpoente: .asciiz "Insira o numero inteiro positivo corresponente ao expoente: "
outputResultado: .asciiz "\nResultado = "

.text
main:
    # Exibir mensagem base
    la $a0, promptBase
    li $v0, 4
    syscall

    # Ler o inteiro inserido (base) 
    li $v0, 5
    syscall
    
    # Salva o base em $s0
    move $s0, $v0

    # Exibir mensagem expoente
    la $a0, promptExpoente
    li $v0, 4
    syscall

    # Ler o inteiro inserido (expoente)
    li $v0, 5
    syscall
    
    # Salva o expoente em $s1
    move $s1, $v0

    move $t0, $s0    # resultado = base
    subi $t1, $s1, 1 # aux = expoente - 1
    jal power        # Chama o procedimento

    # Exibir mensagem resultado
    li $v0, 4
    la $a0, outputResultado
    syscall
    
    li $v0, 1     # Imprimir resutado
    la $a0, ($t0) # carrega o valor do endereco do resultado
    syscall

    # Terminar programa
    li $v0, 10
    syscall

.text 
power:
    bne $s1, $zero, else	 # se expoente != $zero, Else
    li $t0, 1                # resultado = 1
    jr $ra                   # desvia e salva o endereco de retorno do procedimento em $ra 
else: 
    mul  $t0, $t0, $s0       # resultado = resultao * base
    subi $t1, $t1, 1         # aux -- 
    bne  $t1, $zero, power   # se aux != zero, power
    jr $ra                   # desvia e salva o endereco de retorno do procedimento em $ra
exit: 
        
