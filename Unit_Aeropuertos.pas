//Buris Mateo

unit Unit_Aeropuertos;

interface

type T_Aeropuerto=record
		ID_Aeropuerto:integer;
		Nombre:string[50];
		Ciudad:string[50];
		Pais:string[50];
		Activo:boolean;
	end;
	Arch_Aeropuerto= file of T_Aeropuerto;
	T_Aerop = record
		Nombre:string;
		Pos: integer;
	end;
	T_Vec_Aerop = array [1..100] of T_Aerop;

var Arch_Aerop:Arch_Aeropuerto;
	Reg_Aerop:T_Aeropuerto;
	Posicion:integer;
	Buscado:string;

procedure Abrir_Aerop(var A_Aerop:Arch_Aeropuerto);
procedure Cerrar_Aerop(var A_Aerop:Arch_Aeropuerto);
procedure Leer_Aerop(var A_Aerop:Arch_Aeropuerto; var R_Aerop:T_Aeropuerto; Pos:integer);
procedure Modificar_Aerop(var A_Aerop:Arch_Aeropuerto;Pos:integer;R_Aerop:T_Aeropuerto);
procedure Guardar_Aerop(var A_Aerop:Arch_Aeropuerto;R_Aerop:T_Aeropuerto);
procedure Busqueda_Aerop(var A_Aerop:Arch_Aeropuerto;var Pos:integer;Bus:string; var R_Aerop:T_Aeropuerto);
procedure Cargar_Aerop(var A_Aerop:Arch_Aeropuerto; var V:T_Vec_Aerop; var Cant:integer);
procedure Burbuja_Aerop(var V:T_Vec_Aerop; var Cant:integer);

implementation

procedure Abrir_Aerop(var A_Aerop:Arch_Aeropuerto);
begin
	Assign(A_Aerop,'Unit_Aeropuerto.dat');
	Reset(A_Aerop);
	if (ioresult <> 0) then
	begin	
		Rewrite(A_Aerop);
	end;
end;

procedure Cerrar_Aerop(var A_Aerop:Arch_Aeropuerto);
begin
	Close(A_Aerop);
end;

procedure Leer_Aerop(var A_Aerop:Arch_Aeropuerto; var R_Aerop:T_Aeropuerto; Pos:integer);
begin
	seek(A_Aerop,Pos);
	read(A_Aerop,R_Aerop);
end;

procedure Modificar_Aerop(var A_Aerop:Arch_Aeropuerto; Pos:integer; R_Aerop:T_Aeropuerto);
begin
	seek(A_Aerop,Pos);
	write(A_Aerop,R_Aerop);
end;

procedure Guardar_Aerop(var A_Aerop:Arch_Aeropuerto;R_Aerop:T_Aeropuerto);
begin
	seek(A_Aerop,filesize(A_Aerop));
	write(A_Aerop,R_Aerop);
end;

procedure Busqueda_Aerop(var A_Aerop:Arch_Aeropuerto; var Pos:integer;Bus:string; var R_Aerop:T_Aeropuerto);
var P:integer;
begin
	Pos:=-1;
	P:=0;
	while (not eof (A_Aerop)) and (Pos=-1) do
	begin
		Leer_Aerop(A_Aerop,R_Aerop,P);
		if (Bus=R_Aerop.Nombre) then
		begin
			Pos:=P;
		end;
		P:=P+1;
	end;
end;

procedure Cargar_Aerop(var A_Aerop:Arch_Aeropuerto; var V:T_Vec_Aerop; var Cant:integer);
var p:integer;
begin
	Abrir_Aerop(A_Aerop);
	p:=0;
	Cant:=0;
	while(not eof(A_Aerop)) do
	begin
		Leer_Aerop(A_Aerop, Reg_Aerop, p);
		if(Reg_Aerop.Activo) then
		begin
			inc(Cant);
			V[Cant].Nombre := Reg_Aerop.Nombre;
			V[Cant].pos :=  p;
		end;
		inc(p);
	end;
	Cerrar_Aerop(A_Aerop);
end;

procedure Burbuja_Aerop(var V:T_Vec_Aerop; var Cant:integer);
var I,J:byte;
	Aux:T_Aerop;
begin
	for I:= 1 to (Cant-1) do
	begin
		for J:= 1 to (Cant-I) do
		begin
			if ((V[J].Nombre))>((V[J+1].Nombre)) then
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
