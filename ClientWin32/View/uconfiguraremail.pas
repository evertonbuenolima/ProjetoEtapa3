unit uconfiguraremail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB;

type
  Tfrmconfiguraremail = class(TForm)
    lblFrom: TLabel;
    edtmail: TEdit;
    lblFromName: TLabel;
    edtnome: TEdit;
    lblHost: TLabel;
    edtsmtp: TEdit;
    lblPort: TLabel;
    edtporta: TEdit;
    lblTipoAutenticacao: TLabel;
    chktls: TCheckBox;
    chkSSL: TCheckBox;
    lblUser: TLabel;
    edtlogin: TEdit;
    lblPassword: TLabel;
    edtsenha: TEdit;
    btnconfirmar: TButton;
    btncancelar: TButton;
    procedure btncancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnconfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmconfiguraremail: Tfrmconfiguraremail;

implementation

{$R *.dfm}

uses UDM, MsgBox, Bibliotecas;

procedure Tfrmconfiguraremail.btncancelarClick(Sender: TObject);
begin
  close;
end;

procedure Tfrmconfiguraremail.btnconfirmarClick(Sender: TObject);
begin
  if MsgBoxConfirmacao('Deseja confirmar os dados informados?') = rmbNao then
    exit;

  dm.cdsemail.close;
  dm.cdsemail.Open;

  dm.cdsemail.Insert;
  dm.cdsemail.FieldByName('email').AsString := edtmail.text;
  dm.cdsemail.FieldByName('nome').AsString := edtnome.text;
  dm.cdsemail.FieldByName('porta').AsString := edtporta.text;
  dm.cdsemail.FieldByName('tls').AsString := iff(chktls.Checked, 'S', 'N');
  dm.cdsemail.FieldByName('ssl').AsString := iff(chkSSL.Checked, 'S', 'N');
  dm.cdsemail.FieldByName('smtp').AsString := edtsmtp.text;
  dm.cdsemail.FieldByName('login').AsString := edtlogin.text;
  dm.cdsemail.FieldByName('senha').AsString := edtsenha.text;
  dm.cdsemail.Post;

  close;

end;

procedure Tfrmconfiguraremail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
