unit uLogin;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, odbcconn, Forms, Controls, Graphics, Dialogs,
  StdCtrls, LCLType;

type
  { TForm6 }
  TForm6 = class(TForm)
    btnLogin: TButton;
    btnCencel: TButton;
    edtUsername: TEdit;
    edtPassword: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SQLConnector1: TSQLConnector;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure btnLoginClick(Sender: TObject);
    procedure btnCencelClick(Sender: TObject);
    procedure SQLConnector1AfterConnect(Sender: TObject);
    function login: boolean;
  private
  public
  end;

var
  Form6: TForm6;

implementation

{$R *.lfm}

{ TForm6 }

procedure TForm6.SQLConnector1AfterConnect(Sender: TObject);
begin
  // Code yang diinginkan setelah koneksi terjadi
end;

function TForm6.login: boolean;
begin
  Result := False; // Set default result
  SQLConnector1.Connected := True;
  with SQLQuery1 do
  begin
    SQL.Text := 'SELECT * FROM user WHERE username = :username AND password = :password';
    Params.ParamByName('username').AsString := edtUsername.Text;
    Params.ParamByName('password').AsString := edtPassword.Text;
    Open;
    if RecordCount >= 1 then
      Result := True; // Set result menjadi True jika login berhasil
  end;
  SQLConnector1.Connected := False;
end;

procedure TForm6.btnLoginClick(Sender: TObject);
begin
  if login then
  begin
    ShowMessage('Login berhasil');
    // Form login akan ditutup dan hasilnya akan diteruskan ke form pembuka (Main)
    ModalResult := mrOk;
  end
  else
    ShowMessage('Login gagal');
end;

procedure TForm6.btnCencelClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.

