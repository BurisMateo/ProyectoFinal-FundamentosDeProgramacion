//Buris Mateo

unit Menu_Aerolineas;

interface
uses crt,Unit_Aerolineas,Unit_Fondo,Unit_Validaciones;

procedure Alta_Aerolinea(var A_Aerol:Arch_Aerolinea);
procedure Baja_Aerolinea(Var A_Aerol:Arch_Aerolinea);
procedure Modificar_Aerolinea(var A_Aerol:Arch_Aerolinea);
procedure Listado_Aerolinea(var A_Aerol:Arch_Aerolinea);
procedure Menu_Aerol;

implementation

procedure Alta_Aerolinea(var A_Aerol:Arch_Aerolinea);
var Pos,x,y:integer;
	R_Aerol:T_Aerolinea;
	Bus:string;
	Opc:char;
begin
	clrscr;
	Fondo2;
	gotoxy(24,23);
	writeln('Ingrese 0 para cancelar');
	gotoxy(24,4);
	write('Ingrese el nombre de la Aerolinea que desea dar de alta: ');
	readln(Bus);
	if (Bus<>'0') then	
	begin
		Abrir_Aerol(A_Aerol);
		Busqueda_Aerol(A_Aerol,Bus,Pos,R_Aerol);
		if (Pos=-1)then
		begin
			gotoxy(24,23);
			writeln('                             ');
			gotoxy(24,6);
			write('Cuit(sin guiones): ');
			x:=43;
			y:=6;
			Ingresar_CUIT(R_Aerol.Cuit,x,y);
			gotoxy(24,8);
			write('Domicilio: ');
			readln(R_Aerol.Domicilio);
			R_Aerol.ID_Aerolinea:=(filesize(A_Aerol)+1);
			R_Aerol.Activo:=True;
			R_Aerol.Nombre:=Bus;
			Guardar_Aerol(A_Aerol,R_Aerol);
			Cerrar_Aerol(A_Aerol);
			Mensaje_Alta;
		end
		else
		begin
			Leer_Aerol(A_Aerol,R_Aerol,Pos);
			Cerrar_Aerol(A_Aerol);
			if (R_Aerol.Activo=True) then
			begin
				repeat
					clrscr;
					Fondo2;
					gotoxy(24,4);
					writeln('La Aerolinea ya fue dada de alta');
					gotoxy(24,6);
					writeln('Sus datos son:');
					gotoxy(24,10);
					writeln('ID de Aerolinea: ',R_Aerol.ID_Aerolinea);
					gotoxy(24,11);
					writeln('Nombre: ',R_Aerol.Nombre);
					gotoxy(24,12);
					writeln('Cuit: ',R_Aerol.Cuit);
					gotoxy(24,13);
					writeln('Domicilio: ',R_Aerol.Domicilio);
					gotoxy(24,15);
					writeln('Elija una opcion para seguir:');
					gotoxy(45,16);
					writeln('1. Baja Aerolinea');
					gotoxy(45,17);
					writeln('2. Modificar Aerolinea');
					gotoxy(45,18);
					writeln('0. Salir');
					gotoxy(120,30);
					Opc:=readkey;
					case (Opc) of
						'1': Baja_Aerolinea(A_Aerol);
						'2': Modificar_Aerolinea(A_Aerol);
					end;
				until (Opc='0');
			end
			else
			begin
				repeat
					clrscr;
					Fondo2;
					gotoxy(24,4);
					writeln('La Aerolinea esta dada de baja');
					gotoxy(24,6);
					writeln('Sus datos son:');
					gotoxy(24,10);
					writeln('ID Aerolinea: ',R_Aerol.ID_Aerolinea);
					gotoxy(24,11);
					writeln('Nombre: ',R_Aerol.Nombre);
					gotoxy(24,12);
					writeln('Cuit: ',R_Aerol.Cuit);
					gotoxy(24,13);
					writeln('Domicilio: ',R_Aerol.Domicilio);
					gotoxy(24,15);
					writeln('Elija una opcion para seguir:');
					gotoxy(45,16);
					writeln('1. Reactivarla');
					gotoxy(45,17);
					writeln('0. Salir');
					gotoxy(120,30);
					Opc:=readkey;
					case (Opc) of
						'1':begin
								R_Aerol.Activo:=True;
								Abrir_Aerol(A_Aerol);
								Modificar_Aerol(A_Aerol,Pos,R_Aerol);
								Cerrar_Aerol(A_Aerol);
								Mensaje_Reactivacion;
							end;
					end;
				until (Opc='0');
			end;
		end;
	end;
