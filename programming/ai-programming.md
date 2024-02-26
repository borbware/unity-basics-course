---
marp: true
paginate: true
title: Using AI as a programming aid
math: mathjax
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Using Generative AI for programming

## The rise of generative AI

* [Generative AI](https://en.wikipedia.org/wiki/Generative_artificial_intelligence) is the new hotness in the whole IT field
* Generative AI models
  * ...learn the patterns and structure of their input training data
  * ...generate new data that has similar characteristics
  * a.k.a. write a prompt, and you get text/code/images/videos/music/etc
* [Large Language Model (LLM)](https://en.wikipedia.org/wiki/Large_language_model) is a form of generative AI
  * OpenAI's GPT series has been particularly notable, and this technology fuels [ChatGPT](https://chat.openai.com/)

## Why?

## ChatGPT

* milloin kannattaa käyttää
  * esimerkkejä
  * tiedonhaku vs valmiin koodin tuotto


## GitHub Copilot

* GitHub's [paid code auto-completion service](https://github.com/features/copilot) that is advertised as *AI pair programming*
* What is it *really*?
  * See Copilot [here](https://www.youtube.com/watch?v=edSZh-tpTIk) in action
  * It looks like magic, right?
* Could be useful for generating basic boilerplate code
* But wait, there's `var` variables there...
  * Due to their scope problems, they shouldn't be used nowadays!
* I know this, but if you're using Copilot as a junior dev, YOU might not
* Worse, due to using AI for basic stuff, you might never even learn some basics

## How does it work?

* All AI models need data
* GitHub Copilot uses data from GitHub without GitHub users' consent
* AI does not know when it's wrong, when it's using bad practices
* TBH, it does not *know* anything
  * It just returns an answer that best matches your prompt
  * It might be exactly what you need, but it also might not
* Future is worse: At some point, AI will be taught on AI-generated code


## Using ChatGPT effectively

* I asked a senior developer who uses ChatGPT for its merits
* Here's the results
1) Finds the cause for a given error message faster than me
     * Give code & error message -> ChatGPT gives fixed code as a result
2) 

## ChatGPT 4 notes by peetu

* en yleesä käytä koodin kirjottamiseen
* voi olla nopeempi löytää virheviestin syyn ku seniori
  * ei piä paikkaasa t JR
    * toimii jos teet jotain mitä muutkin on tehny
  * syöttää virheviestin
    * -> antaa korjatun koodin vastineeksi
* tosi hyvä lukemaan dokumentaatiota
  * varsinkin jos ei oo tavallisin tapa käyttää jotain kirjastoa
  * (käyttää githubin esimerkkikoodia)
* hyvä selittää arkkitehtuurisia ratkasuja
  * "pitäs pistää aws:ssä palvelu pystyyn x määrälle ihmisiä"
  * "miten aws:ssä laittaa event based palvelu"
* "ei se aina oikee oo, mut se on yllättävän tarkka"

* molemmat:
  * regexien kirjottaminen!
  * apufunktiot
* Copilot:
  * "make sure this is 4 characters long"
    * koodaa validaatio automaattisesti
* copilotilla voi tehä samoja juttuja

## ronkainen

* korkean tason speksit. "mun pitäis tehä tällanen softa"
  * antaa pohjan
  * harvemmin siitä jää yhtään riviä jälelle
  * siitä on hyvä alottaa
* koodia mistä et ymmärrä yhtään mitään (TÄMÄ!)
  * sanot chatgpt:lle: muuta tää pythoniksi
* cpp:n kanssa ei oikein toimi koska maailmassa on niin paljon paskaa cpp :D
  * myös vanhentunutta
  * kun kieli on tarkka omasta syntaksistaan niin auttaa chatgptssä asdf
  * rust hyvä, cpp huono
* kun pitää tehä jotain ihan uutta


## Is it any good?

* Let's ask ChatGPT!
* Summary:
  * Makes mistakes
  * Doesn't understand context
  * ...And I somewhat disagree the pros 3-5

![bg right width: 86%](imgs/chatgpt-programming.png)

## Let's also ask Linus

![](imgs/linus-copying.png)

## AI is a good servant, but a bad master

## Reading

* [Tekoäly on hyvä renki mutta huono isäntä - näin algoritmit muuttavat yhteiskuntaa ja arkeamme](https://www.helsinki.fi/fi/uutiset/tekoaly/tekoaly-hyva-renki-mutta-huono-isanta-nain-algoritmit-muuttavat-yhteiskuntaa-ja-arkeamme)
* [Patrick Boyle: Is AI Actually Useful?](https://www.youtube.com/watch?v=FTs35x-xUg4)
* [Tom Scott: I tried using AI. It scared me.](https://www.youtube.com/watch?v=jPhJbKBuNnA)