//Buris Mateo

unit Unit_Fondo;

interface

uses crt;

procedure fondo();
procedure fondo2();
procedure fondo3();
procedure Mensaje_Alta;
procedure Mensaje_Baja;
procedure Mensaje_Modificacion;
procedure Mensaje_Reactivacion;


implementation

procedure fondo();
begin
	textcolor(yellow);
	gotoxy(20,2);
	writeln('********************************************************************************');
	gotoxy(20,3);
	writeln('*                                                                              *');
	gotoxy(20,4);
	writeln('*                                                                              *');//38
	gotoxy(20,5);
	writeln('*                                                                              *');
	gotoxy(20,6);
	writeln('********************************************************************************');
	gotoxy(20,7);
	writeln('*                                                                              *');
	gotoxy(20,8);
	writeln('*                                                                              *');//10
	gotoxy(20,9);
	writeln('*                                                                              *');
	gotoxy(20,10);
	writeln('*                                                                              *');
	gotoxy(20,11);
	writeln('*                                                                              *');
	gotoxy(20,12);
	writeln('*                                                                              *');
	gotoxy(20,13);
	writeln('*                                                                              *');
	gotoxy(20,14);
	writeln('*                                                                              *');
	gotoxy(20,15);
	writeln('*                                                                              *');
	gotoxy(20,16);
	writeln('*                                                                              *');
	gotoxy(20,17);
	writeln('*                                                                              *');
	gotoxy(20,18);
	writeln('*                                                                              *');
	gotoxy(20,19);
	writeln('*                                                                              *');
	gotoxy(20,20);
	writeln('*                                                                              *');
	gotoxy(20,21);
	writeln('*                                                                              *');
	gotoxy(20,22);
	writeln('*                                                                              *');
	gotoxy(20,23);
	writeln('*                                                                              *');
	gotoxy(20,24);
	writeln('*                                                                              *');
	gotoxy(20,25);
	writeln('********************************************************************************');
end;

procedure fondo2();
begin
	textcolor(yellow);
	gotoxy(20,2);
	writeln('********************************************************************************');
	gotoxy(20,3);
	writeln('*                                                                              *');
	gotoxy(20,4);
	writeln('*                                                                              *');
	gotoxy(20,5);
	writeln('*                                                                              *');
	gotoxy(20,6);
	writeln('*                                                                              *');
	gotoxy(20,7);
	writeln('*                                                                              *');
	gotoxy(20,8);
	writeln('*                                                                              *');
	gotoxy(20,9);
	writeln('*                                                                              *');
	gotoxy(20,10);
	writeln('*                                                                              *');
	gotoxy(20,11);
	writeln('*                                                                              *');
	gotoxy(20,12);
	writeln('*                                                                              *');
	gotoxy(20,13);
	writeln('*                                                                              *');
	gotoxy(20,14);
	writeln('*                                                                              *');
	gotoxy(20,15);
	writeln('*                                                                              *');
	gotoxy(20,16);
	writeln('*                                                                              *');
	gotoxy(20,17);
	writeln('*                                                                              *');
	gotoxy(20,18);
	writeln('*                                                                              *');
	gotoxy(20,19);
	writeln('*                                                                              *');
	gotoxy(20,20);
	writeln('*                                                                              *');
	gotoxy(20,21);
	writeln('*                                                                              *');
	gotoxy(20,22);
	writeln('*                                                                              *');
	gotoxy(20,23);
	writeln('*                                                                              *');
	gotoxy(20,24);
	writeln('*                                                                              *');
	gotoxy(20,25);
	writeln('********************************************************************************');
end;

