# Questão 4: Escreva o procedimento do programa que ordena um vetor com N posições e mostre os elementos desse vetor em ordem crescente.
	.text
	.globl main
main:
	li $s3, 0
	
	li $v0, 4
	la $a0, len
	syscall 
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	li $v0, 4
	la $a0, ele
	syscall
	
	sll $t1, $s1, 2
	
	li $v0, 9
	la $a0, ($t1)
	syscall 
	move $s0, $v0
	
	move $s2, $zero
For: 
	slt $t0, $s2, $s1
	beqz $t0, Exit
	sll $t0, $s2, 2
	add $t0, $t0, $s0
	li $v0, 5
	syscall 
	move $t1, $v0
	sw $t1, 0($t0)
	addi $s2, $s2, 1
	j For
Exit:
	move $a0, $s0
	move $a1, $s1
	jal printVetor
	
	li $v0, 4
	la $a0, newLine
	syscall 
	
	move $a0, $s0
	move $a1, $s1
	jal ord
	
	move $a0, $s0
	move $a1, $s1
	jal printVetor
	
	li $v0, 10
	syscall
	
	.data
len: .asciiz "Informe o tamanho do vetor: "
ele: .asciiz "Inserir elemento(os)\n"
newLine: .asciiz "\n"

	.text
ord:
	addi $sp, $sp -20
	sw $ra, 0($sp)
 	sw $s0, 4($sp) 
 	sw $s1, 8($sp)
 	sw $s2, 12($sp)
 	sw $s3, 16($sp)

 	move $s0, $a0
 	move $s1, $a1

 	addi $s2, $zero, 0 
 	ForTwo:
 		addi $t1, $s1, -1
 		slt $t0, $s2, $t1
		beqz $t0, EndForTwo

 		addi $s3, $zero, 0 
 		Forthree:
 			addi $t1, $s1, -1
 			sub $t1, $t1, $s2
 			slt $t0, $s3, $t1
 			beqz $t0, EndForthree
 			sll $t4, $s3, 2 
 			add $t5, $s0, $t4
 			lw $t2, 0($t5)

 			addi $t6, $t5, 4 
 			lw $t3, 0($t6)

 			sgt $t0, $t2, $t3
 			beqz $t0, NotIf
 			move $a0, $s0
 			move $a1, $s3
 			addi $t0, $s3, 1
 			move $a2, $t0
 			jal Swap 
		
 			NotIf:
 				addi $s3, $s3, 1
 				b Forthree
 		EndForthree:
 			addi $s2, $s2, 1
 			b ForTwo
EndForTwo:
	lw $ra, 0($sp) 
 	lw $s0, 4($sp)
 	lw $s1, 8($sp)
 	lw $s2, 12($sp)
 	lw $s3, 16($sp)
 	addi $sp, $sp 20
 	jr $ra
 	
	.text
Swap:
	sll $t0, $a1, 2 
 	add $t0, $a0, $t0
 	sll $t1, $a2, 2 
 	add $t1, $a0, $t1
 	lw $t2, 0($t0) 
 	lw $t3, 0($t1)
 	sw $t2, 0($t1)
 	sw $t3, 0($t0)
 	jr $ra
 		
	.text
printVetor:
	addi $sp, $sp, -16
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $s2, 12($sp)
	
	move $s0, $a0
	move $s1, $a1
	
	move $s2, $zero
ForFour:
	slt $t0, $s2, $s1
	beqz $t0, EndForFour
	sll $t0, $s2, 2
	add $t0, $t0, $s0
	lw $a1, 0($t0)
	la $a0, space
	li $v0, 4
	syscall 
	li $v0, 1
	move $a0, $a1
	syscall 
	addi $s2, $s2, 1
	j For_2
EndForFour:	
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	jr $ra	
	.data
space: .asciiz " "
