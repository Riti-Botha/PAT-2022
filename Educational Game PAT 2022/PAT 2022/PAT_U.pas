unit PAT_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, jpeg, pngimage, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    pagecontrol: TPageControl;
    tbsHome: TTabSheet;
    tbsAvatar: TTabSheet;
    imgStart: TImage;
    pnlAvatar: TPanel;
    imgMoana: TImage;
    imgAstronaut: TImage;
    imgRaya: TImage;
    tbsgame: TTabSheet;
    lblAfmetings: TLabel;
    pnlBack: TPanel;
    pnlBack2: TPanel;
    Panel4: TPanel;
    pnlBacktogame: TPanel;
    lblNaam: TLabel;
    edtNaam: TEdit;
    cmbGraad: TComboBox;
    lblWelkom: TLabel;
    pnlHelp: TPanel;
    imgBackgroundHome: TImage;
    imgHelp: TImage;
    procedure imgStartClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgRayaClick(Sender: TObject);
    procedure imgMoanaClick(Sender: TObject);
    procedure imgAstronautClick(Sender: TObject);
    procedure pnlBacktogameClick(Sender: TObject);
    procedure edtNaamChange(Sender: TObject);
    procedure pnlHelpClick(Sender: TObject);
    procedure imgHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  iAantalReg, igraad, ikarakter, ikliekStart: integer;
  sNaam: string;

implementation

{$R *.dfm}

/// //////////////////////////////////////////////////////
procedure TForm1.edtNaamChange(Sender: TObject);
begin
  sNaam := edtNaam.Text;
  lblWelkom.Caption := 'WELKOM ' + uppercase(sNaam);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  imgStart.Picture.LoadFromFile('startbutton.png');
  imgStart.Stretch := true;
  imgStart.Proportional := true;

  imgBackgroundHome.Picture.LoadFromFile('backgroundimage.png');
  imgBackgroundHome.Stretch := true;


  pnlAvatar.Caption := 'KIES JOU KARAKTER!';
  pnlAvatar.Font.Size := 22;
  pnlAvatar.Font.Style := [fsbold];
  pnlAvatar.color := clmoneygreen;
  pnlAvatar.Font.color := clActiveCaption;

imgHelp.Visible := false;
imgHelp.Picture.LoadFromFile('help.png');

   pnlBacktogame.Visible := false;

  pnlBack.Caption := 'Back';
  pnlBack2.Caption := 'Back';
  pnlBacktogame.Caption := 'RETURN';


  ikliekStart := 0;
  lblNaam.Caption := 'What is your name?';
  edtNaam.Text := ' ';
  cmbGraad.Text := 'In watter graad is jy? ';

  lblWelkom.Font.Size := 18;
  pnlHelp.Caption := 'HELP!!';
  pnlHelp.Color := clwhite;

end;

procedure TForm1.imgAstronautClick(Sender: TObject);
begin
  ikarakter := 3;
end;

procedure TForm1.imgHelpClick(Sender: TObject);
begin
imgHelp.Visible := false;

edtNaam.Visible := true;
cmbGraad.Visible := true;
end;

procedure TForm1.imgMoanaClick(Sender: TObject);
begin
  ikarakter := 2;
end;

procedure TForm1.imgRayaClick(Sender: TObject);
begin
  ikarakter := 1;
end;

procedure TForm1.imgStartClick(Sender: TObject);
begin

  tbsAvatar.Visible := true;
  tbsHome.Visible := false;

  imgMoana.Picture.LoadFromFile('Moana.jpeg');
  imgAstronaut.Picture.LoadFromFile('Astronaut.png');
  imgRaya.Picture.LoadFromFile('Raya.jpg');

  imgMoana.Stretch := true;
  imgAstronaut.Stretch := true;
  imgRaya.Stretch := true;

  ikliekStart := 1;

  if ikliekStart >= 1 then
  begin
    pnlBacktogame.Visible := true;
  end;

end;

procedure TForm1.pnlBacktogameClick(Sender: TObject);
begin
  // tbsGame.Visible := true;
  // tbsHome.Visible := false;
  // tbsAvatar.Visible := false;

  tbsgame.Show;
end;

procedure TForm1.pnlHelpClick(Sender: TObject);
begin
//  showmessage('Tik jou naam en graad in, dan kliek op ''start''!')

imgHelp.Visible := true;
imgHelp.Stretch := true;

edtNaam.Visible := false;
cmbGraad.Visible := false;
end;

end.
