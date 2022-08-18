public class LeadConversion {
	Public static void main()
	{
		Lead l = [SELECT name FROM lead WHERE name like 'Aksh%' LIMIT 1];
		Database.leadConvert lc = new Database.leadConvert();
		lc.setLeadId(l.id);
		System.debug('ID of record inserted is: '+ l.id);
		lc.convertedStatus='Closed - Converted';
		lc.ownerId='0055j000004QGAgAAO'; // any user id
		Database.leadConvertResult lcr = Database.convertLead(lc);
	}

}