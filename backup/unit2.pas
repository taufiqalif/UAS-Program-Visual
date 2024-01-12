unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    btnSimpan: TButton;
    Button2: TButton;
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
    procedure btnSimpanClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.Label1Click(Sender: TObject);
begin

end;

procedure TfrmTambah.btnSimpanClick(Sender: TObject);
begin
// masukan data kedalam basis data
  try
    with SQLQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO data_barang (kategori, nama, gambar, harga_beli, harga_jual, stok)');
      SQL.Add('VALUES (:kategori, :nama, :gambar, :harga_beli, :harga_jual, :stok)');
      Params.ParamByName('kategori').AsString:=edtKategori.Text;
      Params.ParamByName('nama').AsString:=edtNama.Text;
      Params.ParamByName('harga_beli').AsInteger:=StrToInt(edtHarga.Text);
      Params.ParamByName('harga_jual').AsInteger:=StrToInt(edtHargaJual.Text);
      Params.ParamByName('stok').AsInteger:=StrToInt(edtJumlahStok.Text);
      Params.ParamByName('gambar').AsString:=edtFileGambar.Text;
      ExecSQL;

      //pesan sukses dan reset input
      ShowMessage('Data BArang Berhasil Di tambahkan');
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
  finally
  end;
  end;
end;

procedure TForm2.Label6Click(Sender: TObject);
begin

end;

end.

