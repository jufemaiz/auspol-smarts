import nltk
import json
import sys
from nltk.corpus import cmudict
from re import match

cmu = cmudict.dict()

def syllable_count(word):
	reduced = reduce(word)
	if (not len(reduced)) or (not reduced in cmu):
		return 0
	return len([x for x in list(''.join(list(cmu[reduced])[-1])) if match(r'\d', x)])

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
    print str(totalwords) + "Words"
    print str(totalsentences) +"Sentences"
    print str(totalsyllables) +"Syllables"
    return (0.39 * (totalwords / totalsentences)+ 11.8 * (totalsyllables / totalwords)- 11.59 )


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


main()