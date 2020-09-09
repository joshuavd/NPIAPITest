public class AsyncProcessing {

	// Simple protection from workflows and triggers
	private static Boolean alreadyProcessed = false;	
	

	public static void handleNPITrigger(List<Contact> ContactList, 
		Map<ID, Contact> newMap, Map<ID, Contact> oldMap, 
		 TriggerOperation operation)
	{
		if(alreadyProcessed) return;
		alreadyProcessed = true;


		List<AsyncRequest__c> newAsyncRequests = new List<AsyncRequest__c>();
		List<String> textChangedIds = new List<ID>();

		System.debug('Total Contacts in Contact List: ' + ContactList.size());
		for(Contact co: ContactList)
		{
			if(operation == TriggerOperation.AFTER_INSERT && !String.isBlank(co.NPI__c) || co.NPI__c!= oldMap.get(co.id).NPI__c && !String.isBlank(co.NPI__c)) {
				textChangedIds.add(co.id); 
			}
			
			if(textChangedIds.size()>99) {
				newAsyncRequests.add(
					new AsyncRequest__c(
						AsyncType__c = 'NPI API Call',
						Params2__c = string.Join(textChangedIds,',')
					)
				);
				System.debug('Current Async Request Size in Loop: '+newAsyncRequests.size());
				textChangedIds.clear();
			}
		}

		if(textChangedIds.size()>0){
			newAsyncRequests.add(
				new AsyncRequest__c(
					AsyncType__c = 'NPI API Call',
					Params2__c = string.Join(textChangedIds,',')
				)
			);
		}
		System.debug('Async Request Size:' + newAsyncRequests.size());
		for( AsyncRequest__c a: newAsyncRequests){
			System.debug(a.Name + a.params2__c);
		}

		Database.SaveResult[] srList = database.insert(newAsyncRequests,false);
		system.debug(srList+'srList+++');
		for (Database.SaveResult sr : srList) {
		if (sr.isSuccess()) {
			// Operation was successful, so get the ID of the record that was processed
			System.debug('Successfully inserted AsyncRequest__c. AsyncRequest__c ID: ' + sr.getId());
		}else {
			for(Database.Error err : sr.getErrors()) {
				System.debug('The following error has occurred.');                    
				System.debug(err.getStatusCode() + ': ' + err.getMessage());
				System.debug('Error Ids: ' + err.getFields());
        	}
		}
		}


		for (AsyncRequest__c ar : newAsyncRequests) {
			System.debug(ar.id);
		}
	}

}