---
title: A Mojibake Experience
date: 2022-08-26 18:53:00 +100
categories: [computer science]
tags: [storytime,computer science,linux,mojibake,meme]
---

The story began when I found a youtube video about a meme in niconico-douga (コメ付き).
A video that, when I watched it, I shat myself laughing, which is the following:

<iframe width="560" height="315" src="https://www.youtube.com/embed/LciNOuifV5o" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

It's like a YTP of Kotoura-san, but with mitary-style voice acting.
What got my attention was that GYUUUUHN scream at 5:45.

At that moment, I could just record the autio and end it here, BUT my brain said: NO!
`¯\_(ツ)_/¯`

me be like: damn I wanna have the sound library with which they make these video montages... :D

One of the comments (niconico-douga comment that you find in the video, not a comment on youtube) written at the same timestamp (5:45) was: ぎゅぅぅぅぅぅぅん↓

I searched on Youtube: `日本兵サウンドライブラリー` (in english: sound library of japanese soldiers)
then I've found a veeeeery long video (7 hours long, oh shit):

<iframe width="560" height="315" src="https://www.youtube.com/embed/b9weLXVrEkI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Ouf, the list of audios in the vid is ordered, as the order of the japanese kana:
as: a-i-u-e-o ka-ki-ku-ke-ko ... etc.
audio part found: it's at 1:07:17 of the video, and the title of the audio is: ぎゅぅう！

me be like: oh nice! the author of the video has left in the description a downloadable file :)


I download ... it's zip-file with the name `日本語音声素材集2020.zip` with the size of `1.8Gb`
(`1.8Go` for the frenchies :3)
I unzip:

```bash
unzip 日本語音声素材集2020.zip # (linux command)
```

And here ... I saw Hell... the contents of the files are certainly not corrupted, but the names of the folders and files are in "hieroglyphics"!!! BUT NOT ONLY THAT!!! the audios are also in subfolders!!! so the order is changed compared to the video...

At that moment, I discovered the term ["Mojibake" (文字化け)](https://en.wikipedia.org/wiki/Mojibake).
But there was a hint that helped me: when I unziped the zip-file, the extraction gave me a folder that contains everything instead of all of the subfolder directly, basically the main folder, and its name was `У·Ц{МъЙ╣Р║СfН▐ПW`. And taht means most likely the name of the zip-file but encoded differently (`日本語音声素材集2020`, but without the `2020` part).

I instantly understood.

So I understood that the assignment in mojibake of `日本語音声素材集` (without `2020` at the end) is `У·Ц{МъЙ╣Р║СfН▐ПW`.

I did some research on the encoding, I found that Japanese characters are normally done in `Shift_JIS` encoding... noice so I have at least the destination encoding... I just need the source encoding.
after a big trouble I could find that the encoding of `У·Ц{МъЙ╣Р║СfН▐ПW` is in `IBM866`.
to check, I used a site that transforms the texts by changing the encodings:

[https://www.online-decoder.com/el/ei](https://www.online-decoder.com/el/ei)
(the website seems to give a 502 Bad Gateway error).

to check if I'm right: I took `У·Ц{МъЙ╣Р║СfН▐ПW` and transformed the encoding:
from `IBM866` to `Shift_JIS`

the result was: `日本語音声素材集`

me be like: yeeeeeeeeeeah

so I took this string: `ぎゅぅう！.wav` (yeah because all the audio in this zip have `.wav` as file-extention):
from `Shift_JIS` en `IBM866`
the result was: `ВмВуВгВдБI.wav`

I only thing I had to do was to:

```bash
find -name "ВмВуВгВдБI.wav" -type f
```

and the result is:
`./У·Ц{МъЙ╣Р║СfН▐ПW/MoHPA/Г_ГББ[ГWБEЩЇЪK/ВмВуВгВдБI.wav`

I play the audio I found to check: it is the audio I was looking for!

NIIIIIIIIIIIIIIIIIICE!!!!!!!!!!!

END 
