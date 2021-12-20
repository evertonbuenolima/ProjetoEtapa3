object frmconfiguraremail: Tfrmconfiguraremail
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configurar Email'
  ClientHeight = 382
  ClientWidth = 318
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lblFrom: TLabel
    Left = 19
    Top = 19
    Width = 85
    Height = 13
    Caption = 'Informe seu Email'
    Color = clBtnFace
    ParentColor = False
  end
  object lblFromName: TLabel
    Left = 19
    Top = 74
    Width = 88
    Height = 13
    Caption = 'Informe seu Nome'
    Color = clBtnFace
    ParentColor = False
  end
  object lblHost: TLabel
    Left = 19
    Top = 184
    Width = 180
    Height = 13
    Caption = 'Verifique com seu provedor seu SMTP'
    Color = clBtnFace
    ParentColor = False
  end
  object lblPort: TLabel
    Left = 19
    Top = 128
    Width = 26
    Height = 13
    Caption = 'Porta'
    Color = clBtnFace
    ParentColor = False
  end
  object lblTipoAutenticacao: TLabel
    Left = 91
    Top = 129
    Width = 90
    Height = 13
    Caption = 'Tipo Autentica'#231#227'o:'
    Color = clBtnFace
    ParentColor = False
  end
  object lblUser: TLabel
    Left = 19
    Top = 231
    Width = 67
    Height = 13
    Caption = 'Email de Login'
    Color = clBtnFace
    ParentColor = False
  end
  object lblPassword: TLabel
    Left = 19
    Top = 278
    Width = 102
    Height = 13
    Caption = 'Senha usada do login'
    Color = clBtnFace
    ParentColor = False
  end
  object edtmail: TEdit
    Left = 19
    Top = 37
    Width = 283
    Height = 21
    TabOrder = 0
    Text = 'fulano@empresa.com.br'
  end
  object edtnome: TEdit
    Left = 19
    Top = 93
    Width = 283
    Height = 21
    TabOrder = 1
    Text = 'Fula do Tal'
  end
  object edtsmtp: TEdit
    Left = 19
    Top = 202
    Width = 283
    Height = 21
    TabOrder = 2
    Text = 'smtp.empresa.com.br'
  end
  object edtporta: TEdit
    Left = 19
    Top = 147
    Width = 58
    Height = 21
    TabOrder = 3
    Text = '587'
  end
  object chktls: TCheckBox
    Left = 91
    Top = 148
    Width = 45
    Height = 17
    Caption = 'TLS'
    TabOrder = 4
  end
  object chkSSL: TCheckBox
    Left = 142
    Top = 148
    Width = 45
    Height = 17
    Caption = 'SSL'
    TabOrder = 5
  end
  object edtlogin: TEdit
    Left = 19
    Top = 250
    Width = 283
    Height = 21
    TabOrder = 6
    Text = 'fulano@empresa.com.br'
  end
  object edtsenha: TEdit
    Left = 19
    Top = 297
    Width = 283
    Height = 21
    PasswordChar = '@'
    TabOrder = 7
    Text = 'fulano@empresa.com.br'
  end
  object btnconfirmar: TButton
    Left = 48
    Top = 336
    Width = 105
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 8
    OnClick = btnconfirmarClick
  end
  object btncancelar: TButton
    Left = 159
    Top = 336
    Width = 105
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 9
    OnClick = btncancelarClick
  end
end
