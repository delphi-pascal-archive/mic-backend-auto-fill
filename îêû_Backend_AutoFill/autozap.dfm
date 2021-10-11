object Form1: TForm1
  Left = 217
  Top = 123
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1052#1048#1062' - Backend AutoFill'
  ClientHeight = 658
  ClientWidth = 1034
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 30
    Width = 58
    Height = 16
    Caption = 'Progress:'
  end
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 409
    Height = 16
    AutoSize = False
    Caption = 'Caption:'
    ParentShowHint = False
    ShowHint = True
  end
  object Label3: TLabel
    Left = 8
    Top = 56
    Width = 58
    Height = 16
    Caption = 'Navigate:'
  end
  object Label4: TLabel
    Left = 420
    Top = 16
    Width = 61
    Height = 16
    Alignment = taRightJustify
    Caption = #1052#1072#1089#1096#1090#1072#1073':'
    Visible = False
  end
  object Bevel1: TBevel
    Left = 592
    Top = 8
    Width = 9
    Height = 641
    Shape = bsLeftLine
  end
  object Label21: TLabel
    Left = 600
    Top = 600
    Width = 100
    Height = 16
    Caption = 'Records count: 0'
  end
  object Label22: TLabel
    Left = 728
    Top = 600
    Width = 79
    Height = 16
    Caption = 'Record 0 of 0'
  end
  object Button1: TButton
    Left = 856
    Top = 624
    Width = 169
    Height = 25
    Caption = 'Fill all fields'
    Enabled = False
    TabOrder = 7
    OnClick = Button1Click
  end
  object Panel1: TPanel
    Left = 8
    Top = 80
    Width = 577
    Height = 569
    BevelOuter = bvLowered
    TabOrder = 8
    object WebBrowser1: TWebBrowser
      Left = 1
      Top = 1
      Width = 575
      Height = 567
      Align = alClient
      TabOrder = 0
      OnProgressChange = WebBrowser1ProgressChange
      OnDocumentComplete = WebBrowser1DocumentComplete
      ControlData = {
        4C0000008B2F0000E22E00000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
  object ComboBox1: TComboBox
    Left = 80
    Top = 48
    Width = 409
    Height = 24
    ItemHeight = 16
    Sorted = True
    TabOrder = 0
    OnKeyPress = ComboBox1KeyPress
    Items.Strings = (
      'http://www.mosipoteka.ru'
      'http://www.mosipoteka.ru/backend')
  end
  object Button2: TButton
    Left = 496
    Top = 48
    Width = 89
    Height = 25
    Caption = 'GO'
    TabOrder = 1
    OnClick = Button2Click
  end
  object ComboBox2: TComboBox
    Left = 488
    Top = 8
    Width = 97
    Height = 24
    Style = csDropDownList
    ItemHeight = 16
    TabOrder = 2
    Visible = False
    OnChange = ComboBox2Change
    Items.Strings = (
      '500 %'
      '400 %'
      '300 %'
      '250 %'
      '200 %'
      '175 %'
      '150 %'
      '125 %'
      '110 %'
      '100 %'
      '90 %'
      '80 %'
      '70 %'
      '60 %'
      '50 %'
      '40 %'
      '30 %'
      '20 %')
  end
  object GroupBox1: TGroupBox
    Left = 600
    Top = 40
    Width = 425
    Height = 545
    Caption = ' '#1060#1086#1088#1084#1072' '#1076#1083#1103' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103' '
    TabOrder = 4
    object Label5: TLabel
      Left = 16
      Top = 30
      Width = 42
      Height = 16
      Caption = #1043#1086#1088#1086#1076':'
    end
    object Label6: TLabel
      Left = 16
      Top = 56
      Width = 93
      Height = 16
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1046#1050':'
    end
    object Label7: TLabel
      Left = 16
      Top = 80
      Width = 45
      Height = 16
      Caption = #1052#1077#1090#1088#1086':'
    end
    object Label8: TLabel
      Left = 16
      Top = 104
      Width = 63
      Height = 16
      Caption = #1054#1090' '#1084#1077#1090#1088#1086':'
    end
    object Label9: TLabel
      Left = 16
      Top = 135
      Width = 43
      Height = 16
      Caption = #1040#1076#1088#1077#1089':'
    end
    object Label10: TLabel
      Left = 16
      Top = 160
      Width = 109
      Height = 16
      Caption = #1062#1077#1085#1072' '#1079#1072' '#1082#1074'. '#1084' '#1074' $:'
      Enabled = False
    end
    object Label11: TLabel
      Left = 16
      Top = 182
      Width = 129
      Height = 16
      Caption = #1062#1077#1085#1072' '#1079#1072' '#1082#1074'. '#1084' '#1074' '#1088#1091#1073'.:'
      Enabled = False
    end
    object Label12: TLabel
      Left = 16
      Top = 208
      Width = 109
      Height = 16
      Caption = #1062#1077#1085#1072' '#1086#1073#1097#1072#1103' '#1088#1091#1073'.:'
    end
    object Label13: TLabel
      Left = 16
      Top = 240
      Width = 89
      Height = 16
      Caption = #1062#1077#1085#1072' '#1086#1073#1097#1072#1103' $:'
    end
    object Label14: TLabel
      Left = 16
      Top = 272
      Width = 61
      Height = 16
      Caption = #1055#1083#1086#1097#1072#1076#1100':'
    end
    object Label15: TLabel
      Left = 16
      Top = 296
      Width = 104
      Height = 16
      Caption = #1055#1083#1086#1097#1072#1076#1100' '#1086#1073#1097#1072#1103':'
    end
    object Label16: TLabel
      Left = 16
      Top = 320
      Width = 74
      Height = 16
      Caption = #1069#1090#1072#1078#1085#1086#1089#1090#1100':'
    end
    object Label17: TLabel
      Left = 16
      Top = 344
      Width = 92
      Height = 16
      Caption = #1063#1080#1089#1090#1086' '#1082#1086#1084#1085#1072#1090':'
    end
    object Label18: TLabel
      Left = 16
      Top = 376
      Width = 72
      Height = 16
      Caption = #1058#1077#1083#1077#1092#1086#1085#1099':'
    end
    object Label19: TLabel
      Left = 16
      Top = 400
      Width = 82
      Height = 16
      Caption = #1057#1087#1077#1094#1080#1072#1083#1080#1089#1090':'
    end
    object Label20: TLabel
      Left = 16
      Top = 432
      Width = 68
      Height = 16
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
    end
    object Edit1: TEdit
      Tag = 2
      Left = 160
      Top = 48
      Width = 249
      Height = 24
      TabOrder = 1
    end
    object Edit2: TEdit
      Tag = 4
      Left = 160
      Top = 96
      Width = 249
      Height = 24
      TabOrder = 3
    end
    object Edit3: TEdit
      Tag = 5
      Left = 160
      Top = 128
      Width = 249
      Height = 24
      TabOrder = 4
    end
    object Edit4: TEdit
      Tag = 6
      Left = 160
      Top = 152
      Width = 249
      Height = 24
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object Edit5: TEdit
      Tag = 7
      Left = 160
      Top = 176
      Width = 249
      Height = 24
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object SpinEdit1: TSpinEdit
      Tag = 9
      Left = 160
      Top = 232
      Width = 249
      Height = 26
      MaxValue = 0
      MinValue = 0
      TabOrder = 8
      Value = 0
    end
    object SpinEdit2: TSpinEdit
      Tag = 8
      Left = 160
      Top = 200
      Width = 249
      Height = 26
      MaxValue = 0
      MinValue = 0
      TabOrder = 7
      Value = 0
    end
    object Edit6: TEdit
      Tag = 10
      Left = 160
      Top = 264
      Width = 249
      Height = 24
      TabOrder = 9
    end
    object Edit7: TEdit
      Tag = 11
      Left = 160
      Top = 288
      Width = 249
      Height = 24
      TabOrder = 10
    end
    object Edit8: TEdit
      Tag = 12
      Left = 160
      Top = 312
      Width = 249
      Height = 24
      TabOrder = 11
    end
    object Edit9: TEdit
      Tag = 16
      Left = 160
      Top = 368
      Width = 249
      Height = 24
      TabOrder = 13
    end
    object Edit10: TEdit
      Tag = 17
      Left = 160
      Top = 392
      Width = 249
      Height = 24
      TabOrder = 14
    end
    object Memo1: TMemo
      Tag = 18
      Left = 160
      Top = 416
      Width = 249
      Height = 57
      ParentShowHint = False
      ScrollBars = ssBoth
      ShowHint = True
      TabOrder = 15
      WordWrap = False
    end
    object CheckBox1: TCheckBox
      Tag = 14
      Left = 16
      Top = 488
      Width = 153
      Height = 17
      Caption = #1057#1087#1077#1094#1087#1088#1077#1076#1083#1086#1078#1077#1085#1080#1077
      TabOrder = 16
    end
    object CheckBox2: TCheckBox
      Tag = 15
      Left = 16
      Top = 512
      Width = 137
      Height = 17
      Caption = #1042' "'#1048#1085#1074#1077#1089#1090#1080#1094#1080#1080'"'
      TabOrder = 17
    end
    object CheckBox3: TCheckBox
      Tag = 19
      Left = 248
      Top = 504
      Width = 105
      Height = 17
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100
      Checked = True
      State = cbChecked
      TabOrder = 18
    end
    object Edit11: TEdit
      Tag = 1
      Left = 160
      Top = 24
      Width = 249
      Height = 24
      TabOrder = 0
    end
    object Edit12: TEdit
      Tag = 3
      Left = 160
      Top = 72
      Width = 249
      Height = 24
      TabOrder = 2
    end
    object Edit13: TEdit
      Tag = 13
      Left = 160
      Top = 336
      Width = 249
      Height = 24
      TabOrder = 12
    end
  end
  object Button3: TButton
    Left = 600
    Top = 8
    Width = 425
    Height = 25
    Caption = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083' ...'
    TabOrder = 3
    OnClick = Button3Click
  end
  object ListView1: TListView
    Left = 16
    Top = 488
    Width = 545
    Height = 137
    Columns = <
      item
        Caption = 'City'
        Width = 62
      end
      item
        Caption = 'Name GK'
        Width = 62
      end
      item
        Caption = 'Metro'
        Width = 62
      end
      item
        Caption = 'From metro'
        Width = 62
      end
      item
        Caption = 'Adress'
        Width = 62
      end
      item
        Caption = 'Price (kv m USD)'
        Width = 62
      end
      item
        Caption = 'Price (kv m RUB)'
        Width = 62
      end
      item
        Caption = 'Price obsh (RUB)'
        Width = 62
      end
      item
        Caption = 'Price obsh (USD)'
        Width = 62
      end
      item
        Caption = 'Square'
        Width = 62
      end
      item
        Caption = 'Square big'
        Width = 62
      end
      item
        Caption = 'Floor'
        Width = 62
      end
      item
        Caption = 'Flats'
        Width = 62
      end
      item
        Caption = 'Phones'
        Width = 62
      end
      item
        Caption = 'Specialist'
        Width = 62
      end
      item
        Caption = 'Description'
        Width = 62
      end>
    ReadOnly = True
    RowSelect = True
    TabOrder = 9
    ViewStyle = vsReport
    Visible = False
  end
  object Button5: TButton
    Left = 600
    Top = 624
    Width = 121
    Height = 25
    Caption = '<< Back record'
    Enabled = False
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 728
    Top = 624
    Width = 121
    Height = 25
    Caption = 'Next record >>'
    Enabled = False
    TabOrder = 6
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 16
    Top = 336
    Width = 113
    Height = 25
    Caption = 'Get doc fields'
    TabOrder = 10
    Visible = False
    OnClick = Button7Click
  end
  object ProgressBar1: TProgressBar
    Left = 240
    Top = 32
    Width = 177
    Height = 9
    Smooth = True
    Step = 1
    TabOrder = 11
    Visible = False
  end
  object Button8: TButton
    Left = 16
    Top = 368
    Width = 113
    Height = 25
    Caption = 'Test ComboBox'
    TabOrder = 12
    Visible = False
    OnClick = Button8Click
  end
  object ListBox1: TListBox
    Left = 16
    Top = 400
    Width = 545
    Height = 81
    ItemHeight = 16
    TabOrder = 13
    Visible = False
  end
  object Button11: TButton
    Left = 336
    Top = 336
    Width = 225
    Height = 25
    Caption = 'Put data (IHtmlDoc2)'
    TabOrder = 14
    Visible = False
    OnClick = Button11Click
  end
  object Button12: TButton
    Left = 136
    Top = 368
    Width = 193
    Height = 25
    Caption = 'Click on element (IHtmlDoc2)'
    TabOrder = 15
    Visible = False
    OnClick = Button12Click
  end
  object Button13: TButton
    Left = 136
    Top = 336
    Width = 193
    Height = 25
    Caption = 'Test (IHtmlDoc2)'
    TabOrder = 16
    Visible = False
    OnClick = Button13Click
  end
  object Button9: TButton
    Left = 336
    Top = 368
    Width = 225
    Height = 25
    Caption = 'Get "Select" <Option> (IHtmlDoc2)'
    TabOrder = 17
    Visible = False
    OnClick = Button9Click
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Text files (*.txt)|*.txt|All files (*.*)|*.*'
    Left = 360
    Top = 88
  end
  object SaveDialog1: TSaveDialog
    Left = 392
    Top = 88
  end
end
