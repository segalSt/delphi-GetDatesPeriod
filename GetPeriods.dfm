object GetPeriodForm: TGetPeriodForm
  Left = 970
  Top = 565
  BorderStyle = bsDialog
  Caption = 'Select Period'
  ClientHeight = 177
  ClientWidth = 734
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 130
    Top = 124
    Width = 23
    Height = 13
    Caption = 'from:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 129
    Top = 156
    Width = 24
    Height = 13
    Caption = 'Until:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object rbDay: TRadioButton
    Left = 16
    Top = 96
    Width = 100
    Height = 17
    Caption = '&Day'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = rbClick
  end
  object rbQuarter: TRadioButton
    Left = 16
    Top = 42
    Width = 100
    Height = 17
    Caption = '&Quarter'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = rbClick
  end
  object rbMonth: TRadioButton
    Left = 16
    Top = 69
    Width = 100
    Height = 17
    Caption = '&Month'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = rbClick
  end
  object InfoPanel: TPanel
    Left = 8
    Top = 8
    Width = 697
    Height = 19
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Caption = 'Selected period from 01.01.2002 to 31.12.2002'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object ceQuarterYear: TSpinEdit
    Left = 266
    Top = 40
    Width = 57
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxValue = 0
    MinValue = 0
    ParentFont = False
    TabOrder = 3
    Value = 2002
    OnExit = rbClick
  end
  object cbQuarter: TComboBox
    Left = 168
    Top = 40
    Width = 97
    Height = 21
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 2
    OnChange = rbClick
    Items.Strings = (
      '1 '#1466#1490#1488#1504#1506#1488#1499
      '2 '#1466#1490#1488#1504#1506#1488#1499
      '3 '#1466#1490#1488#1504#1506#1488#1499
      '4 '#1466#1490#1488#1504#1506#1488#1499)
  end
  object cbWithBeginYear: TCheckBox
    Left = 384
    Top = 42
    Width = 129
    Height = 17
    Caption = 'From year begining'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = cbWithBeginClick
  end
  object cbWithBeginQuarter: TCheckBox
    Left = 384
    Top = 69
    Width = 129
    Height = 17
    Caption = 'from quarter begining'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = cbWithBeginClick
  end
  object cbWithBeginMonth: TCheckBox
    Left = 384
    Top = 96
    Width = 129
    Height = 17
    Caption = 'from month begining'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnClick = cbWithBeginClick
  end
  object ceMonthYear: TSpinEdit
    Left = 266
    Top = 67
    Width = 57
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxValue = 0
    MinValue = 0
    ParentFont = False
    TabOrder = 6
    Value = 2002
    OnExit = rbClick
  end
  object cbMonth: TComboBox
    Left = 168
    Top = 67
    Width = 97
    Height = 21
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 5
    OnChange = rbClick
  end
  object DateEdit: TDateTimePicker
    Left = 168
    Top = 94
    Width = 155
    Height = 21
    Date = 42970.600916770840000000
    Time = 42970.600916770840000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnExit = rbClick
  end
  object STDateEdit: TDateTimePicker
    Left = 168
    Top = 120
    Width = 155
    Height = 21
    Date = 42970.600974155100000000
    Time = 42970.600974155100000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    OnExit = DateEditExit
  end
  object EdDateEdit: TDateTimePicker
    Left = 168
    Top = 147
    Width = 155
    Height = 21
    Date = 42970.600974201400000000
    Time = 42970.600974201400000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    OnExit = DateEditExit
  end
  object rbInterval: TRadioButton
    Left = 16
    Top = 122
    Width = 100
    Height = 17
    Caption = '&interval'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    OnClick = rbClick
  end
  object Button1: TButton
    Left = 536
    Top = 40
    Width = 75
    Height = 25
    Action = ActionOk
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 15
  end
  object Button2: TButton
    Left = 536
    Top = 72
    Width = 75
    Height = 25
    Action = ActionCancel
    Cancel = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 16
  end
  object Button3: TButton
    Left = 536
    Top = 104
    Width = 75
    Height = 25
    Action = ActionHelp
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 17
  end
  object ActionList: TActionList
    OnUpdate = ActionListUpdate
    Left = 680
    Top = 128
    object ActionOk: TAction
      Caption = 'ok'
      OnExecute = ActionOkExecute
      OnUpdate = ActionOkUpdate
    end
    object ActionCancel: TAction
      Caption = 'Cancel'
      OnExecute = ActionCancelExecute
    end
    object ActionHelp: TAction
      Caption = 'Help'
      Visible = False
    end
  end
end
