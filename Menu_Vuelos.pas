//Buris Mateo

unit Menu_Vuelos;

interface
uses crt, Unit_Vuelos, Unit_Aerolineas, Unit_Aeropuertos, Unit_Fondo, Menu_Aeropuertos, Menu_Aerolineas, Unit_Validaciones;

procedure Alta_Vuelo(var A_Vue:Arch_Vuelo;var A_Aerop:Arch_Aeropuerto;var A_Aerol:Arch_Aerolinea);
procedure Baja_Vuelo(Var A_Vue:Arch_Vuelo);
procedure Modificar_Vuelo(var A_Vue:Arch_Vuelo);
procedure Listado_Vuelo(var A_Vue:Arch_Vuelo;var A_Aerop:Arch_Aeropuerto;var A_Aerol:Arch_Aerolinea);
procedure Fecha_Vuelo_Aeropuerto(Var A_Vue:Arch_Vuelo;var A_Aerop:Arch_Aeropuerto);
procedure Fechas_Vuelo_Aerolinea(Var A_Vue:Arch_Vuelo;var A_Aerol:Arch_Aerolinea);
procedure Menu_Vue;

implementation

procedure Alta_Vuelo(var A_Vue:Arch_Vuelo;var A_Aerop:Arch_Aeropuerto;var A_Aerol:Arch_Aerolinea);
var Escala:string;
	Opc:char;   //Opc;
	Pos,j,x,y:integer;  //Bus,Pos,i;
	R_Vue:T_Vuelo;
	R_Aerop:T_Aeropuerto;
	R_Aerol:T_Aerolinea;
