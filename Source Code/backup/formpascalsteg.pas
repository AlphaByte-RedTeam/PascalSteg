unit FormPascalSteg;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtDlgs, Buttons,
  StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    EXTRACTION: TLabel;
    embedImage2: TImage;
    EMBEDDING: TLabel;
    labelOriginalImage1: TLabel;
    labelOriginalImage2: TLabel;
    labelOriginalImage3: TLabel;
    radioLoadOption: TRadioGroup;
    saveButton: TButton;
    closeButton: TButton;
    embedText: TEdit;
    extractText: TEdit;
    embedButton: TButton;
    extractButton: TButton;
    originalImage1: TImage;
    embedImage1: TImage;
    openPictureDialog: TOpenPictureDialog;
    savePictureDialog: TSavePictureDialog;
    procedure embedTextChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure originalImage1Click(Sender: TObject);
    procedure embedImage1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.originalImage1Click(Sender: TObject);
begin

end;

procedure TForm1.embedImage1Click(Sender: TObject);
begin

end;

procedure TForm1.embedTextChange(Sender: TObject);
begin

end;

end.
