.data 
a: .word 1, 2, 3, 4, 5
.text
j start


#la $s1, a
lw $t0, 0
lw $t1, 1
add $s0, $t0, $t1
sw $s0, 5
lw $t0, 2
lw $t1, 5
add $s0, $t0, $t1
sw $s0, 5
lw $t0, 3
lw $t1, 5
add $s0, $t0, $t1
sw $s0, 5
lw $t0, 4
lw $t1, 5
add $s0, $t0, $t1
sw $s0, 5
start:
#NEW STUFF
li $t1,5  #15 in t1
ori $s0, $t1, 33
beq $s0, $t1, skip
and $t0,$s0,$t1
skip:
sub $s0, $t1,$s0
beq $t0, $t1, jump
slt $t0, $t0, $t0
jump:
slti $t0, $t0, 1