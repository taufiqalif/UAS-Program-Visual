unit frnDetail;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, SQLDB, odbcconn, Forms, Controls, Graphics, Dialogs,
  DBGrids, StdCtrls;

type

  { TForm4 }

  TForm4 = class(TForm)
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    SQLConnector1: TSQLConnector;
    SQLQuery1: TSQLQuery;
    SQLQuery2: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
  private

  public

  end;

var
  Form4: TForm4;

implementation

{$R *.lfm}

end.

