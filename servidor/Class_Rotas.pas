unit Class_Rotas;

interface
uses
  System.SysUtils,
  System.Classes,
  // --------------------------------------------------------------------------
  FireDAC.Comp.Client, Data.DB, FireDAC.DApt,
  // --------------------------------------------------------------------------
  Horse, Horse.Jhonson, Horse.Query, Horse.OctetStream;

type
  TRotas = class
  private
    procedure pong(req: THorseRequest; res: THorseResponse; next: TProc);
    procedure usesHorse;
  public
    procedure registrarRotas;
    procedure ligarServidor;
  end;


implementation

{ TRotas }

procedure TRotas.ligarServidor;
begin
  usesHorse;
  registrarRotas;
  THorse.Listen(9000);
end;

procedure TRotas.pong(req: THorseRequest; res: THorseResponse; next: TProc);
begin
  // verifica se o servidor esta conectado, ping pong...
  res.Send('pong');
end;

procedure TRotas.registrarRotas;
begin
  // registra todas as rotas que a API vai ter
  THorse.Get('ping', pong);
end;

procedure TRotas.usesHorse;
begin
  // configura as lib que o horse vai usar
  THorse.Use(Jhonson);
  THorse.Use(Query);
  THorse.Use(OctetStream);
end;

end.
