EJERCICIO 3

  .data
salto: .asciiz "\n"	#Salta Línea 

.text
.globl main
main:
	li $t0, 1                        #Declara inicio
	li $s0, 101                      #Declara final
#-----------------------------------------------------------------------------------------------------------
verificar:                         #Verifica si t0 es mutliplo de 3 o de 5
	beq $t0, $s0, exit               #Pregunta si la variable inicial es igual a la variable final. Si es así, finaliza 
	rem $t1, $t0, 5                  #Si no se cumple lo anterior, hace t0 % 5 y lo guarda en t1
	beq $t1, $zero, multiplos        #Si t1 = 0, entonces t0 es multiplo de 5. Va a multiplos
	rem $t1, $t0, 3				           #Si no se cumple lo anterior, hace t0 % 3 y lo guarda en t1
	beq $t1, $zero, multiplos	       #Si t1 = 0, entonces t0 es multiplo de 3. Va a multiplos

	#Si no se cumple nada , t0 no es multiplo de 3 o 5. Pasa al siguiente numero
	addi $t0, $t0, 1                 #Añade 1 a t0

	j verificar                      #Vuelve a verificar
#-----------------------------------------------------------------------------------------------------------
multiplos:                         #Imprime t0
	li $v0, 1                        #Prepara para imprimir entero
	add $a0, $t0, $zero             
	syscall                          #Imrpime t0

	li $v0, 4                        #Prepara para imprimir string
	la $a0, salto                    #Guarda dirección del string en a0
	syscall                          #Imprime string

	addi $t0, $t0, 1                 #t0 + 1

	j verificar                      #Vuelve a verificar
#-----------------------------------------------------------------------------------------------------------
#Finalizo el programa
exit:
	li $v0, 10
	syscall
