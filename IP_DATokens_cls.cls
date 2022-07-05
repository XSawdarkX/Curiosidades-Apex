/*
 * Author: Daniel Junca
 * Description: Muestra como obtener el Token y el Describe de un Objeto y un Campo.
 * CreateDate: 04-07-2022
*/
public class IP_DATokens_cls {

    //Obtiene el token de un objeto y de un campo
    public void getSobjectFieldToken(){
        
        //OBJETO
        
        //obtener Token con member variable 
        Schema.sObjectType tokenObjectMV = Account.sObjectType;
        System.debug('Sobject Account token: '+tokenObjectMV);
        
        //obtener Token con getSObjectType() / getSObjectField()
        Account objAccount = new Account();
        Schema.sObjectType tokenObjectGSOT = objAccount.getSObjectType();
        System.debug('Sobject Account token: '+tokenObjectGSOT);
        
        //CAMPO
        
        //obtener el Token de un campo
        Schema.SObjectField tokenFieldMV = Account.Name;
        System.debug('Field Name Account token: '+tokenFieldMV);
    }
    
    //Obtiene los Tokens de todos los objetos de la instancia
    public void getAllSObjectsTokens(){
        
        /*
		Key: SObject Name
		Value: SObject Token
		*/
        
        Map<String,Schema.SObjectType> gd = Schema.getGlobalDescribe();
        
        System.debug('Cantidad objetos: '+gd.Size());
        
        for(String sobjectName : gd.keySet()){
           system.debug('SObject Name : '+sobjectName+' SObject Token: '+gd.get(sobjectName)); 
        }
    }
    
    //Obtiene los Tokens de todos los campos de un objeto
    public void getAllFieldTokenssObject(){
        
        /*
		Key: Api Name Field
		Value: Field Token
		*/
        
        Map<String, Schema.SObjectField> fieldMap = Schema.SObjectType.Account.fields.getMap();
        
        System.debug('Cantidad campos objeto: '+fieldMap.size());
        
        for(String apiNameField : fieldMap.keySet()){
           system.debug('Api Name Field : '+apiNameField+' Field Token: '+fieldMap.get(apiNameField));  
        }
    }
    
    //Obtiene el Describe de un objeto
    public void getDescribeObject(){
        
        //Obtiene el Describe usando Tokens
        Schema.DescribeSObjectResult dsrToken = Account.sObjectType.getDescribe();
        System.debug('Describe Token Account: '+dsrToken);
        
        //Obtiene el Describe usando una member variable
        Schema.DescribeSObjectResult dsrSchema = Schema.SObjectType.Account;
        System.debug('Describe Schema Account: '+dsrSchema);
    }
    
    //Obtiene el Describe de un campo
    public void getDescribeField(){
        
        Schema.DescribeFieldResult dfr = Schema.sObjectType.Account.fields.Name;
        System.debug('Describe Schema Account Name: '+dfr);
        
        Schema.DescribeFieldResult Tokendfr = Account.Description.getDescribe();
        System.debug('Describe token Account Description: '+Tokendfr);
    }
    
    //Obtiene el Describe de multiples objeto
    public void getDescribeSchemaMethod(){
       
        List<String> types = new List<String>{'Account','Book__c'};
        Schema.DescribeSobjectResult[] results = Schema.describeSObjects(types); 
        System.debug('Describe Schema Account, Book: '+results);
    }
    
}
