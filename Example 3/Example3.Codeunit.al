codeunit 50000 "Barcode Functions"
{
    procedure Code128Barcode(InText: Text): Text
    var
        TempBarcodeSetting: Record "Barcode Encode Settings" temporary;
        BarcodeSymbology: Enum "Barcode Symbology";
        BarcodeFontProvider: Interface "Barcode Font Provider";
    begin
        TempBarcodeSetting."Code Set" := TempBarcodeSetting."Code Set"::"None";
        TempBarcodeSetting."Allow Extended Charset" := true;
        TempBarcodeSetting."Enable Checksum" := true;
        BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
        BarcodeSymbology := Enum::"Barcode Symbology"::Code128;
        BarcodeFontProvider.ValidateInput(InText, BarcodeSymbology);
        exit(BarcodeFontProvider.EncodeFont(InText, BarcodeSymbology));
    end;
}