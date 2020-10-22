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


