//Buris Mateo

unit Menu_Pasajeros;

interface
uses crt, Unit_Pasajeros, Unit_Reservas, Unit_Vuelos,Unit_Fondo,Unit_Validaciones;

procedure Alta_Pasajero(var A_Pasaj:Arch_Pasajero);
procedure Baja_Pasajero(var A_Pasaj:Arch_Pasajero);
procedure Modificar_Pasajero(var A_Pasaj:Arch_Pasajero);
procedure Listado_Pasajero(var A_Pasaj:Arch_Pasajero);
procedure Pasajero_Vuelo(var A_Res:Arch_Reserva;var A_Vue:Arch_Vuelo;var A_Pasaj:Arch_Pasajero);
procedure Menu_Pasaj;

implementation

procedure Alta_Pasajero(var A_Pasaj:Arch_Pasajero);
var Pos,x,y:integer;
	dni:string;
	R_Pasaj:T_Pasajero;
	Opc:char;
begin
	clrscr;
	Fondo2;
	gotoxy(24,23);
	writeln('Ingrese 0 para cancelar');
	gotoxy(24,4);
	write('Ingrese el DNI del pasajero: ');
	x:=53;
	y:=4;
	Ingresar_DNI(dni,x,y);
	if dni<>'0' then
	begin
		Abrir_Pasaj(A_Pasaj);
		Busqueda_Pasaj(A_Pasaj,dni,Pos,R_Pasaj);
		if (Pos=-1)then
		begin
			gotoxy(24,23);
			writeln('                             ');
			gotoxy(24,6);
			writeln('                                             ');
			gotoxy(24,6);
			write('Apellido: ');
			readln(R_Pasaj.Apellido);
			gotoxy(24,8);
			write('Nombre: ');
			readln(R_Pasaj.Nombre);
			gotoxy(24,10);
			write('Edad: ');
			x:=30;
			y:=10;
			Ingresar_Entero(R_Pasaj.Edad,x,y);
			R_Pasaj.DNI:=dni;
			R_Pasaj.Activo:=true;
			Guardar_Pasaj(A_Pasaj,R_Pasaj);
			Mensaje_Alta;
			Cerrar_Pasaj(A_Pasaj);
		end
		else
		begin
			Leer_Pasaj(A_Pasaj,R_Pasaj,Pos);
			Cerrar_Pasaj(A_Pasaj);
			if (R_Pasaj.Activo=True) then
			begin
				repeat
					clrscr;
					Fondo2;
					gotoxy(24,4);
					writeln('El pasajero ya fue dado de alta');
					gotoxy(24,6);
					writeln('Sus datos son:');
					gotoxy(24,10);
					writeln('DNI: ',R_Pasaj.DNI);
					gotoxy(24,11);
					writeln('Apellido: ',R_Pasaj.Apellido);
					gotoxy(24,12);
					writeln('Nombre: ',R_Pasaj.Nombre);
					gotoxy(24,13);
					writeln('Edad: ',R_Pasaj.Edad);
					gotoxy(24,15);
					writeln('Elija una opcion para seguir:');
					gotoxy(45,16);
					writeln('1. Baja pasajero');
					gotoxy(45,17);
					writeln('2. Modificar pasajero');
					gotoxy(45,18);
					writeln('0. Salir');
					gotoxy(120,30);
					Opc:=readkey;
					case (Opc) of
						'1': Baja_Pasajero(A_Pasaj);
						'2': Modificar_Pasajero(A_Pasaj);
					end;
				until (Opc='0');
			end
			else
			begin
				repeat
					clrscr;        
					Fondo2;
					gotoxy(24,4);
					writeln('El pasajero esta dado de baja');
					gotoxy(24,6);
					writeln('Sus datos son:');
					gotoxy(24,10);
					writeln('DNI: ',R_Pasaj.DNI);
					gotoxy(24,11);
					writeln('Apellido: ',R_Pasaj.Apellido);
					gotoxy(24,12);
					writeln('Nombre: ',R_Pasaj.Nombre);
					gotoxy(24,13);
					writeln('Edad: ',R_Pasaj.Edad);
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
								R_Pasaj.Activo:=true;
								Abrir_Pasaj(A_Pasaj);
								Modificar_Pasaj(A_Pasaj,Pos,R_Pasaj);
								Cerrar_Pasaj(A_Pasaj);
								Mensaje_Reactivacion;
							end;
					end;
				until (Opc='0');
			end;
		end;
	end;
