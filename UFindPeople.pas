unit UFindPeople;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, unet, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmFindPeople = class(TFrame)
    edtLastName: TEdit;
    lblLastName: TLabel;
    btnFind: TButton;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    DataSourceFind: TDataSource;
    procedure btnFindClick(Sender: TObject);
    procedure edtLastNameKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    parentfrom: TFormClass;
    net: TNet;
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses UPerson, UOperator, UDM;

procedure TFrmFindPeople.btnFindClick(Sender: TObject);
begin
  if trim(edtLastName.Text) <> '' then begin
    //FindQuery.Transaction := net.FTrans;
    //FindQuery.Connection := net.FCon;
    net.ExecuteQuery(net.FReadQuery, 'SELECT ID, LAST_NAME, FIRST_NAME, SUR_NAME,	BIRTHDAY, UDATE FROM PERSON '
    + ' where last_name like ''%' + trim(edtLastName.Text) + '%'''
    + 'order by last_name, first_name, sur_name');
    DataSourceFind.DataSet := net.FReadQuery;
  end;
end;

procedure TFrmFindPeople.edtLastNameKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    btnFind.Click;
end;

end.
