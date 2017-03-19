import java.io.*;
import java.util.*;
import com.cybozu.labs.langdetect.Detector;
import com.cybozu.labs.langdetect.DetectorFactory;
import com.cybozu.labs.langdetect.Language;
import com.cybozu.labs.langdetect.*;

public class LangDetect{
	
	public static void main(String[] args) throws IOException, FileNotFoundException{
		//read categories into a list
        Scanner scat = new Scanner(new File("restaurants.txt"));
		ArrayList<String> cat = new ArrayList<String>();
		HashMap<String,Integer> langStat = new HashMap<String,Integer>();
		
		while(scat.hasNext()){
			cat.add(scat.nextLine());
		}
 	   
	   	scat.close();
		
		try{
			DetectorFactory.loadProfile("langdetect-03-03-2014/profiles/");
		}catch(LangDetectException lde){
			lde.printStackTrace();
		}

		//loop through the files in categories folder;
		for(String category : cat){
			int filep = 1;
			File f = new File("../reviewdata/" + category + "/" + filep);
			System.out.println("../reviewdata/" + category + "/" + filep);
			while(f.exists()){
				Scanner fscan = new Scanner(f);
				ArrayList<String> filecontent = new ArrayList<String>();
				while(fscan.hasNext()){
					filecontent.add(fscan.nextLine());
				}
				fscan.close();
				
				String lang = "";
				try{
					lang = detectLang(filecontent);
				}catch(LangDetectException lde){
					System.out.println("detect failure: " + filecontent.toString());
				}
				
				
				if(lang != null && lang.length() > 0){
					if(langStat.containsKey(lang)){
						int count = langStat.get(lang);
						count++;
						langStat.put(lang, count);
					}else{
						langStat.put(lang, 1);
					}
					if(!lang.equals("en")){
						f.delete();
					}
				}
				
				filep++;
				f = new File("../reviewdata/" + category + "/" + filep);
			}
		}
		System.out.println(langStat.toString());
	}

		public static String detectLang(ArrayList<String> c) throws LangDetectException, IOException {
				Detector d = DetectorFactory.create();
				for(String s: c)
					d.append(s);
				String lang = d.detect();
				if (lang.length() == 0) {
				        return null;
				}
				return lang;
		}

}