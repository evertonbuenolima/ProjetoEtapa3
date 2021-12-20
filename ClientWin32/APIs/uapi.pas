unit uapi;

interface

uses
  Forms, System.SysUtils, System.Classes, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, REST.Response.Adapter, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

Const
  ObjBaseURL = 'http://viacep.com.br/ws/@CEP/json';

type
  TAPI = class(TDataModule)
    rcviacep: TRESTClient;
    rqviacep: TRESTRequest;
    rrviacep: TRESTResponse;
    mmviacep: TFDMemTable;
    rdviacep: TRESTResponseDataSetAdapter;
    mmviacepcep: TWideStringField;
    mmviaceplogradouro: TWideStringField;
    mmviacepcomplemento: TWideStringField;
    mmviacepbairro: TWideStringField;
    mmviaceplocalidade: TWideStringField;
    mmviacepuf: TWideStringField;
    mmviacepibge: TWideStringField;
    mmviacepgia: TWideStringField;
    mmviacepddd: TWideStringField;
    mmviacepsiafi: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure BuscaCEP(cep: string);
  end;

var
  API: TAPI;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses MsgBox, Bibliotecas;
{$R *.dfm}
{ TAPI }

procedure TAPI.BuscaCEP(cep: string);
begin
  rdviacep.Active := False;
  rdviacep.Active := True;
  application.ProcessMessages;

  rcviacep.BaseURL := StringReplace(ObjBaseURL, '@CEP', SoNumero(cep),
    [rfReplaceAll, rfIgnoreCase]);

  rqviacep.ClearBody;
  rqviacep.Timeout := 0;

  try
    rqviacep.Execute;
  except
    on e: exception do
    Begin
      MsgBoxSimples('Falha ao cnsultar CEP: ' + e.Message, tmbAdvertencia);
    End;
  end;
end;

end.
