	.data
	A:	.word32 -125, 102, 180, 59, -183, 186, 79, -8, 8, 22, 12, -120, 124, -101, -48, -127, 128, -100, 115, 93
		.word32 94, -111, -20, 122, 55, -15, 41, -14, 187, 14, -136, 90, 104, 151, 123, 55, 76, 92, 107, 152
		.word32 84, -18, 133, -69, 0, 171, 115,-170, 64, 25, 157, 103, -52, -67, -73, 80, -15, -83, 138, -69
		.word32 -38, 120, 187, -15, 68, -16, -101, 116, 0, -37, 69, -137, 176, -70, -130, -35, 131, 183, 61, -111
		.word32 55, 55, -95, -53, -20, 66, 177, 113, -40, -153, 143, -47, 180, 124, -86, -151, -58, 118, -91, 156
		.word32  135, -1, 100, 117, -154, -111, -3, -14, 153, 184, -168, 186, -64, -66, 57, 158, -142, -100, 156, -27
		.word32  135, -197, 142, -92, 40, -78, 95, 123, 66, 112, -139, 80, 177, -170, 86, -57, 50, 97, -164, 87
		.word32  -67, 7, 159, -49, 59, 184, -44, -60, -83, -108, 175, -125, -13, 122, -5, 56, 120, -59, 87, -130
		.word32  -10, 152, 197, -15, -64, 0, 47, -61, 78, -163, 96, -27, -183, -173, 75, 21, 49, -81, -27, 152
		.word32  -123, -83, -10, 156, 83, 109, -144, 142, 51, 113, 183, 184, 119, -89, 7, 109, -27, 111, 167, 32

CONTROL: .word32 0x10000;
DATA:    .word32 0x10008;
X: .word 55;
K: .asciiz "K = ";
N: .asciiz "N = ";
P: .asciiz "P = ";
Z: .asciiz "Z = ";
B: .asciiz "B = ";
S: .asciiz "S = ";

	.text
daddi $t2,$zero,0;
daddi $t5,$zero,200;
daddi $t0,$zero,0;
ld $s4,X($zero);
lwu $t8,DATA($zero)										; $t8 = address of DATA register
lwu $t9,CONTROL($zero)								; $t9 = address of CONTROL register
loop:	beq $t5,$t0,out1;     					;	exit - access all data
		daddi $t0,$t0,1;
		lw $t1,A($t2);
		daddi $t2,$t2,2;									; next data of the array
		slt $t4,$t1,$s4         					; if $t1<$s4, then $t4=1;
		daddi $t2,$t2,2;
		bnez $t4,what1;										; element bigger of number(X)
		slti $t7,$t1,1;   								; if $t1<0 then $t7=1;
		beq $t1,$s4,what;									; element equal to number(X)
		beq $t7,$zero,positive; 					; element is positive
		beqz $t1,zero;										; element equal to zero
		j loop;
zero: 	daddi $s0,$s0,1;
		j loop;
positive: daddi $s2,$s2,1;
		j loop;
what: 	slti $t7,$t1,1;   						; if $t1<0 then $t7=1;
		daddi $s3,$s3,1;
		beq $t7,$zero,positive; 					; element is positive
		beqz $t1,zero;										; element equal to zero
		j loop;
what1:	slti $t7,$t1,1;   					  ; if $t1<0 then $t7=1;
		daddi $s6,$s6,1;
		beq $t7,$zero,positive; 					; element positive
		beqz $t1,zero;										; element equal to zero
		j loop;
out1:	dadd $s5,$s2,$s0;
		dadd $t3,$s6,$s3;
		dsub $s1,$t5,$s5;
		dsub $s7,$t5,$t3;									; finding the remaining variables
out2:	daddi $v0,$zero,4								; printing elements
		daddi $t1,$zero,Z;
		sd $t1,($t8);
		sd $v0,0($t9);
		daddi $v0,$zero,1
		sd $s0,0($t8);
		sd $v0,0($t9);
		daddi $v0,$zero,4
		daddi $t1,$zero,N;
		sd $t1,($t8);
		sd $v0,0($t9);
		daddi $v0,$zero,1
		sd $s1,0($t8);
		sd $v0,0($t9);
		daddi $v0,$zero,4
		daddi $t1,$zero,P;
		sd $t1,($t8);
		sd $v0,0($t9);
		daddi $v0,$zero,1
		sd $s2,0($t8);
		sd $v0,0($t9);
		daddi $v0,$zero,4
		daddi $t1,$zero,K;
		sd $t1,($t8);
		sd $v0,0($t9);
		daddi $v0,$zero,1
		sd $s3,0($t8);
		sd $v0,0($t9);
		daddi $v0,$zero,4
		daddi $t1,$zero,B;
		sd $t1,($t8);
		sd $v0,0($t9);
		daddi $v0,$zero,1
		sd $s7,0($t8);
		sd $v0,0($t9);
		daddi $v0,$zero,4
		daddi $t1,$zero,S;
		sd $t1,($t8);
		sd $v0,0($t9);
		daddi $v0,$zero,1
		sd $s6,0($t8);
		sd $v0,0($t9);
		halt;
