public class SOQL_EX1 {
    PUBLIC List <Contact>  Contact{set;get;}  
    public SOQL_EX1(){
        Contact =[select email,Name,fax,Description from Contact];
    }
}