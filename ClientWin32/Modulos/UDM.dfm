object DM: TDM
  OldCreateOrder = False
  Height = 633
  Width = 872
  object cdsidentificador: TClientDataSet
    PersistDataPacket.Data = {
      410000009619E0BD010000001800000002000000000003000000410007746162
      656C617301004900000001000557494454480200020032000269640400010000
      0000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'tabelas'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'id'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 64
    Top = 32
    object cdsidentificadortabelas: TStringField
      FieldName = 'tabelas'
      Size = 50
    end
    object cdsidentificadorid: TIntegerField
      FieldName = 'id'
    end
  end
  object cdsclientes: TClientDataSet
    PersistDataPacket.Data = {
      950100009619E0BD01000000180000000F000000000003000000950102696404
      00010000000000046E6F6D65010049000000010005574944544802000200C800
      0A6964656E7469646164650100490000000100055749445448020002000F0003
      6370660100490000000100055749445448020002000F000874656C65666F6E65
      010049000000010005574944544802000200320005656D61696C010049000000
      0100055749445448020002006400036365700100490000000100055749445448
      020002000A000A6C6F677261646F75726F010049000000010005574944544802
      0002006400066E756D65726F0100490000000100055749445448020002000A00
      0B636F6D706C656D656E746F0100490000000100055749445448020002003200
      0662616972726F01004900000001000557494454480200020032000663696461
      646501004900000001000557494454480200020064000665737461646F010049
      0000000100055749445448020002000200047061697301004900000001000557
      49445448020002003200046962676504000100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'identidade'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'cpf'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'telefone'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'email'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'cep'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'logradouro'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'numero'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'complemento'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'bairro'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'cidade'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'estado'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'pais'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ibge'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 168
    Top = 37
    object cdsclientesid: TIntegerField
      FieldName = 'id'
    end
    object cdsclientesnome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 200
    end
    object cdsclientesidentidade: TStringField
      FieldName = 'identidade'
      Size = 15
    end
    object cdsclientestelefone: TStringField
      FieldName = 'telefone'
      EditMask = '(99)99999-9999'
      Size = 50
    end
    object cdsclientesemail: TStringField
      DisplayLabel = 'Email'
      FieldName = 'email'
      Required = True
      Size = 100
    end
    object cdsclientescep: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'cep'
      Required = True
      EditMask = '99.999-999'
      Size = 10
    end
    object cdsclienteslogradouro: TStringField
      FieldName = 'logradouro'
      Size = 100
    end
    object cdsclientesnumero: TStringField
      FieldName = 'numero'
      Size = 10
    end
    object cdsclientescomplemento: TStringField
      FieldName = 'complemento'
      Size = 50
    end
    object cdsclientesbairro: TStringField
      FieldName = 'bairro'
      Size = 50
    end
    object cdsclientescidade: TStringField
      FieldName = 'cidade'
      Size = 100
    end
    object cdsclientesestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object cdsclientespais: TStringField
      FieldName = 'pais'
      Size = 50
    end
    object cdsclientesibge: TIntegerField
      FieldName = 'ibge'
    end
    object cdsclientescpf: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'cpf'
      Required = True
      EditMask = '999.999.999-99'
      Size = 15
    end
  end
  object dsidentificador: TDataSource
    DataSet = cdsidentificador
    Left = 64
    Top = 96
  end
  object cdsemail: TClientDataSet
    PersistDataPacket.Data = {
      E40000009619E0BD010000001800000008000000000003000000E40005656D61
      696C010049000000010005574944544802000200C800046E6F6D650100490000
      00010005574944544802000200C80005706F7274610100490000000100055749
      445448020002000A0003746C7301004900000001000557494454480200020001
      000373736C010049000000010005574944544802000200010004736D74700100
      490000000100055749445448020002006400056C6F67696E0100490000000100
      05574944544802000200C8000573656E68610100490000000100055749445448
      0200020064000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'email'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'porta'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'tls'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ssl'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'smtp'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'login'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'senha'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 256
    Top = 40
    object cdsemailemail: TStringField
      FieldName = 'email'
      Size = 200
    end
    object cdsemailnome: TStringField
      FieldName = 'nome'
      Size = 200
    end
    object cdsemailporta: TStringField
      FieldName = 'porta'
      Size = 10
    end
    object cdsemailtls: TStringField
      FieldName = 'tls'
      Size = 1
    end
    object cdsemailssl: TStringField
      FieldName = 'ssl'
      Size = 1
    end
    object cdsemailsmtp: TStringField
      FieldName = 'smtp'
      Size = 100
    end
    object cdsemaillogin: TStringField
      FieldName = 'login'
      Size = 200
    end
    object cdsemailsenha: TStringField
      FieldName = 'senha'
      Size = 100
    end
  end
end
