# Quiz Question Answering Challenge

The goal of the task is to develop solution capable of providing answers to general-knowledge questions typical for  the popular TV quiz shows, such as [Fifteen to One](https://en.wikipedia.org/wiki/Fifteen_to_One) (PL: [Jeden z dziesięciu](https://pl.wikipedia.org/wiki/Jeden_z_dziesi%C4%99ciu)).

The participants will be provided with:

*   a small development set (question and answers)
*   test set A (without answers; the results will be immediately shown in the leaderboard)
*   test set B (without answers; the results will be shown in the leaderboard in the last week of the competition).

No training set will be provided this time, but participants are free to use all kinds of available offline sources. Thus, caching Wikipedia is fine but asking Google on the fly is not; the system should be ready to run without Internet connection. The answering process also has to be completely automated and not involve any form of human assistance.

# Questions (and answers)
Questions and answers were retrieved from various sources and may correspond to actual questions asked in the quiz shows before.

The questions could be grouped according to the type of answer they seek, for example::

*   A name of a specific entity:
    *   Q: _Jak nazywa się bohaterka gier komputerowych z serii Tomb Raider?_
    *   A: _Lara Croft_
*   A name of a more general category of entities:
    *   Q: _Paź królowej to gatunek których owadów?_
    *   A: _Motyli_
*   True or false value (“tak” or “nie”):
    *   Q: _Czy w przypadku skrócenia kadencji Sejmu ulega skróceniu kadencja Senatu?_
    *   A: _Tak_
*   One of the options, which are given in the question:
    *   Q: _Co zabiera Wenus więcej czasu: obieg dookoła Słońca czy obrót dookoła osi?_
    *   A: _Obrót dookoła osi_
*   Words that complete a given sentence, quote or expression:
    *   Q: _Proszę dokończyć powiedzenie: „piłka jest okrągła, a bramki są…”_
    *   A: _dwie_
*   Numbers:
    *   Q: _Ile pełnych tygodni ma rok kalendarzowy?_
    *   A: _52_
*   Alternative names for a given entity:
    *   Q: _Jaki przydomek nosił Ludwik I, król Franków i syn Karola Wielkiego?_
    *   A: _Pobożny_

Please note that questions can be expressed in various ways, e.g.

*   _Proszę rozwinąć skrót CIA._
*   _Tę samą nazwę noszą pocisk miotany ręką, kamień półszlachetny i owoc południowy. Jaką?_
*   _Ten urodzony w XIX w. Nantes francuski pisarz uchodzi za prekursora literatury fantastycznonaukowej. O kogo chodzi?_
*   _Festiwal filmowy Dwa Brzegi odbywa się jednocześnie w dwóch miejscowościach na dwóch brzegach Wisły. Jedna z nich to Janowiec, a druga?_
*   _Tadeusz Andrzej Bonawentura, walczył o niepodległość USA. Jak brzmi jego nazwisko?_
*   _Zobaczyć... i umrzeć – o które miasto chodzi?_

Answers should also be provided as in a quiz, i.e. they should consist of just a few words that satisfy the question, not a whole sentence or document, like in other QA tasks. Also, answers:

*   can contain prepositions:
    *   Q: _W którym mieście trasa drogi krzyżowej przebiega ulicą Via Dolorosa?_
    *   A: _W Jerozolimie_
*   can be inflected:
    *   Q: _Paź królowej to gatunek których owadów?_
    *   A: _Motyli_
*   can contain punctuation:
    *   Q: _W jakim filmie mężczyzna w białym garniturze zrywa lilie ze stawu?_
    *   A: _„Noce i dnie”_
*   for person names, include first name and surname:
    *   Q: _Który brytyjski pisarz wprowadził do literatury pojęcie Wielkiego Brata?_
    *   A: _George Orwell_

The following types of questions were removed from the set:

*   about current issues (“_Kto jest prezydentem Francji?_”)
*   seeking multiple entities in an answer (“_Proszę podać dwa państwa, przez które przepływa Nil._”); NOTE: questions with exactly two answers are valid and answers can be given in any order: _“Co występuje w powiedzeniu razem z makiem i oznacza nic?” – pasternak i figa / figa i pasternak_
*   related to the rules of spelling (“_Przez jakie ‘h’ piszemy słowo ‘charyzma’?_”)
*   those requiring longer explanations (“_Jakie pokrewieństwo łączyło reżysera Jana Łomnickiego i aktora Tadeusza?_")


# Development data

...


# Test data
Test data are provided as a single UTF-8-encoded tab-separated plain text file in which each line consists of at least three tab-separated columns:

1. Question ID
2. Question text
3. Answer text 1
4. Answer text 2
5. ...

Each question can have a set of equivalent answers, starting in column 3.


# Submission format
Submission file should contains just two tab-separated columns:

1. Question ID
2. Answer text


# Evaluation
The task will be evaluated by comparing the known answer (gold standard) to the one provided by the participating systems (predictions). Specifically, we will compute **accuracy** as the number of matching answers divided by the number of questions in the test set.

Checking if the two answers match will depend on the question type:

1. For non-numerical questions, we will assess textual similarity. To that end, a Levenshtein distance[^1] will be computed between the two (lowercased) strings and if it is less than ½ of the length of the gold standard answer, we accept the candidate answer.

2. For numerical questions (e.g. _In which year…_), we will assess numerical similarity. Specifically, we will use a regular expression to extract a sequence of characters that could be interpreted as a number[^2]. If such sequences can be found in both answers and represent the same number, we accept the prediction.
For some questions, more than one answer text is available, e.g. _Richard I_, _Richard Cœur de Lion_ and _Richard the Lionheart_. In such cases the answer that has the best match with the candidate will be used.


# Baseline

TBC


## Notes

[^1]:

     https://en.wikipedia.org/wiki/Levenshtein_distance

[^2]:

     Note that we will not accept numbers expressed through words (numerals), e.g. _trzynaście_.
