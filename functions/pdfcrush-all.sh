#!/bin/zsh

# File content
read -r -d '' function_comments << EOM
# Compresses and overwrites all PDF files in a folder.
EOM

read -r -d '' function_commands << EOM
for pdf in *.pdf(.N); do
    printf "Compressing \$pdf...\\\\n"
    ps2pdf -dPDFSETTINGS=/ebook "\$pdf" output.pdf 2> /dev/null
    mv output.pdf "\$pdf"
done;
EOM

# Adding content to function file
path_to_function=$ZDOTDIR/.zsh_functions/pdfcrush-all
echo "$function_comments" > $path_to_function
echo "$function_commands" >> $path_to_function
