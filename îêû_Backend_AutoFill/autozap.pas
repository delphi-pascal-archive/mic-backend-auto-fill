unit autozap;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OleCtrls, SHDocVw, ExtCtrls, Spin, ComCtrls, XPMan, Buttons;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Panel1: TPanel;
    WebBrowser1: TWebBrowser;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Button2: TButton;
    ComboBox2: TComboBox;
    Label4: TLabel;
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Memo1: TMemo;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    ListView1: TListView;
    Label21: TLabel;
    Button5: TButton;
    Button6: TButton;
    Label22: TLabel;
    Button7: TButton;
    ProgressBar1: TProgressBar;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Button8: TButton;
    ListBox1: TListBox;
    Edit11: TEdit;
    Edit12: TEdit;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button9: TButton;
    Edit13: TEdit;
    procedure FormShow(Sender: TObject);
    procedure WebBrowser1DocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure WebBrowser1ProgressChange(Sender: TObject; Progress,
      ProgressMax: Integer);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Button8Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Get_Record(rec: integer);
  end;

var
  Form1: TForm1;
  Str_Container: TStringList;

implementation

uses mshtml;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 Application.Title:='ћ»÷ Backend - ¬торичка дл€ яны';

 OpenDialog1.InitialDir:=Paramstr(0);
 SaveDialog1.InitialDir:=Paramstr(0);

 Str_Container:=TStringList.Create;
 combobox2.ItemIndex:=0;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
 Webbrowser1.Navigate(ExtractFilePath(Paramstr(0))+'backend_test.htm');
 // Webbrowser1.Navigate('http://www.mosipoteka.ru/backend');
 // Webbrowser1.Navigate('http://www.yandex.ru');
 // http://direct.yandex.ru/registered/main.pl?login=mosipoteka&passwd=pswd0&retpath=http://direct.yandex.ru/&timestamp=0
 // http://passport.yandex.ru/passport?login=mosipoteka&passwd=pswd
end;

procedure TForm1.WebBrowser1DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
 Label2.Caption:='Caption: "'+Webbrowser1.OleObject.Document.Title+'".';
 Label2.Hint:=Webbrowser1.OleObject.Document.Title;
end;

procedure TForm1.WebBrowser1ProgressChange(Sender: TObject; Progress,
  ProgressMax: Integer);
begin
 if ProgressMax=0
 then
  begin
   Label1.Caption:='Progress: 100% loaded...';
   ProgressBar1.Position:=0;
   Exit;
  end;

 try
  if (Progress<>-1) and (Progress<=ProgressMax)
  then
   begin
    Label1.Caption:='Progress: '+IntToStr((Progress*100) div ProgressMax)+'% loaded...';
    ProgressBar1.Position:=(Progress*100) div ProgressMax;
   end
  else
   begin
    Label1.Caption:='Progress: 100% loaded...';
    ProgressBar1.Position:=ProgressBar1.Max;
   end; 
 except
  on EDivByZero do
   Exit;
 end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 ProgressBar1.Max:=100;
 Webbrowser1.Navigate(Combobox1.Text);
end;

//-----------------------------------------------------------------

function FillForm(WebBrowser: TWebBrowser; FieldName: string;
                                           Value: string): Boolean;
var
 itt,itn: string;
 i, j: integer;
 FormItem: Variant;
begin
 Result:=false;
 // no form on document
 if WebBrowser.OleObject.Document.All.Tags('FORM').Length=0
 then
  begin
   MessageDlg('No forms found in "'+WebBrowser.LocationURL+'"!',mtInformation,[mbOK],0);
   Exit;
  end;
 // count forms on document
 for i:=0 to WebBrowser.OleObject.Document.Forms.Length-1 do
  begin
   FormItem:=WebBrowser.OleObject.Document.Forms.Item(i);
   for j:=0 to FormItem.Length-1 do
    begin
     try
      // when the fieldname is found, try to fill out
      itn:=FormItem.Item(j).Name;
      itt:=FormItem.Item(j).Type;

      if (itn=FieldName) or (itt='checkbox')
      then
       begin
        if itt='checkbox'
        then
         begin
          itt:=FormItem.Item(j).OnClick;
          if pos(FieldName,itt)<>0
          then
           if Value='ch_true'
           then FormItem.Item(j).Checked:=true
           else FormItem.Item(j).Checked:=false;
           // FormItem.Item(j).Click; // кликаем
         end
        else FormItem.Item(j).Value:=Value;

        result:=true;
       end;
     except
      Form1.ListBox1.Items.Add('Fill form error! Fieldname: "'
        +FieldName+'" (i = '
        +IntToStr(i)+', j = '
        +IntToStr(j)+')');
      Exit;
     end;
    end;
  end;
