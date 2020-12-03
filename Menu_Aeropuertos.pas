//Buris Mateo

unit Menu_Aeropuertos;


interface
uses crt, Unit_Fondo, Unit_Aeropuertos;

procedure Alta_Aeropuerto(var A_Aerop:Arch_Aeropuerto);
procedure Baja_Aeropuerto(Var A_Aerop:Arch_Aeropuerto);
procedure Modificar_Aeropuerto(var A_Aerop:Arch_aeropuerto);
procedure Listado_Aeropuerto(var A_Aerop:Arch_aeropuerto);
procedure Menu_Aerop;

implementation

procedure Alta_Aeropuerto(var A_Aerop:Arch_Aeropuerto);
var Pos:integer;
	R_Aerop:T_Aeropuerto;
	Bus:string;
	Opc:char;
begin
	clrscr;
	Fondo2;
	gotoxy(24,23);
	writeln('Ingrese 0 para cancelar');
	gotoxy(24,4);
	write('Ingrese el nombre del Aeropuerto que desea dar de alta: ');
	readln(Bus);
	if Bus <> '0' then
	begin
		gotoxy(24,23);
		writeln('                           ');
		Abrir_Aerop(A_Aerop);
		Busqueda_Aerop(A_Aerop,Pos,Bus,R_Aerop);
		if (Pos=-1)then
		begin
			gotoxy(24,6);
			write('Ciudad: ');
			readln(R_Aerop.Ciudad);
			gotoxy(24,8);
			write('Pais: ');
			readln(R_Aerop.Pais);
			R_Aerop.ID_Aeropuerto:=(filesize(A_Aerop)+1);
			R_Aerop.Activo:=True;
			R_Aerop.Nombre:=Bus;
			Guardar_Aerop(A_Aerop,R_Aerop);
			Mensaje_Alta;
			Cerrar_Aerop(A_Aerop);
		end
		else
		begin
			Leer_Aerop(A_Aerop,R_Aerop,Pos);
			Cerrar_Aerop(A_Aerop);
			if (R_Aerop.Activo=True) then
			begin
				repeat
					clrscr;
					Fondo2;
					gotoxy(24,4);
					writeln('El aeropuerto ya fue dado de alta');
					gotoxy(24,6);
					writeln('Sus datos son:');
					gotoxy(24,10);
					writeln('ID del Aeropuerto: ',R_Aerop.ID_Aeropuerto);
					gotoxy(24,11);
					writeln('Nombre: ',R_Aerop.Nombre);
					gotoxy(24,12);
					writeln('Pais: ',R_Aerop.Pais);
					gotoxy(24,13);
					writeln('Ciudad: ',R_Aerop.Ciudad);
					gotoxy(24,15);
					writeln('Elija una opcion para seguir:');
					gotoxy(45,16);
					writeln('1. Baja aeropuerto');
					gotoxy(45,17);
					writeln('2. Modificar aeropuerto');
					gotoxy(45,18);
					writeln('0. Salir');
					gotoxy(120,30);
					Opc:=readkey;
					case (Opc) of
						'1': Baja_Aeropuerto(A_Aerop);
						'2': Modificar_Aeropuerto(A_Aerop);
					end;
				until (Opc='0');
			end
			else
			begin
				repeat
					clrscr;
					Fondo2;
					gotoxy(24,4);
					writeln('El aeropuerto esta dado de baja');
					gotoxy(24,6);
					writeln('Sus datos son:');
					gotoxy(24,10);
					writeln('ID Aeropuerto: ',R_Aerop.ID_Aeropuerto);
					gotoxy(24,11);
					writeln('Nombre: ',R_Aerop.Nombre);
					gotoxy(24,12);
					writeln('Pais: ',R_Aerop.Pais);
					gotoxy(24,13);
					writeln('Ciudad: ',R_Aerop.Ciudad);
					gotoxy(24,15);
					writeln('Elija una opcion para seguir:');
					gotoxy(45,16);
					writeln('1. Reactivarlo');
					gotoxy(45,17);
					writeln('0. Salir');
					gotoxy(120,30);
					Opc:=readkey;
					case (Opc) of
						'1':begin
								R_Aerop.Activo:=True;
								Abrir_Aerop(A_Aerop);
								Modificar_Aerop(A_Aerop,Pos,R_Aerop);
								Cerrar_Aerop(A_Aerop);
								Mensaje_Reactivacion;
							end;
					end;
				until (Opc='0');
			end;
		end;
	end;
end;


procedure Baja_Aeropuerto(Var A_Aerop:Arch_Aeropuerto);
var Bus:string;
	Pos:integer;
	R_Aerop:T_Aeropuerto;
