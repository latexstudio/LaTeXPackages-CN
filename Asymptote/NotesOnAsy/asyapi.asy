file fin=input("asy-keywords.el");
file out=output("asy.api");
string[] one=fin.word();
int[] index;
int[] rindex;
for(int i=0;i<one.length;++i){
if(find(one[i],"'(")!=-1) index.push(i);
if(find(one[i],"))")!=-1) rindex.push(i);
}
string[][] keywords;
for(int i=0;i<index.length;++i){
keywords[i]=one[index[i]+1 : rindex[i]];
}
string[] asykeywords=concat(...keywords);
asykeywords=sort(asykeywords);
for(int i=0;i<asykeywords.length;++i){
//write(out,asykeywords[i],suffix=endl);
write(out,asykeywords[i]+'\r\n');
}

