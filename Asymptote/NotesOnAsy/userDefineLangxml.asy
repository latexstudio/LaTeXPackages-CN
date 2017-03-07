file fin=input("asy-keywords.el");

file outtwo=output("userDefineLang.xml");

string[] two=fin.dimension(0);
int[] idx;
for(int i=0;i<two.length;++i){
  if(find(two[i],"))")!=-1)
    idx.push(i);
  two[i]=erase(two[i],length(two[i])-3,3);
}

write(outtwo,"
<NotepadPlus>
  <UserLang name=\"Asy\" ext=\"asy\">
    <Settings>
      <Global caseIgnored=\"yes\" />
      <TreatAsSymbol comment=\"yes\" commentLine=\"yes\" />
      <Prefix words1=\"no\" words2=\"yes\" words3=\"no\" words4=\"yes\" />
    </Settings>
    <KeywordLists>
      <Keywords name=\"Delimiters\">\"'0\"'0</Keywords>
      <Keywords name=\"Folder+\">{</Keywords>
      <Keywords name=\"Folder-\">}</Keywords>
      <Keywords name=\"Operators\">' - ! \" ( ) , . ; ? @ [ ] &lt; &gt;</Keywords>
      <Keywords name=\"Comment\">1/* 2*/ 0//</Keywords>
");



for(int i=0;i<idx.length;++i){
  write(outtwo,"<Keywords name=\"Words"+string(i+1)+"\">"+two[idx[i]]+"</Keywords>",suffix=endl);
}


write(outtwo,"
        </KeywordLists>
        <Styles>
            <WordsStyle name=\"DEFAULT\" styleID=\"11\" fgColor=\"000000\" bgColor=\"FFFFFF\" fontName=\"\" fontStyle=\"0\" />
            <WordsStyle name=\"FOLDEROPEN\" styleID=\"12\" fgColor=\"FF0000\" bgColor=\"FFFFFF\" fontName=\"\" fontStyle=\"0\" />
            <WordsStyle name=\"FOLDERCLOSE\" styleID=\"13\" fgColor=\"FF0000\" bgColor=\"FFFFFF\" fontName=\"\" fontStyle=\"0\" />
            <WordsStyle name=\"KEYWORD1\" styleID=\"5\" fgColor=\"FF8040\" bgColor=\"FFFFFF\" fontName=\"Consolas\" fontStyle=\"1\" fontSize=\"10\" />
            <WordsStyle name=\"KEYWORD2\" styleID=\"6\" fgColor=\"91A62D\" bgColor=\"FFFFFF\" fontName=\"Consolas\" fontStyle=\"2\" fontSize=\"10\" />
            <WordsStyle name=\"KEYWORD3\" styleID=\"7\" fgColor=\"004080\" bgColor=\"FFFFFF\" fontName=\"Consolas\" fontStyle=\"0\" fontSize=\"10\" />
            <WordsStyle name=\"KEYWORD4\" styleID=\"8\" fgColor=\"FF0000\" bgColor=\"FFFFFF\" fontName=\"Consolas\" fontStyle=\"0\" fontSize=\"10\" />
            <WordsStyle name=\"COMMENT\" styleID=\"1\" fgColor=\"FF8080\" bgColor=\"FFFFFF\" fontName=\"Consolas\" fontStyle=\"2\" fontSize=\"10\" />
            <WordsStyle name=\"COMMENT LINE\" styleID=\"2\" fgColor=\"008000\" bgColor=\"FFFFFF\" fontName=\"Consolas\" fontStyle=\"2\" fontSize=\"10\" />
            <WordsStyle name=\"NUMBER\" styleID=\"4\" fgColor=\"D9006C\" bgColor=\"FFFFFF\" fontName=\"Consolas\" fontStyle=\"0\" fontSize=\"10\" />
            <WordsStyle name=\"OPERATOR\" styleID=\"10\" fgColor=\"008040\" bgColor=\"FFFFFF\" fontName=\"\" fontStyle=\"0\" />
            <WordsStyle name=\"DELIMINER1\" styleID=\"14\" fgColor=\"AF2BFF\" bgColor=\"FFFFFF\" fontName=\"\" fontStyle=\"0\" />
            <WordsStyle name=\"DELIMINER2\" styleID=\"15\" fgColor=\"AF2BFF\" bgColor=\"FFFFFF\" fontName=\"\" fontStyle=\"0\" />
            <WordsStyle name=\"DELIMINER3\" styleID=\"16\" fgColor=\"000000\" bgColor=\"FFFFFF\" fontName=\"\" fontStyle=\"0\" />
        </Styles>
    </UserLang>
</NotepadPlus>
");

