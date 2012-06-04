import nltk
import json
import sys


def vocab(corpus):
    tokens=nltk.word_tokenize(corpus)
    uniques=(sorted(set(tokens)))
    vocab=len(uniques)
    fdist=nltk.FreqDist(tokens)
    topwords=fdist.keys()
    bottomwordmark=len(topwords)-5
    bottomwords=topwords[bottomwordmark:]
    longwords=list()
    longestsofar=0
    for word in tokens:
        if len(word) > longestsofar:
            longwords.append(word)
            longestsofar=len(word)
    #print longest
    results=dict()
    results['vocab']=vocab
    results['topwords']=topwords[:20]
    results['bottomwords']=bottomwords
    longestword=len(longwords)-5
    results['longestword']=longwords[longestword:]
    return(results)



def main():
    if len(sys.argv) == 1:
        filename=raw_input("You didn't pass me an arg. Filename?")
        workfile=open(filename, 'r')
        corpus=workfile.read()
    else:
        workfile=open(sys.argv[1], 'r')
        corpus= workfile.read()
    result=vocab(corpus)
    print result


main()