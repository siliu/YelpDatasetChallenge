import java.io.*;
import java.util.*;
 
import edu.stanford.nlp.tagger.maxent.MaxentTagger;
 
public class Tagging {
    public static void main(String[] args) throws IOException,
            ClassNotFoundException {
 
 
		//read categories into a list
        Scanner scat = new Scanner(new File("topr.txt"));
		ArrayList<String> cat = new ArrayList<String>();
		
		while(scat.hasNext()){
			cat.add(scat.nextLine());
		}
 	   
	   	scat.close();
		
		//make directories
		for(String category : cat){
			boolean suc = new File("../taggeddata/" + category).mkdirs();
		}
		
		//loop through the files in categories folder;
		for(String category : cat){
			int filep = 1;
			File f = new File("../reviewdata/" + category + "/" + filep);
			System.out.println("../reviewdata/" + category + "/" + filep);
			while(f.exists() || filep<4500){
				if(f.exists()){
					Scanner fscan = new Scanner(f);
					ArrayList<String> filecontent = new ArrayList<String>();
					while(fscan.hasNext()){
						filecontent.add(fscan.nextLine());
					}
					fscan.close();
				
					ArrayList<String> taggedFile = tag(filecontent);
				
					//write output
					File taggedout = new File("../taggeddata/" + category + "/" + filep);
					taggedout.createNewFile();
					PrintWriter pw = new PrintWriter(new FileWriter(taggedout));
					for(String ts:taggedFile){
						pw.write(ts + "\n");
					}
					pw.close();
				
				}
			
				filep++;
				f = new File("../reviewdata/" + category + "/" + filep);
			}
		}
		
    }
	
	public static ArrayList<String> tag(ArrayList<String> input) throws IOException,
            ClassNotFoundException{
        MaxentTagger tagger = new MaxentTagger("stanford-postagger-2011-04-20/models/left3words-wsj-0-18.tagger");
 
		ArrayList<String> out = new ArrayList<String>();
		for( String s : input ){
			 String tagged = tagger.tagString(s);
			 out.add(tagged);
		}
		return out;
	}
}