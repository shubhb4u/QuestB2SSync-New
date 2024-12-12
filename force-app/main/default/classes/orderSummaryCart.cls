public with sharing class orderSummaryCart {

    @AuraEnabled(cacheable=true)
    public static List<CartItem> getCartOrderSummary(Id cartId) {
        try {
            // Query to get cart items
            List<CartItem> cartItemList = [SELECT Id, Name, TotalPrice, SalesPrice,CurrencyIsoCode
                                            FROM CartItem WHERE CartId = :cartId];

            return cartItemList;
        } catch (Exception e) {
            throw new AuraHandledException('Error fetching cart items: ' + e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static WebCart getCart(Id cartId) {
        try {
            // Query to get cart items
            WebCart crt = [SELECT Id, GrandTotalAmount from WebCart Where Id =: cartId ];

            return crt;
        } catch (Exception e) {
            throw new AuraHandledException('Error fetching cart total amount: ' + e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static WebCart getTotalTaxAmount(Id cartId){
        try {
            WebCart crtTax = [Select id,TotalTaxAmount,CurrencyIsoCode from WebCart Where Id =: cartId];

            return crtTax;
        } catch (Exception e) {
            throw new AuraHandledException('Error fetching cart total tax amount: ' + e.getMessage());
        }
    }
}