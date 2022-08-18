public class ChildClass  {          
    public void show(){
        ParentClass parent = new ParentClass();
        system.debug(parent.name);
        parent.name = 'abhinav';
        system.debug(parent.name);
    }
}