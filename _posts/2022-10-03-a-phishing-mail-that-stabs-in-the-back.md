---
title: A Phshing Mail that stabs in the Back
date: 2022-10-03 18:29:00 +100
categories: [computer science]
tags: [storytime,computer science,reverse engineering,linux]
---

On the date of `2022-09-26`, I've got a sus mail from someone pretending to be a professor that I know pretty well, so damn well that I know she would never send me a mail with spelling errors.

For the respect of my professors and my school's privacy, I will _redact_ (figuratively) names, and I will also be changing name of some files.

The mail had a file called: `somethingImportant.zip`

I gues it's the malware the attacker hoped i would open... okay, let's open it on a VM just to make sure:

extracting the file you get:
```bash
$ unzip somethingImportant.zip 
Archive:  somethingImportant.zip
  inflating: anHtmlFile.html
```

So the `.zip`-file has only one file, and it's a `.html`-file.

Guessing the HTML contains some unsafe javascript code, I opened it on editor instead to see it's content, and I see:

```html
<!doctype html>
<html lang="en">
<head>
	<title>Y155</title>
	<style type="text/css">
	html, body{
		font-style: Tahoma, sans-serif;
	}
	.aopMsetisamile{
		font-style: Tahoma, sans-serif;
		font-size: 16px;
	}
	</style>
</head>
<body>
	<div style="margin: 50px;">
		<h3>File opening error</h3>
		<p>See file <b>ievrmluaEt.zip</b> in downloaded files</p>
		<p>Password: <b>K789</b></p>
        <script type="text/javascript">var mazeinqhsgm='bWFuLi4uIGxldCdzIHNheSBpdCdzIGEgZmlsZSwgaSdtIG5vdCBnb2luZyB0byBwdXQgdGhlIHdob2xlIGJhc2U2NCB0eHQgOi8=
        ...
        // the base64 is longer than this
```

so the file indeed contained some javascript code, but it seems obfuscated...
But here is what i found interesting during the analysis of the malware with a friend of mine:

* this in js: `!![]` means `true`, so the attacker used it for a while loop:

```js
while(!![]){
    try{
        ...
        if(...) break;
    }catch(error){

    }
}
```

* you can use a function without storing it into a variable if you just want to use it once:

```js
(function(meme_template){console.log('hey sir can a get a '+meme_template+'?')})("BO'OH'O'WA'ER");
// output is: hey sir can a get a BO'OH'O'WA'ER?
```

* you can rotate an array with just one line:

```js
my_array = ['a', 'b', 'c', 'd']
my_array['push'](my_array['shift']())
// now my_array is: [ "b", "c", "d", "a" ]
```

That's it, that was the things that i've found interesting from the attacker during his JS-obfuscation:

Anyhow, after the analysis with my friend, I've found that what this JS-does, is forcing a download of a file stored in the long b64 variable.

The downloaded file is another `.zip`-file, that contains an `.iso`-file, which at the end contained a kind of Trojan. (actually i got borred, because too much reverse engineering)

The most bizarre/interesting thing, is the date of reciving the mail coincided with the date of release of a video of John Hammond in which he explained how to force the download of a file in an HTML page.

Here is the video:

<iframe width="560" height="315" src="https://www.youtube.com/embed/KTxsBW9SkOU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Thanks for reading!