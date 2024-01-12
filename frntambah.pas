unit frnTambah;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, odbcconn, DB, Forms, Controls, Graphics, Dialogs,
  StdCtrls, DBCtrls;

type

  { TForm2 }



  TForm2 = class(TForm)
    Button1: TButton;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    dbLookupKategori: TDBLookupComboBox;
    edtNama: TEdit;
    edtHarga: TEdit;
    edtHargaJual: TEdit;
    edtJumlahStok: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SQLConnector1: TSQLConnector;
    SQLQuery1: TSQLQuery;
    SQLQuery2: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure btnSimpanClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public
    add: boolean
  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.btnSimpanClick(Sender: TObject);
begin

  end;

procedure TForm2.Button1Click(Sender: TObject);
begin
   try
     with SQLQuery2 do
     begin

     //SQLQuery1.Close;
     SQL.Clear;
     SQL.Add('INSERT INTO data_barang (nama, kategori, harga_beli, harga_jual, stok)');
     SQL.Add('VALUES (:nama, (SELECT nama FROM kategori WHERE nama = :kategori_id), :harga_beli, :harga_jual, :stok)');

     Params.ParamByName('nama').AsString := edtNama.Text;
     Params.ParamByName('kategori_id').AsString:=dbLookupKategori.Text;
     Params.ParamByName('harga_beli').AsInteger := StrToIntDef(edtHarga.Text, 0);
     Params.ParamByName('harga_jual').AsInteger := StrToIntDef(edtHargaJual.Text, 0);
     Params.ParamByName('stok').AsInteger := StrToIntDef(edtJumlahStok.Text, 0);

     ExecSQL;

     // Commit the transaction after successful execution
     SQLTransaction1.Commit;

     // Show success message and reset input fields
     ShowMessage('Data Barang Berhasil Ditambahkan');
     edtNama.Text := '';
     edtHarga.Text := '';
     edtHargaJual.Text := '';
     edtJumlahStok.Text := '';
     add := True;

     end;
     SQLQuery1.Open;
     except
       on E: Exception do
          ShowMessage('Terjadi Kesalahan'+ E.Message);
     end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  SQLQuery1.Open;
end;



end.
