unit GetPeriods;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ActnList, Mask, ComCtrls, Spin;

type
  TGetPeriodForm = class(TForm)
    rbDay: TRadioButton;
    rbQuarter: TRadioButton;
    rbMonth: TRadioButton;
    InfoPanel: TPanel;
    ceQuarterYear: TSpinEdit;
    cbQuarter: TComboBox;
    cbWithBeginYear: TCheckBox;
    cbWithBeginQuarter: TCheckBox;
    cbWithBeginMonth: TCheckBox;
    ceMonthYear: TSpinEdit;
    cbMonth: TComboBox;
    DateEdit: TDateTimePicker;
    EdDateEdit: TDateTimePicker;
    STDateEdit: TDateTimePicker;
    rbInterval: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    ActionList: TActionList;
    ActionOk: TAction;
    ActionCancel: TAction;
    ActionHelp: TAction;
    Button3: TButton;
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure ActionCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbWithBeginClick(Sender: TObject);
    procedure rbClick(Sender: TObject);
    procedure ActionOkExecute(Sender: TObject);
    procedure ActionOkUpdate(Sender: TObject);
    procedure DateEditExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FStartDate, FEndDate: TDateTime;
    procedure DecodePeriod(stDate, edDate: TDateTime);
    procedure EncodePeriod;
  public
    { Public declarations }
  end;

function GetPeriod(var StartDate, EndDate: TDateTime): Boolean;

implementation

{$R *.DFM}   

const
  QuarterName = '%d QuarterName';
  sInfo = 'Selected period from %s to %s';

function GetPeriod(var StartDate, EndDate: TDateTime): Boolean;
begin
  with TGetPeriodForm.Create(nil) do begin
    try
      if StartDate = 0 then
        FStartDate := Date
      else
        FStartDate := StartDate;
      if EndDate = 0 then
       FEndDate := Date
      else
        FEndDate   := EndDate;
        
      DecodePeriod(FStartDate, FEndDate);
      Result := ShowModal = mrOk;
      if Result then begin
        StartDate := FStartDate;
        EndDate   := FEndDate;
      end;// if
    finally
      Destroy;
    end; // try
  end; // with
end;

procedure TGetPeriodForm.FormCreate(Sender: TObject);
var
  i: Integer;
  nYear, nMonth, nDay: Word;
begin
  DecodeDate(Date, nYear, nMonth, nDay);

  with cbQuarter do begin
    Items.Clear;
    for i:=1 to 4 do Items.Add(Format(QuarterName, [i]));
    ItemIndex := 0;
  end; // with
  ceQuarterYear.Value := nYear;

  with cbMonth do begin
    Items.Clear;
    for i:=1 to 12 do Items.Add(LongMonthNames[i]);
    ItemIndex := 0;
  end; // with
  ceMonthYear.Value := nYear;

  DateEdit.Date := Date;

  StDateEdit.Date := EncodeDate(nYear, nMonth, 1);
  EdDateEdit.Date := IncMonth(StDateEdit.Date, 1) - 1;
end;

procedure TGetPeriodForm.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  // quarter
  cbQuarter.Enabled := rbQuarter.Checked;
  ceQuarterYear.Enabled := cbQuarter.Enabled;
  // Month
  cbMonth.Enabled := rbMonth.Checked;
  ceMonthYear.Enabled := cbMonth.Enabled;
  // day
  DateEdit.Enabled := rbDay.Checked;
  // interval
  StDateEdit.Enabled := rbInterval.Checked;
  EdDateEdit.Enabled := rbInterval.Checked;
  // from year beginig
  cbWithBeginYear.Enabled := rbQuarter.Checked or
                             rbMonth.Checked or
                             rbDay.Checked;
  // from year beginig
  cbWithBeginQuarter.Enabled := rbMonth.Checked or
                                rbDay.Checked;
  // from quarter beginig
  cbWithBeginMonth.Enabled := rbDay.Checked;

  InfoPanel.Caption := Format(sInfo, [DateToStr(FStartDate),
                                      DateToStr(FEndDate)]);

end;

procedure TGetPeriodForm.ActionCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TGetPeriodForm.cbWithBeginClick(Sender: TObject);
begin
  EncodePeriod;

  if Not TCheckBox(Sender).Checked then Exit;

  if Sender <> cbWithBeginYear then
    cbWithBeginYear.Checked := False;
  if Sender <> cbWithBeginQuarter then
    cbWithBeginQuarter.Checked := False;
  if Sender <> cbWithBeginMonth then
    cbWithBeginMonth.Checked := False;
end;

function isLastDay(inDate: TDateTime): Boolean;
var
  nYear, nMonth, nDay: Word;
  nYear1, nMonth1, nDay1: Word;
begin
  DecodeDate(inDate, nYear, nMonth, nDay);
  DecodeDate(IncMonth(EncodeDate(nYear, nMonth, 1),1)-1, nYear1, nMonth1, nDay1);
  Result := nDay = nDay1
end;

procedure TGetPeriodForm.DecodePeriod(stDate, edDate: TDateTime);
var
  stYear, stMonth, stDay,
  edYear, edMonth, edDay: Word;