end;

procedure Baja_Pasajero(var A_Pasaj:Arch_Pasajero);
var Bus:string;
	Pos,x,y:integer;
	R_Pasaj:T_Pasajero;
begin
	clrscr;
	Fondo2;
	gotoxy(24,23);
	writeln('Ingrese 0 para cancelar');
	gotoxy(24,4);
	write('Ingrese el DNI: ');
	x:=40;
	y:=4;
	Ingresar_DNI(Bus,x,y);
	if Bus<>'0' then
	begin
		gotoxy(24,23);
		writeln('                            ');
		Abrir_Pasaj(A_Pasaj);
		Busqueda_Pasaj(A_Pasaj,Bus,Pos,R_Pasaj);
		if (Pos<>-1) then
		begin
			Leer_Pasaj(A_Pasaj,R_Pasaj,Pos);
			if (R_Pasaj.Activo=True) then
			begin
				R_Pasaj.Activo:=False;
				Modificar_Pasaj(A_Pasaj,Pos,R_Pasaj);
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
				writeln('*      EL PASAJERO ESTA DADO DE BAJA     *');
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
			writeln('*          EL PASAJERO NO EXISTE         *');
			gotoxy(40,13);
			writeln('*                                        *');
			gotoxy(40,14);
			writeln('*                                        *');
			gotoxy(40,15);
			writeln('******************************************');
			gotoxy(120,30);
			readkey;
		end;
		Cerrar_Pasaj(A_Pasaj);
	end;
end;

procedure Modificar_Pasajero(var A_Pasaj:Arch_Pasajero);
var Bus:string;
	Pos,x,y:integer;
	R_Pasaj:T_Pasajero;
	Opc:char;
begin
	clrscr;
	Fondo2;
	gotoxy(24,23);
	writeln('Ingrese 0 para cancelar');
	gotoxy(24,4);
	write('Ingrese el DNI: ');
	x:=40;
	y:=4;
	Ingresar_DNI(Bus,x,y);
	if Bus<>'0' then
	begin
		gotoxy(24,23);
		writeln('                           ');
		Abrir_Pasaj(A_Pasaj);
		Busqueda_Pasaj(A_Pasaj,Bus,Pos,R_Pasaj);
		if (Pos<>-1) then
		begin
			Leer_Pasaj(A_Pasaj,R_Pasaj,Pos);
			if (R_Pasaj.Activo=True) then
			begin
				repeat   
					clrscr;
					Fondo2;
					gotoxy(24,4);
					writeln('El pasajero esta dado de alta');
					gotoxy(24,6);
					writeln('Sus datos son:');
					gotoxy(24,10);
					writeln('DNI: ',R_Pasaj.DNI);
					gotoxy(24,11);
					writeln('Apellido: ',R_Pasaj.Apellido);
					gotoxy(24,12);
					writeln('Nombre: ',R_Pasaj.Nombre);
					gotoxy(24,13);
					writeln('Edad: ',R_Pasaj.Edad);
					gotoxy(24,15);
					writeln('Campos disponibles a Modificar:');
					gotoxy(52,16);
					writeln('1. Apellido');
					gotoxy(52,17);
					writeln('2. Nombre');
					gotoxy(52,18);
					writeln('3. Edad');
					gotoxy(52,19);
					writeln('4. DNI');
					gotoxy(52,20);
					writeln('0. Salir');
					gotoxy(120,30);
					Opc:=readkey;
					case Opc of
						'1':begin
								clrscr;
								Fondo2;
								gotoxy(24,4);
								writeln('Ingrese el nuevo dato para la modificacion');
								gotoxy(24,6);
								write('Apellido: ');
								readln(R_Pasaj.Apellido);
								Modificar_Pasaj(A_Pasaj,Pos,R_Pasaj);
								Mensaje_Modificacion;
							end;
						'2':begin
								clrscr;
								Fondo2;
								gotoxy(24,4);
								writeln('Ingrese el nuevo dato para la modificacion');
								gotoxy(24,6);
								write('Nombre: ');
								readln(R_Pasaj.Nombre);
								Modificar_Pasaj(A_Pasaj,Pos,R_Pasaj);
								Mensaje_Modificacion;
							end;
						'3':begin
								clrscr;
								Fondo2;
								gotoxy(24,4);
								writeln('Ingrese el nuevo dato para la modificacion');
								gotoxy(24,6);
								write('Edad: ');
								readln(R_Pasaj.Edad);
								Modificar_Pasaj(A_Pasaj,Pos,R_Pasaj);
								Mensaje_Modificacion;
							end;
						'4':begin
								clrscr;
								Fondo2;
								gotoxy(24,6);
								write('Ingrese el DNI: ');
								x:=40;
								y:=6;
								Ingresar_DNI(R_Pasaj.DNI,x,y);
								Modificar_Pasaj(A_Pasaj,Pos,R_Pasaj);
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
				writeln('*      EL PASAJERO ESTA DADO DE BAJA     *');
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
			writeln('*          EL PASAJERO NO EXISTE         *');
			gotoxy(40,13);
			writeln('*                                        *');
			gotoxy(40,14);
			writeln('*                                        *');
			gotoxy(40,15);
			writeln('******************************************');
			gotoxy(120,30);
			readkey;
		end;
		Cerrar_Pasaj(A_Pasaj);
	end;