end;

procedure Baja_Aerolinea(Var A_Aerol:Arch_Aerolinea);
var Bus:string;
	Pos:integer;
	R_Aerol:T_Aerolinea;
begin
	clrscr;
	Fondo2;
	gotoxy(24,23);
	writeln('Ingrese 0 para cancelar');
	gotoxy(24,4);
	write('Ingrese el nombre de la Aerolinea que desea dar de baja: ');
	readln(Bus);
	if Bus<>'0' then
	begin
		gotoxy(24,23);
		writeln('                             ');
		Abrir_Aerol(A_Aerol);
		Busqueda_Aerol(A_Aerol,Bus,Pos,R_Aerol);
		if (Pos<>-1) then
		begin
			Leer_Aerol(A_Aerol,R_Aerol,Pos);
			if (R_Aerol.Activo=True) then
			begin
				R_Aerol.Activo:=False;
				Modificar_Aerol(A_Aerol,Pos,R_Aerol);
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
				writeln('*    LA AEROLINEA ESTA DADA DE BAJA      *');
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
			writeln('*        LA AEROLINEA NO EXISTE          *');
			gotoxy(40,13);
			writeln('*                                        *');
			gotoxy(40,14);
			writeln('*                                        *');
			gotoxy(40,15);
			writeln('******************************************');
			gotoxy(120,30);
			readkey;
		end;
		Cerrar_Aerol(A_Aerol);
	end;
end;

procedure Modificar_Aerolinea(var A_Aerol:Arch_Aerolinea);
var Bus:string;
	Pos,x,y:integer;
	R_Aerol:T_Aerolinea;
	Opc:char;
begin 
	clrscr;
	Fondo2;
	gotoxy(24,23);
	writeln('Ingrese 0 para cancelar');
	gotoxy(24,4);
	write('Ingrese el nombre de la Aerolinea que desea modificar: ');
	readln(Bus);
	if Bus<>'0' then
	begin
		Abrir_Aerol(A_Aerol);
		Busqueda_Aerol(A_Aerol,Bus,Pos,R_Aerol);
		if (Pos<>-1) then
		begin
			Leer_Aerol(A_Aerol,R_Aerol,Pos);
			if (R_Aerol.Activo=True) then
			begin
				repeat
					clrscr;
					Fondo2;
					gotoxy(24,4);
					writeln('La Aerolinea esta dada de alta');
					gotoxy(24,6);
					writeln('Sus datos son:');
					gotoxy(24,10);
					writeln('ID de Aerolinea: ',R_Aerol.ID_Aerolinea);
					gotoxy(24,11);
					writeln('Nombre: ',R_Aerol.Nombre);
					gotoxy(24,12);
					writeln('Cuit: ',R_Aerol.Cuit);
					gotoxy(24,13);
					writeln('Domicilio: ',R_Aerol.Domicilio);
					gotoxy(24,15);
					writeln('Campos disponibles a Modificar:');
					gotoxy(52,16);
					writeln('1. Nombre      2. Domicilio');
					gotoxy(52,17);
					writeln('3. CUIT        0. Salir');
					gotoxy(120,30);
					Opc:=readkey;
					case Opc of
						'1':begin
								clrscr;
								Fondo2;
								gotoxy(24,4);
								writeln('Ingrese el nuevo dato para la modificacion');
								gotoxy(24,6);
								write('Nombre: ');
								readln(R_Aerol.Nombre);
								Modificar_Aerol(A_Aerol,Pos,R_Aerol);
								Mensaje_Modificacion;
							end;
						'2':begin
								clrscr;
								Fondo2;
								gotoxy(24,4);
								writeln('Ingrese el nuevo dato para la modificacion');
								gotoxy(24,6);
								write('Domicilio: ');
								readln(R_Aerol.Domicilio);
								Modificar_Aerol(A_Aerol,Pos,R_Aerol);
								Mensaje_Modificacion;
							end;
						'3':begin
								clrscr;
								Fondo2;
								gotoxy(24,4);
								write('Cuit(sin guiones): ');
								x:=43;
								y:=4;
								Ingresar_CUIT(R_Aerol.Cuit,x,y);
								Modificar_Aerol(A_Aerol,Pos,R_Aerol);
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
				writeln('*    LA AEROLINEA ESTA DADA DE BAJA      *');
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
			writeln('*        LA AEROLINEA NO EXISTE          *');
			gotoxy(40,13);
			writeln('*                                        *');
			gotoxy(40,14);
			writeln('*                                        *');
			gotoxy(40,15);
			writeln('******************************************');
			gotoxy(120,30);
			readkey;
		end;
		Cerrar_Aerol(A_Aerol);
	end;
