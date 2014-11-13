public with sharing class QuizController {



 public String question{get;set;}
    public String option1{get;set;}
    public String option2{get;set;}
    public String option3{get;set;}
    public String option4{get;set;}
    public String selectedChoice{get;set;}
    public String ans{get;set;}
    public String rnd{get;set;}
    public String q1{get;set;}
    List<Q_A__c> qa{get;set;}
    Set<String>ques{get;set;}
    List<String>correct{get;set;}
    List<String>wrong{get;set;}
    public String but{get;set;}
    public Integer counter {get;set;}
    private Quiz__c obj; 
    public QuizController(ApexPages.StandardController controller) {
        this.obj = (Quiz__c)controller.getRecord();
        ques=new Set<String>();
        counter=0;
        correct=new List<String>();
        wrong=new List<String>();
        qa=new List<Q_A__c>();
        but='Next';
        rnd =  String.valueOf(Integer.valueOf(Math.random()*20));
        ques.add(rnd);
        for(Q_A__c qans:[Select q.Question__c, q.Option_4__c, q.Option_3__c, q.Option_2__c, q.Option_1__c,q.Answer__c From Q_A__c q where q.Name =:rnd]) {
            question=qans.Question__c;
            option1=qans.Option_1__c;
            option2=qans.Option_2__c;
            option3=qans.Option_3__c;
            option4=qans.Option_4__c;
            ans=qans.Answer__c;
            counter++;
        }
    }

   
    public void getQuestion(){
    	if(!(selectedChoice==null)) {
    		
    	
        if(selectedChoice.equals(ans)){
        	correct.add(rnd);
        }
        else{
        	wrong.add(rnd);
        }
    	}
       
        //generating random value
            rnd =  String.valueOf(Integer.valueOf(Math.random()*20));
            while(ques.contains(rnd)){
                rnd =  String.valueOf(Integer.valueOf(Math.random()*20));
                
            }
            ques.add(rnd);
            for(Q_A__c qans:[Select q.Question__c, q.Option_4__c, q.Option_3__c, q.Option_2__c, q.Option_1__c,q.Answer__c From Q_A__c q where q.Name =:rnd]) {
                question=qans.Question__c;
                option1=qans.Option_1__c;
                option2=qans.Option_2__c;
                option3=qans.Option_3__c;
                option4=qans.Option_4__c;
                ans=qans.Answer__c;
                counter++;
            }
    }
    public PageReference anotherPage(){
    	if(!(selectedChoice==null)) {
    		
    	
        if(selectedChoice.equals(ans)){
        	correct.add(rnd);
        }
        else{
        	wrong.add(rnd);
        }
    	}
    	 q1=String.valueOf(correct.size());
    	 obj.QuizScore__c = Integer.valueOf(q1);
    	 Database.insert(obj);
    	PageReference pageRef= new PageReference('/apex/finish?score='+q1+'&tQuestions='+(correct.size()+wrong.size())+'&rQues='+correct.size()+'&wQues='+wrong.size());
        pageRef.setRedirect(true);        
        return pageRef;
    }
}