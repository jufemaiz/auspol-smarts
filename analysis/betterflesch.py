import nltk
import json
import sys
import _mysql
from nltk.corpus import cmudict
from re import match
global debug
debug=0
global db
db=_mysql.connect(host="localhost",port=3306,user="govhacker",passwd="govhacker",db="govhack")
cmu = cmudict.dict()
workfile=open('output.txt','w')

def getmembers():
    querystring="SELECT aphkey, first_name, last_name from members"
    db.query(querystring)
    memberlist=db.store_result()
    return(memberlist)


def getcorpus(memberid):
    querystring="SELECT content FROM speeches where member_id='"+str(memberid)+"' and length(content) > 5 LIMIT 0, 10000 "
    db.query(querystring)
    dbresult=db.store_result()
    return(dbresult)

def syllable_count(word):
    reduced = reduce(word)
    if debug==20:
        print reduced
    if (not len(reduced)) or (not reduced in cmu):
        return 1.6
    newlength=len([x for x in list(''.join(list(cmu[reduced])[-1])) if match(r'\d', x)])
    if debug==20:
        print newlength
    return(newlength)

def reduce(word):
	return ''.join([x for x in word.lower() if match(r'\w', x)])

def fkgrade(text):
    sentences = nltk.tokenize.sent_tokenize(text)
    totalwords = 0
    totalsyllables = 0
    totalsentences = len(sentences)
    for sentence in sentences:
        words = nltk.tokenize.word_tokenize(sentence)
        words = [reduce(word) for word in words]
        words = [word for word in words if word != '']
        totalwords += len(words)
        syllables = [syllable_count(word) for word in words]
        totalsyllables += sum(syllables)
        totalwords = float(totalwords)
        score = (0.39 * (totalwords / totalsentences)+ 11.8 * (totalsyllables / totalwords)- 15.59 )
    if debug==5:
        print str(totalwords) + "Words"
        print str(totalsentences) +"Sentences"
        print str(totalsyllables) +"Syllables"
        print str(score) + " FK Score"
    return (score)


def main():
    if len(sys.argv) == 1:
        filename=raw_input('Enter filename')
        workfile=open(filename, 'r')
        corpus=workfile.read()
    else:
        workfile=open(sys.argv[1], 'r')
        corpus= workfile.read()
    result=fkgrade(corpus)
    print result


#main()
memberlist=getmembers()
for i in range(int(memberlist.num_rows())):
    for i in range (0,19):
        member=memberlist.fetch_row()
    memberid=member[0][0]
    corpus=getcorpus(memberid)
    fkscorelist=list()
    for i in range(1,int(corpus.num_rows())):
        if debug==10:
            print str(i) +"/" +str(int(corpus.num_rows()))
        speechrow=corpus.fetch_row();
        speech=speechrow[0][0]
        if len(speech) > 1:
            try:
                speechscore=fkgrade(speech)
                fkscorelist.append(speechscore)
            except:
                print "Something went wrong scoring this speech"
    try:
        fkscore=float(sum(fkscorelist) / len(fkscorelist))
        workline=str((memberid)+str(member[0][1])+str(member[0][2])+str(fkscore))
        workfile.write(workline)
        workfile.write('\n')

    except:
        print "Something went wrong calculating this FK Score."
        print str(memberid)+str(member[0][1])+str(member[0][2])
        print str(sum(fkscorelist)) + " FK Score Combined"
        print str(len(fkscorelist)) + " List length"
    print str(memberid)+str(member[0][1])+str(member[0][2])+str(fkscore)

workfile.close()