end;

function Get_City_Index(st: string): string;
var
 s: string;
 i: integer;
 iDisp: IDispatch;
 iDoc: IHTMLDocument2;
 iOpt: IHTMLOptionElement;
 iCol: IHTMLElementCollection;
 TempStr: TStringList;
begin
 Result:='0';
 TempStr:=TStringList.Create;
 TempStr.Clear;

 iDoc:=Form1.WebBrowser1.Document as IHtmlDocument2;

 iDisp:=iDoc.All.Tags('OPTION');
 if Assigned(iDisp)
 then
  begin
   iDisp.QueryInterface(IHTMLElementCollection, iCol);

   if Assigned(iCol)
   then
    begin
     for i:=1 to iCol.Length do
      begin
       iDisp:=iCol.Item(pred(i),0);
       iDisp.QueryInterface(IHTMLOptionElement, iOpt);
       if Assigned(iOpt)
       then
        begin
         TempStr.Add(iOpt.Value+'|'+iOpt.Text);
        end;
      end;
    end;
  end;

 for i:=0 to TempStr.Count-1 do
  begin
   s:=AnsiLowerCase(TempStr.Strings[i]);
   if pos(st,s)<>0
   then
    begin
     Result:=Copy(s,1,pos('|',s)-1);
     Break;
    end;
  end;

 TempStr.Free;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
 f: boolean;
 s,fn: string;
 i,j: integer;
 fields_names: array [1..19] of string;
