echo =====================================
echo Searching the arXiv for the new stuff
echo http://arxiv.org/list/cond-mat/new
echo =====================================
echo keyword: $1
echo =====================================
echo Articles found: 
curl -s http://arxiv.org/list/cond-mat/new | grep -iw Title: | sed 's/.*>/+/g' | grep $1 | wc -l
curl -s http://arxiv.org/list/cond-mat/new | grep -iw Title: | sed 's/.*>/+/g' | grep $1
echo =====================================
