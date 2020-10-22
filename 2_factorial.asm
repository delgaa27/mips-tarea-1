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

