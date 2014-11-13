public with sharing class TableController {
    public Integer anum{get;set;}
    public Integer i;
   public List<String>val{get;set;}
   
   public TableController() {
       val=new List<String>();
   }
    
   /* public Integer getAnum() {
        return anum;
    }
    public void setAnum(Integer n) {
        anum=n;
    }*/
    public void multiply(){
        val=new List<String>();
        for(i=1;i<=10;i++){
            val.add(i+'*'+aNum+'='+aNum*i);
        }
    }
}