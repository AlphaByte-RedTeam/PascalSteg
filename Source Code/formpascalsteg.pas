unit FormPascalSteg;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtDlgs, Buttons,
  StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    image3: TImage;
    Label1: TLabel;
    loadButton: TButton;
    RadioGroup1: TRadioGroup;
    saveButton: TButton;
    closeButton: TButton;
    embedTxt: TEdit;
    extractTxt: TEdit;
    embedButton: TButton;
    extractButton: TButton;
    image1: TImage;
    image2: TImage;
    openPictureDialog: TOpenPictureDialog;
    savePictureDialog: TSavePictureDialog;
    procedure embedTxtChange(Sender: TObject);
    procedure embedButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

// TODO: Fix Radio Group Button

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.embedButtonClick(Sender: TObject);
begin

end;

procedure TForm1.embedTxtChange(Sender: TObject);
begin

end;

end.

