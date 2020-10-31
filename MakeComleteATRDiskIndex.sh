# Creates a file which contains all ATR- Image's Disk Directory's

find . -name *.atr > AllAtrFiles
find . -name *.ATR >> AllAtrFiles
atdir -f AllAtrFiles > ATRImageDirectorys
