unit frnUbah;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, odbcconn, Forms, Controls, Graphics, Dialogs,
  StdCtrls;

type

  { TForm3 }

  TForm3 = class(TForm)
    btnSimpan: TButton;
    Button1: TButton;
    edtKategori: TEdit;
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
    procedure btnSimpanClick(Sender: TObject);
    procedure edtKategoriChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form3: TForm3;

implementation

{$R *.lfm}

{ TForm3 }
procedure TForm3.edtKategoriChange(Sender: TObject);
begin

end;

procedure TForm3.btnSimpanClick(Sender: TObject);
begin
//  memasukan data kedalam basis data
  try
    with SQLQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE data_barang SET kategori=:kategori, nama=:nam, gambar=:gambar');
      SQL.Add('harga_beli=:harga_beli, harga_jual=:harga_jual, stok=:stok');
      SQL.Add('WHERE id=:id');
      Params.ParamByName('kategori').AsString:=edtKategori.Text;
      Params.ParamByName('nama').AsString:=edtNama.Text;
      Params.ParamByName('harga_beli').AsInteger:=StrToInt(edtHarga.Text);
      Params.ParamByName('harga_jual').AsInteger:=StrToInt(edtHargaJual.Text);
      Params.ParamByName('stok').AsInteger:=StrToInt(edtJumlahStok.Text);
      Params.ParamByName('gambar').AsString:=edtFileGambar.Text;
      //Params.ParamByName('id').AsInteger:=idBarang;
      ExecSQL;

      //pesan sukse dan reset input
      ShowMessage('Data Barang Berhasil Di tambahkan');
      edtNama.Text:= '';
      edtHarga.Text:= '';
      edtHargaJual.Text:= '';
      edtJumlahStok.Text:= '';
      edtFileGambar.Text:= '';
    end;
    except
      on E: Exception do
         ShowMessage('Terjadi Kesalahan'+ E.Message);
    end;
  end;

procedure TForm3.FormCreate(Sender: TObject);
begin

end;

end.

