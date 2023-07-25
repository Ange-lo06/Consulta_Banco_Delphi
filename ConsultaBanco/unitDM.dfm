object DM: TDM
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object conexao: TFDConnection
    Params.Strings = (
      'Database=consulta'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 72
    Top = 120
  end
  object SQLconsulta: TFDQuery
    Active = True
    Connection = conexao
    SQL.Strings = (
      'select * from cliente')
    Left = 104
    Top = 256
    ParamData = <
      item
        Name = 'pConsulta'
      end>
  end
  object DSsqlConsulta: TDataSource
    DataSet = SQLconsulta
    Left = 152
    Top = 400
  end
end