end;

procedure Listado_Pasajero(var A_Pasaj:Arch_Pasajero);
var x,cantidad,i:integer;
	Vec:T_Vec_Pasaj;
	R_Pasaj:T_Pasajero;
	opc:char;
begin
	Cargar_Pasaj(A_Pasaj,Vec, cantidad);
	Burbuja_Pasaj(Vec, cantidad);
	Abrir_Pasaj(A_Pasaj);
	i:=1;
	opc:='*';
	x:=3;
	clrscr;
	Fondo3;
	gotoxy(3,2);
	writeln('Apellido         | Nombre             | DNI          | Edad');
	while(i<=cantidad) and (opc<>'0') do
	begin
		Leer_Pasaj(A_Pasaj,R_Pasaj,Vec[i].pos);
		gotoxy(3,x);
		writeln(R_Pasaj.Apellido);
		gotoxy(20,x);
		writeln('| ',R_Pasaj.Nombre);
		gotoxy(41,x);
		writeln('| ',R_Pasaj.DNI);
		gotoxy(56,x);
		writeln('| ',R_Pasaj.Edad);
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
					writeln('Apellido         | Nombre             | DNI          | Edad');
				end
				else
				begin
					i:=i-19-(x-3);
					x:=3;
					clrscr;
					Fondo3;
					gotoxy(3,2);
					writeln('Apellido         | Nombre             | DNI          | Edad');
				end;
			end;
			if (opc='s') and (i<cantidad)then
			begin
				x:=3;
				clrscr;
				Fondo3;
				gotoxy(3,2);
				writeln('Apellido         | Nombre             | DNI          | Edad');
			end;
		end;
	end;
	Cerrar_Pasaj(A_Pasaj);
end;

procedure Pasajero_Vuelo(var A_Res:Arch_Reserva;var A_Vue:Arch_Vuelo;var A_Pasaj:Arch_Pasajero);
var Bus:string;
	i,c,j,x,y,pos,cantidad,cantidad1,posvuelo:integer;
	Vec:T_Vec_Res;
	Vec1:T_Vec_Vue;
	R_Res:T_Reserva;
	R_Vue:T_Vuelo;
	R_Pasaj:T_Pasajero;
	opc:char;