begin
	clrscr;
	Fondo2;
	Abrir_Vue(A_Vue);
	repeat
		gotoxy(46,6);
		writeln('                                              ');
		gotoxy(24,8);
		writeln('                         ');
		gotoxy(24,10);
		writeln('                                                      ');
		gotoxy(24,23);
		writeln('Ingrese 0 para cancelar');
		gotoxy(24,4);
		writeln('Ingrese los datos para realizar el alta del vuelo');
		gotoxy(24,6);
		write('Aeropuerto de origen: ');
		readln(R_Vue.Origen);
		if (R_Vue.Origen<>'0') then
		begin
			gotoxy(24,23);
			writeln('                             ');
			Abrir_Aerop(A_Aerop);
			Busqueda_Aerop(A_Aerop,Pos,R_Vue.Origen,R_Aerop);
			Cerrar_Aerop(A_Aerop);
			if (Pos=-1) then
			begin
				repeat
					gotoxy(24,8);
					writeln('el aeropuerto no existe');
					gotoxy(24,10);
					writeln('0. ingresar de nuevo | A. ir al menu de aeropuertos');
					gotoxy(120,30);
					Opc:=readkey;
				until (Opc='0') or (Opc='a') or (Opc='A');
				if(Opc='a')or(Opc='A') then
				begin
					Menu_Aerop;
					clrscr;
					Fondo2;
				end;
			end;
		end;
	until (Pos<>-1) or (R_Vue.Origen='0');
	repeat
		gotoxy(46,8);
		writeln('                                              ');
		gotoxy(24,10);
		writeln('                         ');
		gotoxy(24,12);
		writeln('                                                      ');
		gotoxy(24,23);
		writeln('Ingrese 0 para cancelar');
		gotoxy(24,4);
		writeln('Ingrese los datos para realizar el alta del vuelo');
		gotoxy(24,6);
		writeln('Aeropuerto de origen: '+R_Vue.Origen);
		gotoxy(24,8);
		write('Aeropuerto de destino: ');
		readln(R_Vue.Destino);
		if (R_Vue.Destino<>'0') then
		begin
			gotoxy(24,23);
			writeln('                             ');
			Abrir_Aerop(A_Aerop);
			Busqueda_Aerop(A_Aerop,Pos,R_Vue.Destino,R_Aerop);
			Cerrar_Aerop(A_Aerop);
			if (Pos=-1) then
			begin
				repeat
					gotoxy(24,10);
					writeln('el aeropuerto no existe');
					gotoxy(24,12);
					writeln('0. ingresar de nuevo | A. ir al menu de aeropuertos');
					gotoxy(120,30);
					Opc:=readkey;
				until (Opc='0') or (Opc='a') or (Opc='A');
				if(Opc='a')or(Opc='A') then
				begin
					Menu_Aerop;
					clrscr;
					Fondo2;
				end;
			end;
		end;
	until (Pos<>-1) or (R_Vue.Destino='0');
	if (R_Vue.Origen<>'0') and (R_Vue.Destino<>'0') then
	begin
		gotoxy(24,10);
		write('Fecha de partida: ');
		x:=43;
		y:=10;
		Ingresar_Fecha(R_Vue.Fecha_Partida,x,y);
		gotoxy(24,12);
		write('Hora de partida: ');
		x:=42;
		y:=12;
		Ingresar_Hora(R_Vue.Hora_Partida,x,y);
		gotoxy(24,14);
		write('Fecha de llegada: ');
		x:=43;
		y:=14;
		Ingresar_Fecha(R_Vue.Fecha_Llegada,x,y);
		gotoxy(24,16);
		write('Hora de llegada: ');
		x:=43;
		y:=16;
		Ingresar_Hora(R_Vue.Hora_Llegada,x,y);
		clrscr;
		Fondo2;
		repeat
			gotoxy(35,6);
			writeln('                                              ');
			gotoxy(24,8);
			writeln('                         ');
			gotoxy(24,10);
			writeln('                                                      ');
			gotoxy(24,23);
			writeln('Ingrese 0 para cancelar');
			gotoxy(24,4);
			writeln('Ingrese los datos para realizar el alta del vuelo');
			gotoxy(24,6);
			write('Aerolinea: ');
			readln(R_Vue.Nombre_Aerol);
			if (R_Vue.Nombre_Aerol<>'0') then
			begin
				gotoxy(24,23);
				writeln('                             ');
				Abrir_Aerol(A_Aerol);
				Busqueda_Aerol(A_Aerol,R_Vue.Nombre_Aerol,Pos,R_Aerol);
				Cerrar_Aerol(A_Aerol);
				if (Pos=-1) then
				begin
					repeat
						gotoxy(24,8);
						writeln('la aerolinea no existe');
						gotoxy(24,10);
						writeln('0. ingresar de nuevo | A. ir al menu de aerolineas');
						gotoxy(120,30);
						Opc:=readkey;
					until (Opc='0') or (Opc='a') or (Opc='A');
					if(Opc='a')or(Opc='A') then
					begin
						Menu_Aerol;
						clrscr;
						Fondo2;
					end;
				end;
			end;
		until (Pos<>-1) or (R_Vue.Nombre_Aerol='0');
		if (R_Vue.Nombre_Aerol<>'0') then
		begin
			for j:=1 to 3 do
			begin
				R_Vue.Escalas[j]:='';
			end;
			y:=8;
			j:=0;
			Escala:='0';
			while (Escala<>'') and (j<3) do
			begin	
				repeat
					gotoxy(46,y);
					writeln('                                              ');
					gotoxy(24,y+2);
					writeln('                         ');
					gotoxy(24,y+4);
					writeln('                                                      ');
					gotoxy(24,23);
					writeln('Si no desea ingresar una escala deje en blanco');
					gotoxy(24,y);
					write('Escalas (aeropuertos): ');
					readln(Escala);
					if (Escala<>'') then
					begin
						gotoxy(24,23);
						writeln('                                                         ');
						Abrir_Aerop(A_Aerop);
						Busqueda_Aerop(A_Aerop,Pos,Escala,R_Aerop);
						Cerrar_Aerop(A_Aerop);
						if (Pos=-1) then
						begin
							repeat
								gotoxy(24,y+2);
								writeln('el aeropuerto no existe');
								gotoxy(24,y+4);
								writeln('0. ingresar de nuevo | A. ir al menu de aeropuertos');
								gotoxy(120,30);
								Opc:=readkey;
							until (Opc='0') or (Opc='a') or (Opc='A');
							if(Opc='a')or(Opc='A') then
							begin
								Menu_Aerop;
								clrscr;
								Fondo2;
								gotoxy(24,4);
								writeln('Ingrese los datos para realizar el alta del vuelo');
								gotoxy(24,6);
								writeln('Aerolinea: '+R_Vue.Nombre_Aerol);
								if (R_Vue.Escalas[1]<>'') then
								begin
									gotoxy(24,8);
									writeln('Escala n1: ',R_Vue.Escalas[1]);
								end;
								if (R_Vue.Escalas[2]<>'') then
								begin
									gotoxy(24,10);
									writeln('Escala n2: ',R_Vue.Escalas[2]);
								end;
							end;
						end;
					end;
				until (Pos<>-1) or (Escala='');
				if (Escala<>'') then
				begin
					Inc(j);
					R_Vue.Escalas[j]:=Escala;
					gotoxy(24,y);
					writeln('                                                     ' );
					gotoxy(24,y);
					writeln('Escala n',j,': ',R_Vue.Escalas[j]);
					y:=y+2;
				end;
			end;
			gotoxy(24,23);
			writeln('                                                         ');
			gotoxy(24,y);
			writeln('                                                       ');
			gotoxy(24,y);
			write('Cantidad de pasajeros: ');
			x:=47;
			Ingresar_Entero(R_Vue.Cant_Pasajeros,x,y);
			R_Vue.Total_Pasaj:=0;
			R_Vue.Activo:=True;
			R_Vue.ID_Vuelo:=(Filesize(A_Vue)+1);
			Guardar_Vue(A_Vue,R_Vue);
			Mensaje_Alta;
		end;
	end;
	Cerrar_Vue(A_Vue);