begin
	clrscr;
	Fondo2;
	gotoxy(24,23);
	writeln('Ingrese 0 para cancelar');
	gotoxy(24,4);
	write('Ingrese el nombre del Aeropuerto que desea dar de baja: ');
	readln(Bus);
	if Bus <> '0' then
	begin
		gotoxy(24,23);
		writeln('                           ');
		Abrir_Aerop(A_Aerop);
		Busqueda_Aerop(A_Aerop,Pos,Bus,R_Aerop);
		if (Pos<>-1) then
		begin
			Leer_Aerop(A_Aerop,R_Aerop,Pos);
			if (R_Aerop.Activo=True) then
			begin
				R_Aerop.Activo:=False;
				Modificar_Aerop(A_Aerop,Pos,R_Aerop);
				Mensaje_Baja;
			end
			else
			begin
				clrscr;
				gotoxy(40,9);
				writeln('******************************************');
				gotoxy(40,10);
				writeln('*                                        *');
				gotoxy(40,11);
				writeln('*                                        *');
				gotoxy(40,12);
				writeln('*    EL AEROPUERTO ESTA DADO DE BAJA     *');
				gotoxy(40,13);
				writeln('*                                        *');
				gotoxy(40,14);
				writeln('*                                        *');
				gotoxy(40,15);
				writeln('******************************************');
				gotoxy(120,30);
				readkey;
			end;
		end
		else
		begin
			clrscr;
			gotoxy(40,9);
			writeln('******************************************');
			gotoxy(40,10);
			writeln('*                                        *');
			gotoxy(40,11);
			writeln('*                                        *');
			gotoxy(40,12);
			writeln('*        EL AEROPUERTO NO EXISTE         *');
			gotoxy(40,13);
			writeln('*                                        *');
			gotoxy(40,14);
			writeln('*                                        *');
			gotoxy(40,15);
			writeln('******************************************');
			gotoxy(120,30);
			readkey;
		end;
		Cerrar_Aerop(A_Aerop);
	end;
end;

procedure Modificar_Aeropuerto(var A_Aerop:Arch_Aeropuerto);
var Bus:string;
	Pos:integer;
	R_Aerop:T_Aeropuerto;
	Opc:char;
begin	
	clrscr;
	Fondo2;
	gotoxy(24,23);
	writeln('Ingrese 0 para cancelar');
	gotoxy(24,4);
	write('Ingrese el nombre del Aeropuerto que desea modificar: ');
	readln(Bus);
	if Bus<>'0' then
	begin
		gotoxy(24,23);
		writeln('                           ');
		Abrir_Aerop(A_Aerop);
		Busqueda_Aerop(A_Aerop,Pos,Bus,R_Aerop);
		if (Pos<>-1) then
		begin
			Leer_Aerop(A_Aerop,R_Aerop,Pos);
			if (R_Aerop.Activo=True) then
			begin
				repeat
					clrscr;
					Fondo2;
					gotoxy(24,4);
					writeln('El aeropuerto esta dado de alta');
					gotoxy(24,6);
					writeln('Sus datos son:');
					gotoxy(24,10);
					writeln('ID del Aeropuerto: ',R_Aerop.ID_Aeropuerto);
					gotoxy(24,11);
					writeln('Nombre: ',R_Aerop.Nombre);
					gotoxy(24,12);
					writeln('Pais: ',R_Aerop.Pais);
					gotoxy(24,13);
					writeln('Ciudad: ',R_Aerop.Ciudad);
					gotoxy(24,15);
					writeln('Campos disponibles a Modificar:');
					gotoxy(52,16);
					writeln('1. Nombre');
					gotoxy(52,17);
					writeln('2. Pais');
					gotoxy(52,18);
					writeln('3. Ciudad');
					gotoxy(52,19);
					writeln('0. Salir');
					gotoxy(120,30);
					Opc:=readkey;
					case (Opc) of
						'1':begin
								clrscr;
								Fondo2;
								gotoxy(24,4);
								writeln('Ingrese el nuevo dato para la modificacion');
								gotoxy(24,6);
								write('Nombre: ');
								Readln(R_Aerop.Nombre);
								Modificar_Aerop(A_Aerop,Pos,R_Aerop);
								Mensaje_Modificacion;
							end;
						'2':begin
								clrscr;
								Fondo2;
								gotoxy(24,4);
								writeln('Ingrese el nuevo dato para la modificacion');
								gotoxy(24,6);
								write('Pais: ');
								readln(R_Aerop.Pais);
								Modificar_Aerop(A_Aerop,Pos,R_Aerop);
								Mensaje_Modificacion;
							end;
						'3':begin
								clrscr;
								Fondo2;
								gotoxy(24,4);
								writeln('Ingrese el nuevo dato para la modificacion');
								gotoxy(24,6);
								write('Ciudad: ');
								Readln(R_Aerop.Ciudad);
								Modificar_Aerop(A_Aerop,Pos,R_Aerop);
								Mensaje_Modificacion;
							end;
					end;
				until (Opc='0');
			end
			else
			begin
				clrscr;
				gotoxy(40,9);
				writeln('******************************************');
				gotoxy(40,10);
				writeln('*                                        *');
				gotoxy(40,11);
				writeln('*                                        *');
				gotoxy(40,12);
				writeln('*    EL AEROPUERTO ESTA DADO DE BAJA     *');
				gotoxy(40,13);
				writeln('*                                        *');
				gotoxy(40,14);
				writeln('*                                        *');
				gotoxy(40,15);
				writeln('******************************************');
				gotoxy(120,30);
				readkey;
			end;
		end
		else
		begin
			clrscr;
			gotoxy(40,9);
			writeln('******************************************');
			gotoxy(40,10);
			writeln('*                                        *');
			gotoxy(40,11);
			writeln('*                                        *');
			gotoxy(40,12);
			writeln('*        EL AEROPUERTO NO EXISTE         *');
			gotoxy(40,13);
			writeln('*                                        *');
			gotoxy(40,14);
			writeln('*                                        *');
			gotoxy(40,15);
			writeln('******************************************');
			gotoxy(120,30);
			readkey;
		end;
		Cerrar_Aerop(A_Aerop);
	end;
