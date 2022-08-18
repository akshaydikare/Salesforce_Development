public class PageReference_Example {
    public String name{set;get;}
    public String city{set;get;}
    public PageReference_Example(){
        name='Akshay';
        city='Pune';
    }
    
    public PageReference call(){
        PageReference p = new PageReference('/apex/Picklist_Examples');
        return p;
    }
    
    public PageReference show(){
        String url = '/apex/ReadURL_Values?name='+name;
        url = url + '&city='+ city;
        PageReference p = new PageReference(url);
        return p;
            }
    public PageReference invoke(){
        PageReference p = Page.apex_facet;
        return p;       
    }
    
}