begin
 // if FillForm(WebBrowser1, Edit2.Text, Edit1.Text)=false
 // then MessageDlg('Field "'+Edit2.Text+'" not available or no forms found!',mtError,[mbOK],0);

 fields_names[1]:='data[city]';
 fields_names[2]:='data[coopname]';
 fields_names[3]:='data[subway]';
 fields_names[4]:='data[way]';
 fields_names[5]:='data[address]';
 fields_names[6]:='data[priceusd]';
 fields_names[7]:='data[price]';
 fields_names[8]:='data[ruprice]';
 fields_names[9]:='data[totalprice]';
 fields_names[10]:='data[squarefull]';
 fields_names[11]:='data[square]';
 fields_names[12]:='data[flor]';
 fields_names[13]:='data[rooms]';
 fields_names[14]:='data[special]';
 fields_names[15]:='data[invest]';
 fields_names[16]:='data[phone]';
 fields_names[17]:='data[contacts]';
 fields_names[18]:='description';
 fields_names[19]:='data[show]';
 // fields_names[19]:='data[description]';
 // fields_names[20]:='mce_editor_1_fontNameSelect';
 // fields_names[21]:='mce_editor_1_fontSizeSelect';
 // fields_names[23]:='data[id]';
 // fields_names[24]:='data[department]';

 for i:=1 to 19 do
  begin
   for j:=0 to Form1.ComponentCount-1 do
    begin
     // Edit
     if (((Form1.Components[j] as TObject) is TEdit))
     then
      begin
       if Form1.Components[j].Tag<>0
       then
        begin
         if ((Form1.Components[j] as TObject) as TEdit).Tag=i
         then
          begin
           s:=((Form1.Components[j] as TObject) as TEdit).Text;

           if s='none'
           then Continue;

           fn:=fields_names[i];
           if (fn='data[city]') or (fn='data[subway]')
           then
            begin
             if fn='data[city]'
             then s:=Get_City_Index(AnsiLowerCase(Edit11.Text))
             else s:=Get_City_Index(AnsiLowerCase(Edit12.Text));
            end;

           if FillForm(WebBrowser1, fields_names[i], s)=false
           then ListBox1.Items.Add('Field "'+fields_names[i]
                +'" not available'
                +' "'+s+'" (Tag = '+IntToStr(i)+')');
          end;
        end;
      end;
     {
     // ComboBox
     if (((Form1.Components[j] as TObject) is TComboBox))
     then
      begin
       if Form1.Components[j].Tag<>0
       then
        begin
         if ((Form1.Components[j] as TObject) as TComboBox).Tag=i
         then
          begin
           s:=((Form1.Components[j] as TObject) as TComboBox).Text;

           if s='none'
           then Continue;

           if FillForm(WebBrowser1, fields_names[i], s)=false
           then ListBox1.Items.Add('Field "'+fields_names[i]
                +'" not available'
                +' "'+s+'" (Tag = '+IntToStr(i)+')');
          end;
        end;
      end;
     }
     // SpinEdit
     if (((Form1.Components[j] as TObject) is TSpinEdit))
     then
      begin
       if Form1.Components[j].Tag<>0
       then
        begin
         if ((Form1.Components[j] as TObject) as TSpinEdit).Tag=i
         then
          begin
           s:=IntToStr(((Form1.Components[j] as TObject) as TSpinEdit).Value);

           if s='none'
           then Continue;

           if FillForm(WebBrowser1, fields_names[i], s)=false
           then ListBox1.Items.Add('Field "'+fields_names[i]
                +'" not available'
                +' "'+s+'" (Tag = '+IntToStr(i)+')');
          end;
        end;
      end;
     // Memo
     if (((Form1.Components[j] as TObject) is TMemo))
     then
      begin
       if Form1.Components[j].Tag<>0
       then
        begin
         if ((Form1.Components[j] as TObject) as TMemo).Tag=i
         then
          begin
           s:=((Form1.Components[j] as TObject) as TMemo).Text;

           if s='none'
           then Continue;

           if FillForm(WebBrowser1, fields_names[i], s)=false
           then ListBox1.Items.Add('Field "'+fields_names[i]
                +'" not available'
                +' "'+s+'" (Tag = '+IntToStr(i)+')');
          end;
        end;
      end;
     // CheckBox
     if (((Form1.Components[j] as TObject) is TCheckBox))
     then
      begin
       if Form1.Components[j].Tag<>0
       then
        begin
         if ((Form1.Components[j] as TObject) as TCheckBox).Tag=i
         then
          begin
           f:=((Form1.Components[j] as TObject) as TCheckBox).Checked;

           if f=true
           then s:='ch_true'
           else s:='ch_false';

           if FillForm(WebBrowser1, fields_names[i], s)=false
           then ListBox1.Items.Add('Field "'+fields_names[i]
                +'" not available'
                +' "'+s+'" (Tag = '+IntToStr(i)+')');
          end;
        end;
      end;
    end;
  end;
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
  try
   // 20 %
   if ComboBox2.Text='20 %'
   then WebBrowser1.OleObject.Document.Body.Style.Zoom:=0.2;
   // 30 %
   if ComboBox2.Text='30 %'
   then WebBrowser1.OleObject.Document.Body.Style.Zoom:=0.3;
   // 40 %
   if ComboBox2.Text='40 %'
   then WebBrowser1.OleObject.Document.Body.Style.Zoom:=0.4;
   // 50 %
   if ComboBox2.Text='50 %'
   then WebBrowser1.OleObject.Document.Body.Style.Zoom:=0.5;
   // 60 %
   if ComboBox2.Text='60 %'
   then WebBrowser1.OleObject.Document.Body.Style.Zoom:=0.6;
   // 70 %
   if ComboBox2.Text='70 %'
   then WebBrowser1.OleObject.Document.Body.Style.Zoom:=0.7;
   // 80 %
   if ComboBox2.Text='80 %'
   then WebBrowser1.OleObject.Document.Body.Style.Zoom:=0.8;
   // 90 %
   if ComboBox2.Text='90 %'
   then WebBrowser1.OleObject.Document.Body.Style.Zoom:=0.9;
   // 100 %
   if ComboBox2.Text='100 %'
   then WebBrowser1.OleObject.Document.Body.Style.Zoom:=1;
   // 110 %
   if ComboBox2.Text='110 %'
   then WebBrowser1.OleObject.Document.Body.Style.Zoom:=1.1;
   // 125 %
   if ComboBox2.Text='125 %'
   then WebBrowser1.OleObject.Document.Body.Style.Zoom:=1.25;
    // 150 %
   if ComboBox2.Text='150 %'
   then WebBrowser1.OleObject.Document.Body.Style.Zoom:=1.5;
   // 175 %
   if ComboBox2.Text='175 %'
   then WebBrowser1.OleObject.Document.Body.Style.Zoom:=1.75;
   // 200 %
   if ComboBox2.Text='200 %'
   then WebBrowser1.OleObject.Document.Body.Style.Zoom:=2;
   // 250 %
   if ComboBox2.Text='250 %'
   then WebBrowser1.OleObject.Document.Body.Style.Zoom:=2.5;
   // 300 %
   if ComboBox2.Text='300 %'
   then WebBrowser1.OleObject.Document.Body.Style.Zoom:=3;
   // 400 %
   if ComboBox2.Text='400 %'
   then WebBrowser1.OleObject.Document.Body.Style.Zoom:=4;
   // 500 %
   if ComboBox2.Text='500 %'
   then WebBrowser1.OleObject.Document.Body.Style.Zoom:=5;
  except
  
  end;
