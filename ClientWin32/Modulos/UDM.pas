unit UDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient;

type
  TDM = class(TDataModule)
    cdsidentificador: TClientDataSet;
    cdsclientes: TClientDataSet;
    cdsclientesid: TIntegerField;
    cdsclientesnome: TStringField;
    cdsclientesidentidade: TStringField;
    cdsclientestelefone: TStringField;
    cdsclientesemail: TStringField;
    cdsclientescep: TStringField;
    cdsclienteslogradouro: TStringField;
    cdsclientesnumero: TStringField;
    cdsclientescomplemento: TStringField;
    cdsclientesbairro: TStringField;
    cdsclientescidade: TStringField;
    cdsclientesestado: TStringField;
    cdsclientespais: TStringField;
    dsidentificador: TDataSource;
    cdsclientesibge: TIntegerField;
    cdsidentificadortabelas: TStringField;
    cdsidentificadorid: TIntegerField;
    cdsclientescpf: TStringField;
    cdsemail: TClientDataSet;
    cdsemailemail: TStringField;
    cdsemailnome: TStringField;
    cdsemailporta: TStringField;
    cdsemailtls: TStringField;
    cdsemailssl: TStringField;
    cdsemailsmtp: TStringField;
    cdsemaillogin: TStringField;
    cdsemailsenha: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
