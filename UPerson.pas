unit UPerson;

interface
uses Unet, SysUtils, Forms;

type
  TPerson = class
  private

  public
    FLastName: string;
    FSurname: string;
    FFirstName: string;
    FBirthday: TDate;
    procedure AddRecord(var net: TNet);
  end;

implementation


{ TPerson }

uses UFindPeople, UDM, UOperator, UStatist;

procedure TPerson.AddRecord(var net: TNet);
begin
  net.ExecuteQuery(net.FTempQuery, 'INSERT INTO	PERSON (LAST_NAME, SUR_NAME, FIRST_NAME, BIRTHDAY) values ('
  + '''' + FLastName + ''', '
  + '''' + FSurname + ''', '
  + '''' + FFirstName + ''', '
  + '''' + DateToStr(FBirthday) + ''')', true);
end;



end.
