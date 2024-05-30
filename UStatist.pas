unit UStatist;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unet, Vcl.ComCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFrmStatist = class(TForm)
    StatusBar: TStatusBar;
    GroupBox1: TGroupBox;
    btnFind: TButton;
    pnlHistory: TPanel;
    DBGridHistory: TDBGrid;
    DBGridDocs: TDBGrid;
    DataSourceDocs: TDataSource;
    DataSourceHistory: TDataSource;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    RadioGroup: TRadioGroup;
    lblDash: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSourceHistoryDataChange(Sender: TObject; Field: TField);
    procedure btnFindClick(Sender: TObject);
  private
    { Private declarations }
  public
    Net: TNet;
    { Public declarations }
  end;

var
  FrmStatist: TFrmStatist;

implementation

uses
  UMain, UFindPeople;

{$R *.dfm}

procedure TFrmStatist.FormCreate(Sender: TObject);
var
  frame: TFrmFindPeople;
begin
  Net := TNet.Create;
  frame := TFrmFindPeople.Create(Self);  //подгружаем фрейм поиска
  frame.Parent := Self;
  frame.Align := alTop;
  frame.parentfrom := TFrmStatist;
  frame.net := Net;
  if Net.Connect then
    StatusBar.Panels[0].Text := 'Подключено';
end;

procedure TFrmStatist.btnFindClick(Sender: TObject);           // поиск по датам
begin
  case RadioGroup.ItemIndex of
    0 :   Net.ExecuteQuery(Net.FHistoryQuery, 'SELECT p.id,	p.LAST_NAME, p.FIRST_NAME, p.SUR_NAME, p.birthday FROM PERSON p '
        + ' where p.udate between ''' + DateToStr(DateTimePicker1.Date) + ' 00:00:00.000 ''' //для timestamp
        + ' and ''' + DateToStr(DateTimePicker2.Date) + ' 23:59:59.999'''
        + 'order by 1, 2, 3 ');
    1 :   Net.ExecuteQuery(Net.FHistoryQuery, 'SELECT	p.id, p.LAST_NAME, p.FIRST_NAME, p.SUR_NAME, p.birthday FROM PERSON p '
        + ' where p.BIRTHDAY between ''' + DateToStr(DateTimePicker1.Date) + ''''
        + ' and ''' + DateToStr(DateTimePicker2.Date) + ''''
        + 'order by 1, 2, 3 ');
  end;


  DataSourceHistory.DataSet := Net.FHistoryQuery;
end;

procedure TFrmStatist.DataSourceHistoryDataChange(Sender: TObject;
  Field: TField);
begin
  if DataSourceHistory.DataSet.RecordCount > 0 then begin
    Net.ExecuteQuery(Net.FDocsQuery, 'select ndoc from docs where id_person = ' + DataSourceHistory.DataSet.FieldByName('id').AsString.Trim);
    DataSourceDocs.DataSet := Net.FDocsQuery;
  end;
end;

procedure TFrmStatist.FormActivate(Sender: TObject);
begin
  frmMain.StatusBar.Panels[0].Text := Caption;
end;

procedure TFrmStatist.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //dec(CountSt);
  Net.Destroy;
  Action := caFree;
end;

end.
