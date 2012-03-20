set -e
# sed on OS X appears to be broken and insists on leaving ^M at the end of this string
PKG=`curl -s http://www.bay12games.com/dwarves/ | grep 'Mac (Intel)' | sed -e 's/<a href="\(.*\)">Mac (Intel)<\/a>/\1/' | perl -pe 's/\r\n|\n|\r/\n/g'`
curl "http://www.bay12games.com/dwarves/${PKG}" -o ${PKG}
bunzip2 ${PKG}
TAR=`echo ${PKG} | sed -e 's/\.bz2//'`
tar xf ${TAR}
rm ${TAR}
