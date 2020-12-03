//Buris Mateo

unit Unit_Aerolineas;

interface

type T_Aerolinea=record
		ID_Aerolinea:integer;
		Cuit:string[15];
		Nombre:string[50];
		Domicilio:string[50];
		Activo:boolean;
	end;
	Arch_Aerolinea= file of T_Aerolinea;
	T_Aerol = record
		Nombre:string;
		Pos: integer;
	end;
	T_Vec_Aerol = array [1..100] of T_Aerol;

var Arch_Aerol:Arch_Aerolinea;
    Reg_Aerol:T_Aerolinea;
    Posicion:integer;
    Buscado:string;

procedure Abrir_Aerol(var A_Aerol:Arch_Aerolinea);
procedure Cerrar_Aerol(var A_Aerol:Arch_Aerolinea);
procedure Leer_Aerol(var A_Aerol:Arch_Aerolinea; var R_Aerol:T_Aerolinea; Pos:integer);
procedure Modificar_Aerol(var A_Aerol:Arch_Aerolinea;Pos:integer;R_Aerol:T_Aerolinea);
procedure Guardar_Aerol(var A_Aerol:Arch_Aerolinea;R_Aerol:T_Aerolinea);
procedure Busqueda_Aerol(var A_Aerol:Arch_Aerolinea; Bus:string; var Pos:integer;var R_Aerol:T_Aerolinea);
procedure Cargar_Aerol(var A_Aerol:Arch_Aerolinea; var V:T_Vec_Aerol; var Cant:integer);
procedure Burbuja_Aerol(var V:T_Vec_Aerol; var Cant:integer);


implementation

procedure Abrir_Aerol(var A_Aerol:Arch_Aerolinea);
begin
	Assign(A_Aerol,'Unit_Aerolinea.dat');
	Reset(A_Aerol);
	if (ioresult <> 0) then
	begin
		Rewrite(A_Aerol);
	end;
end;

procedure Cerrar_Aerol(var A_Aerol:Arch_Aerolinea);
begin
	Close(A_Aerol);
end;

procedure Leer_Aerol(var A_Aerol:Arch_Aerolinea; var R_Aerol:T_Aerolinea; Pos:integer);
begin
	seek(A_Aerol,Pos);
	read(A_Aerol,R_Aerol);
end;

procedure Modificar_Aerol(var A_Aerol:Arch_Aerolinea; Pos:integer; R_Aerol:T_Aerolinea);
begin
	seek(A_Aerol,Pos);
	write(A_Aerol,R_Aerol);
end;

procedure Guardar_Aerol(var A_Aerol:Arch_Aerolinea;R_Aerol:T_Aerolinea);
begin
	seek(A_Aerol,filesize(A_Aerol));
	write(A_Aerol,R_Aerol);
end;

procedure Busqueda_Aerol(var A_Aerol:Arch_Aerolinea; Bus:string; var Pos:integer;var R_Aerol:T_Aerolinea);
var P:integer;
begin
	Pos:=-1;
	P:=0;
	while (not eof (A_Aerol)) and (Pos=-1) do
	begin
		Leer_Aerol(A_Aerol,R_Aerol,P);
		if (Bus=R_Aerol.Nombre) then
		begin
			Pos:=P;
		end;
		P:=P+1;
	end;
end;

procedure Cargar_Aerol(var A_Aerol:Arch_Aerolinea; var V:T_Vec_Aerol; var Cant:integer);
var p:integer;
begin
	Abrir_Aerol(A_Aerol);
	p:=0;
	Cant:=0;
	while(not eof(A_Aerol)) do
	begin
		Leer_Aerol(A_Aerol, Reg_Aerol, p);
		if(Reg_Aerol.Activo) then
		begin
			inc(Cant);
			V[Cant].Nombre:=Reg_Aerol.Nombre;
			V[Cant].pos:=p;
		end;
		inc(p);
	end;
	Cerrar_Aerol(A_Aerol);
end;

procedure Burbuja_Aerol(var V:T_Vec_Aerol; var Cant:integer);
var I,J:byte;
    Aux:T_Aerol;
begin
	for I:= 1 to (Cant-1) do
	begin
		for J:= 1 to (Cant-I) do
		begin
			if (V[J].Nombre)>(V[J+1].Nombre) then
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
