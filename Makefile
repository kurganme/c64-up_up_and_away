%.prg: %.asm
	64tass -C -a -B -i -Wall $< \
		-o $@ --vice-labels -l $*.l
	printf '%s\n' >>$*.l \
	    'bk .start' \
	    # 'tr .bp'

all: up_up_and_away.prg

run: up_up_and_away.prg
	x64sc -autostartprgmode 1 $<

debug: up_up_and_away.prg
	x64sc -autostartprgmode 1 -nativemonitor \
		-moncommands $(basename $<).l \
		-initbreak ready \
		$<

clean:
	-rm -f up_up_and_away.prg up_up_and_away.l

.PHONY: run debug clean