end;

procedure Baja_Vuelo(var A_Vue:Arch_Vuelo);
var Bus,Pos,x,y:integer;
	R_Vue:T_Vuelo;
begin
	clrscr;
	Fondo2;
	gotoxy(24,23);
	writeln('Ingrese 0 para cancelar');
	gotoxy(24,4);
	write('Ingrese el ID del vuelo: ');
	x:=49;
	y:=4;
	Ingresar_Entero(Bus,x,y);
	if Bus<>0 then
	begin
		gotoxy(24,23);
		writeln('                            ');
		Abrir_Vue(A_Vue);
		Busqueda_Vue(A_Vue,Bus,Pos,R_Vue);
		if (Pos<>-1) then
		begin
			Leer_Vue(A_Vue,R_Vue,Pos);
			if (R_Vue.Activo=True) then
			begin
				R_Vue.Activo:=False;
				Modificar_Vue(A_Vue,Pos,R_Vue);
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
				writeln('*       EL VUELO ESTA DADO DE BAJA       *');
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
			writeln('*           EL VUELO NO EXISTE           *');
			gotoxy(40,13);
			writeln('*                                        *');
			gotoxy(40,14);
			writeln('*                                        *');
			gotoxy(40,15);
			writeln('******************************************');
			gotoxy(120,30);
			readkey;
		end;
	end;
	Cerrar_Vue(A_Vue);
end;

procedure Modificar_Vuelo(var A_Vue:Arch_Vuelo);
var Bus,x,y:integer;
	Pos,i:integer;
	R_Vue:T_Vuelo;
	Opc:char;
