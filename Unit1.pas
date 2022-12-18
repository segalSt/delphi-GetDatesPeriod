unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  TForm1 = class(TForm)
    SpeedButton1: TSpeedButton;
    Button1: TButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private     { Private declarations }
  public      { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses dateUtils, GetPeriods;

{$R *.dfm}

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  sd,ed : TDatetime;
begin
  sd:= EncodeDate(2005, 7, 1);
  Ed:= EncodeDate(2005, 9, 29);
  GetPeriod(sd,ed);
  MessageDlg( Format('Selected period from "%s" until "%s"', [DateTimeToStr(sd),DateTimeToStr(ed)]), mtWarning, [mbOK], 0);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 close;
end;

end.
