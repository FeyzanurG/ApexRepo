public with sharing class GetAccount {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList() {
        return [
            SELECT Id, Name, Phone, Industry
            FROM Account
            LIMIT 10
        ];
    }
}