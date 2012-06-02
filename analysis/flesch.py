sentence = "I am a man more sinned against than sinning" +"."

def to_cv(word):
    cv_list = []
    for ch in word:
        if ch in 'aeiou':
            cv_list.append('v')
        else:
            cv_list.append('c')
    return cv_list

def count_cv(cv):
    count = 0
    i = 0
    while i < len(cv) - 1:
        if cv[i] == 'c' and cv[i+1] == 'v':
            count += 1
        i += 1
    return count

def count_vowel_groups(word):
    cv = to_cv(word)
    count = count_cv(cv)
    if cv[0] == 'v':
        count += 1
    return count

def count_syllables_in_word(word):
    vgc = count_vowel_groups(word)
    if vgc == 0:
        return 1
    else:
        return vgc

def count_syllables(text):
    words = text.split()
    total_syllables = 0
    for w in words:
        total_syllables += count_syllables_in_word(w)
    return total_syllables

def count_sentences(s):
    return s.count('.') + s.count('!') + s.count('?')

def count_words(s):
    return len(s.split())


def summarize(s):
    try:
        text = open(s, 'r').read().lower()
        print 'Successfully opened ' + s
    except IOError:
        text = s

    # get text stats
    sy_count = count_syllables(text)
    w_count = count_words(text)
    sent_count = count_sentences(text)

    # FRES: Flesch Readability Ease score
    fres = 206.876 - 1.015 * (float(w_count)/sent_count) - 84.6 * (float(sy_count)/w_count)

    # Flesch-Kincaid Grade Level
    fkgl = 0.39 * (float(w_count)/sent_count) + 11.8 * (float(sy_count)/w_count) - 11.59

    # print readability report
    print
    print 'Readability report for ' + s

    print 'Total # syllables: ' + str(sy_count)
    print 'Total # words: ' + str(w_count)
    print 'Total # sentences: ' + str(sent_count)
    print 'Flesch-Kincaid grade level: ' + str(fkgl)


def main():
    usersentence=""
    usersentence=raw_input('Please enter a sentence or paragraph')
    sentence = usersentence + "."
    summarize(sentence)

main()