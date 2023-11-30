object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 488
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object pagecontrol: TPageControl
    Left = 8
    Top = 0
    Width = 537
    Height = 489
    ActivePage = tbsHome
    TabOrder = 0
    object tbsHome: TTabSheet
      Caption = ' '
      object imgBackgroundHome: TImage
        Left = 3
        Top = 0
        Width = 526
        Height = 465
      end
      object imgStart: TImage
        Left = 120
        Top = 108
        Width = 265
        Height = 122
        OnClick = imgStartClick
      end
      object lblNaam: TLabel
        Left = 120
        Top = 307
        Width = 45
        Height = 15
        Caption = 'lblNaam'
      end
      object lblWelkom: TLabel
        Left = 152
        Top = 263
        Width = 57
        Height = 15
        Caption = 'lblWelkom'
      end
      object imgHelp: TImage
        Left = 120
        Top = 24
        Width = 265
        Height = 417
        OnClick = imgHelpClick
      end
      object cmbGraad: TComboBox
        Left = 120
        Top = 344
        Width = 249
        Height = 23
        TabOrder = 3
        Text = 'cmbGraad'
        Items.Strings = (
          'Ek is jonger as dit!'
          'Graad 1'
          'Graad 2'
          'Graad 3'
          'Graad 4'
          'Graad 5'
          'Graad 6'
          'Graad 7'
          'Graad 8'
          'Graad 9'
          'Ek is ouer as dit!')
      end
      object Panel4: TPanel
        Left = 456
        Top = 432
        Width = 185
        Height = 41
        Caption = 'Panel4'
        TabOrder = 0
      end
      object pnlBacktogame: TPanel
        Left = 456
        Top = 432
        Width = 70
        Height = 24
        ParentCustomHint = False
        BiDiMode = bdLeftToRight
        Caption = 'pnlBacktogame'
        Ctl3D = True
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBiDiMode = False
        ParentBackground = False
        ParentCtl3D = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        OnClick = pnlBacktogameClick
      end
      object edtNaam: TEdit
        Left = 248
        Top = 304
        Width = 121
        Height = 23
        TabOrder = 2
        Text = 'edtNaam'
        OnChange = edtNaamChange
      end
      object pnlHelp: TPanel
        Left = 3
        Top = 415
        Width = 118
        Height = 41
        ParentCustomHint = False
        BiDiMode = bdLeftToRight
        BorderWidth = 10
        BorderStyle = bsSingle
        Caption = 'pnlHelp'
        Ctl3D = True
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBiDiMode = False
        ParentBackground = False
        ParentCtl3D = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 4
        OnClick = pnlHelpClick
      end
    end
    object tbsAvatar: TTabSheet
      Caption = ' '
      ImageIndex = 1
      object imgMoana: TImage
        Left = 184
        Top = 200
        Width = 153
        Height = 145
        OnClick = imgMoanaClick
      end
      object imgAstronaut: TImage
        Left = 351
        Top = 200
        Width = 153
        Height = 145
        OnClick = imgAstronautClick
      end
      object imgRaya: TImage
        Left = 16
        Top = 200
        Width = 153
        Height = 145
        OnClick = imgRayaClick
      end
      object pnlAvatar: TPanel
        Left = 0
        Top = 0
        Width = 529
        Height = 105
        Caption = 'pnlAvatar'
        ParentBackground = False
        TabOrder = 1
      end
      object pnlBack: TPanel
        Left = 456
        Top = 432
        Width = 70
        Height = 24
        Caption = 'pnlBack'
        TabOrder = 0
      end
    end
    object tbsgame: TTabSheet
      ImageIndex = 2
      object lblAfmetings: TLabel
        Left = 67
        Top = 171
        Width = 3
        Height = 15
      end
      object pnlBack2: TPanel
        Left = 456
        Top = 431
        Width = 70
        Height = 25
        Caption = 'pnlBack2'
        TabOrder = 0
      end
    end
  end
end
