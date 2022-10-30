program servidor;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  System.Classes,
  Class_Rotas in 'Class_Rotas.pas';

var
  rotas: TRotas;

begin
  rotas := TRotas.Create;
  rotas.ligarServidor;
end.
