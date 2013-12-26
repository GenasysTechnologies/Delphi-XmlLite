{#----------------------------------------------------------------------------
  Header translation for Microsoft XmlLite
  @author Carl Mönnig

  * XmlLite is a native C++ implementation of .NET XmlReader+Writer for stream-based, forward-only XML parsing and creation.
  * XmlLite.dll is required.  It is included with all new versions of Windows, and service packs for old versions.
  * XmlReader's pull-based interface is cleaner to use than SAX's event-based interface.
  * More info: http://msdn.microsoft.com/en-us/library/ms752838%28v=VS.85%29.aspx

  Note: This is a minimal translation, some parts were not implemented and most are untested.
-----------------------------------------------------------------------------}
unit XmlLite;

interface

uses ActiveX;

const
  XmlNodeType_None  = 0;
  XmlNodeType_Element  = 1;
  XmlNodeType_Attribute  = 2;
  XmlNodeType_Text  = 3;
  XmlNodeType_CDATA  = 4;
  XmlNodeType_ProcessingInstruction  = 7;
  XmlNodeType_Comment  = 8;
  XmlNodeType_DocumentType  = 10;
  XmlNodeType_Whitespace  = 13;
  XmlNodeType_EndElement  = 15;
  XmlNodeType_XmlDeclaration  = 17;

  XmlStandalone_Omit  = 0;
  XmlStandalone_Yes  = 1;
  XmlStandalone_No  = 2;

  XmlDtdProcessing_Prohibit = 0;
  XmlDtdProcessing_Parse = 1;

  XmlWriterProperty_MultiLanguage = 0;
  XmlWriterProperty_Indent = 1;
  XmlWriterProperty_ByteOrderMark = 2;
  XmlWriterProperty_OmitXmlDeclaration = 3;
  xmlWriterProperty_ConformanceLevel = 4;

  XmlReaderProperty_MultiLanguage  = 0;
  XmlReaderProperty_ConformanceLevel = 1;
  XmlReaderProperty_RandomAccess = 2;
  XmlReaderProperty_XmlResolver  = 3;
  XmlReaderProperty_DtdProcessing  = 4;
  XmlReaderProperty_ReadState  = 5;
  XmlReaderProperty_MaxElementDepth  = 6;
  XmlReaderProperty_MaxEntityExpansion  = 7;

type
  IXMLReader = interface
  ['{7279FC81-709D-4095-B63D-69FE4B0D9030}']
    function SetInput(const _IXMLStream: IStream): HRESULT; stdcall;
    function GetProperty(const nProperty: LongWord; out ppValue: Longint): HRESULT; stdcall;
    function SetProperty(const nProperty: LongWord; const pValue: Longint): HRESULT; stdcall;
    function Read(out XmlNodeType: Integer): HRESULT; stdcall;
    function GetNodeType(out XmlNodeType: Integer): HRESULT; stdcall;
    function MoveToFirstAttribute: HRESULT; stdcall;
    function MoveToNextAttribute: HRESULT; stdcall;
    function MoveToAttributeByName(const pwszLocalName, pwszNamespaceUri: WideString): HRESULT; stdcall;
    function MoveToElement: HRESULT; stdcall;
    function GetQualifiedName(out ppwszQualifiedName: PWideChar; out pcwchQualifiedName: LongWord): HRESULT; stdcall;
    function GetNamespaceUri(out ppwszNamespaceUri: PWideChar; out pcwchNamespaceUri: LongWord): HRESULT; stdcall;
    function GetLocalName(out ppwszLocalName: PWideChar; out pcwchLocalName: LongWord): HRESULT; stdcall;
    function GetPrefix(out ppwszPrefix: PWideChar; out pcwchPrefix: LongWord): HRESULT; stdcall;
    function GetValue(out ppwszValue: PWideChar; out pcwchValue: LongWord): HRESULT; stdcall;
    function ReadValueChunk({__out_ecount_part(cwchChunkSize, *pcwchRead) WCHAR *pwchBuffer, LongWord cwchChunkSize, __inout  LongWord *pcwchRead}): HRESULT; stdcall;
    function GetBaseUri(out ppwszBaseUri: PWideChar; out pcwchBaseUri: LongWord): HRESULT; stdcall;
    function IsDefault: LongBool; stdcall;
    function IsEmptyElement: LongBool; stdcall;
    function GetLineNumber(out pnLineNumber: LongWord): HRESULT; stdcall;
    function GetLinePosition(out pnLinePosition: LongWord): HRESULT; stdcall;
    function GetAttributeCount(out pnAttributeCount: LongWord): HRESULT; stdcall;
    function GetDepth(out pnDepth: LongWord): HRESULT; stdcall;
    function IsEOF: LongBool; stdcall;
  end;

  IXMLWriter = interface
  ['{7279FC88-709D-4095-B63D-69FE4B0D9030}']
    function SetOutput(const _IXMLStream: IStream): HRESULT; stdcall;
    function GetProperty(const nProperty: LongWord; out ppValue: LongInt): HRESULT; stdcall;
    function SetProperty(const nProperty: LongWord; const pValue: LongInt): HRESULT; stdcall;
    function WriteAttributes(const pReader: IXmlReader; const fWriteDefaultAttributes: LongBool): HRESULT; stdcall;
    function WriteAttributeString(const pwszPrefix, pwszLocalName, pwszNamespaceUri, pwszValue: WideString): HRESULT; stdcall;
    function WriteCData(const pwszText: WideString): HRESULT; stdcall;
    function WriteCharEntity(const wch: WideChar): HRESULT; stdcall;
    function WriteChars({__in_ecount_opt(cwch)  const WCHAR *pwch, LongWord cwch}): HRESULT; stdcall;
    function WriteComment(const pwszComment: WideString): HRESULT; stdcall;
    function WriteDocType(const pwszName, pwszPublicId, pwszSystemId, pwszSubset: WideString): HRESULT; stdcall;
    function WriteElementString(const pwszPrefix, pwszLocalName, pwszNamespaceUri, pwszValue: WideString): HRESULT; stdcall;
    function WriteEndDocument: HRESULT; stdcall;
    function WriteEndElement: HRESULT; stdcall;
    function WriteEntityRef(const pwszName: WideString): HRESULT; stdcall;
    function WriteFullEndElement: HRESULT; stdcall;
    function WriteName(const pwszName: WideString): HRESULT; stdcall;
    function WriteNmToken(const pwszNmToken: WideString): HRESULT; stdcall;
    function WriteNode(const pReader: IXmlReader; const fWriteDefaultAttributes: LongBool): HRESULT; stdcall;
    function WriteNodeShallow(const pReader: IXmlReader; const fWriteDefaultAttributes: LongBool): HRESULT; stdcall;
    function WriteProcessingInstruction(const pwszName, pwszText: WideString): HRESULT; stdcall;
    function WriteQualifiedName(const pwszLocalName, pwszNamespaceUri: WideString): HRESULT; stdcall;
    function WriteRaw(const pwszData: WideString): HRESULT; stdcall;
    function WriteRawChars({_in_ecount_opt(cwch)  const WCHAR *pwch, LongWord cwch}): HRESULT; stdcall;
    function WriteStartDocument(const standalone: Integer): HRESULT; stdcall;
    function WriteStartElement(const pwszPrefix, pwszLocalName, pwszNamespaceUri: PWideChar): HRESULT; stdcall;
    function WriteString(const pwszText: WideString): HRESULT; stdcall;
    function WriteSurrogateCharEntity(const wchLow, wchHigh: WideChar): HRESULT; stdcall;
    function WriteWhitespace(const pwszWhitespace: WideString): HRESULT; stdcall;
    function Flush: HRESULT; stdcall;
  end;

