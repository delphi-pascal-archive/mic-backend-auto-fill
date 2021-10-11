program Backend_AutoFill;

uses
  Forms,
  autozap in 'autozap.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