begin
  DecodeDate(stDate, stYear, stMonth, stDay);
  DecodeDate(edDate, edYear, edMonth, edDay);
  // interval  
  stDateEdit.Date := stDate;
  edDateEdit.Date := edDate;
  rbInterval.Checked := True;
  // day
  DateEdit.Date := edDate;
  rbDay.Checked := (stDate = edDate) or
                   ((stDay = 1) and
                    ((stMonth = edMonth) or
                     (stMonth mod 3 = 1) or
                     (stMonth = 1))) and
                   Not IsLastDay(edDate);
  // Month
  cbMonth.ItemIndex := edMonth-1;
  ceMonthYear.Value := edYear;
  rbMonth.Checked := IsLastDay(edDate) and
                     (stDay = 1) and
                     ((stMonth = edMonth) or
                      (stMonth = 1) or
                      (stMonth mod 3 = 1));
  // quarter
  cbQuarter.ItemIndex := ((edMonth-1) div 3);
  ceQuarterYear.Value := edYear;
  rbQuarter.Checked := (edMonth mod 3 = 0) and
                       (stMonth mod 3 = 1) and
                       IsLastDay(edDate) and
                       (stDay = 1);
  //
  // from month beginig
  cbWithBeginMonth.Checked := cbWithBeginMonth.Enabled and
                              (stDay = 1) and
                              (stMonth = edMonth) and
                              (edDay <> 1); 
  // from quarter beginig
  cbWithBeginQuarter.Checked := cbWithBeginQuarter.Enabled and
                                (stDay = 1) and
                                ((stMonth mod 3) = 1) and
                                (cbQuarter.ItemIndex > 0) and
                                (stMonth <> edMonth);
  // from year beginig
  cbWithBeginYear.Checked := cbWithBeginYear.Enabled and
                             (stDay = 1) and
                             (stMonth = 1) and
                             (cbQuarter.ItemIndex > 0);
end;

procedure TGetPeriodForm.EncodePeriod;
var
  nYear, nMonth, nDay: Word;
begin
  // interval
  if rbInterval.Checked then begin
    FStartDate := StDateEdit.Date;
    FEndDate   := EdDateEdit.Date;
  end; // if
  // day
  if rbDay.Checked then begin
    FEndDate   := DateEdit.Date;
    DecodeDate(DateEdit.Date, nYear, nMonth, nDay);
    if cbWithBeginYear.Checked then
      FStartDate := EncodeDate(nYear, 1, 1)
    else if cbWithBeginQuarter.Checked then
      FStartDate := EncodeDate(nYear, ((nMonth-1) div 3 + 1)* 3 - 2, 1)
    else if cbWithBeginMonth.Checked then
      FStartDate := EncodeDate(nYear, nMonth, 1)
    else
      FStartDate := FEndDate;
  end; // if
  // month
  if rbMonth.Checked then begin
    FEndDate := IncMonth(EncodeDate(Round(ceMonthYear.Value), cbMonth.ItemIndex + 1, 1),1)-1;
    if cbWithBeginYear.Checked then
      FStartDate := EncodeDate(Round(ceMonthYear.Value), 1, 1)
    else if cbWithBeginQuarter.Checked then
      FStartDate := EncodeDate(Round(ceMonthYear.Value), (cbMonth.ItemIndex div 3 + 1) * 3 - 2, 1)
    else
      FStartDate := EncodeDate(Round(ceMonthYear.Value), cbMonth.ItemIndex + 1, 1);
  end; // if
  // quarter
  if rbQuarter.Checked then begin
    FEndDate := IncMonth(EncodeDate(Round(ceQuarterYear.Value), (cbQuarter.ItemIndex + 1) * 3, 1),1)-1;
    if cbWithBeginYear.Checked then
      FStartDate := EncodeDate(Round(ceQuarterYear.Value), 1, 1)
    else
      FStartDate := EncodeDate(Round(ceQuarterYear.Value), (cbQuarter.ItemIndex * 3) + 1, 1);
  end; // if
end;

procedure TGetPeriodForm.rbClick(Sender: TObject);
begin
  EncodePeriod;
end;

procedure TGetPeriodForm.ActionOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TGetPeriodForm.ActionOkUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (FStartDate > 0) and (FEndDate > 0);
end;

procedure TGetPeriodForm.DateEditExit(Sender: TObject);
begin
  if (Sender = StDateEdit) and (StDateEdit.Date > EdDateEdit.Date) then
    EdDateEdit.Date := StDateEdit.Date;
  if (Sender = EdDateEdit) and (StDateEdit.Date > EdDateEdit.Date) then
    StDateEdit.Date := EdDateEdit.Date;

  rbClick(Sender);
end;

procedure TGetPeriodForm.FormShow(Sender: TObject);
begin
  if rbInterval.Checked then rbInterval.SetFocus;
  if rbDay.Checked then rbDay.SetFocus;
  if rbMonth.Checked then rbMonth.SetFocus;
  if rbQuarter.Checked then rbQuarter.SetFocus;
end;

end.
