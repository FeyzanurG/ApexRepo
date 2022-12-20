public with sharing class Client {
    Public String name ='Feyzanur';
    Public Integer age = 28;

    Public void clientDataMethod(){
        String ageToText = String.valueOf(age);
        System.debug('The name of the client is ' + name + ' and the age of them is' + ageToText);
    }
}
