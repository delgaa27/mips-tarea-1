# Tarea de MIPS \#1

Ejercicios de lenguaje ensamblador. Más información en [el blog](https://la35.net/orga/mips-branchs.html). Para probar los programas pueden usar el SPIM.

## Ejercicios

Forkear este repo e implementar los siguientes programas en _assembler_ de MIPS. Recuerden comentar el código.

1. Un programa que imprima en consola los primeros 20 números de Fibonacci.
2. Un programa que calcule el factorial de un número ingresado por el usuario.
3. Un programa que muestre los múltiplos de 3 y de 5 (o de ambos) para los primeros 100 números naturales.


EJERCICIO 1

.data
newline: .asciiz "\n"

.text
.globl main
main:
  li         $s0, 0              #Almacena 0 en s0
  li         $s1, 1              #Almacena 1 en s1
  
  #Imprime lo almacenado en s0
  li         $v0, 1
  move       $a0, $s0
  syscall                        

  #Imprime \n
  li         $v0, 4
  la         $a0, newline
  syscall

  #Imprime lo almacenado en s1
  li         $v0, 1
  move       $a0, $s1
  syscall

  #Imprime \n 
  li         $v0, 4
  la         $a0, newline
  syscall
  
  li         $s3, 18            #Almacena el 18 en s3

  #Loop que cumple el ciclo for
  loop:
  beq        $s3, $zero, exit       
  add        $s2, $s0, $s1      #s2 = s0 + s1
  #Imprime lo almacenado en s2
  li         $v0, 1
  move       $a0, $s2
  syscall                      
  #Imprime \n
  li         $v0, 4
  la         $a0, newline
  syscall
  move       $s0, $s1
  move       $s1, $s2
  
  addi       $s3, $s3, -1      #Resta 1

  j loop

  exit:
  li         $v0, 10
  syscall


EJERCICIO 2

.data
prompt: .asciiz "INGRESE NUMERO DEL FACTORIAL A CALCULAR:  
space:  .asciiz "\n"        

.text
.globl main
main:

li		    $v0, 4		   
la		    $a0, prompt
syscall                     
li          $v0, 5         
syscall                     
move        $t0, $v0        

li		    $v0, 4		    
la		    $a0, space		
syscall                    

addi		$t1, $t0, -1    # $t1 = $t0-- (number - 1)

loop:
beq		   $t1, $zero, exit # if $t1 == 0 go to exit
mul         $t0, $t0, $t1   # number *=  number-1
addi		$t1, $t1, -1    # $t1 = $t0-- (number - 1)
j           loop            

exit:
li          $v0, 1         
move        $a0, $t0        
syscall                     

li		    $v0, 10
syscall                   

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
