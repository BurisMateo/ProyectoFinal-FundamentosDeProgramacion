//Buris Mateo

unit Menu_Reservas;

Interface

uses crt, Unit_Reservas,Unit_Vuelos,Menu_Vuelos,Unit_Aeropuertos,Unit_Aerolineas,Unit_Pasajeros,Menu_Pasajeros,Unit_Fondo,Unit_Validaciones;

procedure Alta_Reserva(var A_Res:Arch_Reserva;var A_Pasaj:Arch_Pasajero;var A_Vue:Arch_Vuelo;var A_Aerop:Arch_Aeropuerto;var A_Aerol:Arch_Aerolinea);
procedure Baja_Reserva(var A_Res:Arch_Reserva;var A_Vue:Arch_Vuelo);
procedure Modificar_Reserva(var A_Res:Arch_Reserva);
Procedure Listado_Reserva(var A_Res:Arch_Reserva);
procedure Menu_Res;

implementation

procedure Alta_Reserva(var A_Res:Arch_Reserva;var A_Pasaj:Arch_Pasajero;var A_Vue:Arch_Vuelo;var A_Aerop:Arch_Aeropuerto;var A_Aerol:Arch_Aerolinea);
var Pos1,Pos2,x,y:integer;
	R_Res:T_Reserva;
	R_Pasaj:T_Pasajero;
	R_Vue:T_Vuelo;
	Opc1,Opc2:char;
begin
	clrscr;
	Fondo2;
	Abrir_Res(A_Res);
	repeat
		gotoxy(24,8);
		writeln('                         ');
		gotoxy(24,10);
		writeln('                                                      ');
		gotoxy(24,23);
		writeln('Ingrese 0 para cancelar');
		gotoxy(24,4);
		writeln('Ingrese los datos para realizar el alta de la reserva');
		gotoxy(24,6);
		write('ID del Vuelo: ');
		x:=38;
		y:=6;
		Ingresar_Entero(R_Res.ID_Vuelo,x,y);
		if R_Res.ID_Vuelo<>0 then
		begin
			gotoxy(24,23);
			writeln('                                ');
			Abrir_Vue(A_Vue);
			Busqueda_Vue(A_Vue,R_Res.ID_Vuelo,Pos2,R_Vue);
			Cerrar_Vue(A_Vue);
			if (Pos2=-1) then
			begin
				repeat
					gotoxy(24,8);
					writeln('el vuelo no existe');
					gotoxy(24,10);
					writeln('0. ingresar de nuevo | A. ir al menu de vuelos');
					gotoxy(120,30);
					Opc2:=readkey;
				until (Opc2='0') or (Opc2='a') or (Opc2='A');
				if(Opc2='a')or(Opc2='A') then
				begin
					Menu_Vue;
					clrscr;
					Fondo2;
				end;
			end;
		end;
	until (Pos2<>-1) or (R_Res.ID_Vuelo=0);
	if R_Res.ID_Vuelo<>0 then
	begin
		Abrir_Vue(A_Vue);
		Leer_Vue(A_Vue,R_Vue,R_Res.ID_Vuelo-1);
		if R_Vue.Total_Pasaj=R_Vue.Cant_Pasajeros then
		begin
			clrscr;
			gotoxy(40,9);
			writeln('******************************************');
			gotoxy(40,10);
			writeln('*                                        *');
			gotoxy(40,11);
			writeln('*                                        *');
			gotoxy(40,12);
			writeln('*          EL VUELO ESTA LLENO           *');
			gotoxy(40,13);
			writeln('*                                        *');
			gotoxy(40,14);
			writeln('*                                        *');
			gotoxy(40,15);
			writeln('******************************************');
			gotoxy(120,30);
			readkey;
			Cerrar_Vue(A_Vue);
		end
		else
		begin
			gotoxy(24,8);
			write('Fecha de Reserva: ');
			x:=43;
			y:=8;
			Ingresar_Fecha(R_Res.Fecha,x,y);
			gotoxy(24,10);
			writeln('Hora de Reserva: ');
			x:=42;
			y:=10;
			Ingresar_Hora(R_Res.Hora,x,y);
			gotoxy(24,12);
			writeln('Costo: $');
			x:=33;
			y:=12;
			Ingresar_Real(R_Res.Costo,x,y);
			gotoxy(24,14);
			write('DNI de Pasajero: ');
			repeat
				x:=41;
				y:=14;
				Ingresar_DNI(R_Res.DNI,x,y);
				Abrir_Pasaj(A_Pasaj);
				Busqueda_Pasaj(A_Pasaj,R_Res.DNI,Pos1,R_Pasaj);
				Cerrar_Pasaj(A_Pasaj);
				if (Pos1=-1) then
				begin
					repeat
						gotoxy(24,16);
						writeln('el pasajero no existe');
						gotoxy(24,18);
						writeln('0. ingresar de nuevo | A. ir al menu de pasajeros');
						gotoxy(120,30);
						Opc1:=readkey;
					until (Opc1='0') or (Opc1='a') or (Opc1='A');
					if(Opc1='0') then
					begin
						gotoxy(24,16);
						writeln('                                                     ');
						gotoxy(24,18);
						writeln('                                                     ');
						gotoxy(41,14);
						writeln('                      ');
					end
					else
					begin
						Menu_Pasaj;
						clrscr;
						Fondo2;
						gotoxy(24,4);
						writeln('Ingrese los datos para realizar el alta de la reserva');
						gotoxy(24,6);
						writeln('ID del Vuelo: ');
						gotoxy(24,8);
						writeln('Fecha de Reserva: ',R_Res.Fecha);
						gotoxy(24,10);
						writeln('Hora de Reserva: ',R_Res.Hora);
						gotoxy(24,12);
						writeln('Costo: $',R_Res.Costo:2:2);
						gotoxy(24,14);
						writeln('DNI de Pasajero: ');	
					end;
				end;
			until (Pos1<>-1);
			inc(R_Vue.Total_Pasaj);
			Modificar_Vue(A_Vue,R_Res.ID_Vuelo-1,R_Vue);
			Cerrar_Vue(A_Vue);
			R_Res.Activo:=True;
			R_Res.ID_Reserva:=(filesize(A_Res)+1);
			Guardar_Res(A_Res,R_Res);
			Mensaje_Alta;
		end;
	end;
	Cerrar_Res(A_Res);
