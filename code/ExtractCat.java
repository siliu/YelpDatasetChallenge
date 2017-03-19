import java.io.*;
import java.util.*;

public class ExtractCat{
	public static void main(String[] args) throws IOException, FileNotFoundException{
		if(args.length != 1){
			System.out.println("usage: ExtractCat <String of targeting type (case sensitive)>");
			return;
		}
		
		String type = args[0];
		
		//read categories into a list
        Scanner scat = new Scanner(new File("restaurants.txt"));
		ArrayList<String> cat = new ArrayList<String>();
		HashMap<String,Integer> langStat = new HashMap<String,Integer>();
		
		while(scat.hasNext()){
			cat.add(scat.nextLine());
		}
 	   
	   	scat.close();
		//make directories
		boolean suc = new File("../restdata").mkdirs();

		
		//loop through the files in categories folder;
		for(String category : cat){
			int filep = 1;
			File f = new File("../taggeddata/" + category + "/" + filep);
			//System.out.println("../taggeddata/" + category + "/" + filep);
			//write output
			File taggedout = new File("../restdata/" + category);
			taggedout.createNewFile();
			PrintWriter pw = new PrintWriter(new FileWriter(taggedout));
			
			
			while(f.exists() || filep<4500){
				if(f.exists()){
					Scanner fscan = new Scanner(f);
					ArrayList<String> filecontent = new ArrayList<String>();
					while(fscan.hasNext()){
						filecontent.add(fscan.nextLine());
					}
					fscan.close();
				
					ArrayList<String> taggedFile = extract(filecontent, type);
					for(String s: taggedFile){
						if(s.contains("\\")){
							int index = taggedFile.indexOf(s);
							s=s.replaceAll("\\\\", " ");
							s=s.replaceAll("/", " ");
							taggedFile.set(index, s);
						}
					}
				
					for(String ts:taggedFile){
						pw.write(ts + "\n");
					}
				}
				filep++;
				f = new File("../taggeddata/" + category + "/" + filep);
			}
			pw.close();
		}
		
	}
	
	public static ArrayList<String> extract(ArrayList<String> input, String type){
		ArrayList<String> out = new ArrayList<String>();
		for( String s : input ){
			 String [] words = s.split(" ");
			 String tarwords = "";
			 for(String w : words){
				 int sep = w.lastIndexOf("/");
				 if(sep != -1){
				 	String tail = w.substring(sep);
				 	if(tail.contains(type))
					 	tarwords += w.substring(0, sep) + " ";
				 }
			 }
			 if(tarwords.length()>0)
			 	out.add(tarwords);
		}
		return out;
	}
	
	
	
}