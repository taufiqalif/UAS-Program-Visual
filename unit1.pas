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
    btnCari: TButton;
    btnReset: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    edtCari: TEdit;
    Label1: TLabel;
    SQLConnector1: TSQLConnector;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure btnCariClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnTambahClick(Sender: TObject);
    procedure btnUbahClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);

  private

  public
    procedure AmbilDataBarang;

  end;

var
  Form1: TForm1;
  idGrid: integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  AmbilDataBarang;
end;

procedure TForm1.AmbilDataBarang;
begin

end;

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

procedure TForm1.btnCariClick(Sender: TObject);
begin
  with SQLQuery1 do
  begin
    Close;
    SQL.Text :=
      'SELECT * FROM data_barang WHERE nama LIKE :nama';
      Params.ParamByName('nama').AsString := '%' + edtCari.Text + '%';
    Open;
  end;
end;

procedure TForm1.btnHapusClick(Sender: TObject);
var
  Response: Integer;
begin
  if idGrid <> 0 then
  begin
    Response := MessageDlg('Anda yakin ingin menghapus?', mtConfirmation, mbYesNo, 0);
    if Response = mrYes then
    begin
      try
        with SQLQuery1 do
        begin
          Close;
          SQL.Text := 'DELETE FROM data_barang WHERE id_barang = :id_barang';
          Params.ParamByName('id_barang').AsString := IntToStr(idGrid);
          ExecSQL;
          SQLTransaction1.Commit;
          AmbilDataBarang;
        end;
      except
        on E: Exception do
        begin
          ShowMessage('Terjadi Kesalahan : ' + E.Message);
          SQLTransaction1.Rollback;
        end;
      end;
    end;
  end
  else
    ShowMessage('Klik data yang ingin dihapus');
end;

procedure TForm1.btnResetClick(Sender: TObject);
begin
  edtCari.Text := '';
  AmbilDataBarang;
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

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin
  idGrid := StrToInt(DBGrid1.DataSource.DataSet.FieldByName('id_barang').AsString);
end;



end.

