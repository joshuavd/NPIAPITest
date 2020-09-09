trigger OnAsyncRequestInsert on AsyncRequest__c (after insert) 
{
    if(Limits.getLimitQueueableJobs() - Limits.getQueueableJobs() > 0)
    try
    {
        QueueableAsyncProcessing.enqueueQueueableAsyncProcessing(null);
    } catch(Exception ex)
    {
        
    }
}