begin
	clrscr;
	Fondo2;
	gotoxy(24,23);
	writeln('Ingrese 0 para cancelar');
	gotoxy(24,4);
	write('Ingrese el ID del vuelo: ');
	x:=49;
	y:=4;
	Ingresar_Entero(Bus,x,y);
	if Bus<>0 then
	begin
		Abrir_Vue(A_Vue);
		Busqueda_Vue(A_Vue,Bus,Pos,R_Vue);
		if (Pos<>-1) then
		begin
			Leer_Vue(A_Vue,R_Vue,Pos);
			if (R_Vue.Activo=True) then
			begin
				repeat
					clrscr;
					Fondo2;
					gotoxy(24,4);
					writeln('El Vuelo esta dado de Alta');
					gotoxy(24,6);
					writeln('Sus Datos son:');
					gotoxy(24,7);
					writeln('ID de Vuelo: ',R_Vue.ID_Vuelo);
					gotoxy(24,8);
					writeln('Aerolinea: ',R_Vue.Nombre_Aerol);
					gotoxy(24,9);
					writeln('Aeropuerto de Origen: ',R_Vue.Origen);
					gotoxy(24,10);
					writeln('Fecha de Partida: ',R_Vue.Fecha_Partida);
					gotoxy(24,11);
					writeln('Hora de Partida: ',R_Vue.Hora_Partida);
					gotoxy(24,12);
					writeln('Aeropuerto de Destino: ',R_Vue.Destino);
					gotoxy(24,13);
					writeln('Fecha de Llegada: ',R_Vue.Fecha_Llegada);
					gotoxy(24,14);
					writeln('Hora de Llegada: ',R_Vue.Hora_Llegada);
					x:=14;
					for i:= 1 to 3 do
					begin
						if (R_Vue.Escalas[i]<>'') then
						begin
							Inc(x);
							gotoxy(24,x);
							writeln('Escala n',i,': ',R_Vue.Escalas[i]);
						end;
					end;
					inc(x);
					gotoxy(24,x);
					writeln('Cantidad de Pasajeros: ',R_Vue.Cant_Pasajeros);
					inc(x);
					x:=x+2;
					gotoxy(24,x);
					writeln('Campos Disponibles a Modificar:');
					inc(x);
					gotoxy(30,x);
					writeln('1. Fecha de Partida                 2. Hora de Partida');
					inc(x);
					gotoxy(30,x);
					writeln('3. Fecha de Llegada                 4. Hora de Llegada');
					inc(x);
					gotoxy(30,x);
					writeln('5. Cantidad de pasajeros            0. Salir');
					gotoxy(120,30);
					Opc:=readkey;
					case Opc of
						'1':begin
								clrscr;
								Fondo2;
								gotoxy(24,4);
								writeln('Ingrese el nuevo dato para la modificacion');
								gotoxy(24,6);
								write('Fecha de Partida: ');
								x:=42;
								y:=6;
								Ingresar_Fecha(R_Vue.Fecha_Partida,x,y);
								Modificar_Vue(A_Vue,Pos,R_Vue);
								Mensaje_Modificacion;
							end;
						'2':begin
								clrscr;
								Fondo2;
								gotoxy(24,4);
								writeln('Ingrese el nuevo dato para la modificacion');
								gotoxy(24,6);
								write('Hora de Partida: ');
								x:=41;
								y:=6;
								Ingresar_Hora(R_Vue.Hora_Partida,x,y);
								Modificar_Vue(A_Vue,Pos,R_Vue);
								Mensaje_Modificacion;
							end;
						'3':begin
								clrscr;
								Fondo2;
								gotoxy(24,4);
								writeln('Ingrese el nuevo dato para la modificacion');
								gotoxy(24,6);
								write('Fecha de Llegada: ');
								x:=42;
								y:=6;
								Ingresar_Fecha(R_Vue.Fecha_Llegada,x,y);
								Modificar_Vue(A_Vue,Pos,R_Vue);
								Mensaje_Modificacion;
							end;
						'4':begin
								clrscr;
								Fondo2;
								gotoxy(24,4);
								writeln('Ingrese el nuevo dato para la modificacion');
								gotoxy(24,6);
								write('Hora de Llegada: ');
								x:=41;
								y:=6;
								Ingresar_Hora(R_Vue.Hora_Llegada,x,y);
								Modificar_Vue(A_Vue,Pos,R_Vue);
								Mensaje_Modificacion;
							end;
						'5':begin
								clrscr;
								Fondo2;
								gotoxy(24,4);
								writeln('Ingrese el nuevo dato para la modificacion');
								gotoxy(24,6);
								write('Cantidad de pasajeros: ');
								x:=47;
								y:=6;
								Ingresar_Entero(R_Vue.Cant_Pasajeros,x,y);
								Modificar_Vue(A_Vue,Pos,R_Vue);
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
				writeln('*       EL VUELO ESTA DADO DE BAJA       *');
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
			writeln('*           EL VUELO NO EXISTE           *');
			gotoxy(40,13);
			writeln('*                                        *');
			gotoxy(40,14);
			writeln('*                                        *');
			gotoxy(40,15);
			writeln('******************************************');
			gotoxy(120,30);
			readkey;
		end;
		Cerrar_Vue(A_Vue);
	end;
