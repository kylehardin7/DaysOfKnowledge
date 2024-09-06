codeunit 50004 "ARC Sales Line Subs"
{
    // Override the binding of codeunit 7020 "Sales Line - Price" to Interface "Line With Price"
    // with custom codeunit 50003 "ARC Sales Line - Price"
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterGetLineWithPrice', '', true, true)]
    local procedure OnAfterGetLineWithPrice(var LineWithPrice: Interface "Line With Price")
    var
        DNKSalesLinePrice: Codeunit "DNK Sales Line - Price";
    begin
        LineWithPrice := DNKSalesLinePrice;
    end;
}