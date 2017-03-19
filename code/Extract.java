import java.io.*;
import java.util.*;
 
public class Extract{
	public static void main(String[] args) throws IOException, FileNotFoundException{
		if(args.length != 1){
			System.out.println("usage: Extract <String of targeting type (case sensitive)>");
			return;
		}
		
		String type = args[0];
		
		//read categories into a list
        Scanner scat = new Scanner(new File("restaurants.txt"));
		ArrayList<String> cat = new ArrayList<String>();
		
		while(scat.hasNext()){
			cat.add(scat.nextLine());
		}
 	   
	   	scat.close();
		//make directories
		for(String category : cat){
			boolean suc = new File("../extractdata/" + category).mkdirs();
		}
		
		//loop through the files in categories folder;
		for(String category : cat){
			int filep = 1;
			File f = new File("../taggeddata/" + category + "/" + filep);
			System.out.println("../taggeddata/" + category + "/" + filep);
			while(f.exists() || filep < 4500){
				if(f.exists()){
					Scanner fscan = new Scanner(f);
					ArrayList<String> filecontent = new ArrayList<String>();
					while(fscan.hasNext()){
						filecontent.add(fscan.nextLine());
					}
					fscan.close();
				
					ArrayList<String> taggedFile = extract(filecontent, type);
				
				//write output
					File taggedout = new File("../extractdata/" + category + "/" + filep);
					taggedout.createNewFile();
					PrintWriter pw = new PrintWriter(new FileWriter(taggedout));
					for(String ts:taggedFile){
						pw.write(ts + "\n");
					}
					pw.close();
				
				}
				filep++;
				f = new File("../taggeddata/" + category + "/" + filep);

			}
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