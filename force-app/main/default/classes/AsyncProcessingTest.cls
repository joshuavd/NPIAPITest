@isTest
public class AsyncProcessingTest {
    @IsTest
    static void testAsynchronousProcessing(){
        contact c = new contact();
        c.LastName = 'TestRecord';
        c.NPI__c = '1234567890';
            Test.startTest();
            insert c;
            Test.stopTest();
        
    }
}