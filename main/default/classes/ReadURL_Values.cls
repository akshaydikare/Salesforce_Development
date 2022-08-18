public class ReadURL_Values {
    public string name{set; get;}
    public string city{set; get;}
    public ReadURL_Values(){
		name = Apexpages.currentPage().getParameters().get('name');
        city = Apexpages.currentPage().getParameters().get('city');
    }
}