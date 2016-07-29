unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, MemDS, DBAccess, Ora, OraCall, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  OraFix;

type
  //TOraQuery = class(TFixedOraQuery);

  TForm1 = class(TForm)
    OraQuery1: TOraQuery;
    OraSession1: TOraSession;
    Memo1: TMemo;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    OraQuery1OBJECT_NAME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure OraQuery1AfterFetch(DataSet: TCustomDADataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  oraquery1.open;
end;

procedure TForm1.OraQuery1AfterFetch(DataSet: TCustomDADataSet);
begin
  if dataset.fetching then
    Memo1.Lines.Add('Fetching...')
  else if dataset.fetched then
    Memo1.Lines.Add(DataSet.Fields.Fields[0].AsString)
  else
    Memo1.Lines.Add('AfterFetch');
end;

end.
