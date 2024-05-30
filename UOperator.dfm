object FrmOperator: TFrmOperator
  Left = 0
  Top = 0
  ClientHeight = 614
  ClientWidth = 749
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 595
    Width = 749
    Height = 19
    Panels = <
      item
        Width = 200
      end>
    ExplicitTop = 417
    ExplicitWidth = 722
  end
  object pnlAdd: TPanel
    Left = 0
    Top = 0
    Width = 749
    Height = 137
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 722
    object lblLastName: TLabel
      Left = 40
      Top = 19
      Width = 44
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103
    end
    object lblFirstName: TLabel
      Left = 65
      Top = 46
      Width = 19
      Height = 13
      Caption = #1048#1084#1103
    end
    object lblSurName: TLabel
      Left = 35
      Top = 73
      Width = 49
      Height = 13
      Caption = #1054#1090#1095#1077#1089#1090#1074#1086
    end
    object lblBirthday: TLabel
      Left = 376
      Top = 24
      Width = 80
      Height = 13
      Caption = #1044#1077#1085#1100' '#1088#1086#1078#1076#1077#1085#1080#1103
    end
    object btnAdd: TButton
      Left = 238
      Top = 104
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
      OnClick = btnAddClick
    end
    object edtLastName: TEdit
      Left = 88
      Top = 16
      Width = 225
      Height = 21
      TabOrder = 1
    end
    object edtFirstName: TEdit
      Left = 88
      Top = 43
      Width = 225
      Height = 21
      TabOrder = 2
    end
    object edtSurName: TEdit
      Left = 88
      Top = 70
      Width = 225
      Height = 21
      TabOrder = 3
    end
    object DateTimePicker: TDateTimePicker
      Left = 376
      Top = 43
      Width = 186
      Height = 21
      Date = 45442.000000000000000000
      Time = 0.917831446757190900
      TabOrder = 4
    end
  end
  object pnlHistory: TPanel
    Left = 0
    Top = 382
    Width = 749
    Height = 213
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 204
    ExplicitWidth = 722
    object DBGridHistory: TDBGrid
      Left = 1
      Top = 26
      Width = 488
      Height = 186
      Align = alLeft
      DataSource = DataSourceHistory
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'last_name'
          Title.Caption = #1060#1072#1084#1080#1083#1080#1103
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'first_name'
          Title.Caption = #1048#1084#1103
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sur_name'
          Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'birthday'
          Title.Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
          Width = 102
          Visible = True
        end>
    end
    object DBGridDocs: TDBGrid
      Left = 489
      Top = 26
      Width = 259
      Height = 186
      Align = alClient
      DataSource = DataSourceDocs
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ndoc'
          Title.Caption = #1044#1086#1082#1091#1084#1077#1085#1090
          Width = 150
          Visible = True
        end>
    end
    object btnHistory: TButton
      Left = 1
      Top = 1
      Width = 747
      Height = 25
      Align = alTop
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1080#1089#1090#1086#1088#1080#1102
      TabOrder = 2
      OnClick = btnHistoryClick
      ExplicitWidth = 720
    end
  end
  object pnlAddDocs: TPanel
    Left = 0
    Top = 137
    Width = 749
    Height = 245
    Align = alClient
    TabOrder = 3
    ExplicitWidth = 722
    ExplicitHeight = 67
    object lblFIO: TLabel
      Left = 8
      Top = 0
      Width = 23
      Height = 13
      Caption = #1060#1048#1054
    end
    object lblDocName: TLabel
      Left = 247
      Top = 0
      Width = 50
      Height = 13
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090
    end
    object ComboBox: TComboBox
      Left = 8
      Top = 17
      Width = 233
      Height = 21
      Style = csDropDownList
      TabOrder = 0
    end
    object edtDocName: TEdit
      Left = 247
      Top = 17
      Width = 209
      Height = 21
      TabOrder = 1
    end
    object btnAddDoc: TButton
      Left = 472
      Top = 13
      Width = 88
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 2
      OnClick = btnAddDocClick
    end
  end
  object DataSourceHistory: TDataSource
    OnDataChange = DataSourceHistoryDataChange
    Left = 516
    Top = 72
  end
  object DataSourceDocs: TDataSource
    Left = 632
    Top = 72
  end
end
