object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 311
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 88
    Top = 24
    Width = 537
    Height = 161
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 88
    Top = 200
    Width = 537
    Height = 103
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object OraQuery1: TOraQuery
    SQL.Strings = (
      'select object_name from dba_objects'
      '--where rownum < 2')
    FetchRows = 5
    FetchAll = True
    NonBlocking = True
    AfterFetch = OraQuery1AfterFetch
    Left = 32
    Top = 80
    object OraQuery1OBJECT_NAME: TStringField
      FieldName = 'OBJECT_NAME'
      Size = 128
    end
  end
  object OraSession1: TOraSession
    Username = 'smt'
    Server = 'EHSMT'
    Connected = True
    Left = 32
    Top = 24
    EncryptedPassword = '8CFF92FF8BFF'
  end
  object DataSource1: TDataSource
    DataSet = OraQuery1
    Left = 32
    Top = 136
  end
end
