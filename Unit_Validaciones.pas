//Buris Mateo

unit Unit_Validaciones;

interface

uses crt;

procedure Ingresar_Fecha(var fecha:string; x,y:integer);
procedure Ingresar_Hora(var hora:string; x,y:integer);
procedure Ingresar_Real(var numero:real; x,y:integer);
procedure Ingresar_Entero(var numero:integer; x,y:integer);
procedure Ingresar_EnteroEnString(var numero:string; x,y:integer);
procedure Ingresar_DNI(var dni:string; x,y:integer);
procedure Ingresar_CUIT(var cuit:string; x,y:integer);

implementation

procedure Ingresar_Fecha(var fecha:string; x,y:integer);

var cod,num:integer;
	dia,mes,anio:string;
	estado:boolean;
begin
	estado:=false;
	gotoxy(x,y);
	writeln('Anio (2019..): ');
	repeat
		repeat
			gotoxy(x+15,y);
			writeln('                ');
			gotoxy(x+15,y);
			readln(anio);
			Val(anio,num,cod);
			if cod<>0 then
			begin
				gotoxy(24,y+1);
				writeln('                                                        ');
				gotoxy(24,y+1);
				writeln('Ingrese un numero entero');
			end
			else 
			begin
				if length(anio)<>4 then
				begin
					gotoxy(24,y+1);
					writeln('                                                        ');
					gotoxy(24,y+1);
					writeln('Ingrese un numero de 4 digitos');
					cod:=1;
				end;
			end;
		until(cod=0);
		if (num >= 2019) then
		begin
			estado:=true;
		end
		else
		begin
			gotoxy(24,y+1);
			writeln('                                                        ');
			gotoxy(24,y+1);
			writeln('Ingrese un numero correspondiente');
		end;
	until(estado=true);
	gotoxy(24,y+1);
	writeln('                                                        ');
	estado:=false;
	gotoxy(x,y+1);
	writeln('Mes (01..12): ');
	repeat
		repeat
			gotoxy(x+14,y+1);
			writeln('                ');
			gotoxy(x+14,y+1);
			readln(mes);
			Val(mes,num,cod);
			if cod<>0 then
			begin
				gotoxy(24,y+2);
				writeln('                                                        ');
				gotoxy(24,y+2);
				writeln('Ingrese un numero entero');
			end
			else 
			begin
				if length(mes)<>2 then
				begin
					gotoxy(24,y+2);
					writeln('                                                        ');
					gotoxy(24,y+2);
					writeln('Ingrese un numero de 2 digitos');
					cod:=1;
				end;
			end;
		until(cod=0);
		if num in [1..12] then
		begin
			estado:=true;
		end
		else
		begin
			gotoxy(24,y+2);
			writeln('                                                        ');
			gotoxy(24,y+2);
			writeln('Ingrese un numero correspondiente');
		end;
	until(estado=true);
	gotoxy(24,y+2);
	writeln('                                                        ');
	estado:=false;
	gotoxy(x,y+2);
	writeln('Dia (01..31): ');
	repeat
		repeat
			gotoxy(x+14,y+2);
			writeln('                ');
			gotoxy(x+14,y+2);
			readln(dia);
			Val(dia,num,cod);
			if cod<>0 then
			begin
				gotoxy(24,y+3);
				writeln('                                                        ');
				gotoxy(24,y+3);
				writeln('Ingrese un numero entero');
			end
			else 
			begin
				if length(dia)<>2 then
				begin
					gotoxy(24,y+3);
					writeln('                                                        ');
					gotoxy(24,y+3);
					writeln('Ingrese un numero de 2 digitos');
					cod:=1;
				end;
			end;
		until(cod=0);
		if num in [1..31] then
		begin
			estado:=true;
		end
		else
		begin
			gotoxy(24,y+3);
			writeln('                                                        ');
			gotoxy(24,y+3);
			writeln('Ingrese un numero correspondiente');
		end;
	until(estado=true);
	gotoxy(24,y+3);
	writeln('                                                     ');
	gotoxy(x,y);
	writeln('                                   ');
	gotoxy(x,y+1);
	writeln('                                   ');
	gotoxy(x,y+2);
	writeln('                                   ');
	fecha:=(anio+'/'+mes+'/'+dia);
	gotoxy(x,y);
	writeln(fecha);
end;

procedure Ingresar_Hora(var hora:string; x,y:integer);
var min,hor:string;
	num,cod:integer;
	estado:boolean;
