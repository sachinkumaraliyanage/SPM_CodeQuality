package IT17152938.Contoller;

import IT17152938.Service.FileReader;
import IT17152938.Service.NestingCounter;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class QualityController {
    public JsonArray getQuality(String file){
        FileReader fileReader=new FileReader(file);
        NestingCounter nestig=new NestingCounter(fileReader);
//        InheritanceCount inhe=new InheritanceCount(fileReader);
//        Size size=new Size(fileReader);


        JsonObject res2 = new JsonObject();
        JsonArray data = new JsonArray();

        for(int i=0;i<fileReader.getFileFormat2().size();i++){

            // Create new JSON Object
            JsonObject res = new JsonObject();
            res.addProperty("code", fileReader.getFileFormat2().get(i));
            res.addProperty("nextcount", nestig.getLineNestingCount().get(i));
//            res.addProperty("inheritcount", inhe.getInherite().get(i));
//            res.addProperty("sizecount", size.getAllcount().get(i));
//            res.addProperty("sizedis", size.getAll().get(i));


            data.add(res);

        }

        System.out.println(data.toString());

        res2.addProperty("data", data.toString());



        return data;
    }
}
