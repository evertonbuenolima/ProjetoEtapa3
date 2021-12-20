object COMPONENTES: TCOMPONENTES
  OldCreateOrder = False
  Height = 649
  Width = 936
  object ACBrValidadorDocumento: TACBrValidador
    IgnorarChar = './-'
    Left = 64
    Top = 24
  end
  object ACBrMail: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    Left = 64
    Top = 86
  end
end
