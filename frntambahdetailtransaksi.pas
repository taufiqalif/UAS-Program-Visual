unit frnTambahDetailTransaksi;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, odbcconn, DB, Forms, Controls, Graphics, Dialogs,
  StdCtrls, DBCtrls;

type

  { TForm9 }

  TForm9 = class(TForm)
    btnTambahBarang: TButton;
    DataSource1: TDataSource;
    dbLookupBarang: TDBLookupComboBox;
    edtJumlahBarang: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SQLConnector1: TSQLConnector;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
  private

  public

  end;

var
  Form9: TForm9;

implementation

{$R *.lfm}

end.

