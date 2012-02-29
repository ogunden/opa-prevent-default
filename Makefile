all: foo.exe

foo.exe: foo.opa
	opa --parser classic $^ -o $@

clean:
		rm -rf _build _tracks *.broken *.opp opa-debug *.exe *.opx .opx
