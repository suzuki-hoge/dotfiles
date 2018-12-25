command! -range          ToMarkdown <line1>,<line2>call aligner#convert#toMarkdown()
command! -range          ToCsv      <line1>,<line2>call aligner#convert#toCsv()
command! -range -nargs=+ Align      <line1>,<line2>call aligner#convert#align(<f-args>)
