program fprincipal;

uses
  Vcl.Forms,
  uprincipal in 'uprincipal.pas' {frmprincipal},
  UDM in 'Modulos\UDM.pas' {DM: TDataModule},
  uapi in 'APIs\uapi.pas' {API: TDataModule},
  ucomponentes in 'Componentes\ucomponentes.pas' {COMPONENTES: TDataModule},
  MsgBox in 'Biblioteca\MsgBox.pas',
  Bibliotecas in 'Biblioteca\Bibliotecas.pas',
  uconfiguraremail in 'View\uconfiguraremail.pas' {frmconfiguraremail};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrmprincipal, frmprincipal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TAPI, API);
  Application.CreateForm(TCOMPONENTES, COMPONENTES);
  Application.CreateForm(Tfrmconfiguraremail, frmconfiguraremail);
  Application.Run;
end.