end;

procedure TForm1.Get_Record(rec: integer);
var
 i,j,k: integer;
 fields_names: array [1..16] of string;
begin
 for j:=0 to ListView1.Columns.Count-1 do
  begin
   if j=0
   then fields_names[j+1]:=ListView1.Items.Item[rec].Caption
   else fields_names[j+1]:=ListView1.Items.Item[rec].SubItems.Strings[j-1];
  end;
 //
 for i:=1 to 16 do
  begin
   k:=i;
   if (k=14) or (k=15) or (k=16)
   then k:=k+2;

   for j:=0 to Form1.ComponentCount-1 do
    begin
     // Edit
     if (((Form1.Components[j] as TObject) is TEdit))
     then
      begin
       if Form1.Components[j].Tag<>0
       then
        begin
         if ((Form1.Components[j] as TObject) as TEdit).Tag=k
         then ((Form1.Components[j] as TObject) as TEdit).Text:=fields_names[i];
        end;
      end;
     // SpinEdit
     if (((Form1.Components[j] as TObject) is TSpinEdit))
     then
      begin
       if Form1.Components[j].Tag<>0
       then
        begin
         if ((Form1.Components[j] as TObject) as TSpinEdit).Tag=k
         then ((Form1.Components[j] as TObject) as TSpinEdit).Value:=StrToInt(fields_names[i]);
        end;
      end;
     // Memo
     if (((Form1.Components[j] as TObject) is TMemo))
     then
      begin
       if Form1.Components[j].Tag<>0
       then
        begin
         if ((Form1.Components[j] as TObject) as TMemo).Tag=k
         then
          begin
           ((Form1.Components[j] as TObject) as TMemo).Text:=fields_names[i];
           ((Form1.Components[j] as TObject) as TMemo).Hint:=fields_names[i];
          end;
        end;
      end;
    end;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
 i,j: integer;
 s,ss: string;
 nitem: TListItem;
begin
 if OpenDialog1.Execute
 then
  begin
   ListView1.Clear;
   Str_Container.LoadFromFile(OpenDialog1.FileName);
   Form1.Caption:='ћ»÷ Backend AutoFill ('+ExtractFileName(OpenDialog1.FileName)+')';

   ProgressBar1.Position:=0;
   ProgressBar1.Max:=Str_Container.Count;

   for i:=0 to Str_Container.Count-1 do
    begin
     s:=Str_Container.Strings[i];

     nitem:=ListView1.Items.Add;

     j:=0;
     while pos('Ш',s)<>0 do
      begin
       inc(j);

       Delete(s,1,1); // Ш
       ss:=Copy(s,1,pos('Ш',s)-1);
       Delete(s,1,pos('Ш',s)-1);

       if j=1
       then nitem.Caption:=ss
       else nitem.SubItems.Add(ss);
      end;

     // Sleep(50);
     // ProgressBar1.StepIt;
    end;

   ProgressBar1.Position:=ProgressBar1.Max;

   Label21.Caption:='Records count: '+IntToStr(ListView1.Items.Count);

   if ListView1.Items.Count>0
   then
    begin
     Button1.Enabled:=true;
     Button5.Enabled:=false;
     Button6.Enabled:=true;
     ListView1.ItemIndex:=0;
     // ListView1.SetFocus;

     Get_Record(0);
    end
   else
    begin
     Button1.Enabled:=false;
     Button5.Enabled:=false;
     Button6.Enabled:=false;
    end;
   Label22.Caption:='Record '+IntToStr(ListView1.ItemIndex+1)+' of '+IntToStr(ListView1.Items.Count);
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
 if (ListView1.Items.Count>0) and (ListView1.ItemIndex<>0)
 then
  begin
   Button5.Enabled:=true;
   Button6.Enabled:=true;   
   if ListView1.ItemIndex<>0
   then ListView1.ItemIndex:=ListView1.ItemIndex-1
   else ListView1.ItemIndex:=0;
   // ListView1.SetFocus;

   Get_Record(ListView1.ItemIndex);   
  end
 else
  begin
   Button5.Enabled:=false;
   // ListView1.SetFocus;
  end;

 Label22.Caption:='Record '+IntToStr(ListView1.ItemIndex+1)+' of '+IntToStr(ListView1.Items.Count);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
 if (ListView1.Items.Count>0) and (ListView1.ItemIndex<>ListView1.Items.Count-1)
 then
  begin
   Button5.Enabled:=true;
   Button6.Enabled:=true;
   if ListView1.ItemIndex<>ListView1.Items.Count-1
   then ListView1.ItemIndex:=ListView1.ItemIndex+1
   else ListView1.ItemIndex:=ListView1.Items.Count-1;
   // ListView1.SetFocus;

   Get_Record(ListView1.ItemIndex);
  end
 else
  begin
   Button6.Enabled:=false;
   // ListView1.SetFocus;
  end;

 Label22.Caption:='Record '+IntToStr(ListView1.ItemIndex+1)+' of '+IntToStr(ListView1.Items.Count);
