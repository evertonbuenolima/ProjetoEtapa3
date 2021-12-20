object API: TAPI
  OldCreateOrder = False
  Height = 600
  Width = 782
  object rcviacep: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://viacep.com.br/ws/01001000/json'
    Params = <>
    Left = 56
    Top = 16
  end
  object rqviacep: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = rcviacep
    Params = <>
    Response = rrviacep
    Left = 56
    Top = 80
  end
  object rrviacep: TRESTResponse
    ContentType = 'application/json'
    Left = 56
    Top = 152
  end
  object mmviacep: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'cep'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'logradouro'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'complemento'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'bairro'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'localidade'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'uf'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'ibge'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'gia'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'ddd'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'siafi'
        DataType = ftWideString
        Size = 255
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvAutoCommitUpdates]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 56
    Top = 296
    object mmviacepcep: TWideStringField
      FieldName = 'cep'
      Size = 255
    end
    object mmviaceplogradouro: TWideStringField
      FieldName = 'logradouro'
      Size = 255
    end
    object mmviacepcomplemento: TWideStringField
      FieldName = 'complemento'
      Size = 255
    end
    object mmviacepbairro: TWideStringField
      FieldName = 'bairro'
      Size = 255
    end
    object mmviaceplocalidade: TWideStringField
      FieldName = 'localidade'
      Size = 255
    end
    object mmviacepuf: TWideStringField
      FieldName = 'uf'
      Size = 255
    end
    object mmviacepibge: TWideStringField
      FieldName = 'ibge'
      Size = 255
    end
    object mmviacepgia: TWideStringField
      FieldName = 'gia'
      Size = 255
    end
    object mmviacepddd: TWideStringField
      FieldName = 'ddd'
      Size = 255
    end
    object mmviacepsiafi: TWideStringField
      FieldName = 'siafi'
      Size = 255
    end
  end
  object rdviacep: TRESTResponseDataSetAdapter
    Active = True
    Dataset = mmviacep
    FieldDefs = <>
    Response = rrviacep
    Left = 56
    Top = 224
  end
end
