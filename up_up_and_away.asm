; https://codeincomplete.com/articles/c64-manual-nostalgia/

v          = 53248

*          = $0801
           .word (+), 2023  ;pointer, line number
           .null $9e, format("%d", start)
+          .word 0          ;basic line end

start      lda #4
           sta v+21
           lda #13
           sta 2042

; Copy the sprite data
           ldx #0
-          lda sprite,x
           sta 832,x
           inx
           cpx #63
           bne -

; Move the sprite
loop1      ldx #0

loop2      lda #250
-          cmp $d012
           bcs -
           ; qui il raster == 251

           stx v+4
           stx v+5

-          lda $d012
           bne -
           lda $d011
           bmi -
           ; qui il raster == 0

           inx
           cpx #201
           bne loop2

           jmp loop1

sprite     .long long(%000000000111111100000000)[::-1]
           .long long(%000000011111111111000000)[::-1]
           .long long(%000000111111111111100000)[::-1]
           .long long(%000000111110011111100000)[::-1]
           .long long(%000001111101100111110000)[::-1]
           .long long(%000001111101111111110000)[::-1]
           .long long(%000001111101100111110000)[::-1]
           .long long(%000000111110011111100000)[::-1]
           .long long(%000000111111111111100000)[::-1]
           .long long(%000000111111111111100000)[::-1]
           .long long(%000000101111111110100000)[::-1]
           .long long(%000000010111111101000000)[::-1]
           .long long(%000000010011111001000000)[::-1]
           .long long(%000000001001110010000000)[::-1]
           .long long(%000000001001110010000000)[::-1]
           .long long(%000000000100100100000000)[::-1]
           .long long(%000000000100100100000000)[::-1]
           .long long(%000000000011111000000000)[::-1]
           .long long(%000000000011111000000000)[::-1]
           .long long(%000000000011111000000000)[::-1]
           .long long(%000000000001110000000000)[::-1]
