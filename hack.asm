.memorymap
defaultslot 0
slotsize $2000
slot 0 $8000
slot 1 $a000
slot 2 $c000
slot 3 $e000
.endme

.rombankmap
bankstotal 145
banksize $10
banks 1
banksize $2000
banks 16
banksize $400
banks 128
.endro

.background "smashtv.nes"

.bank 2 slot 2
.orga $dadd
        jmp     my_code

.orga $df80
my_code:
@check_if_music_should_loop
        lda     $fe
        cmp     #$42
        bne     @do_nothing
@loop_music
        lda     #$02
        sta     $fe
        sta     $06b5
        sta     $06b6
        sta     $06b7
        sta     $06b8
@do_nothing
        ; replace original instruction
        jmp     $db28
