package IT17152938.Contoller;

import IT17152938.Service.FileReader;
import org.junit.Before;
import org.junit.Test;

import java.util.ArrayList;

import static org.junit.Assert.*;

public class QualityControllerTest {
    private String filepath;
    private ArrayList<String> nestig=new ArrayList<>();

    @Before
    public void setUp() throws Exception {
        filepath="D://spmtest.java";
        nestig.add("");
        nestig.add("");
        nestig.add("0");
        nestig.add("");
        nestig.add("0");
        nestig.add("1");
        nestig.add("");
        nestig.add("1");
        nestig.add("");
        nestig.add("");
        nestig.add("");
    }

    @Test
    public void getNextingcount() {

        ArrayList<String> nestingGet=new  QualityController().getNextingcount(new FileReader(this.filepath));

        for(int i=0;i<nestingGet.size();i++){
            assertEquals("not same line "+i,nestingGet.get(i),nestig.get(i));
        }

    }
}