unit Bibliotecas;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, W7Classes,
  AdvSmoothToggleButton, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Menus, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus,
  Vcl.StdCtrls, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.AppEvnts, Vcl.ImgList,
  Vcl.Buttons, cxGridExportLink, cxGridCustomPopupMenu,
  cxGridPopupMenu, cxNavigator, cxButtons, cxCheckBox, cxContainer, cxTextEdit,
  cxMaskEdit,
  cxDropDownEdit, cxCheckComboBox, Vcl.Samples.Spin, DataSnap.dbclient,
  ACBrMail;

function GetNextID(ObjTabela: String): Integer;
function Verifica(CDSCampoObrigatorios: TClientDataSet): Boolean;
function SoNumero(fField: String): String;
function iff(ok: Boolean; campoa, campob: variant): variant;
procedure EnviarEmail(destinatario, nomedestinatario: String);
procedure criapanelaguarde(mensagem: string = ''; largura: Integer = 477;
  altura: Integer = 65; form: TForm = nil);
procedure destroipanelaguarde();

implementation

uses UDM, MsgBox, ucomponentes;

function iff(ok: Boolean; campoa, campob: variant): variant;
begin
  if ok then
    result := campoa
  else
    result := campob;
end;

function GetNextID(ObjTabela: String): Integer;
begin
  result := 0;

  try
    if not(dm.cdsidentificador.Locate('tabelas', ObjTabela, [])) then
    begin
      dm.cdsidentificador.Insert;
      dm.cdsidentificadortabelas.AsString := ObjTabela;
      dm.cdsidentificadorid.AsInteger := 1;
      result := 1;
    end
    else
    begin
      dm.cdsidentificador.Edit;
      dm.cdsidentificadortabelas.AsString := ObjTabela;
      dm.cdsidentificadorid.AsInteger := dm.cdsidentificadorid.AsInteger + 1;
      result := dm.cdsidentificadorid.AsInteger;
    end;

    dm.cdsidentificador.Post;
  except
    on e: exception do
      msgboxsimples('Erro na gerãção do ID: ' + e.message, tmbErro);
  end;
end;

function Verifica(CDSCampoObrigatorios: TClientDataSet): Boolean;
var
  i: Integer;
  ObjMensagem: string;
begin
  ObjMensagem := '';
  result := true;

  for i := 0 to CDSCampoObrigatorios.FieldCount - 1 do
    if CDSCampoObrigatorios.Fields[i].Required then
    begin
      if (trim(CDSCampoObrigatorios.Fields[i].AsString) = '') then
      begin
        if ObjMensagem = '' then
          ObjMensagem := ObjMensagem +
            '* Campo(s) Obrigatório(s) não Preenchido(s): ' + sLineBreak +
            sLineBreak + '- ' + CDSCampoObrigatorios.Fields[i].DisplayName + ' '
            + sLineBreak
        else
          ObjMensagem := ObjMensagem + '- ' + CDSCampoObrigatorios.Fields[i]
            .DisplayName + ' ' + sLineBreak;

        result := False;
      end;
    end;
  if ObjMensagem <> '' then
  Begin
    msgboxsimples(ObjMensagem, tmbadvertencia);
    result := False;
  End;
end;

function SoNumero(fField: String): String;
var
  i: Byte;
begin
  result := '';
  for i := 1 To length(fField) do
    if fField[i] In ['0' .. '9'] Then
      result := result + fField[i];
end;

procedure EnviarEmail(destinatario, nomedestinatario: String);
var
  Dir, ArqXML: string;
  P, N: Integer;

  function ConfigurarEnvio: Boolean;
  begin
    result := true;
    dm.cdsemail.Open;

    if dm.cdsemail.IsEmpty then
    begin
      msgboxsimples('Email não configurado. Operação Cancelada!',
        tmbadvertencia);
      result := False;
    end;

    componentes.ACBrMail.From := dm.cdsemailemail.AsString;
    componentes.ACBrMail.FromName := dm.cdsemailnome.AsString;
    componentes.ACBrMail.Host := dm.cdsemailsmtp.AsString;
    componentes.ACBrMail.Username := dm.cdsemaillogin.AsString;
    componentes.ACBrMail.Password := dm.cdsemailsenha.AsString;
    componentes.ACBrMail.Port := dm.cdsemailporta.AsString;
    componentes.ACBrMail.SetTLS := iff(dm.cdsemailtls.AsString = 'S',
      true, False);
    componentes.ACBrMail.SetSSL := iff(dm.cdsemailssl.AsString = 'S',
      true, False);
    componentes.ACBrMail.AddAddress(destinatario, nomedestinatario);
  end;

begin
  try
    Dir := ExtractFilePath(ParamStr(0));

    P := pos(' - ', destinatario);
    if P > 0 then
    begin
      N := StrToIntDef(copy(destinatario, P + 3, 5), 0) + 1;
      destinatario := copy(destinatario, 1, P + 2) + IntToStr(N);
    end;

    componentes.ACBrMail.Clear;
    componentes.ACBrMail.Subject := destinatario;

    if not ConfigurarEnvio then
      exit;

    componentes.ACBrMail.AddAttachment(Dir + 'infcliente.xml', '',
      adAttachment);

    componentes.ACBrMail.Send;
  except
    on e: exception do
      msgboxsimples('Erro ao encaminhar email: ' + e.message, tmbErro);
  end;
end;

procedure criapanelaguarde(mensagem: string = ''; largura: Integer = 477;
  altura: Integer = 65; form: TForm = nil);
var
  pnaguarde: TPanel;
  habilitado: Boolean;
Begin
  try
    try
    except
      destroipanelaguarde();
    end;

    if largura = 0 then
      largura := 477;
    if altura = 0 then
      altura := 65;
    if form = nil then
      form := Screen.ActiveForm;

    pnaguarde := TPanel.Create(form);
    with pnaguarde do
    Begin
      Cursor := crHourGlass;
      parent := form;
      Name := '_pnaguarde';
      Width := largura;
      Height := altura;
      Top := (parent.Height - Height) div 4;
      Left := (parent.Width - Width) div 2;
      BringToFront;
      Caption := mensagem;
      Font.Style := [fsBold];
      Font.Color := clblue;
      Font.Size := 11;
      ParentColor := False;
      Color := clblue;

      BevelOuter := bvRaised;

      Visible := true;
      Refresh;

    End;
    application.ProcessMessages;
  except
  end;
End;

procedure destroipanelaguarde();
var
  i: Integer;
begin
  try
    for i := 0 to Screen.CustomFormCount - 1 do
    begin
      application.ProcessMessages;
      if Assigned(Screen.CustomForms[i]) then
        if Assigned(TPanel(Screen.CustomForms[i].FindComponent('_pnaguarde')))
        then
          with TPanel(Screen.CustomForms[i].FindComponent('_pnaguarde')) do
          Begin
            Visible := False;
            free;
          End;
    end;
  except

  end;
end;

end.
