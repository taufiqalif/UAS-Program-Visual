unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, SQLDB, odbcconn, Forms, Controls, Graphics, Dialogs,
  StdCtrls, DBGrids, DBCtrls, frnTambah, frnUbah;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnTambah: TButton;
    btnUbah: TButton;
    btnHapus: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    SQLConnector1: TSQLConnector;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure btnTambahClick(Sender: TObject);
    procedure btnUbahClick(Sender: TObject);

  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnTambahClick(Sender: TObject);
begin
  // Membuat objek Form2
  with TForm2.Create(Application) do
  begin
    try
      // Menampilkan form data barang
      ShowModal;
    finally
      Free; // Membebaskan memori objek Form1 setelah selesai digunakan
    end;
  end;
end;

procedure TForm1.btnUbahClick(Sender: TObject);
begin
  // Membuat objek Form3
  with TForm3.Create(Application) do
  begin
    try
      // Menampilkan form data barang
      ShowModal;
    finally
      Free; // Membebaskan memori objek Form1 setelah selesai digunakan
    end;
  end;
end;



end.

