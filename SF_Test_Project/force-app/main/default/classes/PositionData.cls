@RestResource(urlMapping = '/Position__c/*')
global class PositionData {
    @httpPost
    global static String createPosition (String posName, String dept, String Status, String jobDesc){
        Position__c pos = new Position__c(Name=posName, Department__c = dept, Status__c = Status, Job_Description__c=jobDesc);
        try{
            insert pos;
            return pos.Id;
        }
        catch(DMLException ex){
            System.debug(ex.getMessage());
            return 'Unable to create a Position Record'; }
    }
    @httpGet
    global static Position__c retrievePosition(){
        RestRequest request = RestContext.request;
        String URL = request.requestURI;
        String positionId = URL.substring(URL.lastIndexOf('/')+1);
        Position__c pos = [select Name, Department__c, Status__c, Location__c from Position__c where
                           Id=:positionId ]; return pos;
    }
    @httpPut
    global static Id upsertPosition(String inputId, String posName, String dept, String status){
        Position__c updatePos = new Position__c(Id = inputId, Name=posname, Department__c = dept, Status__c = status);
        upsert updatePos;
        return updatePos.Id; }
    @httpDelete
    global static void deletePosition(){
        RestRequest request = RestContext.request;
        String URL = request.requestURI;
        String positionId = URL.substring(URL.lastIndexOf('/')+1);
        Position__c pos = [select Name, Department__c, Status__c, Location__c from Position__c where
                           Id=:positionId ]; delete pos;
    } }