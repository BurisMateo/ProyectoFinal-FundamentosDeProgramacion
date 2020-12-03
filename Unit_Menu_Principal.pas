//Buris Mateo

unit Unit_Menu_Principal;

interface

uses crt,Menu_Aerolineas,Menu_Aeropuertos,Menu_Vuelos,Menu_Pasajeros,Menu_Reservas,Unit_Fondo;

procedure Bienvenido;
procedure Menu_Principal;

implementation

procedure Bienvenido;
begin
	textcolor(yellow);
	gotoxy(15,10);
	writeln('########   ####  ########  ##    ##  ##     ##  ########  ##    ##  ####  ########    #######');
	gotoxy(15,16);
	writeln('########   ####  ########  ##    ##     ###     ########  ##    ##  ####  ########    #######');
	gotoxy(15,11);
	writeln('##     ##   ##   ##        ###   ##  ##     ##  ##        ###   ##   ##   ##     ##  ##     ##');
	gotoxy(15,15);
	writeln('##     ##   ##   ##        ##   ###    ## ##    ##        ##   ###   ##   ##     ##  ##     ##');
	gotoxy(15,12);
	writeln('##     ##   ##   ##        ####  ##  ##     ##  ##        ####  ##   ##   ##     ##  ##     ##');
	gotoxy(15,14);
	writeln('##     ##   ##   ##        ##  ####   ##   ##   ##        ##  ####   ##   ##     ##  ##     ##');
	gotoxy(15,13);
	writeln('########    ##   ######    ## ## ##  ##     ##  ######    ## ## ##   ##   ##     ##  ##     ##');
	gotoxy(120,30);
	readkey;
end;

procedure Menu_Principal;
var opc:char;
begin
	repeat
		clrscr;
		textcolor(yellow);
		fondo();
		gotoxy(58,4);
		writeln('MENU');
		gotoxy(30,8);
		writeln('Seleccione una Opcion');
		gotoxy(30,10);
		writeln('1. Aerolineas');
		gotoxy(30,12);
		writeln('2. Aeropuertos');
		gotoxy(30,14);
		writeln('3. Pasajeros');
		gotoxy(30,16);
		writeln('4. Vuelos');
		gotoxy(30,18);
		writeln('5. Reservas');
		gotoxy(30,22);
		writeln('0. Salir del Programa');
		gotoxy(120,30);
		opc:=readkey;
		case (opc) of
			'1': Menu_Aerol;
			'2': Menu_Aerop;
			'3': Menu_Pasaj;
			'4': Menu_Vue;
			'5': Menu_Res;
		end;
	until(opc='0');
end;


begin
end.