end;

procedure TForm1.Button7Click(Sender: TObject);
var
 s: string;
 i, j: integer;
 FormItem: Variant;
begin
 ListBox1.Items.Clear;
 // no form on document
 if WebBrowser1.OleObject.Document.All.Tags('FORM').Length=0
 then
  begin
   MessageDlg('No forms found in "'+WebBrowser1.LocationURL+'"!',mtInformation,[mbOK],0);
   Exit;
  end;
 // count forms on document
 for i:=0 to WebBrowser1.OleObject.Document.Forms.Length-1 do
  begin
   FormItem:=WebBrowser1.OleObject.Document.Forms.Item(i);
   for j:=0 to FormItem.Length-1 do
    begin
     s:='Name: '+FormItem.Item(j).Name
       +', Value: '+FormItem.Item(j).Value
       +', TagName: '+FormItem.Item(j).TagName
       +', Type: '+FormItem.Item(j).Type;
     ListBox1.Items.Add('Fields: '+s);
    end;
  end;
end;

procedure TForm1.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
 {
 if Key=#13
 then
  begin
   Key:=#0;
   Button2.Click;
  end;
 }
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
 if FillForm(WebBrowser1, 'data[city]', '1')=false
 then MessageDlg('Field  not available or no forms found!',mtError,[mbOK],0);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Str_Container.Free;
end;

procedure TForm1.Button11Click(Sender: TObject);
var
 i: integer;
 ov: OleVariant;
 iDisp: IDispatch;
 iDoc:IHtmlDocument2;
 iColl: IHTMLElementCollection;
 iInputElement: IHTMLInputElement;
begin
 WebBrowser1.ControlInterface.Document.QueryInterface(IHtmlDocument2,iDoc);

 if not Assigned(iDoc)
 then
  begin
   ShowMessage('Nothing dowloaded ...');
   Exit;
 end;

 ov:='INPUT';
 IDisp:=iDoc.All.Tags(ov);

 if Assigned(IDisp)
 then
  begin
   IDisp.QueryInterface(IHTMLElementCollection,iColl);

   if Assigned(iColl)
   then
    begin
     for i:=1 to iColl.Get_Length do
      begin
       iDisp:=iColl.Item(pred(i),0);
       iDisp.QueryInterface(IHTMLInputElement,iInputElement);

       if Assigned(iInputElement)
       then
        begin
         if iInputElement.Get_Name='data[coopname]'
         then iInputElement.Set_Value('New name');
        end;
      end;
    end;
  end;
end;

procedure TForm1.Button12Click(Sender: TObject);
var
 i: integer;
 ov: OleVariant;
 iDisp: IDispatch;
 iEl: IHTMLElement;
 iDoc: IHtmlDocument2;
 iColl: IHTMLElementCollection;
 iInputElement: IHTMLInputElement;