end;

procedure Listado_Vuelo(var A_Vue:Arch_Vuelo;var A_Aerop:Arch_Aeropuerto;var A_Aerol:Arch_Aerolinea);
var pos,cantidad,i,j,c,x,s,num,cod:integer; 
	bus:string;
	Vec:T_Vec_Vue;
	R_Vue:T_Vuelo;
	opc:char;
begin
	Cargar_Vue(A_Vue,Vec, cantidad);
	Burbuja_Vue(Vec, cantidad);
	Abrir_Vue(A_Vue);
	Abrir_Aerop(A_Aerop);
	Abrir_Aerol(A_Aerol);
	i:=1;
	opc:='*';
	x:=3;
	clrscr;
	Fondo3;
	gotoxy(3,2);
	writeln('ID Vuelo | Aerolinea   | Origen      | Fecha P.  | Hora P. | Destino      | Fecha L.  | Hora L.| Escalas | Pasajeros');
	while(i<=cantidad) and (opc<>'0') do
	begin
		Leer_Vue(A_Vue,R_Vue,Vec[i].pos);
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
		inc(i);
		if ((x=22) or (i=cantidad+1)) then
		begin	
			gotoxy(3,23);
			writeln('A. Anterior | S. Siguiente | V. Escalas | 0. Salir');
			repeat
				gotoxy(120,30);
				opc:=readkey;
			until  (opc='0') or (opc='a') or (opc='s') or (opc='v');
			if (Opc='v') then
			begin
				gotoxy(25,10);
				writeln('****************************************************************');
				gotoxy(25,11);
				writeln('*      Ingrese el ID del vuelo para ver las escalas:           *');
				gotoxy(25,12);
				writeln('*                                                              *');
				gotoxy(25,13);
				writeln('*                                                              *');
				gotoxy(25,14);
				writeln('*                                                              *');
				gotoxy(25,15);
				writeln('*                                                              *');
				gotoxy(25,16);
				writeln('*                                                              *');
				gotoxy(25,17);
				writeln('*   Enter para continuar                                       *');
				gotoxy(25,18);
				writeln('****************************************************************');
				repeat
					gotoxy(77,11);
					writeln('     ');
					gotoxy(77,11);
					readln(bus);
					Val(bus,num,cod);
					if cod<>0 then
					begin
						gotoxy(40,13);
						writeln('ingrese un numero entero');
					end;
				until(cod=0);
				gotoxy(40,13);
				writeln('                              ');
				pos:=-1;
				seek(A_Vue,0);
				Busqueda_Vue(A_Vue,num,pos,R_Vue);
				if (pos<>-1) then
				begin
					Leer_Vue(A_Vue,R_Vue,pos);
					if (R_Vue.Activo=true) then
					begin					
						s:=0;
						x:=12;
						for j:= 1 to 3 do
						begin
							inc(x);
							gotoxy(40,x);
							writeln(R_Vue.Escalas[j]);
							if (R_Vue.Escalas[j]='') then
							begin
								inc(s);
							end;
						end;
						if (s=3) then
						begin
							gotoxy(40,13);
							writeln(' El vuelo no posee escalas');
						end;
					end
					else
					begin
						gotoxy(40,13);
							writeln(' El vuelo esta dado de baja');
					end;
				end
				else
				begin
					gotoxy(40,13);
					writeln('No existe el vuelo');
				end;
				gotoxy(120,30);
				readkey;
				i:=1;
				x:=3;
				clrscr;
				Fondo3;
				gotoxy(3,2);
				writeln('ID Vuelo | Aerolinea   | Origen      | Fecha P.  | Hora P. | Destino      | Fecha L.  | Hora L.| Escalas | Pasajeros');
			end;
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
	Cerrar_Vue(A_Vue);
	Cerrar_Aerop(A_Aerop);
	Cerrar_Aerol(A_Aerol);
