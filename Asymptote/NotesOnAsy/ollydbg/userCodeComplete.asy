file fin=input("asy-keywords.el");
file outone=output("asy.xml");
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
write(outone,"<?xml version=\"1.0\" encoding=\"Windows-1252\" ?>
<NotepadPlus>
<AutoComplete>
<Environment ignoreCase=\"no\" startFunc=\"(\" stopFunc=\")\"
paramSeparator=\",\" terminal=\";\" />");
for(int i=0;i<asykeywords.length;++i){
write(outone,"<KeyWord name=\""+asykeywords[i]+"\" />",suffix=endl);
}
write(outone,"</AutoComplete>",suffix=endl);
write(outone,"</NotepadPlus>",suffix=endl);
