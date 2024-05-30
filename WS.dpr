program WS;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {frmMain},
  UPerson in 'UPerson.pas',
  UOperator in 'UOperator.pas' {FrmOperator},
  UStatist in 'UStatist.pas' {FrmStatist},
  UNet in 'UNet.pas',
  UFindPeople in 'UFindPeople.pas' {FrmFindPeople: TFrame},
  UDM in 'UDM.pas' {dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