end;

procedure Fecha_Vuelo_Aeropuerto(var A_Vue:Arch_Vuelo;var A_Aerop:Arch_Aeropuerto);
var i,j,Pos,x,y,cantidad,c:integer;
	opc:char;
	Bus,aeropuerto:string[20];
	R_Vue:T_Vuelo;
	R_Aerop:T_Aeropuerto;
	Vec1:T_Vec_Vue;
begin
	clrscr;
	Fondo2;
	gotoxy(24,4);
	writeln('Listado de vuelos de un Aeropuerto segun una fecha');
	gotoxy(24,6);
	write('Ingrese la fecha: ');
	x:=42;
	y:=6;
	Ingresar_Fecha(Bus,x,y);
	Cargar_Vue(A_Vue,Vec1,cantidad);
	Burbuja_Vue(Vec1, cantidad);
	Abrir_Vue(A_Vue);
	gotoxy(24,8);
	write('Ingrese el nombre del aeropuerto que desea buscar: ');
	readln(aeropuerto);
	Pos:=-1;
	Abrir_Aerop(A_Aerop);
	Busqueda_Aerop(A_Aerop,Pos,aeropuerto,R_Aerop);
	if (Pos<>-1) then
	begin
		Leer_Aerop(A_Aerop,R_Aerop,Pos);
		if (R_Aerop.Activo=true) then
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
				Leer_Vue(A_Vue,R_Vue,Vec1[i].pos);
				if (Bus=R_Vue.Fecha_Partida) and (aeropuerto=R_Vue.Origen) then
				begin
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
					until  (opc='0') or (opc='a') or (opc='s');
				end;
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
			end
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
	Cerrar_Vue(A_Vue);
end;

procedure Fechas_Vuelo_Aerolinea(var A_Vue:Arch_Vuelo;var A_Aerol:Arch_Aerolinea);
var Pos,cantidad,codigo,i,DI1,MI1,AI1,DI2,MI2,AI2,DIP,MIP,AIP,j,c,x,y:integer;
	opc:char;
	Fecha1,Fecha2,Aerolinea,DS1,MS1,AS1,DS2,MS2,AS2,DSP,MSP,ASP:string[20];
	R_Vue:T_Vuelo;
	R_Aerol:T_Aerolinea;
	Vec:T_Vec_Vue;