end;

procedure Listado_Aeropuerto(var A_Aerop:Arch_Aeropuerto);
var x,cantidad,i:integer;
	Vec:T_Vec_Aerop;
	R_Aerop:T_Aeropuerto;
	opc:char;
begin
	Cargar_Aerop(A_Aerop, Vec, cantidad);
	Burbuja_Aerop(Vec, cantidad);
	Abrir_Aerop(A_Aerop);
	i:=1;
	opc:='*';
	x:=3;
	clrscr;
	Fondo3;
	gotoxy(3,2);
	writeln('ID Aeropuerto | Nombre                | Ciudad             | Pais');
	while(i<=cantidad) and (opc<>'0') do
	begin
		Leer_Aerop(A_Aerop,R_Aerop,Vec[i].pos);
		gotoxy(3,x);
		writeln(R_Aerop.ID_Aeropuerto);
		gotoxy(17,x);
		writeln('| ',R_Aerop.Nombre);
		gotoxy(41,x);
		writeln('| ',R_Aerop.Ciudad);
		gotoxy(62,x);
		writeln('| ',R_Aerop.Pais);
		inc(x);
		inc(i);
		if ((x=22) or (i=cantidad+1)) then
		begin
			gotoxy(3,23);
			writeln('A. Anterior | S. Siguiente | 0. Salir');
			repeat
				gotoxy(120,30);
				opc:=readkey;
			until (opc='0') or (opc='a') or (opc='s');
			if (opc='a') then
			begin
				if i<39 then
				begin
					i:=1;
					x:=3;
					clrscr;
					Fondo3;
					gotoxy(3,2);
					writeln('ID Aeropuerto | Nombre                | Ciudad             | Pais');
				end
				else
				begin
					i:=i-19-(x-3);
					x:=3;
					clrscr;
					Fondo3;
					gotoxy(3,2);
					writeln('ID Aeropuerto | Nombre                | Ciudad             | Pais');
				end;
			end;
			if (opc='s') and (i<cantidad)then
			begin
				x:=3;
				clrscr;
				Fondo3;
				gotoxy(3,2);
				writeln('ID Aeropuerto | Nombre                | Ciudad             | Pais');
			end;
		end;
	end;
	Cerrar_Aerop(A_Aerop);
end;

procedure Menu_Aerop;
var Opc:char;
begin
	repeat
		clrscr;
		Fondo;
		gotoxy(52,4);
		writeln('MENU DE AEROPUERTOS');
		gotoxy(30,8);
		writeln('Opciones:');
		gotoxy(30,10);
		writeln('1. Alta de Aeropuertos');
		gotoxy(30,12);
		writeln('2. Baja de Aeropuertos');
		gotoxy(30,14);
		writeln('3. Modificacion de Aeropuertos');
		gotoxy(30,16);
		writeln('4. Listado de Aeropuertos');
		gotoxy(30,18);
		writeln('0. Regresar');
		gotoxy(120,30);
		Opc:=readkey;
		case (Opc) of
			'1': Alta_Aeropuerto(Arch_Aerop);
			'2': Baja_Aeropuerto(Arch_Aerop);
			'3': Modificar_Aeropuerto(Arch_Aerop);
			'4': Listado_Aeropuerto(Arch_Aerop);
		end;
	until(Opc='0');
end;


begin
end.
