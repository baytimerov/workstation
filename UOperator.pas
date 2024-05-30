unit UOperator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UNet, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmOperator = class(TForm)
    StatusBar: TStatusBar;
    edtLastName: TEdit;
    edtFirstName: TEdit;
    edtSurName: TEdit;
    lblLastName: TLabel;
    lblFirstName: TLabel;
    lblSurName: TLabel;
    btnAdd: TButton;
    pnlAdd: TPanel;
    pnlHistory: TPanel;
    DateTimePicker: TDateTimePicker;
    lblBirthday: TLabel;
    DBGridHistory: TDBGrid;
    DBGridDocs: TDBGrid;
    btnHistory: TButton;
    pnlAddDocs: TPanel;
    DataSourceHistory: TDataSource;
    DataSourceDocs: TDataSource;
    ComboBox: TComboBox;
    lblFIO: TLabel;
    edtDocName: TEdit;
    lblDocName: TLabel;
    btnAddDoc: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAddClick(Sender: TObject);
    procedure btnHistoryClick(Sender: TObject);
    procedure DataSourceHistoryDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btnAddDocClick(Sender: TObject);
  private
    procedure FillComboBox;
    { Private declarations }
  public
    Net: TNet;
    { Public declarations }
  end;

var
  FrmOperator: TFrmOperator;

implementation

{$R *.dfm}

uses UMain, UPerson, UFindPeople, UDM;

procedure TFrmOperator.FillComboBox;                            //заполнить людьми
begin
  ComboBox.Items.Clear;
  Net.ExecuteQuery(Net.FTempQuery, 'SELECT ID, LAST_NAME, FIRST_NAME, SUR_NAME FROM PERSON '
  + ' order by last_name, first_name, sur_name');
  while not Net.FTempQuery.Eof do begin
    ComboBox.AddItem(
    net.FTempQuery.FieldByName('LAST_NAME').AsString.Trim + ' '
    + net.FTempQuery.FieldByName('FIRST_NAME').AsString.Trim + ' '
    + net.FTempQuery.FieldByName('SUR_NAME').AsString.Trim + ' ',
    TObject(net.FTempQuery.FieldByName('id').AsInteger)
    );
    Net.FTempQuery.Next;
  end;
  ComboBox.ItemIndex := -1;
end;

procedure TFrmOperator.FormCreate(Sender: TObject);
var
  frame: TFrmFindPeople;
begin
  Net := TNet.Create;
  frame := TFrmFindPeople.Create(Self);   //подгружаем фрейм поиска
  frame.Parent := Self;
  frame.Align := alTop;
  frame.parentfrom := TFrmOperator;
  frame.net := Net;
  if Net.Connect then
    StatusBar.Panels[0].Text := 'Подключено';
end;

procedure TFrmOperator.FormShow(Sender: TObject);
begin
  FillComboBox;
end;

procedure TFrmOperator.btnAddClick(Sender: TObject);
var
  Person: TPerson;
begin
  if (trim(edtLastName.Text) <> '') and (trim(edtSurName.Text) <> '') and (trim(edtFirstName.Text) <> '') then begin
    Person := TPerson.Create;
    try
      Person.FLastName := trim(edtLastName.Text);
      Person.FSurname := trim(edtSurName.Text);
      Person.FFirstName := trim(edtFirstName.Text);
      Person.FBirthday := DateTimePicker.Date;
      Person.AddRecord(Net);
    finally
      Person.Free;
      FillComboBox;
    end;
  end;
end;


procedure TFrmOperator.btnAddDocClick(Sender: TObject);
begin
  if (ComboBox.ItemIndex < 0) or (trim(edtDocName.Text) = '') then
    exit;

  Net.ExecuteQuery(Net.FTempQuery, ' INSERT INTO DOCS (ID_PERSON, NDOC) VALUES( '
  + IntToStr(integer(ComboBox.Items.Objects[ComboBox.ItemIndex])) + ', '
  + '''' + trim(edtDocName.Text) + ''')', true);

end;

procedure TFrmOperator.btnHistoryClick(Sender: TObject);
begin
  Net.ExecuteQuery(net.FHistoryQuery, 'SELECT FIRST 10 ID, LAST_NAME, FIRST_NAME, SUR_NAME,	BIRTHDAY, UDATE FROM PERSON '
  + ' order by udate desc');
  DataSourceHistory.DataSet := net.FHistoryQuery;
end;

procedure TFrmOperator.DataSourceHistoryDataChange(Sender: TObject;
  Field: TField);
begin
  if DataSourceHistory.DataSet.RecordCount > 0 then begin
    Net.ExecuteQuery(Net.FDocsQuery, 'select ndoc from docs where id_person = ' + DataSourceHistory.DataSet.FieldByName('id').AsString.Trim);
    DataSourceDocs.DataSet := Net.FDocsQuery;
  end;
end;

procedure TFrmOperator.FormActivate(Sender: TObject);
begin
  frmMain.StatusBar.Panels[0].Text := Caption;
end;

procedure TFrmOperator.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //dec(CountOp);
  Net.Destroy;
  Action := caFree;     //для закрытия
end;



end.