begin 
 WebBrowser1.ControlInterface.Document.QueryInterface(IHtmlDocument2,iDoc);
 if not assigned(iDoc)
 then
  begin
   ShowMessage('Nothing dowloaded ...');
   Exit;
  end;

 ov:='INPUT';
 IDisp:=iDoc.all.tags(ov);
 if assigned(IDisp)
 then
  begin
   IDisp.QueryInterface(IHTMLElementCollection,iColl);
   if assigned(iColl)
   then
    begin
     for i:=1 to iColl.Get_length do
      begin
       iDisp:=iColl.item(pred(i),0);
       iDisp.QueryInterface(IHTMLInputElement,iInputElement);
       if assigned(iInputElement)
       then
        begin
         if iInputElement.Get_name='login'
         then
          begin
           iInputElement.QueryInterface(IHtmlElement,iEl);
           iEl.click;
          end;
        end;
      end;
    end;
  end;
end;

procedure TForm1.Button13Click(Sender: TObject);
var
 i: integer;
 s,Comm: string;
 Disp: IDispatch;
 Doc: IHtmlDocument2;
 Uni: IHTMLSelectElement;
 Element,pChild: IHTMLElement;
 InputElement: IHTMLInputElement;
begin
 ListBox1.Clear;

 Doc:=WebBrowser1.Document as IHtmlDocument2;

 // Memo2.Lines.Add(Doc.Body.innerHTML);

 for i:=1 to Doc.All.Length do
  begin
   Disp:=Doc.All.Item(Pred(i),0);
   Disp.QueryInterface(IHTMLElement,Element);

   if Assigned(Element)
   then
    begin
     Element.QueryInterface(IHTMLInputElement,InputElement);
     // выбор элемента
     if Element.TagName='SELECT'
     then
      begin
       Element.QueryInterface(IHTMLSelectElement,Uni);

       Disp.QueryInterface(IHTMLElement,pChild);

       if Assigned(pChild)
       then
        begin
         s:=IntToStr(i)+' tag='+Element.TagName+' ';
         pChild.QueryInterface(IHtmlInputElement,InputElement);

         if Assigned(InputElement)
         then
          begin
           s:=s+'name='+InputElement.Get_Name;
           s:=s+'value='+InputElement.Get_Value;
           s:=s+'type='+InputElement.Get_Type_;
          end;
         ListBox1.Items.Add(s);
        end;

       {
       pChild:=Element;

       if Element.Contains(pChild)=true
       then
        begin
         // Disp:=Element. .Children;
         // Disp.QueryInterface(IHTMLElement,pChild);

         if Assigned(pChild)
         then
          begin
           pChild.QueryInterface(IHTMLInputElement,InputElement);
           // выбор элемента
           if pChild.TagName='OPTION'
           then
           else
          end;
        end;
       }

       if Assigned(Uni)
       then
        begin
         if (Uni.Name='data[city]') or (Uni.Name='data[subway]')
         then
          begin
           Uni.SelectedIndex:=1;
           // ListBox1.Items.Add('Select= '+Uni.Name);
           // ListBox1.Items.Add('Select= '+Uni.Type_);
           // ListBox1.Items.Add('Select= '+Uni.Value);
          end;
        end;
      end;
     //
     // нажатие на кнопку
     if Assigned(InputElement)
     then
      begin
       if InputElement.Name='logout'
       then
        begin
         if Comm<>'ClickButton'
         then InputElement.value:='test'
         else Element.click;

         ListBox1.Items.Add('NAME= '+InputElement.Name)
        end;
      end;
    end;
  end;
end;

procedure TForm1.Button9Click(Sender: TObject);
var
 i: integer;
 iDisp: IDispatch;
 iDoc: IHTMLDocument2;
 // iInp: IHTMLInputElement;
 iOpt: IHTMLOptionElement;
 // iSel: IHTMLSelectElement;
 iCol: IHTMLElementCollection;
begin
 ListBox1.Items.Clear;

 iDoc:=WebBrowser1.Document as IHtmlDocument2;

 iDisp:=iDoc.All.Tags('OPTION');
 if Assigned(iDisp)
 then
  begin
   iDisp.QueryInterface(IHTMLElementCollection, iCol);

   if Assigned(iCol)
   then
    begin
     for i:=1 to iCol.Length do
      begin
       iDisp:=iCol.Item(pred(i),0);
       iDisp.QueryInterface(IHTMLOptionElement, iOpt);
       if Assigned(iOpt)
       then
        begin
         ListBox1.Items.Add('Value='+iOpt.Value+' Text='+iOpt.Text);
         // ListBox1.Items.Add(iOpt.Text);
         // ListBox1.Items.SaveToFile('add.txt');
        end;
      end;
    end;
  end;
end;

end.
