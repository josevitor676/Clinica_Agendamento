unit uDataModule;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ZConnection, ZDataset, ZSqlUpdate;

type

  { TDataModuleF }

  TDataModuleF = class(TDataModule)
    QRYAgendamentosdata_agendamento: TDateTimeField;
    QRYAgendamentosespecialidade: TStringField;
    QRYAgendamentoshora_agendamento: TStringField;
    QRYAgendamentosid: TLongintField;
    QRYAgendamentosid_agendamento: TLongintField;
    QRYAgendamentosmedico: TStringField;
    QRYPacientescelular: TStringField;
    QRYPacientescpf: TStringField;
    QRYPacientesdata_cadastro: TDateTimeField;
    QRYPacientesid: TLongintField;
    QRYPacientesnome: TStringField;
    ZConnection1: TZConnection;
    QRYPacientes: TZQuery;
    QRYAgendamentos: TZQuery;
    QRYGenerica: TZQuery;
    ZUpdatePacientes: TZUpdateSQL;
    ZUpdateAgendamentos: TZUpdateSQL;
    procedure QRYAgendamentosAfterInsert(DataSet: TDataSet);
    procedure QRYPacientesAfterInsert(DataSet: TDataSet);
  private

  public
    function getSequence(const pNomeSequence: String): String;
  end;

var
  DataModuleF: TDataModuleF;

implementation
uses uCadPacientes, uCadAgendamentos;

{$R *.lfm}

{ TDataModuleF }

procedure TDataModuleF.QRYPacientesAfterInsert(DataSet: TDataSet);
begin
  QRYPacientesdata_cadastro.Value:= Date();
  QRYPacientesid.AsInteger := StrToInt(getSequence('paciente_id'));
  FPacientes.DBEdit2.SetFocus;
end;

procedure TDataModuleF.QRYAgendamentosAfterInsert(DataSet: TDataSet);
begin
  QRYAgendamentosid_agendamento.AsInteger := StrToInt(getSequence('id_agendamento_seq'));
  FAgendamentos.DBLookupComboBox1.SetFocus;
end;

function TDataModuleF.getSequence(const pNomeSequence: String): String;
begin
 Result := '';
 try
     QRYGenerica.close;
     QRYGenerica.SQL.Clear;
     QRYGenerica.SQL.Add('SELECT NEXTVAL(' + QuotedStr(pNomeSequence) + ') AS CODIGO');
     QRYGenerica.Open;
     Result := QRYGenerica.FieldByName('CODIGO').AsString;
 finally
   QRYGenerica.Close;
end;
end;

end.

