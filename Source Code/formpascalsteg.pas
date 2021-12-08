unit FormPascalSteg;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtDlgs, Buttons,
  StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    loadButton: TButton;
    saveButton: TButton;
    closeButton: TButton;
    text1: TEdit;
    text2: TEdit;
    embedButton: TButton;
    extractButton: TButton;
    image1: TImage;
    image2: TImage;
    openPictureDialog: TOpenPictureDialog;
    savePictureDialog: TSavePictureDialog;
    procedure text1Change(Sender: TObject);
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

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.embedButtonClick(Sender: TObject);
begin

end;

procedure TForm1.text1Change(Sender: TObject);
begin

end;

end.