end;

procedure Baja_Reserva(var A_Res:Arch_Reserva;var A_Vue:Arch_Vuelo);
var num,Pos,x,y:integer;
	R_Res:T_Reserva;
	R_Vue:T_Vuelo;
begin     
	clrscr;
	Fondo2;
	gotoxy(24,23);
	writeln('Ingrese 0 para cancelar');
	gotoxy(24,4);
	write('Ingrese el codigo de reserva: ');
	x:=54;
	y:=4;
	Ingresar_Entero(num,x,y);
	if num<>0 then
	begin
		gotoxy(24,23);
		writeln('                           ');
		Abrir_Res(A_Res);
		Busqueda_Res(A_Res,num,Pos,R_Res);
		if (Pos<>-1) then
		begin
			Leer_Res(A_Res,R_Res,Pos);
			if (R_Res.Activo=True) then
			begin
				R_Res.Activo:=False;
				Modificar_Res(A_Res,Pos,R_Res);
				Abrir_Vue(A_Vue);
				Leer_Vue(A_Vue,R_Vue,R_Res.ID_Vuelo-1);
				dec(R_Vue.Total_Pasaj);
				Modificar_Vue(A_Vue,R_Res.ID_Vuelo-1,R_Vue);
				Cerrar_Vue(A_Vue);			
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
				writeln('*     LA RESERVA ESTA DADA DE BAJA       *');
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
			writeln('*          LA RESRVA NO EXISTE           *');
			gotoxy(40,13);
			writeln('*                                        *');
			gotoxy(40,14);
			writeln('*                                        *');
			gotoxy(40,15);
			writeln('******************************************');
			gotoxy(120,30);
			readkey;
		end;
		Cerrar_Res(A_Res);
	end;
end;

procedure Modificar_Reserva(var A_Res:Arch_Reserva);
var Bus,x,y:integer;
	Pos:integer;
	R_Res:T_Reserva;
	Opc:char;
