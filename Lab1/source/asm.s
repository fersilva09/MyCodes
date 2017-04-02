        // PUBLIC f_asm
        // EXTERN matriz
        
        //r0 =  retorno da função -  tamanho da imagem RGB
        //r1 = registrador livre
        //r2 = posicao inicial da matriz 
        //r3 = posição inicial RED
        //r4 = posição inicial GREEN
        //r5 = posição incial BLUE
        //r6 = registrador livre 
        //r7 = variável de loop
        //r8 = registrador livre
        //r9 = registrador livre
        //r10 = registrador livre
        //r11 = registrador livre
        //r12 = registrador livre
        
        PUBLIC histrgb
        EXTERN image_in

        SECTION .text : CODE (2)
        THUMB

histrgb:
        
 
        
        push {R4-R11,LR}
        
        mul r0, r0, r1  // tamanho da imagem
        mov r6, #0x3
        mul r0, r0, r6// Tamanho percorrido na imagem
           
        
        mov r6, #0x400//256*4   
        add r4, r3, r6  //endereco de G - R2
        add r5, r4, r6  //endereco de B - R3
        mov r8, #0x0

        
loop:  
        add r8, r8, #0x3
      //R   
        ldrb r6,[r2], #0x1//valores da matriz
        mov r7, #0x4
        mul r6, r6, r7
        add r7, r6, r3//Endereco final
        ldrh r6, [r7, #0] //quantidade de numero na posição
        add r6, r6, #0x1
        strh r6, [r7, #0]
       //G
        ldrb r6,[r2],#0x1//valores da matriz
        mov r7, #0x4
        mul r6, r6, r7
        add r7, r6, r4//Endereco final
        ldrh r6, [r7, #0] //quantidade de numero na posição
        add r6, r6, #0x1
        strh r6, [r7, #0]
       //B 
        ldrb r6,[r2],#0x1//valores da matriz
        mov r7, #0x4
        mul r6, r6, r7
        add r7, r6, r5//Endereco final
        ldrh r6, [r7, #0] //quantidade de numero na posição
        add r6, r6, #0x1
        strh r6, [r7, #0]
        
        cmp r0, r8
        beq stop
        b loop
        
        stop:
          pop {R4-R11,PC}

        END

