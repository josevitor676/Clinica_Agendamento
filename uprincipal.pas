unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  Buttons, uCadPacientes, uCadAgendamentos;

type

  { TFPrincipal }

  TFPrincipal = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Image1: TImage;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    Panel1: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
  private

  public

  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.lfm}

{ TFPrincipal }

procedure TFPrincipal.MenuItem2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFPrincipal.BitBtn1Click(Sender: TObject);
begin
  FPacientes.ShowModal;
end;

procedure TFPrincipal.BitBtn2Click(Sender: TObject);
begin
  FAgendamentos.ShowModal;
end;

procedure TFPrincipal.MenuItem4Click(Sender: TObject);
begin
  FPacientes.ShowModal;
end;

procedure TFPrincipal.MenuItem5Click(Sender: TObject);
begin
  FAgendamentos.ShowModal;
end;

end.