begin   
	clrscr;
	Fondo2;
	gotoxy(24,23);
	writeln('Ingrese 0 para cancelar');
	gotoxy(24,4);
	write('Ingrese el codigo de reserva: ');
	x:=54;
	y:=4;
	Ingresar_Entero(Bus,x,y);
	if Bus<>0 then
	begin
		Abrir_Res(A_Res);
		Busqueda_Res(A_Res,Bus,Pos,R_Res);
		if (Pos<>-1) then
		begin
			gotoxy(24,23);
			writeln('                            ');
			Leer_Res(A_Res,R_Res,Pos);
			if (R_Res.Activo=True) then
			begin
				repeat     
					clrscr;
					Fondo2;
					gotoxy(24,4);
					writeln('La reserva esta dada de alta');
					gotoxy(24,6);
					writeln('Sus datos son:');
					gotoxy(24,10);
					writeln('ID Reserva: ',R_Res.ID_Reserva);
					gotoxy(24,11);
					writeln('DNI Pasajero: ',R_Res.DNI);
					gotoxy(24,12);
					writeln('ID Vuelo: ',R_Res.ID_Vuelo);
					gotoxy(24,13);
					writeln('Costo: ',R_Res.Costo:2:2);
					gotoxy(24,14);
					writeln('Fecha: ',R_Res.Fecha);
					gotoxy(24,15);
					writeln('Hora: ',R_Res.Hora);
					gotoxy(24,17);
					writeln('Campo disponibles a Modificar:');
					gotoxy(52,18);
					writeln('1. Fecha');
					gotoxy(52,19);
					writeln('2. Hora');
					gotoxy(52,20);
					writeln('3. Costo');
					gotoxy(52,21);
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
								write('Fecha: ');
								x:=32;
								y:=6;
								Ingresar_Fecha(R_Res.Fecha,x,y);
								Modificar_Res(A_Res,Pos,R_Res);
								Mensaje_Modificacion;
							end;
						'2':begin    
								clrscr;
								Fondo2;
								gotoxy(24,4);
								writeln('Ingrese el nuevo dato para la modificacion');
								gotoxy(24,6);
								write('Hora: ');
								x:=31;
								y:=6;
								Ingresar_Hora(R_Res.Hora,x,y);
								Modificar_Res(A_Res,Pos,R_Res);
								Mensaje_Modificacion;
							end;
						'3':begin
								clrscr;
								Fondo2;
								gotoxy(24,4);
								writeln('Ingrese el nuevo dato para la modificacion');
								gotoxy(24,6);
								write('Costo: $');
								x:=33;
								y:=6;
								Ingresar_Real(R_Res.Costo,x,y);
								Modificar_Res(A_Res,Pos,R_Res);
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
				writeln('*     LA RESERVA ESTA DADA DE BAJA       *');
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
			writeln('*          LA RESRVA NO EXISTE           *');
			gotoxy(40,13);
			writeln('*                                        *');
			gotoxy(40,14);
			writeln('*                                        *');
			gotoxy(40,15);
			writeln('******************************************');
			gotoxy(120,30);
			readkey;
		end;
		Cerrar_Res(A_Res);
	end;
end;

procedure Listado_Reserva(var A_Res:Arch_Reserva);
var x,cantidad, i:integer;
	Vec:T_Vec_Res;
	R_Res:T_Reserva;
	opc:char;
begin
	Cargar_Res(A_Res,Vec,cantidad);
	Burbuja_Res(Vec,cantidad);
	Abrir_Res(A_Res);
	i:=1;
	opc:='*';
	x:=3;
	clrscr;
	Fondo3;
	gotoxy(3,2);
	writeln('ID Reserva   | ID Vuelo     | Costo     | Fecha      | Hora     | DNI');
	while(i<=cantidad) and (opc<>'0') do
	begin     
		Leer_Res(A_Res,R_Res,Vec[i].pos);
		gotoxy(3,x);
		writeln(R_Res.ID_Reserva);
		gotoxy(16,x);
		writeln('| ',R_Res.ID_Vuelo);
		gotoxy(31,x);
		writeln('| $',R_Res.Costo:2:2);
		gotoxy(43,x);
		writeln('| ',R_Res.Fecha);
		gotoxy(56,x);
		writeln('| ',R_Res.Hora);
		gotoxy(67,x);
		writeln('| ',R_Res.DNI);
		inc(x);
		inc(i);
		if ((x=23) or (i=cantidad+1)) then
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
					writeln('ID Reserva   | ID Vuelo     | Costo     | Fecha      | Hora     | DNI');
				end
				else
				begin
					i:=i-19-(x-3);
					x:=3;
					clrscr;
					Fondo3;
					gotoxy(3,2);
					writeln('ID Reserva   | ID Vuelo     | Costo     | Fecha      | Hora     | DNI');
				end;
			end;
			if (opc='s') and (i<cantidad)then
			begin
				x:=3;
				clrscr;
				Fondo3;
				gotoxy(3,2);
				writeln('ID Reserva   | ID Vuelo     | Costo     | Fecha      | Hora     | DNI');
			end;
		end;
	end;
	Cerrar_Res(A_Res);
end;

procedure Menu_Res;
var Opc:char;
begin
	repeat
		clrscr;
		Fondo;
		gotoxy(53,4);
		writeln('MENU DE RESERVAS');
		gotoxy(30,8);
		writeln('Opciones:');
		gotoxy(30,10);
		writeln('1. Alta de Reservas');
		gotoxy(30,12);
		writeln('2. Baja de Reservas');
		gotoxy(30,14);
		writeln('3. Modificacion de Reservas');
		gotoxy(30,16);
		writeln('4. Listado de Reservas');
		gotoxy(30,18);
		writeln('0. Regresar');
		gotoxy(120,30);
		Opc:=readkey;
		case (Opc) of
			'1': Alta_Reserva(Arch_Res,Arch_Pasaj,Arch_Vue,Arch_Aerop,Arch_Aerol);
			'2': Baja_Reserva(Arch_Res,Arch_Vue);
			'3': Modificar_Reserva(Arch_Res);
			'4': Listado_Reserva(Arch_Res);
		end;
	until(Opc='0');
end;

begin
end.
