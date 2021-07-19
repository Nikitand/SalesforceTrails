global with sharing class Utils {
    @InvocableMethod(label='Split String')
    global static List<List<String>> SplitSelectedPropertiesString(List<String> selectedProperties) {
        List<List<String>> result = new List<List<String>>();
        result.add(selectedProperties[0].split(';'));
        return result;
    }   
}
