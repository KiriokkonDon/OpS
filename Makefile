all: main.exe

main.exe: myfunc.o main.o
	g++ myfunc.o main.o -o main.exe

myfunc.o: myfunc.cpp
	g++ -c myfunc.cpp -o myfunc.o

main.o: main.cpp
	g++ -c main.cpp -o main.o

clean-w:
	del /Q myfunc.o main.o main.exe

clean-l:
	rm -f myfunc.o main.o main.exe
