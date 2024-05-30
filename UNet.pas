unit UNet;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, dialogs, inifiles, forms;

type
  /// Подключение + запросы
  TNet = class
  private
    FDBpath: string;
  public
    FCon: TFDConnection;
    FTrans: TFDTransaction;
    FReadQuery: TFDQuery;
    FTempQuery: TFDQuery;
    FHistoryQuery: TFDQuery;
    FDocsQuery: TFDQuery;
    function Connect:boolean;
    constructor Create;
    destructor Destroy;
    procedure ExecuteQuery(query: TFDQuery; querytext: string; commit: boolean = false);
  end;



implementation

constructor TNet.Create;
var
  inifile: TIniFile;
begin
  inifile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'config.ini');
  try
    FDBpath := inifile.ReadString('general', 'base', 'error');
  finally
    inifile.Free;
  end;
  FCon := TFDConnection.Create(nil);
  FTrans := TFDTransaction.Create(nil);
  FTrans.Connection := FCon;
  FTempQuery := TFDQuery.Create(nil);
  FTempQuery.Transaction := FTrans;
  FTempQuery.Connection := FCon;
  FReadQuery := TFDQuery.Create(nil);
  FReadQuery.Transaction := FTrans;
  FReadQuery.Connection := FCon;
  FHistoryQuery := TFDQuery.Create(nil);
  FHistoryQuery.Transaction := FTrans;
  FHistoryQuery.Connection := FCon;
  FDocsQuery := TFDQuery.Create(nil);
  FDocsQuery.Transaction := FTrans;
  FDocsQuery.Connection := FCon;
end;

destructor TNet.Destroy;
begin
  if FTrans.Active then
    FTrans.Commit;
  if FCon.Connected then
    FCon.Connected := false;
  FTempQuery.Destroy;
  FReadQuery.Destroy;
  FHistoryQuery.Destroy;
  FDocsQuery.Destroy;
  FTrans.Destroy;
  FCon.Destroy;
end;

procedure TNet.ExecuteQuery(query: TFDQuery; querytext: string; commit: boolean);          //выполнить запрос
begin
  if commit then begin
    if not FTrans.Active then
      FTrans.StartTransaction;
    query.SQL.Text := querytext;
    query.ExecSQL;
    if FTrans.Active then
      FTrans.Commit;
  end else begin
    query.SQL.Text := querytext;
    query.Open();
  end;
end;

function TNet.Connect: boolean;                   //подключение
begin
  Result := false;
  try
    FCon.Params.Clear;
    FCon.Params.DriverID := 'FB';
    FCon.Params.UserName := 'sysdba';
    FCon.Params.Password := 'masterkey';
    FCon.Params.Database := FDBpath;
    FCon.LoginPrompt := false;
    FCon.Connected := true;
  except
    on E:exception do
      MessageDlg('Ошибка подключения' + #13 + e.Message, mtError, [mbOK], 0);
  end;
  Result := FCon.Connected;
end;

end.
