unit ucomponentes;

interface

uses
  System.SysUtils, System.Classes, ACBrBase, ACBrValidador, ACBrMail;

type
  TCOMPONENTES = class(TDataModule)
    ACBrValidadorDocumento: TACBrValidador;
    ACBrMail: TACBrMail;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  COMPONENTES: TCOMPONENTES;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
