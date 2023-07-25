unit unitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    RadioGroup1: TRadioGroup;
    lblConsulta: TLabel;
    txtbusca: TEdit;
    btnRealizarConsulta: TButton;
    DBGrid1: TDBGrid;
    procedure RadioGroup1Click(Sender: TObject);
    procedure btnRealizarConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses unitDM;

procedure TForm1.btnRealizarConsultaClick(Sender: TObject);
begin
  DM.SQLconsulta.Close;
  DM.SQLconsulta.SQL.Clear;
  if (RadioGroup1.ItemIndex = 0) then
    begin
      DM.SQLconsulta.SQL.Add('SELECT * FROM cliente WHERE nome LIKE :pConsulta');
      DM.SQLconsulta.ParamByName('pConsulta').AsString := txtbusca.Text+'%';
    end;

  if (RadioGroup1.ItemIndex = 1) then
    begin
      DM.SQLconsulta.SQL.Add('SELECT * FROM cliente WHERE bairro LIKE :pConsulta');
      DM.SQLconsulta.ParamByName('pConsulta').AsString := txtbusca.Text+'%';
    end;

  DM.SQLconsulta.Open;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
  if (RadioGroup1.ItemIndex = 0) then
    begin
      lblConsulta.Caption := 'Digite seu nome';
    end;

  if (RadioGroup1.ItemIndex = 1) then
    begin
      lblConsulta.Caption := 'Digite seu bairro';
    end;


end;

end.
