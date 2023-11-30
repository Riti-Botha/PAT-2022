unit PAT_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, math, jpeg, pngimage, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Samples.Spin;

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
    pnlBacktogame: TPanel;
    lblNaam: TLabel;
    edtNaam: TEdit;
    cmbGraad: TComboBox;
    lblWelkom: TLabel;
    pnlHelp: TPanel;
    imgBackgroundHome: TImage;
    imgHelp: TImage;
    imgBackgroundAvatar: TImage;
    imgBackgroundGame: TImage;
    Panel1: TPanel;
    sedElement1: TSpinEdit;
    sedElement2: TSpinEdit;
    lblPyl: TLabel;
    lblElement3: TLabel;
    lblElement1: TLabel;
    lblElement2: TLabel;
    pnlPunte: TPanel;
    imgAvatarGekies: TImage;
    pnlToets: TPanel;
    sedElement3: TSpinEdit;
    imgMannetjie: TImage;
    imgChemLessonSmall: TImage;
    lblHint: TLabel;
    redafvoer: TRichEdit;
    tbsHandboek: TTabSheet;
    imgHandboek: TImage;
    btnKoop: TButton;
    btnHome: TButton;
    pnlOpskrif: TPanel;
    lblVraag: TLabel;
    btnHandboek: TButton;
    sedHoeveelheid: TSpinEdit;
    lblPrysTotaal: TLabel;
    lblPlus: TLabel;
    lblVoetskrif: TLabel;
    procedure imgStartClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgRayaClick(Sender: TObject);
    procedure imgMoanaClick(Sender: TObject);
    procedure imgAstronautClick(Sender: TObject);
    procedure pnlBacktogameClick(Sender: TObject);
    procedure edtNaamChange(Sender: TObject);
    procedure pnlHelpClick(Sender: TObject);
    procedure imgHelpClick(Sender: TObject);
    procedure pnlBackClick(Sender: TObject);
    procedure imgBackgroundHomeMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure pnlBack2Click(Sender: TObject);
    procedure tbsgameShow(Sender: TObject);
    procedure tbsAvatarShow(Sender: TObject);
    procedure cmbGraadChange(Sender: TObject);
    procedure pnlToetsClick(Sender: TObject);
    procedure imgBackgroundHomeClick(Sender: TObject);
    procedure btnHandboekClick(Sender: TObject);
    procedure tbsHandboekShow(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
    procedure sedHoeveelheidChange(Sender: TObject);
    procedure btnKoopClick(Sender: TObject);
    procedure sedElement1Change(Sender: TObject);
    procedure sedElement2Change(Sender: TObject);
    procedure sedElement3Change(Sender: TObject);

    // VARIABLES DEUR DIE DOKUMENT
  private
    { Private declarations }
    iAantalReg, igraad, ipunte, ichange, ikarakter, ikliekStart: Integer;
    rprys: real;
    sNaam: string;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

// DIE HOME BUTTON
procedure TForm1.btnHomeClick(Sender: TObject);
begin
  tbsHome.Show;
end;

// OP DIE HANDBOEK KOOP SKERM
procedure TForm1.btnKoopClick(Sender: TObject);
begin
  // MAAK SEKER DAT DIE AANTAL HANDBOEKE GELDIG IS
  if (sedHoeveelheid.value > 0) and (sedHoeveelheid.value < 11) then
  begin
    showmessage('Mooi! ' + floattostrf(rprys, ffcurrency, 6, 2) +
      ' is uit jou rekening gehaal!');
  end;
end;

// OP VERANDER PROCEDURE, SODAT DIT BETER WERK
procedure TForm1.cmbGraadChange(Sender: TObject);
begin

  // AS DIE PERSOON SY OUDERDOM VERANDER, WORD EEN BY N INTEGER (ichange) GEPLUS
  ichange := ichange + 1;

  // AS ichange GROTER IS AS 1, DAN KOM 'N BOODSKAP OP
  if ichange > 1 then
  begin
    // EK KON N SHOWMESSAGE GEBRUIK, MAAR DIT LYK METER MET 'N 'MessageDlg'
    // showmessage('JY MAAK NOU REGTIGWAAR JOU OUDERDOM OP!');
    MessageDlg('JY MAAK NOU REGTIGWAAR JOU OUDERDOM OP!', mtError, [mbOK], 0);
  end;

  // NOMMERS WORD HIER AAN DIE GEKOSE GRAAD GEGEE, WANT DAN KAN EK
  // DIT LATER IN DIE PROGRAM MAKLIK GEBRUIK
  case cmbGraad.ItemIndex of
    - 1:
      begin
        showmessage('Kies ''n graad!');
        cmbGraad.Text := '';
      end;
    1:
      igraad := 1;
    2:
      igraad := 2;
    3:
      igraad := 3;
    4:
      igraad := 4;

  end;
end;

procedure TForm1.edtNaamChange(Sender: TObject);
var
  itel: Integer;
begin
  // sNaam is onder private later WEER in die program gebruik word
  // As daar n naam ingesleutel word, dan
  sNaam := edtNaam.Text;
  lblWelkom.Caption := 'WELKOM ' + uppercase(sNaam);

  // Het die naam getalle, hoofletters of spesiale karakters in?
  for itel := 1 to Length(sNaam) do
  begin
    if not(sNaam[itel] in ['a' .. 'z']) then
    begin
      if sNaam[itel] in ['A' .. 'Z'] then
      begin
        showmessage('Jou naam mag nie hier uit hoofletters bestaan nie!');
        edtNaam.Clear;
        edtNaam.SetFocus;
        exit;
      end
      else if sNaam[itel] in ['0' .. '9'] then
      begin
        showmessage('Jou naam mag nie uit getalle bestaan nie!');
        edtNaam.Clear;
        edtNaam.SetFocus;
        exit;
      end
      else
      begin
        showmessage('Jou naam mag nie uit spesiale karakters bestaan nie!');
        edtNaam.Clear;
        edtNaam.SetFocus;
        exit;
      end;

    end;

    // //Het die naam hoofletters in?
    // for itel := 1 to Length(sNaam) do
    // begin
    // if sNaam[itel] in ['A' .. 'Z'] then
    // begin
    // showmessage('Jou naam mag nie hier uit hoofletters bestaan nie!');
    // edtNaam.Clear;
    // edtNaam.SetFocus;
    // exit;
    // end;
    // end;

  end;

end;

procedure TForm1.FormShow(Sender: TObject);
var
  sElemente: string;
begin
  btnHandboek.Caption := 'Koop ''n chemie handboek';
  lblHint.Visible := false;
  // // INITIALIZE
  tbsHome.Show;
  ipunte := 0;
  igraad := 0;
  ichange := 0;
  ikarakter := 0;
  // INITIALIZE DIE KLIEKS OM DIE RETURN KNOPPIE TE WYS OF NIE
  ikliekStart := 0;

  // DIE START BUTTON
  imgStart.Picture.LoadFromFile('startbutton.png');
  imgStart.Stretch := true;
  imgStart.Proportional := true;

  // DIE MOOI PERS BACKGROUND
  imgBackgroundHome.Picture.LoadFromFile('backgroundimage.png');
  imgBackgroundHome.Stretch := true;

  // DIE AVATAR PANEL
  pnlAvatar.Caption := 'KIES JOU KARAKTER!';
  pnlAvatar.Font.Size := 22;
  pnlAvatar.Font.Style := [fsbold];
  pnlAvatar.color := rgb(204, 153, 255);
  pnlAvatar.Font.color := rgb(230, 204, 255);

  // DIE HELP PRENT-KNOPPIE
  imgHelp.Visible := false;
  imgHelp.Picture.LoadFromFile('help.png');
  pnlHelp.Caption := 'HELP!!';
  pnlHelp.color := clwhite;

  // AL DIE BACK PANELS
  pnlBack.Caption := 'Terug';
  pnlBack2.Caption := 'Terug';
  pnlBacktogame.Caption := 'RETURN';

  pnlBacktogame.Visible := false; // <--

  // DIE NAAM EN GRAAD TERUGVOER BOKSE
  lblNaam.Caption := 'Wat is jou naam?';

  // DIE WELKOM TEKS
  lblWelkom.Font.Size := 18;
  lblWelkom.Visible := false;
  lblWelkom.Caption := 'WELKOM';

end;

// MAAK DAT WELKOM WYS WANNEER DIE MUIS OOR DIE PROGRAM BEWEEG
procedure TForm1.imgBackgroundHomeClick(Sender: TObject);
begin
  imgHelp.Visible := false;
  edtNaam.Visible := true;
  cmbGraad.Visible := true;
end;

// As die gebruiker die program oopmaak, dan wys die welkom label nog nie
// Die gebruiker moet eers sy muis oor die program beweeg om welkom te wees
procedure TForm1.imgBackgroundHomeMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  lblWelkom.Show;
end;

procedure TForm1.imgHelpClick(Sender: TObject);
begin
  // KRY DIE HULP WEG
  imgHelp.Visible := false;

  // NAAM, GRAAD EN HANDBOEK WYS
  edtNaam.Visible := true;
  cmbGraad.Visible := true;
  btnHandboek.Visible := true;
end;

procedure TForm1.imgStartClick(Sender: TObject);
begin

  // TOETS OF NAAM EN GRAAD LEEG IS:
  if edtNaam.Text = '' then
  begin
    showmessage('Sleutel jou naam eers in!');
    exit;
  end;
  if cmbGraad.Text = '' then
  begin
    showmessage('Kies eers ''n graad!');
    exit;
  end;

  // Die volgende tabsheet
  tbsAvatar.Show;

  // prente
  imgMoana.Picture.LoadFromFile('Moana.jpeg');
  imgAstronaut.Picture.LoadFromFile('Astronaut.png');
  imgRaya.Picture.LoadFromFile('Raya.jpg');

  imgMoana.Stretch := true;
  imgAstronaut.Stretch := true;
  imgRaya.Stretch := true;

  // Om die return knoppie reg te wys
  ikliekStart := 1;

  if ikliekStart >= 1 then
  begin
    pnlBacktogame.Visible := true;
  end;

  // TE JONK OF TE OUD OM TE SPEEL

  igraad := cmbGraad.ItemIndex;
  if igraad = 0 then
  begin
    showmessage('Jy is nog te jonk om te speel');
    tbsHome.Show;
    cmbGraad.SetFocus;
  end;

  if igraad = 5 then
  begin
    showmessage('Jy is te oud om te speel!');
    tbsHome.Show;
    cmbGraad.SetFocus;
    igraad := 0;
  end;

end;

// DIE BACK-KNOPPIES
procedure TForm1.pnlBack2Click(Sender: TObject);
begin
  tbsAvatar.Show;
end;

procedure TForm1.pnlBackClick(Sender: TObject);
begin
  tbsHome.Show;
end;

procedure TForm1.pnlBacktogameClick(Sender: TObject);
begin
  tbsgame.Show;
end;
//

// DIE HELP-KNOPPIE
procedure TForm1.pnlHelpClick(Sender: TObject);
begin
  // showmessage('Tik jou naam en graad in, dan kliek op ''start''!')
  imgHelp.Visible := true;
  imgHelp.Stretch := true;

  edtNaam.Visible := false;
  cmbGraad.Visible := false;
  btnHandboek.Visible := false;
end;

procedure TForm1.pnlToetsClick(Sender: TObject);
var
  iscore, irandom1, irandom2, irandom3, irandom4, ivoetskrif, iRegs, itel,
    iLinks: Integer;
  sscore: string;
  myfile: textfile;
begin

  // DIE SCORE VANAF TEXT FILE
  assignfile(myfile, 'score.txt');
  reset(myfile);
  readln(myfile, sscore);
  closefile(myfile);

  // KRY SCORE NA N :
  if sscore <> '' then
  begin // Score: 4        //8
    iscore := strtoint(copy(sscore, pos(':', sscore) + 2,
      Length(sscore) - pos(':', sscore) + 2));
  end
  else
  begin
    iscore := 0;
  end;

  // TOETS OF ANTWOORD REG IS
  iLinks := sedElement1.value * 2;
  iRegs := (sedElement2.value * strtoint(lblVoetskrif.Caption)) +
    sedElement3.value;

  if iLinks = iRegs then
  begin
    // KYK OF ALLES NIE DALK NET NA 0 GESLEUTEL IS NIE
    if (sedElement1.value = 0) or (sedElement2.value = 0) or
      (sedElement3.value = 0) then
    begin
      showmessage('Jy kroek nou!');
      sedElement1.SetFocus;
      exit;
    end;

    // KYK OF DAAR N NEGATIEWE WAARDE IS, WEERGAWE 1, DOEN NOU NIKS NIE
    if (sedElement1.value < 0) or (sedElement2.value < 0) or
      (sedElement3.value < 0) then
    begin
      showmessage('Jy kan nie hier ''n negatiewe getal gebruik nie!');
      sedElement1.SetFocus;
      exit;
    end;

    // KRY NUWE GETALLE SODAT DIE SPELETJIE KAN WERK
    irandom1 := randomrange(1, 5);
    irandom2 := randomrange(1, 5);

    irandom3 := randomrange(1, 5);
    ivoetskrif := randomrange(1, 5);

    sedElement1.value := irandom1;
    sedElement2.value := irandom2;
    sedElement3.value := irandom3;
    lblVoetskrif.Caption := inttostr(ivoetskrif);

    // SCORE EN PUNTE WAARDES
    ipunte := ipunte + 1;
    inc(iscore);
    pnlPunte.Visible := true;
    pnlPunte.Caption := 'Jy het ' + inttostr(ipunte) + ' reg';

    // ANIMASIE
    imgMannetjie.Picture.LoadFromFile('stickfigure.jpg');
    imgMannetjie.Stretch := true;

    for itel := 1 to 10 do
    begin
      imgMannetjie.Left := imgMannetjie.Left + 10;
    end;

  end
  else
  begin
    showmessage('Verkeerd! Probeer weer.');
    if iLinks / 2 = iRegs then
    // HINT NOOU EERS, WANT DAN IS DIE GEBRUIKERS AL OP DIE REGTE PAD
    begin
      lblHint.Visible := true;
      lblHint.Caption := 'As daar 1HCL, dan is daar 1H EN 1Cl! ' + slinebreak +
        'OF as daar 2HCL is, dan is daar 2H en 2Cl!!' + slinebreak +
        'As daar 2H4 is, dan moet jy 2 maal met 4!';
    end;
  end;

  // TEXTFILE KRY NUWE SCORE
  assignfile(myfile, 'score.txt');
  rewrite(myfile);
  sscore := 'Jou top score is: ' + inttostr(iscore);
  writeln(myfile, sscore);
  closefile(myfile);
  redafvoer.Lines.Clear;
  redafvoer.Lines.Add('Jou top score is: ' + inttostr(iscore));

end;

// KYK OF ELEMENT SPINEDITS WAARDIGE GETALLE HET
procedure TForm1.sedElement1Change(Sender: TObject);
var
  iroundedValue, ielementvalue: Integer;
  sroundedvalue: string;
begin
  iroundedValue := round(sedElement1.value);
  sedElement1.value := iroundedValue;
  if sedElement1.value < 0 then
  begin
    showmessage('Jy kan nie negatiewe getalle gebruik nie!');
    sedElement1.value := 0;
    exit;
  end;
end;

//
procedure TForm1.sedElement2Change(Sender: TObject);
var
  iroundedValue: Integer;
  sroundedvalue: string;
begin
  iroundedValue := round(sedElement2.value);
  sedElement2.value := iroundedValue;
  if sedElement2.value < 0 then
  begin
    showmessage('Jy kan nie negatiewe getalle gebruik nie!');
    sedElement2.value := 0;
    exit;
  end;
end;

//
procedure TForm1.sedElement3Change(Sender: TObject);
var
  iroundedValue: Integer;
  sroundedvalue: string;
begin
  iroundedValue := round(sedElement3.value);
  sedElement3.value := iroundedValue;
  if sedElement3.value < 0 then
  begin
    showmessage('Jy kan nie negatiewe getalle gebruik nie!');
    sedElement3.value := 0;
    exit;
  end;
end;

//
procedure TForm1.sedHoeveelheidChange(Sender: TObject);
var
  ihoeveelheid: Integer;
begin
  // KOOP DIE GEBRUIKER N REALISTIESE AANTAL BOEKE WAT OOK NIE ONS VOORRAAD GAAN LAAT UITHARDLOOP
  // NIE?
  ihoeveelheid := sedHoeveelheid.value;
  if ihoeveelheid > 10 then
  begin
    showmessage('Dis te veel!');
    lblPrysTotaal.Caption := ' ';
    sedHoeveelheid.value := 0;
  end;

  if ihoeveelheid < 0 then
  begin
    showmessage('Dis nie ''n realistiese bedrag nie!');
    lblPrysTotaal.Caption := ' ';
    sedHoeveelheid.value := 0;
  end;

  if ihoeveelheid = 0 then
  begin
    lblPrysTotaal.Caption := ' ';
  end;

  // AS WAARDIGE BEDRAG INGESLEUTEL IS, DAN WERK DIE.
  if (ihoeveelheid < 11) and (ihoeveelheid > 0) then
  begin
    rprys := ihoeveelheid * 150;
    lblPrysTotaal.Caption := 'Die prys is: ' + floattostrf(rprys,
      ffcurrency, 6, 2);

  end;
end;

procedure TForm1.btnHandboekClick(Sender: TObject);
begin

//IS N GRAAD GEKIES?
  if igraad >= 1 then
  begin
    tbsHandboek.Show;

  end
  else
  begin

    begin
      tbsHome.Show;
      showmessage('Kies ''n graad om voor ''n handboek te koop!');
    end;

  end;
end;

//KIES N KARAKTER WAT AAN N NOMMER GEKOPPEL IS
procedure TForm1.imgRayaClick(Sender: TObject);
begin
  ikarakter := 1;
  tbsgame.Show;
  showmessage('Goeie karakter keuse!');
end;

procedure TForm1.imgMoanaClick(Sender: TObject);
begin
  ikarakter := 2;
  tbsgame.Show;
  showmessage('Goeie karakter keuse!');
end;

procedure TForm1.imgAstronautClick(Sender: TObject);
begin
  ikarakter := 3;
  tbsgame.Show;
  showmessage('Goeie karakter keuse!');
end;
//

//MOOI MAAK
procedure TForm1.tbsAvatarShow(Sender: TObject);
begin
  imgBackgroundAvatar.Picture.LoadFromFile('backgroundimage.png');
  imgBackgroundAvatar.Stretch := true;
end;

procedure TForm1.tbsgameShow(Sender: TObject);
var
  sElemente: string;
  ivoetskrif, itel, irandom1, irandom2, irandom3, irandom4: Integer;
begin
  // Kry score vannaf text file
  redafvoer.Lines.LoadFromFile('score.txt');

  // Gee waardes aan alles
  imgChemLessonSmall.Picture.LoadFromFile('ChemLesson.png');
  imgChemLessonSmall.Proportional := true;

  lblElement1.Caption := 'H Cl';
  lblElement2.Caption := 'H';
  lblElement3.Caption := 'Cl';
  lblPlus.Caption := '+';

  // Aan die begin moet die panel nie wys nie, sodra persoon punt kry, wys die panel
  pnlPunte.Visible := false;

  // KRY RANDOM NOMMERS, SODAT DIE SPELETJIE WERK
  irandom1 := randomrange(1, 5);
  irandom2 := randomrange(1, 5);
  irandom3 := randomrange(1, 5);
  irandom4 := randomrange(1, 4);

  sedElement1.value := irandom1;
  sedElement2.value := irandom2;
  sedElement3.value := irandom3;
  lblVoetskrif.Caption := inttostr(irandom4);

  // INITIALIZE
  tbsHome.Show;
  igraad := 0;
  ichange := 0;

  lblPyl.Caption := '-->';
  lblPyl.Font.Size := 20;
  lblPyl.Font.Style := [fsbold];

  imgBackgroundGame.Picture.LoadFromFile('backgroundimage.png');
  imgBackgroundGame.Stretch := true;

  // KRY DIE KARAKTER DEUR NOMMER WAARDE GEGEE TE GEBRUIK
  if ikarakter = 0 then
  begin
    showmessage('Kies eers ''n karakter');
    tbsgame.Visible := false;
    tbsAvatar.Show;
  end;

  if ikarakter = 1 then
  begin
    imgAvatarGekies.Picture.LoadFromFile('Raya.jpg');
    imgAvatarGekies.Stretch := true;
  end;

  if ikarakter = 2 then
  begin
    imgAvatarGekies.Picture.LoadFromFile('Moana.jpeg');
    imgAvatarGekies.Stretch := true;
  end;

  if ikarakter = 3 then
  begin
    imgAvatarGekies.Picture.LoadFromFile('Astronaut.png');
    imgAvatarGekies.Stretch := true;
  end;
  imgAvatarGekies.Proportional := true;

  pnlToets.Caption := 'KLAAR!';
  pnlToets.Font.Size := 18;

end;

procedure TForm1.tbsHandboekShow(Sender: TObject);
var
  rprys: real;
  svraagsin: string;
begin
  // INITIALIZE
  rprys := 0;
  lblPrysTotaal.Caption := ' ';
  sedHoeveelheid.value := 0;
  btnHome.Caption := 'TERUG';
  btnKoop.Caption := 'KOOP!';
  svraagsin := 'Wil jy ''n handboek koop? Een kos R150!';
  lblVraag.Caption := 'Aantal handboeke' + slinebreak + 'wat jy wil koop?';

  // 'N APARTE BOODSKAP VIR MENSE WAT REEDS HUL NAME INGESLEUTEL HET EN VIR DIE
  // WAT NIE HET NIE
  if sNaam = '' then
  begin
    pnlOpskrif.Caption := svraagsin;
  end
  else
  begin
    pnlOpskrif.Caption := upcase(sNaam[1]) + copy(sNaam, 2, Length(sNaam) - 1) +
      ', ' + svraagsin;
  end;

  pnlOpskrif.Font.Size := 15;
  pnlOpskrif.Font.Style := [fsbold];

  // PRENTE VAN DIE HANDBOEK
  case igraad of
    0:
      tbsHome.Show;
    1:
      imgHandboek.Picture.LoadFromFile('Graad1HB.png');
    2:
      imgHandboek.Picture.LoadFromFile('Graad2HB.png');
    3:
      imgHandboek.Picture.LoadFromFile('Graad3HB.png');
    4:
      imgHandboek.Picture.LoadFromFile('Graad4HB.png');
  end;
  imgHandboek.Stretch := true;
end;

end.
