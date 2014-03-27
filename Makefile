input=wrong1.inp
debug=-dp

run: generator
	 ./generator < $(input)

generator: driver.c parser.y lexer.l 
	flex lexer.l
	bison -d parser.y
	gcc -o generator -I. driver.c generator.tab.c

clean: 
	rm generator lex.yy.c generator.tab.c
