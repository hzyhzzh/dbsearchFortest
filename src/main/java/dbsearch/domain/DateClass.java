package dbsearch.domain;
import java.util.Comparator;
public class DateClass implements Comparator{ //降序
    
	public int compare(Object arg0,Object arg1){  
        Paper paper0 = (Paper)arg0;  
        Paper paper1 = (Paper)arg1;  
        
        int flag = paper0.getUploadTime().compareTo(paper1.getUploadTime());  
        return flag;  
        
    }  
}