unit OraFix;

interface

uses
  Data.DB,   // TResyncMode
  DBAccess,   // TAfterFetchEvent
  Ora;

type
  TFixedOraQuery = class(TOraQuery)
  private
    FInvokeAfterFetchHandler: Boolean;
  protected
    procedure DoOnAfterFetch; override;
  public
    procedure Resync(Mode: TResyncMode); override;
  end;

implementation

procedure TFixedOraQuery.DoOnAfterFetch;
var
  EventHandler: TAfterFetchEvent;
begin
  if NonBlocking and FetchAll and Fetched and (RecordCount < FetchRows) then
  begin
    FInvokeAfterFetchHandler := True;
    EventHandler := AfterFetch;
    AfterFetch := nil;
  end;
  try
    inherited;
  finally
    if FInvokeAfterFetchHandler then
      AfterFetch := EventHandler;
  end;
end;

procedure TFixedOraQuery.Resync(Mode: TResyncMode);
begin
  inherited;
  if FInvokeAfterFetchHandler then
  begin
    FInvokeAfterFetchHandler := False;
    if Assigned(AfterFetch) then
      AfterFetch(Self);
  end;
end;

end.