end;

procedure Listado_Aerolinea(var A_Aerol:Arch_Aerolinea);
var x, cantidad, i:integer;
	Vec:T_Vec_Aerol;
	R_Aerol:T_Aerolinea;
	opc:char;
begin
	Cargar_Aerol(A_Aerol,Vec, cantidad);
	Burbuja_Aerol(Vec, cantidad);
	Abrir_Aerol(A_Aerol);
	i:=1;
	opc:='*';
	x:=3;
	clrscr;
	Fondo3;
	gotoxy(3,2);
	writeln('ID Aerolinea | Nombre                        | Cuit             | Domicilio');
	while(i<=cantidad) and (opc<>'0') do
	begin
		Leer_Aerol(A_Aerol,R_Aerol,Vec[i].pos);
		GotoXY(3,x);
		Writeln(R_Aerol.ID_Aerolinea);
		GotoXY(16,x);
		Writeln('| ',R_Aerol.Nombre);
		GotoXY(48,x);
		Writeln('| ',R_Aerol.Cuit);
		gotoxy(67,x);
		writeln('| ',R_Aerol.Domicilio);
		inc(x);
		inc(i);
		if ((x=22) or (i=cantidad+1)) then
		begin
			gotoxy(3,23);
			writeln('A. Anterior | S. Siguiente | 0. Salir');
			repeat
				gotoxy(120,30);
				opc:=readkey;
			until  (opc='0') or (opc='a') or (opc='s');
			if (opc='a') then
			begin
				if i<39 then
				begin
					i:=1;
					x:=3;
					clrscr;
					Fondo3;
					gotoxy(3,2);
					writeln('ID Aerolinea | Nombre                        | Cuit             | Domicilio');
				end
				else
				begin
					i:=i-19-(x-3);
					x:=3;
					clrscr;
					Fondo3;
					gotoxy(3,2);
					writeln('ID Aerolinea | Nombre                        | Cuit             | Domicilio');
				end;
			end;
			if (opc='s') and (i<cantidad)then
			begin
				x:=3;
				clrscr;
				Fondo3;
				gotoxy(3,2);
				writeln('ID Aerolinea | Nombre                        | Cuit             | Domicilio');
			end;
		end;
	end;
	Cerrar_Aerol(A_Aerol);
end;

procedure Menu_Aerol;
var Opc:char;
begin
	repeat
		clrscr;
		Fondo;
		gotoxy(52,4);
		writeln('MENU DE AEROLINEAS');
		gotoxy(30,8);
		writeln('Opciones:');
		gotoxy(30,10);
		writeln('1. Alta de Aerolineas');
		gotoxy(30,12);
		writeln('2. Baja de Aerolineas');
		gotoxy(30,14);
		writeln('3. Modificacion de Aerolineas');
		gotoxy(30,16);
		writeln('4. Listado de Aerolineas');
		gotoxy(30,18);
		writeln('0. Regresar');
		gotoxy(120,30);
		Opc:=readkey;
		case (Opc) of
			'1': Alta_Aerolinea(Arch_Aerol);
			'2': Baja_Aerolinea(Arch_Aerol);
			'3': Modificar_Aerolinea(Arch_Aerol);
			'4': Listado_Aerolinea(Arch_Aerol);
		end;
	until(Opc='0');
end;

begin
end.
