public without sharing class QueueableAsyncProcessing 
	implements queueable, Database.AllowsCallouts {

 	public void execute(QueueableContext context)
    {
    	if(!AppCustomSetting.appEnabled) return; // On/off switch
    	List<AsyncRequest__c> requests;
    	try
    	{
	    	requests = [Select ID, AsyncType__c, Params2__c
	    		FROM AsyncRequest__c 
	    		where Error__c = false And
	    		CreatedById = :UserInfo.getUserId() 
	    		Limit 1 for update];
    	}
    	catch(Exception ex) { return; }
    	if(requests.size()==0 ) return;
    	
    	AsyncRequest__c currentRequest = requests[0];
    	
    	try
    	{
    		if(currentRequest.AsyncType__c=='NPI API Call') 
				npiAPICall(currentRequest);
    		
    		System.debug(currentRequest);
			currentRequest.Error__c = true;
			currentRequest.Error_Message__c = 'I Ran Succesfully';

			Update currentRequest;

			// delete currentRequest;
			// database.emptyRecycleBin(new List<ID>{currentRequest.id});
    		
    	}
    	catch(Exception ex)
    	{
    		currentRequest.Error__c = true;
    		currentRequest.Error_Message__c = ex.getMessage();
    		update currentRequest;
    	}

    	List<AsyncRequest__c> moreRequests = [Select ID, AsyncType__c, Params2__c 
    		FROM AsyncRequest__c 
    		where Error__c = false 
    		and ID <> :currentRequest.id 
    		and	CreatedById = :UserInfo.getUserId() 
    		Limit 1 ];
    	
    	if(moreRequests.size()==0) return;
    	
		try
		{
			enqueueQueueableAsyncProcessing(context.getJobId());
		}
		catch(Exception ex)
		{
			tryToQueue();
		}
		
    }

	public static void enqueueQueueableAsyncProcessing(ID currentJobId)
	{
		List<AsyncApexJob> jobs = [Select ID, Status, ExtendedStatus from AsyncApexJob 
					where JobType = 'Queueable' And (status='Queued'  Or Status='Holding') 
					and CreatedById = :userinfo.getUserID() and 
					ApexClass.Name='QueueableAsyncProcessing' and ID!= :currentJobId Limit 1 ];
		if(jobs.size()==1) return;	// Already have one queued that isn't this one.
		
		system.enqueueJob(new QueueableAsyncProcessing());
	}

    
    @future
    private static void tryToQueue()
    {
    	if(!AppCustomSetting.appEnabled) return; // On/off switch
    	try
    	{
			if(Limits.getLimitQueueableJobs() - Limits.getQueueableJobs() > 0)
				enqueueQueueableAsyncProcessing(null);
    	}
    	catch(Exception ex)
    	{

    	}
    }

    public void npiAPICall(AsyncRequest__c request)
    {
    	Integer allowedCallouts = 
    	Limits.getLimitCallouts() - Limits.getCallouts();
		if(allowedCallouts<=0) return;
		
		List<ID> idsAfterSplit = request.Params2__c.split(',');
		
		List<Contact> contacts= [SELECT Id, NPI__c, SubSpecialty__c FROM Contact WHERE Id IN :idsAfterSplit LIMIT :allowedCallouts];
			for(Contact c : contacts){
				if(c.npi__c.length() == 10 ){
					Boolean FoundPrimary = False;
					string NPI = 'https://npiregistry.cms.hhs.gov/api/?version=2.1&number='+ c.NPI__c;
			
					HttpRequest req = new HttpRequest();
					req.setEndpoint(NPI);
					req.setMethod('GET');
			
					Http http = new Http();
					HttpResponse res = http.send(req);
					string updatedresponse = res.getBody().replace('"desc":', '"desc_Z":');
					System.debug('resbody:'+updatedresponse);
					JSON2Apex response = (JSON2Apex)JSON.deserialize(updatedresponse, JSON2Apex.Class);
					System.debug(response);
			
					if(response != null && response.result_count == 1){
						for(JSON2Apex.Taxonomies t: response.Results[0].taxonomies){
							if(t.primary) {
								c.SubSpecialty__c = t.desc_Z;
								FoundPrimary = true;
								break;
							}
						}
						if(!FoundPrimary) {
							c.SubSpecialty__c = response.Results[0].taxonomies[0].desc_Z;
						}
						
					}

					else {
						c.SubSpecialty__c = 'Error: No Match for NPI Number';
					}
				}

				else {
					c.SubSpecialty__c = 'Error: NPI Number Incorrect Length';
				}

			}
		database.update(contacts, false);
	}
	
}