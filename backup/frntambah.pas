unit frnTambah;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, odbcconn, DB, Forms, Controls, Graphics, Dialogs,
  StdCtrls, DBCtrls, Variants;

type

  { TForm2 }



  TForm2 = class(TForm)
    Button1: TButton;
    DataSource1: TDataSource;
    dbLookupKategori: TDBLookupComboBox;
    edtNama: TEdit;
    edtHarga: TEdit;
    edtHargaJual: TEdit;
    edtJumlahStok: TEdit;
    edtFileGambar: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    SQLConnector1: TSQLConnector;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure btnSimpanClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

//procedure TForm2.Button1Click(Sender: TObject);
//begin
//  try
//    with SQLQuery1 do
//    begin
//      SQLQuery1.Close;
//      SQLQuery1.SQL.Clear;
//      SQLQuery1.SQL.Add('INSERT INTO data_barang (kategori_id, nama, gambar, harga_beli, harga_jual, stok)');
//      SQLQuery1.SQL.Add('VALUES (:kategori_id, :nama, :gambar, :harga_beli, :harga_jual, :stok)');
//
//      // Periksa apakah dbLookupKategori.KeyValue adalah Null
//      //if VarIsNull(dbLookupKategori.KeyValue) then
//      //begin
//      //  ShowMessage('Pilih kategori terlebih dahulu');
//      //  Exit; // Hentikan proses jika kategori belum dipilih
//      //end;
//
//      // Gunakan dbLookupKategori.KeyValue untuk mendapatkan nilai ID kategori
//      Params.ParamByName('kategori_id').AsInteger := dbLookupKategori.KeyValue;
//      Params.ParamByName('nama').AsString := edtNama.Text;
//      Params.ParamByName('harga_beli').AsInteger := StrToIntDef(edtHarga.Text, 0);
//      Params.ParamByName('harga_jual').AsInteger := StrToIntDef(edtHargaJual.Text, 0);
//      Params.ParamByName('stok').AsInteger := StrToIntDef(edtJumlahStok.Text, 0);
//      Params.ParamByName('gambar').AsString := edtFileGambar.Text;
//
//      ExecSQL;
//
//      // Commit the transaction after successful execution
//      SQLTransaction1.Commit;
//
//      // Show success message and reset input fields
//      ShowMessage('Data Barang Berhasil Ditambahkan');
//      edtNama.Text := '';
//      edtHarga.Text := '';
//      edtHargaJual.Text := '';
//      edtJumlahStok.Text := '';
//      edtFileGambar.Text := '';
//    end;
//  except
//    on E: Exception do
//      ShowMessage('Terjadi Kesalahan: ' + E.Message);
//  end;
//end;




procedure TForm2.Button1Click(Sender: TObject);
begin
   try
     with SQLQuery1 do
     begin

     SQLQuery1.Close;
     SQLQuery1.SQL.Clear;
     SQLQuery1.SQL.Add('INSERT INTO data_barang (kategori, kategori_id, nama, gambar, harga_beli, harga_jual, stok)');
     SQLQuery1.SQL.Add('VALUES (:kategori, :nama, :gambar, :harga_beli, :harga_jual, :stok)');

     //dimana kategori dan kategori_id itu mengambil data dari table kategori kemudian memasukan nya ke dalam table data_barang
     //dimana form kategori meng query data dari table kategori dengan id

     //SQLQuery1.ParamByName('kategori_id').AsInteger := dbLookupKategori.KeyValue;

     Params.ParamByName('kategori').AsString:=dbLookupKategori.Text;
     //SQLQuery1.ParamByName('kategori_id').AsInteger := StrToInt64(dbLookupKategori.KeyValue);
     SQLQuery1.ParamByName('nama').AsString := edtNama.Text;
     SQLQuery1.ParamByName('harga_beli').AsInteger := StrToIntDef(edtHarga.Text, 0);
     SQLQuery1.ParamByName('harga_jual').AsInteger := StrToIntDef(edtHargaJual.Text, 0);
     SQLQuery1.ParamByName('stok').AsInteger := StrToIntDef(edtJumlahStok.Text, 0);
     SQLQuery1.ParamByName('gambar').AsString := edtFileGambar.Text;

     SQLQuery1.ExecSQL;

     // Commit the transaction after successful execution
     SQLTransaction1.Commit;

     // Show success message and reset input fields
     ShowMessage('Data Barang Berhasil Ditambahkan');
     edtNama.Text := '';
     edtHarga.Text := '';
     edtHargaJual.Text := '';
     edtJumlahStok.Text := '';
     edtFileGambar.Text := '';

     end;

     except
       on E: Exception do
          ShowMessage('Terjadi Kesalahan'+ E.Message);
     end;
end;



end.

