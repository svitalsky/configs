# vyroba spellcheck slovniku pro vim by vim ze slovniku OO.o
all: cs cs-iso cesky

cs:
	unzip cs_CZ.zip
	vim -c "mkspell cs cs_CZ" -c q
	/bin/rm -f cs_CZ.aff cs_CZ.dic README_cs_CZ.txt


cs-iso:
	unzip cs_CZ.zip
	LANG=cs_CZ vim -c "mkspell cs cs_CZ" -c q
	/bin/rm -f cs_CZ.aff cs_CZ.dic README_cs_CZ.txt


cesky:
	unzip cs_CZ.zip
	cstocs -i il2 ascii cs_CZ.aff
	cstocs -i il2 ascii cs_CZ.dic
	sed "1D" cs_CZ.aff > .tmptmptmptmptmpxxx
	echo "SET ASCII" > cs_CZ.aff
	cat .tmptmptmptmptmpxxx >> cs_CZ.aff
	vim -c "mkspell -ascii cesky cs_CZ" -c q
	/bin/rm -f cs_CZ.aff cs_CZ.dic README_cs_CZ.txt .tmptmptmptmptmpxxx
