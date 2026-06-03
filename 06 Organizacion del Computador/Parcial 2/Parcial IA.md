![[Pasted image 20260603121835.png|637]]
1.
Si es ilegal. Los operadores inmediatos no aceptan numeros inmediatos negativos.
2.
Si es ilegal. Ldur no soporta inmediatos > 255
3.
Si es ilegal. Offset causado por > 63
4.
Si es ilegal. XZR es 0, o el registro 31, donde no se guarda nada

![[Pasted image 20260603122402.png]]
![[Pasted image 20260603122416.png]]
Está bien el codigo. Respeta las instrucciones correctamente.-

3.
Completar la tabla de señales de control de la unidad principal para la instrucción `CBNZ` (Branch if Not Zero). Usa `0`, `1` o `X` (Don't care). Si alguna señal depende de una asunción específica de tu Datapath, pon un asterisco y acláralo.

Reg2Loc: X
ALUSrc: 0
MemToReg: 0
RegWrite: 0
MemRead: 0
MemWrite: 0
Branch: 1
ALUOp1: 1
ALUOp0: 0

![[Pasted image 20260603123342.png]]
X0 = 0x1000, X1 = 0x3
Este realmente no se como hacerlo y necesito ayuda a entender. jamas lo entendi, mi weak point. Ademas de calculo de saltos + posiciones de hexa.

![[Pasted image 20260603123914.png]]
ADDi X0, X0, #1: 
Type I, R[Rd] = R[Rn] + ALUImm
Opcode(10): 10 0100 0100
ALU_Immediate(11): 000 0000 0001
Rn(5): 00000
Rd(5): 00000

HEXA: `0x24400100

ADD X1, X1, X0
Type R, R[Rd] = R[Rn] + R[Rm]
Opcode(11): 100 0101 1000
shamt(5): 0 0000
Rn(5): 0 0001
Rd(5): 0 0001
Rm(5): 0 0000
100 0101 1000 0000 0000 0100 0010 0000
HEXA: `0x45800420`

SUBI x0, x0, #1.
Type i, R[Rd] = R[Rn] - ALUImm
Opcode(10): 1101 0010 00
ALU_Immediate(11): 000 0000 0001
Rn(5): 00000
Rd(5): 00000
0110 1001 0000 0000 0000 0100 0000 0000

sabes q me confunde como armar estos numeros jakjakja creo q tengo armarlos igual q el TYPE I dado ej: opcode, alu, rn, rd y agrupar de a 4 desde la derecha
Hexa: `0xd6d000400` der <- izq (Creo q este es el correcto)
Hexa: `0xd2000800` izq -> der

CBZ X1, L2 
if (R[RT] == 0) PC = PC + CondBranchAddr

B L1
PC = PC + BranchAddr