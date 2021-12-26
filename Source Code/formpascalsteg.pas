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

  bits = array[1..MAX_BITS_COUNT] of byte;
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
    procedure embedButtonClick(Sender: TObject);
    procedure saveButtonClick(Sender: TObject);

  private
    {Private Declarations}
    function BitsToBytes(const bits:AnsiString): String;
    function ByteToBits(const message:String): AnsiString;
    function ReverseBits(const bits:String): String;
    function ReadFromBMP(const bmp: TBitmap; const internal: Boolean): String;
    procedure EmbedToBmp(const data: String; bmp, SaveTo:TBitmap);

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

function TForm1.ByteToBits(const message:String): AnsiString;
var
  bit, b: byte;
  x, y: integer;
  temp: String;
  count: integer;
  ansi: AnsiString;
begin
  if message = '' then
  begin
    ShowMessage('Message is Empty! Please input a message');
    Exit;
  end;

  temp := FLAG_MARK + message;
  SetLength(ansi, MAX_BITS_COUNT);
  for x:=1 to MAX_BITS_COUNT do
      ansi[x] := '0';

  count := 0;

  for x:=1 to length(temp) do
  begin
    b := ord(temp[x]);
    for y:=0 to 7 do
    begin
      bit := (b SHR y) AND 1;
      ansi[count+1] := IntToStr(bit)[1];
      inc(count);
    end;
  end;
  Result := ansi;
end;

function TForm1.ReverseBits(const bits: String): String;
var
  x: integer;
begin
  // if the bits is not 8bits, then exit
  if length(bits) <> 8 then
     exit;
  // Store the bits in Result
  Result := bits;
  // Reverse bits
  for x:=1 to 8 do
      Result[8 - (x-1)] := bits[x];
end;

function TForm1.ReadFromBMP(const bmp: TBitmap; const internal: Boolean): String;
var
  bs: AnsiString;
  pix: byte;
  x, y: integer;
  count: Word;
  flag: String;
begin
  SetLength(bs, MAX_BITS_COUNT);
  bmp.Canvas.Lock;
  count := 1;
  for y:=0 to bmp.Height-1 do
  begin
    if count > MAX_BITS_COUNT then
       break;

    for x:=0 to bmp.Width-1 do
    begin
      if count > MAX_BITS_COUNT then
         break;
      pix := bmp.Canvas.Pixels[x,y];
      pix := pix AND $00000001;
      bs[count] := IntToStr(pix)[1];
      inc(count);
    end;
  end;

  bmp.Canvas.Unlock;
  Result := BitsToBytes(bs);
  if internal then
     exit;
  flag := copy(Result, 1, length(FLAG_MARK));

  if flag = FLAG_MARK then
     delete(Result, 1, length(FLAG_MARK))
  else
    begin
      Result := '[WARNING] ' + #13#10 + 'Bitmap is invalid or Secret Data is Missing.';
    end
end;

procedure TForm1.EmbedToBmp(const data: String; bmp, SaveTo: TBitmap);
var
  bs: AnsiString;
  pix: TColor;
  x, y: integer;
  count: Word;
  bitmap: TBitmap;
begin
  bs := ByteToBits(data);
  SaveTo.Assign(bitmap);

  SaveTo.Canvas.Lock;
  count := 1;

  for y:=0 to SaveTo.Height-1 do
  begin
    if count > MAX_BITS_COUNT then
       break;
    for x:=0 to SaveTo.Width-1 do
    begin
      pix := SaveTo.Canvas.Pixels[x,y];

      if count > MAX_BITS_COUNT then
         break;

      if bs[count] = '1' then
         pix := pix OR $0000001
      else
          pix := pix AND $FFFFFFFE;
      inc(count);
      SaveTo.Canvas.Pixels[x,y] := pix;
    end;
  end;
  SaveTo.Canvas.Unlock;
end;

procedure TForm1.saveButtonClick(Sender: TObject);
begin
  if (savePictureDialog.Execute) then
  begin
    embedImage1.Picture.SaveToFile(savePictureDialog.FileName);
  end;
end;

function TForm1.BitsToBytes(const bits: AnsiString): String;
var
  temp: String;
  x: integer;
  bit, b: byte;
  str8: String;
begin
  temp := bits;
  Result := '';

  // as long as temp is greater than 0
  while length(temp) > 0 do
  begin
    str8 := copy(temp, 1, 8); // copy temp to str8
    delete(temp, 1, 8); // free temp
    str8 := ReverseBits(str8); // Reverse bit order from str8
    b := 0; // b start from 0

    // x :-> from 1 to 8 do
    for x:=1 to 8 do
    begin
      // if str8 index x is 1, then bit is 1
      if str8[x] = '1' then
      begin
         bit := 1;
      end
      // else, bit is 0
      else
          bit := 0;

      // shift left b 1 time, then OR the result with bit
      // store the result in b
      b := (b SHL 1) OR bit;
    end;
    // append b to result
    Result := Result + chr(b);
  end;
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

procedure TForm1.embedButtonClick(Sender: TObject);
begin
end;

end.
