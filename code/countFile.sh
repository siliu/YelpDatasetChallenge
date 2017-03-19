for i in `ls`; do echo $i >> categories.txt ;  done 

function countFile {
	cd $1
	# echo $1 >> ../count.txt
	B=`ls -1| wc -l`  
	echo $1, $B >> ../count.txt
}
for i in `cat categories.txt`; do countFile $i; cd /Users/pinxiaye/Documents/MS-CS/522/project/reviewdata/;  done 

