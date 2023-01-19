trigger Account1 on Account (after insert) { //after degil before deseydik, orphan account olusturmus olucaktik

    List<Opportunity> oppList = new List<Opportunity>();
    for(Account a: Trigger.New){ //parametre user dan gelen bilgi
        Opportunity o = new Opportunity();
        o.Name = a.Name + ' Opportunity'; 
        o.CloseDate = Date.Today() + 15;
        o.StageName = 'Prospecting';
        o.AccountId = a.Id;
        oppList.add(o);
    }
    insert oppList;
}