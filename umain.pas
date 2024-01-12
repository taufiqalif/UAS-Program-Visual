unit uMain;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, uLogin, Unit1, frnDetail, frnTransaksi; // Tambahkan unit uLogin di sini

type
  { TForm5 }
  TForm5 = class(TForm)
    MainMenu1: TMainMenu;
    menuFile: TMenuItem;
    menuBarang: TMenuItem;
    menuLaporan: TMenuItem;
    menuTransaksi: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    menuKategori: TMenuItem;
    menuCustomer: TMenuItem;
    menuLogin: TMenuItem;
    MenuItem6: TMenuItem;
    menuExit: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure menuBarangClick(Sender: TObject);
    procedure menuExitClick(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure menuKategoriClick(Sender: TObject);
    procedure menuLoginClick(Sender: TObject);
    procedure menuTransaksiClick(Sender: TObject);
  private
    procedure DisableMenu(AMenu: TMenuItem);
    procedure EnableMenu(AMenu: TMenuItem);
  public
  end;

var
  Form5: TForm5;

implementation

{$R *.lfm}

{ TForm5 }

procedure TForm5.DisableMenu(AMenu: TMenuItem);
var
  i: integer;
begin
  for i := 0 to AMenu.Count - 1 do
  begin
    AMenu[i].Enabled := False;
    DisableMenu(AMenu[i]);
  end;
end;

procedure TForm5.EnableMenu(AMenu: TMenuItem);
var
  i: integer;
begin
  for i := 0 to AMenu.Count - 1 do
  begin
    AMenu[i].Enabled := True;
    EnableMenu(AMenu[i]);
  end;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  // Nonaktifkan semua menu
  DisableMenu(MainMenu1.Items);
  // Aktifkan hanya menu login dan exit
  menuFile.Enabled := True;
  menuLogin.Enabled := True;
  menuExit.Enabled := True;
end;

procedure TForm5.menuBarangClick(Sender: TObject);
begin
  // Membuat objek Form1
  with TForm1.Create(Application) do
  begin
    try
      // Menampilkan form data barang
      ShowModal;
    finally
      Free; // Membebaskan memori objek Form1 setelah selesai digunakan
    end;
  end;
end;

procedure TForm5.menuExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm5.MenuItem6Click(Sender: TObject);
begin
  // Nonaktifkan semua menu
  DisableMenu(MainMenu1.Items);
  // Aktifkan menu login dan exit
  menuFile.Enabled := True;
  menuLogin.Enabled := True;
  menuExit.Enabled := True;
end;

procedure TForm5.menuKategoriClick(Sender: TObject);
begin
    // Membuat objek Form4
  with TForm4.Create(Application) do
  begin
    try
      // Menampilkan form data barang
      ShowModal;
    finally
      Free; // Membebaskan memori objek Form1 setelah selesai digunakan
    end;
  end;
end;

procedure TForm5.menuLoginClick(Sender: TObject);
begin
  // Membuat objek TForm6
  with TForm6.Create(Application) do
  begin
    try
      // Menampilkan form login
      if ShowModal = mrOk then
      begin
        // Memanggil metode login pada form login
        if login then
        begin
          EnableMenu(MainMenu1.Items);

          // Aktifkan menu yang diperlukan setelah login berhasil
          menuFile.Enabled := True;
          menuLogin.Enabled := False; // Nonaktifkan menu login setelah berhasil login
          menuExit.Enabled := True;

          // Aktifkan menu Data Master, Transaksi, dan Laporan
          menuBarang.Enabled := True;
          menuTransaksi.Enabled := True;
          menuLaporan.Enabled := True;
        end
        else
        begin
          ShowMessage('Login Gagal');
        end;
      end;
    finally
      Free; // Membebaskan memori objek TForm6 setelah selesai digunakan
    end;
  end;
end;

procedure TForm5.menuTransaksiClick(Sender: TObject);
begin
     // Membuat objek Form7
  with TForm7.Create(Application) do
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

