# Questão 2: Depois de desenvolver o algoritmo que calcula o resto de uma divisão, utilize-o como procedimento para um programa que verifica se um número é par ou ímpar.

.data
promptNumero: .asciiz "Insira um numero inteiro positivo: "
promptPar: .asciiz "\nPar"
promptImpar: .asciiz "\nImpar"

.text
main:
    # Exibir mensagem numero
    la $a0, promptNumero
    li $v0, 4
    syscall

    # Ler o inteiro inserido (numero) 
    li $v0, 5
    syscall
    
    # Salva o numero em $s0
    move $s0, $v0

    li $s1, 2         # divisor = 2
    jal resto_divisao # Chama o procedimento resto_divisao

    bne $t0, $zero, else	# se resto != $zero, Else
        # Exibir mensagem par
        li $v0, 4
        la $a0, promptPar
        syscall
    j Exit
else: # Exibir mensagem impar
      li $v0, 4
      la $a0, promptImpar
      syscall
Exit: 

    # Terminar programa
    li $v0, 10
    syscall

.text  
resto_divisao:
    move $t0, $s0                   # resto = diviendo (numero)
    addi $t1, $zero, 0              # quociente = 0

    loop: blt  $t0, $s1, exit_Loop	# se resto < divisor, Exit
          sub  $t0, $t0, $s1        # resto = resto - divisor 
          addi $t1, $t1, 1          # quociente ++
          j loop                    # retorna para o loop
    exit_Loop:
    jr $ra	