function CreateXmlFileReader(const FileName: string = ''): IXMLReader;
function CreateXmlFileWriter(const FileName: string = ''): IXMLWriter;

function OpenXmlFileStreamReader(const FileName: string): IStream;
function OpenXmlFileStreamWriter(const FileName: string): IStream;

procedure CheckHR(HR: HRESULT);

implementation

uses Classes, SysUtils;

const
  XMLReaderGuid: TGUID = '{7279FC81-709D-4095-B63D-69FE4B0D9030}';
  XMLWriterGuid: TGUID = '{7279FC88-709D-4095-B63D-69FE4B0D9030}';

function CreateXmlReader(const refiid: TGUID; out _IXMLReader: IXMLReader; const pMalloc: Pointer): HRESULT; stdcall; external 'XmlLite.dll';
function CreateXmlWriter(const refiid: TGUID; out _IXMLWriter: IXMLWriter; const pMalloc: Pointer): HRESULT; stdcall; external 'XmlLite.dll';

function CreateXmlFileReader(const FileName: string): IXMLReader;
begin
  CheckHR(CreateXmlReader(XMLReaderGuid, Result, nil));
  if (Result <> nil) and (FileName <> '') then
  begin
    CheckHR(Result.SetProperty(XmlReaderProperty_DtdProcessing, XmlDtdProcessing_Parse));
    CheckHR(Result.SetInput(OpenXmlFileStreamReader(FileName)));
  end;
end;

function CreateXmlFileWriter(const FileName: string): IXMLWriter;
begin
  CheckHR(CreateXmlWriter(XMLWriterGuid, Result, nil));
  if (Result <> nil) and (FileName <> '') then
    CheckHR(Result.SetOutput(OpenXmlFileStreamWriter(FileName)));
end;

function OpenXmlFileStreamReader(const FileName: string): IStream;
begin
  Assert(FileExists(FileName), 'XML file should exist');
  Result := TStreamAdapter.Create(TFileStream.Create(FileName, fmOpenRead), soOwned);
end;

function OpenXmlFileStreamWriter(const FileName: string): IStream;
begin
  Result := TStreamAdapter.Create(TFileStream.Create(FileName, fmCreate), soOwned);
end;

procedure CheckHR(hr: HRESULT);
begin
  if (hr < 0) then
    raise Exception.CreateFmt('XmlLite exception! Code: %d', [hr]);
end;
end.