unit FormPascalSteg;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtDlgs, Buttons,
  StdCtrls, ExtCtrls;

// Flag to mark the image
// PascalSteg will be our flag
const
  FLAG_STRING_LEN = 10; // change the value according to flag char
  FLAG_MARK = 'PascalSteg'; // change the flag here
  MAX_CHAR_COUNT = 100; // max bytes of secret message
  MAX_BITS_COUNT = (MAX_CHAR_COUNT + FLAG_STRING_LEN) * 8;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnLoad: TButton;
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
    procedure btnLoadClick(Sender: TObject);
    procedure closeButtonClick(Sender: TObject);
    procedure embedTextChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure originalImage1Click(Sender: TObject);
    procedure embedImage1Click(Sender: TObject);
    procedure saveButtonClick(Sender: TObject);
  private
    {Private Declarations}
    function BitsToBytes(const bits:AnsiString): String;
    function ByteToBits(const data:String): AnsiString;
    function ReverseBits(const bits:String): String;
    function ReadFromBMP(const bmp:TBitmap; const internal:Boolean = False): String;
    procedure EmbedToBmp(const data: String; bmp, SaveTo:TBitmap);

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

procedure TForm1.saveButtonClick(Sender: TObject);
begin
  if (savePictureDialog.Execute) then
  begin
    embedImage1.Picture.SaveToFile(savePictureDialog.FileName);
  end;
end;

procedure TForm1.embedTextChange(Sender: TObject);
begin

end;

procedure TForm1.btnLoadClick(Sender: TObject);
begin
  if radioLoadOption.ItemIndex = 0 then
  begin
    if (openPictureDialog.Execute) then
       originalImage1.Picture.LoadFromFile(openPictureDialog.FileName);
  end

  else
  begin
    if (openPictureDialog.Execute) then
       embedImage2.Picture.LoadFromFile(openPictureDialog.FileName);
  end;
end;

procedure TForm1.closeButtonClick(Sender: TObject);
begin
  close
end;

end.
