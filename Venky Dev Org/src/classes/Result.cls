public with sharing class Result {
public String score{get;set;}
public String tQuestions{get;set;}
public String rQues{get;set;}
public String wQues{get;set;}
public String res{get;set;}
public Result(){
score=ApexPages.currentPage().getParameters().get('score');	
tQuestions=ApexPages.currentPage().getParameters().get('tQuestions');	
rQues=ApexPages.currentPage().getParameters().get('rQues');	
wQues=ApexPages.currentPage().getParameters().get('wQues');	
if(Integer.valueOf(score)>=6){
	res='PASS';
}
else{
	res='FAIL';
}
}

}