procedure fondo3();
begin
	textcolor(yellow);
	gotoxy(1,1);
	writeln('************************************************************************************************************************');
	gotoxy(1,2);
	writeln('*                                                                                                                      *');
	gotoxy(1,3);
	writeln('*                                                                                                                      *');
	gotoxy(1,4);
	writeln('*                                                                                                                      *');
	gotoxy(1,5);
	writeln('*                                                                                                                      *');
	gotoxy(1,6);
	writeln('*                                                                                                                      *');
	gotoxy(1,7);
	writeln('*                                                                                                                      *');
	gotoxy(1,8);
	writeln('*                                                                                                                      *');
	gotoxy(1,9);
	writeln('*                                                                                                                      *');
	gotoxy(1,10);
	writeln('*                                                                                                                      *');
	gotoxy(1,11);
	writeln('*                                                                                                                      *');
	gotoxy(1,12);
	writeln('*                                                                                                                      *');
	gotoxy(1,13);
	writeln('*                                                                                                                      *');
	gotoxy(1,14);
	writeln('*                                                                                                                      *');
	gotoxy(1,15);
	writeln('*                                                                                                                      *');
	gotoxy(1,16);
	writeln('*                                                                                                                      *');
	gotoxy(1,17);
	writeln('*                                                                                                                      *');
	gotoxy(1,18);
	writeln('*                                                                                                                      *');
	gotoxy(1,19);
	writeln('*                                                                                                                      *');
	gotoxy(1,20);
	writeln('*                                                                                                                      *');
	gotoxy(1,21);
	writeln('*                                                                                                                      *');
	gotoxy(1,22);
	writeln('*                                                                                                                      *');
	gotoxy(1,23);
	writeln('*                                                                                                                      *');
	gotoxy(1,24);
	writeln('************************************************************************************************************************');
end;

procedure Mensaje_Alta;
begin
	clrscr;
	textcolor(yellow);
	gotoxy(40,9);
	writeln('******************************************');
	gotoxy(40,10);
	writeln('*                                        *');
	gotoxy(40,11);
	writeln('*                                        *');
	gotoxy(40,12);
	writeln('*  SE HA REALIZADO EL ALTA EXITOSAMENTE  *');
	gotoxy(40,13);
	writeln('*                                        *');
	gotoxy(40,14);
	writeln('*                                        *');
	gotoxy(40,15);
	writeln('******************************************');
	gotoxy(120,30);
	readkey;
end;

procedure Mensaje_Baja;
begin
	clrscr;
	textcolor(yellow);
	gotoxy(40,9);
	writeln('******************************************');
	gotoxy(40,10);
	writeln('*                                        *');
	gotoxy(40,11);
	writeln('*                                        *');
	gotoxy(40,12);
	writeln('*  SE HA REALIZADO LA BAJA EXITOSAMENTE  *');
	gotoxy(40,13);
	writeln('*                                        *');
	gotoxy(40,14);
	writeln('*                                        *');
	gotoxy(40,15);
	writeln('******************************************');
	gotoxy(120,30);
	readkey;
end;

procedure Mensaje_Modificacion;
begin
	clrscr;
	textcolor(yellow);
	gotoxy(40,9);
	writeln('**************************************************');
	gotoxy(40,10);
	writeln('*                                                *');
	gotoxy(40,11);
	writeln('*                                                *');
	gotoxy(40,12);
	writeln('*  SE HA REALIZADO LA MODIFICACION EXITOSAMENTE  *');
	gotoxy(40,13);
	writeln('*                                                *');
	gotoxy(40,14);
	writeln('*                                                *');
	gotoxy(40,15);
	writeln('**************************************************');
	gotoxy(120,30);
	readkey;
end;

procedure Mensaje_Reactivacion;
begin
	clrscr;
	textcolor(yellow);
	gotoxy(40,9);
	writeln('*************************************************');
	gotoxy(40,10);
	writeln('*                                               *');
	gotoxy(40,11);
	writeln('*                                               *');
	gotoxy(40,12);
	writeln('* SE HA REALIZADO LA REACTIVACION EXITOSAMENTE  *');
	gotoxy(40,13);
	writeln('*                                               *');
	gotoxy(40,14);
	writeln('*                                               *');
	gotoxy(40,15);
	writeln('*************************************************');
	gotoxy(120,30);
	readkey;
end;

begin
end.
