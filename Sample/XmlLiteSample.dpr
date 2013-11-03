program XmlLiteSample;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  XmlLite in '..\XmlLite.pas';

procedure RunSample; 
var
  _Reader: IXMLReader;
  pValue, pName: PWideChar;
  lenValue, lenName: Cardinal;
  nodeType: Integer;
begin
  _Reader := CreateXmlFileReader('cd_catalog.xml');
  while not _Reader.IsEOF do
  begin
    _Reader.Read(nodeType); //Read every node

    //If it is an XML element node, get the name
    if nodeType = XmlNodeType_Element then
      _Reader.GetLocalName(pName, lenName)

    //If it is XML text and the current element is ARTIST, write the value
    else if (pName = 'ARTIST') and (nodeType = Ord(XmlNodeType_Text)) then
    begin
      _Reader.GetValue(pValue, lenValue);
      Writeln(pValue);
    end;
      
  end;
end;

begin
  try
    RunSample;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  Writeln('Hit return to close.');
  Readln;
end.
