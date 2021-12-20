unit uprincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, Data.DB, cxDBData,
  cxCheckBox, cxContainer, Vcl.Menus, Vcl.ToolWin, Vcl.ComCtrls, Vcl.StdCtrls,
  HTMLText, cxButtons, Vcl.Samples.Spin, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCheckComboBox, Vcl.ExtCtrls, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Mask,
  Vcl.DBCtrls, Bibliotecas, ACBrBase, ACBrValidador, JvComponentBase,
  JvEnterTab, ACBrSocket, ACBrIBGE, StrUtils, MidasLib, DbClient;

Const
  ObjEstados: Array [0 .. 26] of String = ('12', '27', '16', '13', '29', '23',
    '53', '32', '52', '21', '51', '50', '31', '15', '25', '41', '26', '22',
    '24', '43', '33', '11', '14', '42', '35', '28', '17');

type
  Tfrmprincipal = class(TForm)
    pgviscad: TPageControl;
    tsconsulta: TTabSheet;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    tscadastro: TTabSheet;
    pccadastro: TPageControl;
    pncadastro: TPanel;
    HTMLStaticText1: THTMLStaticText;
    pnmenu: TPanel;
    tbmenu: TToolBar;
    btnnovo: TcxButton;
    btneditar: TcxButton;
    btnexcluir: TcxButton;
    Panel4: TPanel;
    btnsalvar: TcxButton;
    btncancelar: TcxButton;
    Panel5: TPanel;
    MMMenu: TMainMenu;
    MMConfiguracao: TMenuItem;
    tbdados: TTabSheet;
    lblnome: TLabel;
    lblidentidade: TLabel;
    lblcpf: TLabel;
    lbltelefone: TLabel;
    lblemail: TLabel;
    gbendereco: TGroupBox;
    lblcep: TLabel;
    lbllogradouro: TLabel;
    lblnumero: TLabel;
    lblcomplemento: TLabel;
    lblbairro: TLabel;
    lblcidade: TLabel;
    lblestado: TLabel;
    dbnome: TDBEdit;
    dbidentidade: TDBEdit;
    dbcpf: TDBEdit;
    dbtelefone: TDBEdit;
    dbemail: TDBEdit;
    dbcep: TDBEdit;
    dblogradouro: TDBEdit;
    dbbairro: TDBEdit;
    dbcidade: TDBEdit;
    dbestado: TDBEdit;
    dbnumero: TDBEdit;
    dbcomplemento: TDBEdit;
    lblpais: TLabel;
    dbpais: TDBEdit;
    cxGrid1DBTableView1id: TcxGridDBColumn;
    cxGrid1DBTableView1nome: TcxGridDBColumn;
    cxGrid1DBTableView1identidade: TcxGridDBColumn;
    cxGrid1DBTableView1cpf: TcxGridDBColumn;
    cxGrid1DBTableView1telefone: TcxGridDBColumn;
    cxGrid1DBTableView1email: TcxGridDBColumn;
    cxGrid1DBTableView1cep: TcxGridDBColumn;
    cxGrid1DBTableView1logradouro: TcxGridDBColumn;
    cxGrid1DBTableView1numero: TcxGridDBColumn;
    cxGrid1DBTableView1complemento: TcxGridDBColumn;
    cxGrid1DBTableView1bairro: TcxGridDBColumn;
    cxGrid1DBTableView1cidade: TcxGridDBColumn;
    cxGrid1DBTableView1estado: TcxGridDBColumn;
    cxGrid1DBTableView1pais: TcxGridDBColumn;
    dsclientes: TDataSource;
    MMEmail: TMenuItem;
    N1: TMenuItem;
    MMSair: TMenuItem;
    btnsair: TcxButton;
    EnterTab: TJvEnterAsTab;
    procedure btncancelarClick(Sender: TObject);
    procedure btneditarClick(Sender: TObject);
    procedure btnexcluirClick(Sender: TObject);
    procedure btnnovoClick(Sender: TObject);
    procedure btnsalvarClick(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure dsclientesStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MMSairClick(Sender: TObject);
    procedure btnsairClick(Sender: TObject);
    procedure dbcpfExit(Sender: TObject);
    procedure dbemailExit(Sender: TObject);
    procedure dbcepExit(Sender: TObject);
    procedure MMEmailClick(Sender: TObject);
  private
    { Private declarations }
    ObjIDPos: string;
    ObjIDCad: Integer;
    ObjInsertEdit: Boolean;
    function ValidaObjeto(ObjInformado: Integer): Boolean;
  public
    { Public declarations }
  end;

var
  frmprincipal: Tfrmprincipal;

implementation

{$R *.dfm}

uses UDM, MsgBox, ucomponentes, uapi, uconfiguraremail;

procedure Tfrmprincipal.btncancelarClick(Sender: TObject);
begin
  try
    if (dsclientes.DataSet.State = dsedit) then
      ObjIDPos := dsclientes.DataSet.fieldByname('id').AsString;

    dsclientes.DataSet.Cancel;

    if ObjIDPos <> '' then
      dsclientes.DataSet.Locate('id', ObjIDPos, []);
  except
    on e: exception do
      MsgBoxSimples('Erro na tentativa de cancelar o cadastro: ' +
        e.Message, tmbErro);
  end;

end;

procedure Tfrmprincipal.btneditarClick(Sender: TObject);
begin
  try
    if not dsclientes.DataSet.IsEmpty then
      dsclientes.DataSet.Edit;
  except
    on e: exception do
      MsgBoxSimples('Erro na tentativa de editar o cadastro: ' +
        e.Message, tmbErro);
  end;
end;

procedure Tfrmprincipal.btnexcluirClick(Sender: TObject);
begin
  try
    if not dsclientes.DataSet.IsEmpty then
      if MsgBoxConfirmacao('Deseja excluir o registro selecionado?') = rmbsim
      then
      Begin
        dsclientes.DataSet.Delete;
        MsgBoxSimples('Registro excluído com sucesso!', tmbInformacao);
      End;
  except
    on e: exception do
      MsgBoxSimples('Erro na tentativa de excluir o cadastro: ' +
        e.Message, tmbErro);
  end;

end;

procedure Tfrmprincipal.btnnovoClick(Sender: TObject);
begin
  cxGrid1DBTableView1.DataController.Filter.Active := False;

  try
    dsclientes.DataSet.Insert;
  except
    on e: exception do
      MsgBoxSimples('Erro na tentativa de adicinar um cadastro: ' +
        e.Message, tmbErro);
  end;
end;

procedure Tfrmprincipal.btnsairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrmprincipal.btnsalvarClick(Sender: TObject);
begin
  try
    criapanelaguarde('Aguarda registrando cliente!');
    if not Verifica(dm.cdsclientes) then
      exit;

    if not ValidaObjeto(0) then
      exit;

    try
      case dsclientes.DataSet.State of
        dsInsert:
          begin
            ObjIDCad := GetNextID('clientes');
            if ObjIDCad = 0 then
              exit;
            dsclientes.DataSet.fieldByname('id').asinteger := ObjIDCad;
          end;
        dsedit:
          begin
            ObjIDPos := dsclientes.DataSet.fieldByname('id').AsString
          end;
      end;

      dsclientes.DataSet.Post;

      try
        dm.cdsclientes.Filtered := False;
        dm.cdsclientes.Filter := ' id = ' + dm.cdsclientesid.AsString;
        dm.cdsclientes.Filtered := True;

        if FileExists(ExtractFilePath(ParamStr(0)) + 'infcliente.xml') then
          DeleteFile(ExtractFilePath(ParamStr(0)) + 'infcliente.xml');

        dm.cdsclientes.SaveToFile(ExtractFilePath(ParamStr(0)) +
          'infcliente.xml', dfXML);
      finally
        dm.cdsclientes.Filtered := False;
      end;

      EnviarEmail(dm.cdsclientesemail.AsString, dm.cdsclientesnome.AsString);
    except
      on e: exception do
        MsgBoxSimples('Erro na tentativa de salvar o cadastro: ' +
          e.Message, tmbErro);
    end;
  finally
    destroipanelaguarde;
  end;
end;

procedure Tfrmprincipal.cxGrid1DBTableView1CellDblClick
  (Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  btneditar.Click;
end;

procedure Tfrmprincipal.dbcepExit(Sender: TObject);
begin
  ValidaObjeto(2);
end;

procedure Tfrmprincipal.dbcpfExit(Sender: TObject);
begin
  ValidaObjeto(0);
end;

procedure Tfrmprincipal.dbemailExit(Sender: TObject);
begin
  ValidaObjeto(1);
end;

procedure Tfrmprincipal.dsclientesStateChange(Sender: TObject);
begin
  ObjInsertEdit := (dsclientes.DataSet.State in [dsInsert, dsedit]);

  btnnovo.Enabled := not(ObjInsertEdit);

  btneditar.Enabled := not(ObjInsertEdit);

  btnexcluir.Enabled := not(ObjInsertEdit);

  btnsalvar.Enabled := ObjInsertEdit;

  btncancelar.Enabled := ObjInsertEdit;

  btnsair.Enabled := not(ObjInsertEdit);

  if not(ObjInsertEdit) then
  begin
    tsconsulta.TabVisible := True;
    tscadastro.TabVisible := False;
    pgviscad.ActivePageIndex := 0;
  end
  else
  begin
    tsconsulta.TabVisible := False;
    tscadastro.TabVisible := True;
    dbnome.SetFocus;
    pgviscad.ActivePageIndex := 1;
    ObjIDPos := '';
    ObjIDCad := 0;
    ObjInsertEdit := False;
  end;

end;

procedure Tfrmprincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MsgBoxConfirmacao('Deseja sair do sistema?') = rmbnao then
    exit;

  if dsclientes.DataSet.State in [dsedit, dsInsert] then
    dsclientes.DataSet.Cancel;

  dsclientes.DataSet.close;

  Action := caFree;
end;

procedure Tfrmprincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (pgviscad.ActivePageIndex = 0) then
  begin
    if ((ssCtrl in Shift) and (Key = Ord('N'))) then
      if btnnovo.Enabled then
        btnnovo.Click;

    if ((ssCtrl in Shift) and (Key = Ord('E'))) then
      if btneditar.Enabled then
        btneditar.Click;

    if ((ssCtrl in Shift) and (Key = Ord('D'))) then
      if btnexcluir.Enabled then
        btnexcluir.Click;
  end
  else if pgviscad.ActivePageIndex = 1 then
  begin
    if dsclientes.State in (dsEditModes) then
    begin
      if ((ssCtrl in Shift) and (Key = Ord('S'))) then
        if btnsalvar.Enabled then
          btnsalvar.Click;

      if ((ssCtrl in Shift) and (Key = Ord('C'))) then
        if btncancelar.Enabled then
          btncancelar.Click;
    end;
  end;

end;

procedure Tfrmprincipal.MMEmailClick(Sender: TObject);
begin
  frmconfiguraremail := Tfrmconfiguraremail.Create(nil);
  try
    frmconfiguraremail.ShowModal;
  finally
    frmconfiguraremail.Free;
  end;
end;

procedure Tfrmprincipal.MMSairClick(Sender: TObject);
begin
  close;
end;

Function Tfrmprincipal.ValidaObjeto(ObjInformado: Integer): Boolean;
begin
  Result := True;

  case ObjInformado of
    0:
      begin
        if dbcpf.Text <> '' then
        begin
          componentes.ACBrValidadorDocumento.PermiteVazio := False;
          componentes.ACBrValidadorDocumento.TipoDocto := docCPF;
          componentes.ACBrValidadorDocumento.Documento := dbcpf.Text;
          if not componentes.ACBrValidadorDocumento.Validar then
          begin
            MsgBoxSimples('CPF informado inválido!', tmbAdvertencia);
            if dm.cdsclientescpf.Required then
              Result := False;
          end;
        end;
      end;

    1:
      begin
        if dbemail.Text <> '' then
        begin
          componentes.ACBrValidadorDocumento.PermiteVazio := True;
          componentes.ACBrValidadorDocumento.TipoDocto := docEmail;
          componentes.ACBrValidadorDocumento.Documento := dbemail.Text;
          if not componentes.ACBrValidadorDocumento.Validar then
          begin
            MsgBoxSimples('Email informado inválido!', tmbAdvertencia);
            if dm.cdsclientesemail.Required then
              exit;
          end;
        end;
      end;

    2:
      begin
        if dbcep.Text <> '' then
        begin
          componentes.ACBrValidadorDocumento.PermiteVazio := True;
          componentes.ACBrValidadorDocumento.TipoDocto := docCEP;
          componentes.ACBrValidadorDocumento.Documento := dbcep.Text;
          if not componentes.ACBrValidadorDocumento.Validar then
          begin
            MsgBoxSimples('CEP informado inválido!', tmbAdvertencia);
            if dm.cdsclientescep.Required then
              exit;
          end
          else
          begin
            API.BuscaCEP(dbcep.Text);

            if not API.mmviacep.Eof then
            begin
              dm.cdsclienteslogradouro.Text := API.mmviaceplogradouro.AsString;
              dm.cdsclientescomplemento.Text :=
                API.mmviacepcomplemento.AsString;
              dm.cdsclientesbairro.Text := API.mmviacepbairro.AsString;
              dm.cdsclientescidade.Text := API.mmviaceplocalidade.AsString;
              dm.cdsclientesestado.Text := API.mmviacepuf.AsString;
              if SoNumero(API.mmviacepibge.AsString) <> '' then
              begin
                dm.cdsclientesibge.asinteger :=
                  strtoint(SoNumero(API.mmviacepibge.AsString));
                if MatchStr(copy(dm.cdsclientesibge.AsString, 1, 2), ObjEstados)
                then
                  dm.cdsclientespais.AsString := 'Brasil';
              end;
              dbnumero.SetFocus;
            end;
          end;
        end;
      end;
  end;
end;

end.
