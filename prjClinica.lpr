program prjClinica;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, zcomponent, uPrincipal, uCadPacientes, uCadAgendamentos, uDataModule
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TFPacientes, FPacientes);
  Application.CreateForm(TFAgendamentos, FAgendamentos);
  Application.CreateForm(TDataModuleF, DataModuleF);
  Application.Run;
end.

