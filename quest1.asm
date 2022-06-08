# Questão 1: Escreva um algoritmo que calcule a divisão inteira e o resto da divivsão de dois números.

.data 
	dividendo: .asciiz "Informe um número inteiro positivo >DIVIDENDO: "
	divisor: .asciiz "\nInforme um número inteiro positivo >DIVISOR: "
	quociente: .asciiz "\nQuociente: "
	resto_divisao: .asciiz "\nResto: "
.text 

main:
	
	#Dividendo
	li $v0,4 
	la $a0,dividendo 
	syscall
	
	li $v0,5 
	syscall
	
	move $s0,$v0 
	
	#Divisor
	li $v0,4 
	la $a0,divisor 
	syscall
	
	li $v0,5 
	syscall
	
	move $s1,$v0 
	
	move $s2,$s0 #resto = dividendo
	li $s3,0 #quociente = 0
	
	#Realiza o calculo
	 Loop:
	 slt $t0,$s2,$s1      #t0 = s2 < s1 (resto < divisor)
	 bne $t0,$zero,Exit   #se t0 != 0, Exit
	 sub $s2,$s2,$s1      #s2 = s2 - s1 (resto = resto - divisor)
	 addi $s3,$s3,1       #s3 = s3 + 1 (quociente + 1)
	 j Loop             
	 Exit: 
		
	#print quociente
	li $v0,4
	la $a0,quociente
	syscall
	
	li $v0,1
	move $a0,$s3
	syscall
	
	#print resto
	li $v0,4
	la $a0,resto_divisao
	syscall
	
	li $v0,1
	move $a0,$s2
	syscall
	
	#Termina o programa
  	li $v0, 10
	syscall 