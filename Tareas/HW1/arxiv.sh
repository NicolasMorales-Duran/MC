echo =====================================
echo Searching the arXiv for the new stuff
echo http://arxiv.org/list/cond-mat/new
echo =====================================
echo keyword: $1
echo =====================================

curl http://arxiv.org/list/cond-mat/new | grep -iw Title: | sed 's/.*>/+/g' | grep $1