begin
	clrscr;
	Fondo2;
	gotoxy(24,4);
	writeln('Listado de Vuelos de una Aerolinea en un Rango de Fechas');
	gotoxy(24,6);
	write('Ingrese la primer fecha: ');
	x:=49;
	y:=6;
	Ingresar_Fecha(Fecha1,x,y);
	gotoxy(24,8);
	write('Ingrese la segunda fecha: ');
	x:=50;
	y:=8;
	Ingresar_Fecha(Fecha2,x,y);
	Cargar_Vue(A_Vue,Vec,cantidad);
	Burbuja_Vue(Vec,cantidad);
	Abrir_Vue(A_Vue);
	gotoxy(24,10);
	write('Ingrese el nombre de la Aerolinea: ');
	readln(Aerolinea);
	Pos:=-1;
	Abrir_Aerol(A_Aerol);
	Busqueda_Aerol(A_Aerol,Aerolinea,Pos,R_Aerol);
	Cerrar_Aerol(A_Aerol);
	if (Pos<>-1) then
	begin
		Aerolinea:=R_Aerol.Nombre;
		clrscr;
		Fondo3;
		i:=1;
		opc:='*';
		x:=3;
		gotoxy(3,2);
		writeln('ID Vuelo | Aerolinea   | Origen      | Fecha P.  | Hora P. | Destino      | Fecha L.  | Hora L.| Escalas | Pasajeros');
		while(i<=cantidad) and (opc<>'0') do
		begin
			Leer_Vue(A_Vue,R_Vue,Vec[i].Pos);
			AS1:= copy(Fecha1,1,4);
			MS1:= copy(Fecha1,6,2);
			DS1:= copy(Fecha1,9,2);
			AS2:= copy(Fecha2,1,4);
			MS2:= copy(Fecha2,6,2);
			DS2:= copy(Fecha2,9,2);
			ASP:= copy(R_Vue.Fecha_Partida,1,4);
			MSP:= copy(R_Vue.Fecha_Partida,6,2);
			DSP:= copy(R_Vue.Fecha_Partida,9,2);
			Val(DS1,DI1,codigo);
			Val(MS1,MI1,codigo);
			Val(AS1,AI1,codigo);
			Val(DS2,DI2,codigo);
			Val(MS2,MI2,codigo);
			Val(AS2,AI2,codigo);
			Val(DSP,DIP,codigo);
			Val(MSP,MIP,codigo);
			Val(ASP,AIP,codigo);
			if (Aerolinea=R_Vue.Nombre_Aerol) and(((AI1<=AIP) and (AI2>=AIP)) and((MI1<=MIP) and (MI2>=MIP)) and (((MI1=MIP)and(DIP>=DI1)) or ((MIP=MI2)and(DIP<=DI2)) or((MIP>MI1)and(MIP<MI2)))) then
			begin
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
				writeln(' A. Anterior | S. Siguiente | 0. Salir');
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
				If (opc='s') and (i<cantidad)then
				begin
					x:=3;
					clrscr;
					Fondo3;
					gotoxy(2,3);
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
	Cerrar_Vue(A_Vue);
end;

procedure Menu_Vue;
var Opc:char;
begin
	repeat
		clrscr;
		Fondo;
		gotoxy(54,4);
		writeln('MENU DE VUELOS');
		gotoxy(30,8);
		writeln('Seleccione una Opcion:');
		gotoxy(30,10);
		writeln('1. Alta de Vuelos');
		gotoxy(30,12);
		writeln('2. Baja de Vuelos');
		gotoxy(30,14);
		writeln('3. Modificacion de Vuelos');
		gotoxy(30,16);
		writeln('4. Listado de Vuelos');
		gotoxy(30,18);
		writeln('5. Vuelos de un Aeropuerto segun la Fecha');
		gotoxy(30,20);
		writeln('6. Vuelos de una Aerolinea segun un Rango de Fechas');
		gotoxy(30,22);
		writeln('0. Regresar');
		gotoxy(120,30);
		Opc:=readkey;
		case (Opc) of
			'1': Alta_Vuelo(Arch_Vue,Arch_Aerop,Arch_Aerol);
			'2': Baja_Vuelo(Arch_Vue);
			'3': Modificar_Vuelo(Arch_Vue);
			'4': Listado_Vuelo(Arch_Vue,Arch_Aerop,Arch_Aerol);
			'5': Fecha_Vuelo_Aeropuerto(Arch_Vue,Arch_Aerop);
			'6': Fechas_Vuelo_Aerolinea(Arch_Vue,Arch_Aerol);
		end;
	until(Opc='0');
end;

begin
end.
