object FrmFindPeople: TFrmFindPeople
  Left = 0
  Top = 0
  Width = 563
  Height = 203
  TabOrder = 0
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 563
    Height = 65
    Align = alTop
    Caption = #1055#1086#1080#1089#1082
    TabOrder = 0
    object lblLastName: TLabel
      Left = 16
      Top = 11
      Width = 51
      Height = 15
      Caption = #1060#1072#1084#1080#1083#1080#1103
    end
    object btnFind: TButton
      Left = 238
      Top = 26
      Width = 75
      Height = 25
      Caption = #1053#1072#1081#1090#1080
      TabOrder = 0
      OnClick = btnFindClick
    end
    object edtLastName: TEdit
      Left = 23
      Top = 27
      Width = 209
      Height = 23
      TabOrder = 1
      StyleName = 'Windows'
      OnKeyPress = edtLastNameKeyPress
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 65
    Width = 563
    Height = 138
    Align = alClient
    DataSource = DataSourceFind
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
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
  object DataSourceFind: TDataSource
    Left = 496
    Top = 16
  end
end
