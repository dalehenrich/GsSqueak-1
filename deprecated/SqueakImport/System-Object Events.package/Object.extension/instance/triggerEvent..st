*System-Object Events-accessing-triggering
triggerEvent: anEventSelector
	"Evaluate all actions registered for <anEventSelector>. Return the value of the last registered action."

    ^(self actionForEvent: anEventSelector) value