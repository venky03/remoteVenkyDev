public class CB_CowAndBullController
{
    public Integer CompNumber {get; set;}
    public Integer userEnteredNUmber {get; set;}
    //To maintain the user inputs
    public List<userInputResults> toDisplayWrapperLst {get; set;}
    //Flag to show the button which compare the user input with computer's generated number
    public boolean showButton {get; set;}
    
    public CB_CowAndBullController()
    {
        //Number entered by user
        userEnteredNUmber = 0 ;
        
        showButton = true ;
        
        toDisplayWrapperLst = new List<userInputResults>() ;
        
        //Generating 4 digit number which doesn't start with 0 and no number is repeated
        boolean flag = false ;
        while(!flag)
        {
            Integer tempVar = Integer.valueOf(Math.Random() * 10000) ;
            if(checkNumber(tempVar))
            {
                flag = true ;
                CompNumber = tempVar ;
            }
        }
    }
    
    private Boolean checkNumber(Integer num)
    {
        //Pattern for 4 digit number which doesn't start with 0 and no number is repeated
        Pattern nonZeroPattern = Pattern.compile('([1-9])(?!.*\\1)([0-9])(?!.*\\2)([0-9])(?!.*\\3)([0-9])(?!.*\\4)');
        Matcher nonZeroMatcher = nonZeroPattern.matcher(''+num);
        if(nonZeroMatcher.matches())
             return true;
        else
            return false ;
    }
    
    public PageReference CheckCandB()
    {
        if(checknumber(userEnteredNUmber))
        {
            //Logic to compare user input and computer's generated number
            Integer cow = 0 ;
            Integer bull = 0 ;
            String UEN = string.valueOf(userEnteredNUmber) ;
            String CGN = string.valueOf(CompNumber) ;
            
            for(Integer i = 0 ; i < UEN.length() ; i++)
            {   
                for(Integer j = 0 ; j < CGN.length() ; j++)
                {
                    if(UEN.subString(i , i+1) == CGN.subString(j , j+1))
                    {
                        if(i == j)
                            cow = cow + 1 ;
                        else
                            bull = bull + 1 ;
                    }
                }
            }
            toDisplayWrapperLst.add(new userInputResults(cow, bull, userEnteredNUmber)) ;

            if(cow == 4)
            {
                showButton = false ;
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,'Congratulations! You guessed it right in ' + toDisplayWrapperLst.size() + ' chances.'));
            }
            else
            {
                if(toDisplayWrapperLst.size() > 9)
                {
                    showButton = false ;
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'You failed to guess the number in 10 chances. Better luck next time.'));
                }
            }
        }
        else
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Please enter a 4 digit number which does not start with 0 and no number is repeated' ));
        }
        return null ;
    }
    
    //Wrapper to maintain number of cows, bulls and user input
    public class userInputResults
    {
        public Integer cow {get; set;}
        public Integer bull {get; set;}
        public Integer userInput {get; set;}
        
        public userInputResults(Integer c, Integer b, Integer ui)
        {
            cow = c ;
            bull = b;
            userInput = ui ;
        }
    }
}