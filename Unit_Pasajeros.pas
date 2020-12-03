//Buris Mateo

unit Unit_Pasajeros;

interface

type T_Pasajero=record
        DNI:string[8];
        Apellido:string[50];
        Nombre:string[50];
        Edad:integer;
        Activo:boolean;
     end;
     Arch_Pasajero= file of T_Pasajero;
     T_Pasaj = record
            Apellido: String[50];
            Nombre: String[50];
            Pos: integer;
     end;
     T_Vec_Pasaj = array [1..100] of T_Pasaj;

var Arch_Pasaj:Arch_Pasajero;
    Reg_Pasaj:T_Pasajero;
    Posicion:integer;

procedure Abrir_Pasaj(var A_Pasaj:Arch_Pasajero);
procedure Cerrar_Pasaj(var A_Pasaj:Arch_Pasajero);
procedure Leer_Pasaj(var A_Pasaj:Arch_Pasajero; var R_Pasaj:T_Pasajero; Pos:integer);
procedure Modificar_Pasaj(var A_Pasaj:Arch_Pasajero;Pos:integer;R_Pasaj:T_Pasajero);
procedure Guardar_Pasaj(var A_Pasaj:Arch_Pasajero;R_Pasaj:T_Pasajero);
procedure Busqueda_Pasaj(var A_Pasaj:Arch_Pasajero; Bus:string; var Pos:integer;var R_Pasaj:T_Pasajero);
procedure Cargar_Pasaj(var A_Pasaj:Arch_Pasajero; var V:T_Vec_Pasaj; var Cant:integer);
procedure Burbuja_Pasaj(var V:T_Vec_Pasaj; var Cant:integer);

implementation

procedure Abrir_Pasaj(var A_Pasaj:Arch_Pasajero);
begin
	Assign(A_Pasaj,'Unit_Pasajero.dat');
	Reset(A_Pasaj);
	if (ioresult <> 0) then
	begin
		Rewrite(A_Pasaj);
	end;
end;

procedure Cerrar_Pasaj(var A_Pasaj:Arch_Pasajero);
begin
	Close(A_Pasaj)
end;

procedure Leer_Pasaj(var A_Pasaj:Arch_Pasajero; var R_Pasaj:T_Pasajero; Pos:integer);
begin
	seek(A_Pasaj,Pos);
	read(A_Pasaj,R_Pasaj);
end;

procedure Modificar_Pasaj(var A_Pasaj:Arch_Pasajero; Pos:integer; R_Pasaj:T_Pasajero);
begin
	seek(A_Pasaj,Pos);
	write(A_Pasaj,R_Pasaj);
end;

procedure Guardar_Pasaj(var A_Pasaj:Arch_Pasajero;R_Pasaj:T_Pasajero);
begin
	seek(A_Pasaj,filesize(A_Pasaj));
	write(A_Pasaj,R_Pasaj);
end;

procedure Busqueda_Pasaj(var A_Pasaj:Arch_Pasajero; Bus:string; var Pos:integer;var R_Pasaj:T_Pasajero);
var P:integer;
begin
	Pos:=-1;
	P:=0;
	seek(A_Pasaj,0);
	while (not eof (A_Pasaj)) and (Pos=-1) do
	begin
		Leer_Pasaj(A_Pasaj,R_Pasaj,P);
		if (Bus=R_Pasaj.DNI) then
		begin
			Pos:=P;
		end;
		P:=P+1;
	end;
end;

procedure Cargar_Pasaj(var A_Pasaj:Arch_Pasajero; var V:T_Vec_Pasaj; var Cant:integer);
var p:integer;
begin
	Abrir_Pasaj(A_Pasaj);
	p:=0;
	Cant:=0;
	while(not eof(A_Pasaj)) do
	begin
		Leer_Pasaj(A_Pasaj, Reg_Pasaj, p);
		if(Reg_Pasaj.Activo) then
		begin
			inc(Cant);
			V[Cant].Apellido := Reg_Pasaj.Apellido;
			V[Cant].Nombre := Reg_Pasaj.Nombre;
			V[Cant].Pos :=  p;
		end;
		inc(p);
	end;
	Cerrar_Pasaj(A_Pasaj);
end;

procedure Burbuja_Pasaj(var V:T_Vec_Pasaj; var Cant:integer);
var I,J:byte;
	Aux:T_Pasaj;
begin
	for I:= 1 to (Cant-1) do
	begin
		for J:= 1 to (Cant-I) do
		begin
			if ((V[J].Apellido)+(V[J].Nombre))>((V[J+1].Apellido)+(V[J+1].Nombre)) then
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
