unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList, Vcl.Menus,
  Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ComCtrls, FireDAC.Phys.OracleDef,
  FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.Oracle;

type
  TfrmMain = class(TForm)
    MainMenu: TMainMenu;
    ImageList: TImageList;
    ToolBar1: TToolBar;
    btnOper: TToolButton;
    btnStatist: TToolButton;
    btnExit: TToolButton;
    btnCloseAll: TToolButton;
    FHV1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    StatusBar: TStatusBar;
    procedure btnOperClick(Sender: TObject);
    procedure btnStatistClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnCloseAllClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CreateOperator;
    procedure CreateStatist;
  public

    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  CountOp, CountSt: integer;       //для подсчёта открытых окон
implementation

uses
  UOperator, UStatist, UFindPeople;

{$R *.dfm}

procedure TfrmMain.CreateOperator;  //арм оператора
var
  Oper: TFrmOperator;
begin
  Oper := TFrmOperator.Create(Application);
  inc(CountOp);
  Oper.Caption := 'АРМ оператора ' + IntToStr(CountOp);
end;


procedure TfrmMain.CreateStatist;           //арм статиста
var
  Statist: TFrmStatist;
begin
  Statist := TFrmStatist.Create(Application);
  inc(CountSt);
  Statist.Caption := 'АРМ статиста ' + IntToStr(CountSt);
end;

procedure TfrmMain.btnOperClick(Sender: TObject);
begin
  CreateOperator;
end;

procedure TfrmMain.btnStatistClick(Sender: TObject);
begin
  CreateStatist;
end;

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.btnCloseAllClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to MDIChildCount - 1 do     //закрыть все дочерние окна
    MDIChildren[i].Close;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: integer;
begin
  for i := 0 to MDIChildCount - 1 do
    MDIChildren[i].Close;
end;



procedure TfrmMain.FormCreate(Sender: TObject);
begin
  CountOp := 0;
  CountSt := 0;
end;

end.
