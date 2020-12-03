//Buris Mateo

unit Unit_Reservas;

interface

type T_Reserva=record
		ID_Reserva:integer;
		DNI:string;
		ID_Vuelo:integer;
		Fecha:string[20];
		Hora:string[10];
		Costo:real;
		Activo:boolean;
	end;
	Arch_Reserva= file of T_Reserva;
	T_Res = record
		ID_Reserva: integer;
		Pos: integer;
	end;
	T_Vec_Res = array [1..100] of T_Res;


var Arch_Res:Arch_Reserva;
	Reg_Res:T_Reserva;
	Posicion:integer;
	Buscado:integer;

procedure Abrir_Res(var A_Res:Arch_Reserva);
procedure Cerrar_Res(var A_Res:Arch_Reserva);
procedure Leer_Res(var A_Res:Arch_Reserva; var R_Res:T_Reserva; Pos:integer);
procedure Modificar_Res(var A_Res:Arch_Reserva;Pos:integer;R_Res:T_Reserva);
procedure Guardar_Res(var A_Res:Arch_Reserva;R_Res:T_Reserva);
procedure Busqueda_Res(var A_Res:Arch_Reserva; Bus:integer; var Pos:integer;var R_Res:T_Reserva);
procedure Cargar_Res(var A_Res:Arch_Reserva; var V:T_Vec_Res; var Cant:integer);
procedure Burbuja_Res(var V:T_Vec_Res; var Cant:integer);

implementation

procedure Abrir_Res(var A_Res:Arch_Reserva);
begin
	Assign(A_Res,'Unit_Reserva.dat');
	Reset(A_Res);
	If (ioresult <> 0) then
	begin
		Rewrite(A_Res);
	end;
end;

procedure Cerrar_Res(var A_Res:Arch_Reserva);
begin
	Close(A_Res)
end;

procedure Leer_Res(var A_Res:Arch_Reserva; var R_Res:T_Reserva; Pos:integer);
begin
	seek(A_Res,Pos);
	read(A_Res,R_Res);
end;

procedure Modificar_Res(var A_Res:Arch_Reserva; Pos:integer; R_Res:T_Reserva);
begin
	seek(A_Res,Pos);
	write(A_Res,R_Res);
end;

procedure Guardar_Res(var A_Res:Arch_Reserva;R_Res:T_Reserva);
begin
	seek(A_Res,filesize(A_Res));
	write(A_Res,R_Res);
end;

procedure Busqueda_Res(var A_Res:Arch_Reserva; Bus:integer; var Pos:integer;var R_Res:T_Reserva);
var P:integer;
begin
	Pos:=-1;
	P:=0;
	seek(A_Res,0);
	while (not eof (A_Res)) and (Pos=-1) do
	begin
		Leer_Res(A_Res,R_Res,P);
		if (Bus=R_Res.ID_Reserva) then
		begin
			Pos:=P;
		end;
		P:=P+1;
	end;
end;

procedure Cargar_Res(var A_Res:Arch_Reserva; var V:T_Vec_Res; var Cant:integer);
var p:integer;
begin
	Abrir_Res(A_Res);
	p:=0;
	Cant:=0;
	while(not eof(A_Res)) do
	begin
		Leer_Res(A_Res, Reg_Res, p);
		if(Reg_Res.Activo) then
		begin
			inc(Cant);
			V[Cant].ID_Reserva := Reg_Res.ID_Reserva;
			V[Cant].pos:= p;
		end;
		inc(p);
	end;
	Cerrar_Res(A_Res);
end;

procedure Burbuja_Res(var V:T_Vec_Res; var Cant:integer);
var I,J:byte;
	Aux:T_Res;
begin
	for I:= 1 to (Cant-1) do
	begin
		for J:= 1 to (Cant-I) do
		begin
			if (V[J].ID_Reserva)>(V[J+1].ID_Reserva) then
			begin
				Aux:=V[J];
				V[J]:=V[J+1];
				V[J+1]:=Aux;
			end;
		end;
	end;
end;

begin
end.
