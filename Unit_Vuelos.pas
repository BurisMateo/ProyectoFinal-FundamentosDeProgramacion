//Buris Mateo

unit Unit_Vuelos;

interface

uses Unit_Pasajeros;

type T_Vuelo=record
		Origen:string[30];
		ID_Vuelo:integer;
		Fecha_Partida:string[20];
		Hora_Partida:string[10];
		Destino:string[30];
		Fecha_Llegada:string[20];
		Hora_Llegada:string[10];
		Escalas:array [1..3] of string;
		Nombre_Aerol:string[30];
		Cant_Pasajeros:integer;
		Total_Pasaj:integer;
		Activo:boolean;
	end;
	Arch_Vuelo= file of T_Vuelo;
	T_Vue = record
		ID_Vuelo: integer;
		Pos: integer;
	end;
	T_Vec_Vue = array [1..100] of T_Vue;

var Arch_Vue:Arch_Vuelo;
	Reg_Vue:T_Vuelo;
	Posicion:integer;
	Buscado:integer;

procedure Abrir_Vue(var A_Vue:Arch_Vuelo);
procedure Cerrar_Vue(var A_Vue:Arch_Vuelo);
procedure Leer_Vue(var A_Vue:Arch_Vuelo; var R_Vue:T_Vuelo; Pos:integer);
procedure Modificar_Vue(var A_Vue:Arch_Vuelo;Pos:integer;R_Vue:T_Vuelo);
procedure Guardar_Vue(var A_Vue:Arch_Vuelo;R_Vue:T_Vuelo);
procedure Busqueda_Vue(var A_Vue:Arch_Vuelo; Bus:integer;var Pos:integer;var R_Vue:T_Vuelo);
procedure Cargar_Vue(var A_Vue:Arch_Vuelo; var V:T_Vec_Vue; var Cant:integer);
procedure Burbuja_Vue(var V:T_Vec_Vue; var Cant:integer);

implementation

procedure Abrir_Vue(var A_Vue:Arch_Vuelo);
begin
	Assign(A_Vue,'Unit_Vuelo.dat');
	Reset(A_Vue);
	if (ioresult <> 0) then
	begin	
		Rewrite(A_Vue);
	end;
end;

procedure Cerrar_Vue(var A_Vue:Arch_Vuelo);
begin
	Close(A_Vue)
end;

procedure Leer_Vue(var A_Vue:Arch_Vuelo; var R_Vue:T_Vuelo; Pos:integer);
begin
	seek(A_Vue,Pos);
	read(A_Vue,R_Vue);
end;

procedure Modificar_Vue(var A_Vue:Arch_Vuelo; Pos:integer; R_Vue:T_Vuelo);
begin
	seek(A_Vue,Pos);
	write(A_Vue,R_Vue);
end;

procedure Guardar_Vue(var A_Vue:Arch_Vuelo;R_Vue:T_Vuelo);
begin
	seek(A_Vue,filesize(A_Vue));
	write(A_Vue,R_Vue);
end;

procedure Busqueda_Vue(var A_Vue:Arch_Vuelo; Bus:integer;var Pos:integer;var R_Vue:T_Vuelo);
var P:integer;
begin
	Pos:=-1;
	P:=0;
	seek(A_Vue,0);
	while (not eof (A_Vue)) and (Pos=-1) do
	begin
		Leer_Vue(A_Vue,R_Vue,P);
		if (Bus=R_Vue.ID_Vuelo) then
		begin
			Pos:=P;
		end;
		P:=P+1;
	end;
end;

procedure Cargar_Vue(var A_Vue:Arch_Vuelo; var V:T_Vec_Vue; var Cant:integer);
var p:integer;
begin
	Abrir_Vue(A_Vue);
	p:=0;
	Cant:=0;
	while(not eof(A_Vue)) do
	begin
		Leer_Vue(A_Vue, Reg_Vue, p);
		if(Reg_Vue.Activo) then
		begin
			inc(Cant);
			V[Cant].ID_Vuelo := Reg_Vue.ID_Vuelo;
			V[Cant].pos:= p;
		end;
		inc(p);
	end;
	Cerrar_Vue(A_Vue);
end;

procedure Burbuja_Vue(var V:T_Vec_Vue; var Cant:integer);
var I,J:byte;
	Aux:T_Vue;
begin
	for I:= 1 to (Cant-1) do
	begin
		for J:= 1 to (Cant-I) do
		begin
			if (V[J].ID_Vuelo)>(V[J+1].ID_Vuelo) then
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
