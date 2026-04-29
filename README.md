# I Ching -- Book of Changes
Operational Mechanics for the Book of Changes


書不盡言
Writing cannot express words completely.
言不盡意
Words cannot express thoughts completely.
...
聖人立象以盡意
The sages set up the images to express their thoughts completely;
設卦以盡情偽
they derived the hexagrams in order to express the true and false.
繫辭以盡其言
Then they appended judgements and so could express their words completely.


The Book of Changes
(I Ching 易經 =Changes Classic, or Chou I 周易 =Zhou Changes)
is an ancient Chinese oracle.
There were earlier precursors, but came into use in something like
its current form circa 1000 BCE.  It is still in wide use today.

The basic idea is that one has a very important question or problem,
asks the question, performs a casting/divination (divides bundle of
yarrow stalks or casts coins by formula) and builds up from the bottom
a series of 6 broken or whole lines (a hexagram) which comments on the
current condition and also yields zero or more "changing lines" which
give a new hexagram prognosticating tendency for the future.

The ancient, bronze age, text was created in what has been described
as a pre-moral psychology which is very different than our "modern"
viewpoints.  However the commentaries and interpretations have
evolved, conservatively, with changing world views.  The usage
has gone from one of asking for adanced notice to please ancestral spirits
(just prognosticating) to asking advise on attitude and how to proceed
(collected wisdom).  Where am I?  What can I do about it?

Many views of how this works.  See "TheoryOfOperation.txt" in this repo.

One usually starts being agitated/concerned about something.
- Posing a terse question requires some focus.
- Dividing bundles of Yarrow sticks or casting coins is a calming ritual.
- Contemplating the resulting images leads to lateral thinking and widens one's point of view.


````smalltalk
  Feature require: 'IChing'.
  IChingResponsePanel forHexagram: (Hexagram cast).
  "OR WorldMenu -> New Morph.. --> --> IChingResponsePanel"
````

So you really don't have to have a specific set of beliefs about doing this to derive the benefit: more flexible thinking and calming effect similar to Japanese tea ceremony.

The code here yields text derived from the  Wilhelm Baynes translation:
  https://clovemedia.github.io/i_ching
hardcover (recommended!):
  https://www.amazon.com/exec/obidos/ASIN/069109750X/qid%3D996565491/sr%3D2-1/102-1791842-4862542

There are many useful references on the Web:
  https://www.biroco.com/yijing/links.htm

There is a great intro to usage at
  https://www.biroco.com/yijing/index.htm

I particularly like a recent reinterpretation:
  https://www.biroco.com/yijing/Language_of_the_Lines.pdf

Four translations are available at
  http://www.russellcottrell.com/VirtualYarrowStalks/

Chinese characters require Unicode to display.

To view a translation of the bronze age text in Cuis, 
open or load IChing.txt into tha TextEditor, select All, 
change font (cmd-k).
"pingfang-sc-regular.ttf" font shows as "PingFang SC".

You can also require 'StyledIChing' and
````smalltalk
  IChingText openStyledTextIChing.
````
to view in the StyledText Editor.

A very interesting observation of hexagram structure is at
  https://www.yijing.nl/structures/Gritter.html   
See GritterTransformMorph class:
````smalltalk
  G := GritterTransformMorph fromKingWen openInWorld.
  G showSpecialsWIthSymmetrics.
  G animateToGritter.
````
Enjoy!

