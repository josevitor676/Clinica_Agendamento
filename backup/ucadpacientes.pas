unit uCadPacientes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  DBCtrls, DBGrids, uDataModule;

type

  { TFPacientes }

  TFPacientes = class(TForm)
    DSPacientes: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    EdtBuscaPaciente: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    procedure EdtBuscaPacienteChange(Sender: TObject);
  private

  public

  end;

var
  FPacientes: TFPacientes;

implementation

{$R *.lfm}

{ TFPacientes }

procedure TFPacientes.EdtBuscaPacienteChange(Sender: TObject);
begin
  //DataModuleF.QRYPacientes.Locate('nome', EdtBuscaPaciente.Text, [loPartialKey]);
  DataModuleF.QRYPacientes.Close;
  DataModuleF.QRYPacientes.SQL.Clear;
  DataModuleF.QRYPacientes.SQL.Add('SELECT NOME FROM PACIENTE WHERE LOWER(NOME) LIKE :pNome');
  DataModuleF.QRYPacientes.ParamByName('pNome').AsString:= AnsiLowerCase('%'+EdtBuscaPaciente.Text+'%');
  DataModuleF.QRYPacientes.Open;
end;



end.

