package IT17152938.Contoller;

import IT17152938.Service.FileReader;
import IT17152938.Service.NestingCounter;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class QualityController {
    public JsonArray getQuality(String file){
        FileReader fileReader=new FileReader(file);
        NestingCounter nestig=new NestingCounter(fileReader);


        JsonObject res2 = new JsonObject();
        JsonArray data = new JsonArray();

        for(int i=0;i<fileReader.getFileFormat2().size();i++){

            // Create new JSON Object
            JsonObject res = new JsonObject();
            res.addProperty("code", fileReader.getFileFormat2().get(i));
            res.addProperty("nextcount", nestig.getLineNestingCount().get(i));


            data.add(res);

        }


        res2.addProperty("data", data.toString());


        return data;
    }
}
