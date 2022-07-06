# Questão 1: Escreva um algoritmo que calcule a divisão inteira e o resto da divivsão de dois números.

.data
promptDiviendo: .asciiz "Insira um numero inteiro positivo correspondente ao dividendo: "
promptDivisor: .asciiz "Insira um numero inteiro positivo correspondente ao divisor: "
outputQuociente: .asciiz "\nQuociente = "
outputResto: .asciiz "\nResto = "

.text 
main:
    # Exibir mensagem dividendo
    la $a0, promptDiviendo
    li $v0, 4
    syscall

    # Ler o inteiro inserido (dividendo) 
    li $v0, 5
    syscall
    
    # Salva o dividendo em $s0
    move $s0, $v0

    # Exibir mensagem divisor
    la $a0, promptDivisor
    li $v0, 4
    syscall

    # Ler o inteiro inserido (divisor)
    li $v0, 5
    syscall
    
    # Salva o divisor em $s1
    move $s1, $v0

    move $t0, $s0      # resto = diviendo
    addi $t1, $zero, 0 # quociente = 0

    loop: blt  $t0, $s1, end_loop    # se resto < divisor, Exit
          sub  $t0, $t0, $s1         # resto = resto - divisor 
          addi $t1, $t1, 1           # quociente ++
          j loop                     # retorna para o loop
    end_loop:                     

    # Exibir mensagem quociente
    li $v0, 4
    la $a0, outputQuociente
    syscall

    # Imprimir Quociente
    li $v0, 1
    move $a0, $t1
    syscall

    # Exibir mensagem resto
    li $v0, 4
    la $a0, outputResto
    syscall

    # Imprimir resto
    li $v0, 1
    move $a0, $t0
    syscall

    # Terminar programa
    li $v0, 10
    syscall
