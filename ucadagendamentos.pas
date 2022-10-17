unit uCadAgendamentos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBCtrls,
  StdCtrls, DBGrids, uDataModule;

type

  { TFAgendamentos }

  TFAgendamentos = class(TForm)
    DBComboBox1: TDBComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    DSAgendamentos: TDataSource;
    DBNavigator1: TDBNavigator;
    EdtBuscaAgendamentos: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel1: TPanel;
    procedure EdtBuscaAgendamentosChange(Sender: TObject);
  private

  public

  end;

var
  FAgendamentos: TFAgendamentos;

implementation

{$R *.lfm}

{ TFAgendamentos }







procedure TFAgendamentos.EdtBuscaAgendamentosChange(Sender: TObject);
begin
  DataModuleF.QRYAgendamentos.Close;
  DataModuleF.QRYAgendamentos.SQL.Clear;
  DataModuleF.QRYAgendamentos.sql.Add('SELECT * FROM AGENDAMENTO WHERE LOWER(MEDICO) LIKE :pConsulta OR LOWER(ESPECIALIDADE) LIKE :pConsulta');
  DataModuleF.QRYAgendamentos.ParamByName('pConsulta').AsString:= AnsiLowerCase('%'+EdtBuscaAgendamentos.Text+'%');
  DataModuleF.QRYAgendamentos.Open;
end;

end.