begin
	clrscr;
	Fondo2;
	gotoxy(24,23);
	writeln('Ingrese 0 para cancelar');
	gotoxy(24,4);
	write('Ingrese el DNI: ');
	x:=40;
	y:=4;
	Ingresar_DNI(Bus,x,y);
	if Bus<>'0' then
	begin
		Cargar_Res(A_Res,Vec,cantidad);
		Cargar_Vue(A_Vue,Vec1,cantidad1);
		Burbuja_Vue(Vec1,cantidad1);
		Abrir_Res(A_Res);
		Abrir_Vue(A_Vue);
		Pos:=-1;
		Abrir_Pasaj(A_Pasaj);
		Busqueda_Pasaj(A_Pasaj,Bus,Pos,R_Pasaj);
		Cerrar_Pasaj(A_Pasaj);
		if (pos<>-1) then
		begin
			clrscr;
			Fondo3;
			i:=1;
			opc:='*';
			x:=3;
			gotoxy(3,2);
			writeln('ID Vuelo | Aerolinea   | Origen      | Fecha P.  | Hora P. | Destino      | Fecha L.  | Hora L.| Escalas | Pasajeros');
			while(i<=cantidad) and (opc<>'0') do
			begin
				Leer_Res(A_Res,R_Res,Vec[i].Pos);
				if (Bus=R_Res.DNI) then
				begin
					Busqueda_Vue(A_Vue,R_Res.ID_Vuelo,posvuelo,R_Vue);
					Leer_Vue(A_Vue,R_Vue,posvuelo);
					gotoxy(3,x);
					writeln(R_Vue.ID_Vuelo);
					gotoxy(12,x);
					writeln('| ',R_Vue.Nombre_Aerol);
					gotoxy(26,x);
					writeln('| ',R_Vue.Origen);
					gotoxy(40,x);
					writeln('| ',R_Vue.Fecha_Partida);
					gotoxy(52,x);
					writeln('| ',R_Vue.Hora_Partida);
					gotoxy(62,x);
					writeln('| ',R_Vue.Destino);
					gotoxy(77,x);
					writeln('| ',R_Vue.Fecha_Llegada);
					gotoxy(89,x);
					writeln('| ',R_Vue.Hora_Llegada);
					gotoxy(98,x);
					c:=0;
					for j:= 1 to 3 do
					begin
						if (R_Vue.Escalas[j]<>'') then
						begin
							inc(c);
						end;
					end;
					writeln('| ',c);
					gotoxy(108,x);
					writeln('| ',R_Vue.Total_Pasaj,'/',R_Vue.Cant_Pasajeros);
					inc(x);
				end;
				inc(i);
				if ((x=23) or (i=cantidad+1)) then
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
							writeln('ID Vuelo | Aerolinea   | Origen      | Fecha P.  | Hora P. | Destino      | Fecha L.  | Hora L.| Escalas | Pasajeros');
						end
						else
						begin
							i:=i-19-(x-3);
							x:=3;
							clrscr;
							Fondo3;
							gotoxy(3,2);
							writeln('ID Vuelo | Aerolinea   | Origen      | Fecha P.  | Hora P. | Destino      | Fecha L.  | Hora L.| Escalas | Pasajeros');
						end;
					end;
					if (opc='s') and (i<cantidad)then
					begin
						x:=3;
						clrscr;
						Fondo3;
						gotoxy(3,2);
						writeln('ID Vuelo | Aerolinea   | Origen      | Fecha P.  | Hora P. | Destino      | Fecha L.  | Hora L.| Escalas | Pasajeros');
					end;
				end;
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
			writeln('*          EL PASAJERO NO EXISTE         *');
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
		Cerrar_Vue(A_Vue);
	end;
end;

procedure Menu_Pasaj;
var Opc:char;
begin
	repeat
		clrscr;
		Fondo;
		gotoxy(53,4);
		writeln('MENU DE PASAJEROS');
		gotoxy(30,8);
		writeln('  Opciones:');
		gotoxy(30,10);
		writeln('1. Alta de Pasajeros');
		gotoxy(30,12);
		writeln('2. Baja de Pasajeros');
		gotoxy(30,14);
		writeln('3. Modificacion de Pasajeros');
		gotoxy(30,16);
		writeln('4. Listado de Pasajeros');
		gotoxy(30,18);
		writeln('5. Vuelos que ha realizado un Pasajero');
		gotoxy(30,20);
		writeln('0. Regresar');
		gotoxy(120,30);
		Opc:=readkey;
		case (Opc) of
			'1': Alta_Pasajero(Arch_Pasaj);
			'2': Baja_Pasajero(Arch_Pasaj);
			'3': Modificar_Pasajero(Arch_Pasaj);
			'4': Listado_Pasajero(Arch_Pasaj);
			'5': Pasajero_Vuelo(Arch_Res,Arch_Vue,Arch_Pasaj);
		end;
	until(Opc='0');
end;

begin
end.