begin
	estado:=false;
	gotoxy(x,y);
	writeln('Horas (00..23): ');
	repeat
		repeat
			gotoxy(x+16,y);
			writeln('                ');
			gotoxy(x+16,y);
			readln(hor);
			Val(hor,num,cod);
			if cod<>0 then
			begin
				gotoxy(24,y+1);
				writeln('                                                        ');
				gotoxy(24,y+1);
				writeln('ingrese un numero entero');
			end
			else 
			begin
				if length(hor)<>2 then
				begin
					gotoxy(24,y+1);
					writeln('                                                        ');
					gotoxy(24,y+1);
					writeln('ingrese un numero de 2 digitos');
					cod:=1;
				end;
			end;
		until(cod=0);
		if num in [0..23] then
		begin
			estado:=true;
		end
		else
		begin
			gotoxy(24,y+1);
			writeln('                                                        ');
			gotoxy(24,y+1);
			writeln('ingrese un numero correspondiente');
		end;
	until(estado=true);
	estado:=false;
	gotoxy(x+20,y);
	writeln('Minutos (00..59): ');
	repeat
		repeat
			gotoxy(x+38,y);
			writeln('                ');
			gotoxy(x+38,y);
			readln(min);
			Val(min,num,cod);
			if cod<>0 then
			begin
				gotoxy(24,y+1);
				writeln('                                                        ');
				gotoxy(24,y+1);
				writeln('ingrese un numero entero');
			end
			else 
			begin
				if length(min)<>2 then
				begin
					gotoxy(24,y+1);
					writeln('                                                        ');
					gotoxy(24,y+1);
					writeln('ingrese un numero de 2 digitos');
					cod:=1;
				end;
			end;
		until(cod=0);
		if num in [0..59] then
		begin
			estado:=true;
		end
		else
		begin
			gotoxy(24,y+1);
			writeln('                                                        ');
			gotoxy(24,y+1);
			writeln('ingrese un numero correspondiente');
		end;
	until(estado=true);	
	gotoxy(24,y+1);
	writeln('                                                        ');
	gotoxy(x,y);
	writeln('                                                        ');
	hora:=(hor+':'+min);
	gotoxy(x,y);
	writeln(hora);
end;

procedure Ingresar_Real(var numero:real; x,y:integer);
var Bus:string;
	cod:integer;
begin
	repeat
		gotoxy(x,y);
		writeln('                                  ');
		gotoxy(x,y);
		readln(Bus);
		Val(Bus,numero,cod);
		if cod<>0 then
		begin
			gotoxy(24,y+1);
			writeln('ingrese un numero real');
		end;
	until(cod=0);
	gotoxy(24,y+1);
	writeln('                             ');
end;

procedure Ingresar_Entero(var numero:integer; x,y:integer);
var Bus:string;
	cod:integer;
begin
	repeat
		gotoxy(x,y);
		writeln('                     ');
		gotoxy(x,y);
		readln(Bus);
		Val(Bus,numero,cod);
		if cod<>0 then
		begin
			gotoxy(24,y+1);
			writeln('ingrese un numero entero');
		end;
	until(cod=0);
	gotoxy(24,y+1);
	writeln('                              ');
end;

procedure Ingresar_EnteroEnString(var numero:string; x,y:integer);
var cod,num:integer;
begin
	repeat
		gotoxy(x,y);
		writeln('                     ');
		gotoxy(x,y);
		readln(numero);
		Val(numero,num,cod);
		if cod<>0 then
		begin
			gotoxy(24,y+1);
			writeln('ingrese un numero entero');
		end;
	until(cod=0);
	gotoxy(24,y+1);
	writeln('                              ');
end;

procedure Ingresar_DNI(var dni:string; x,y:integer);
var cod,num:integer;
	estado:boolean;
begin
	repeat
		repeat
			gotoxy(x,y);
			writeln('                     ');
			gotoxy(x,y);
			readln(dni);
			if length(dni)>8 then
				begin
					dni:=copy(dni,1,8);
				end;
			Val(dni,num,cod);
			if cod<>0 then
			begin
				gotoxy(24,y+1);
				writeln('                                             ');
				gotoxy(24,y+1);
				writeln('ingrese un numero entero');
			end;
		until(cod=0);
		estado:=true;
		if (length(dni)<7) and (dni<>'0') then
		begin
			gotoxy(24,y+1);
			writeln('                                             ');
			gotoxy(24,y+1);
			writeln('ingrese un numero de 7 u 8 digitos');
			estado:=false;
		end;
	until(estado=true);
	gotoxy(24,y+1);
	writeln('                                             ');
end;

procedure Ingresar_CUIT(var cuit:string; x,y:integer);
var cuit1,cuit2,cuit3:string;
	cod1,cod2,cod3,num:integer;
	estado:boolean;
begin
	repeat
		estado:=true;
		gotoxy(x,y);
		writeln('                     ');
		gotoxy(x,y);
		readln(cuit);
		if (length(cuit)<11) and (cuit<>'0') then
		begin
			gotoxy(24,y+1);
			writeln('                                             ');
			gotoxy(24,y+1);
			writeln('ingrese un numero de 11 digitos');
			estado:=false;
		end
		else
		begin
			cuit1:=copy(cuit,1,2);
			cuit2:=copy(cuit,3,8);
			cuit3:=copy(cuit,11,1);
			Val(cuit1,num,cod1);
			Val(cuit2,num,cod2);
			Val(cuit3,num,cod3);
			if (cod1<>0) or (cod2<>0) or (cod3<>0) then
			begin
				estado:=false;
				gotoxy(24,y+1);
				writeln('                                             ');
				gotoxy(24,y+1);
				writeln('ingrese un numero entero');
			end;
		end;
	until(estado=true);
	if cuit<>'0' then
	begin
		cuit:=(cuit1+'-'+cuit2+'-'+cuit3);
	end;
	gotoxy(x,y);
	writeln('                                                      ');
	gotoxy(x,y);
	writeln(cuit);
	gotoxy(24,y+1);
	writeln('                                             ');
end;

begin
end.
