trigger AsyncNPICall on Contact (after insert, after update) {
    System.debug(trigger.new);
    AsyncProcessing.handleNPITrigger(trigger.new, trigger.newMap,
        trigger.oldMap, trigger.operationType);
}