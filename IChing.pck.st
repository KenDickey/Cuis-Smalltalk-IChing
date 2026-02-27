'From Cuis7.7 [latest update: #7839] on 27 February 2026 at 12:40:39 pm'!
'Description Book of Changes [I Ching] exploration.

Note HexaGram class comment.'!
!provides: 'IChing' 1 25!
!requires: 'Cuis-Base' 77 7839 nil!
!requires: 'UI-Panel' 1 19 nil!
!requires: 'Graphics-Files-Additional' 1 24 nil!
SystemOrganization addCategory: #IChing!


!classDefinition: #HexaGram category: #IChing!
Object subclass: #HexaGram
	instanceVariableNames: 'upper lower'
	classVariableNames: 'Names PNGForms TrigramDoubleDict2KingWenIndex'
	poolDictionaries: ''
	category: 'IChing'!
!classDefinition: 'HexaGram class' category: #IChing!
HexaGram class
	instanceVariableNames: ''!

!classDefinition: #Rudiment category: #IChing!
Object subclass: #Rudiment
	instanceVariableNames: 'number polarity'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IChing'!
!classDefinition: 'Rudiment class' category: #IChing!
Rudiment class
	instanceVariableNames: ''!

!classDefinition: #TriGram category: #IChing!
Object subclass: #TriGram
	instanceVariableNames: 'top middle bottom'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IChing'!
!classDefinition: 'TriGram class' category: #IChing!
TriGram class
	instanceVariableNames: ''!

!classDefinition: #HexagramDisplayPanel category: #IChing!
Panel subclass: #HexagramDisplayPanel
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IChing'!
!classDefinition: 'HexagramDisplayPanel class' category: #IChing!
HexagramDisplayPanel class
	instanceVariableNames: ''!


!HexaGram commentStamp: '<historical>' prior: 0!
The third discernment is among compositions of preexisting categories.

Coin Casting:

 (HexaGram fromArray: #( 8 9 6 7 8 8 )) hexagramForChange name.
 Hexagram cast name.

Gritter Pattern: Gert Gritter noted a pattern based upon hexagram symmetry.
  https://www.yijing.nl/structures/Gritter.html

Most hexagrams are paired with their image mirrored about their center.
The King Wen pattern:
    HexaGram kingWenImage openInWorld.

Marking Special hexagram pairs which are the same or inverses:
    HexaGram kingWenPlusSpecialsImage openInWorld.

And rearranging a bit with the Specials down the center:
    HexaGram gritterImage openInWorld.

Number patterns mirror internal numeracy:
  6 - Old      Yin     [changing line]
  8 - Young Yin
  9 - Old      Yang  [changing line]
  7 - Young Yang

Note that one can combine figures 6+9 == 8+7 = 15
which is sum of "magic square" slice:
      4 9 2
      3 5 7
      8 1 6

There are many correspondences with the lunisolar calendar which came into use about the same time as the King Wen sequence.
 https://en.wikipedia.org/wiki/Chinese_calendar!

!Rudiment commentStamp: '<historical>' prior: 0!
The LINE is a rudiment of discernment.

polarity is #whole (yang/found/+/sun) or #broken (yin/absent/-/shade)

number is
  6 - Old      Yin     [changing line]
  8 - Young Yin
  7 - Young Yang
  9 - Old      Yang  [changing line]!

!TriGram commentStamp: '<historical>' prior: 0!
The second discernment is among relations: above/same/below
!

!HexagramDisplayPanel commentStamp: '<historical>' prior: 0!
I display a hexagram, including its changes.

(HexagramDisplayPanel forHexagram: (HexaGram cast)) openInWorld.!

!HexaGram methodsFor: 'accessing' stamp: 'KenD 15/Jan/2022 13:54:33'!
changedLinesText

	"Answer string with changed line text"
	| stringResult upperLines lowerLines |
	stringResult := ''.
	upperLines :=  upper lines.
	lowerLines  :=  lower lines.
	3 to: 1 by: -1 do: [ :idx | | upperLine |
		upperLine := upperLines at: idx. "6 5 4"
		(upperLine willChange)
		ifTrue: [ | position |
			position := idx + 3.
			stringResult := 
				stringResult,
				upperLine number asString,
				' in the ',
				(#( '1st' '2nd' '3rd' '4th' '5th' 'top' ) at: position),
				' place', 
				String newLineString]
	].
	3 to: 1 by: -1 do: [ :place | | lowerLine |
		lowerLine := lowerLines at: place. "3 2 1"
		(lowerLine willChange) ifTrue: [ 
			stringResult := 
				stringResult,
				lowerLine number asString,
				' in the ',
				(#( '1st' '2nd' '3rd' '4th' '5th' '6th' ) at: place),
				' place', 
				String newLineString
		]
	].
	^ stringResult! !

!HexaGram methodsFor: 'accessing' stamp: 'KenD 14/Jan/2022 13:56:42'!
form

	^ PNGForms at: self kingWenIndex ! !

!HexaGram methodsFor: 'accessing' stamp: 'KenD 17/Jan/2022 11:30:51'!
icon
	"Answer a form"

	^ self form magnifyTo: 16@16! !

!HexaGram methodsFor: 'accessing' stamp: 'KenD 17/Jan/2022 14:04:22'!
image

	^ ImageMorph new image: (self form magnifyTo: 64@64)! !

!HexaGram methodsFor: 'accessing' stamp: 'KenD 14/Jan/2022 12:38:23'!
kingWenIndex

	^ (TrigramDoubleDict2KingWenIndex at: lower name)
		at: upper name! !

!HexaGram methodsFor: 'accessing' stamp: 'KenD 14/Jan/2022 12:38:36'!
lower

	^lower! !

!HexaGram methodsFor: 'accessing' stamp: 'KenD 14/Jan/2022 13:04:50'!
name

	^ Names at: self kingWenIndex ! !

!HexaGram methodsFor: 'accessing' stamp: 'KenD 14/Jan/2022 12:37:51'!
unicodeIndex
	"Answer unicode index for character"

	^ 19903 + self kingWenIndex! !

!HexaGram methodsFor: 'accessing' stamp: 'KenD 14/Jan/2022 12:39:11'!
upper

	^upper! !

!HexaGram methodsFor: 'initialization' stamp: 'KenD 14/Jan/2022 12:45:31'!
upper: topHexagram lower: bottomHexagram

	upper := topHexagram.
	lower  := bottomHexagram.
	! !

!HexaGram methodsFor: 'changing' stamp: 'KenD 14/Jan/2022 12:45:54'!
hexagramForChange

	^ HexaGram 
		upper: (self upper trigramForChange)
		lower:  (self lower  trigramForChange)! !

!HexaGram class methodsFor: 'instance creation' stamp: 'KenD 15/Jan/2022 08:15:36'!
cast
	"Emulate throwing coins and return new hexagram"

	| newRand seed lineValues casting |
	
	[seed := (Time millisecondClockValue bitAnd: 16r3FFFFFFF). "bitXor: self hash."
	 seed = 0] whileTrue: ["Try again if ever get a seed = 0"].

	newRand := Random new seed: seed.
	lineValues := Array new: 6.
	casting := [ (newRand nextInteger: 2) + 1 ]. "2->yin;3->yang"
	1 to: 6 do: [ :idx | | one two three |
		one   := casting value.
		two    := casting value.
		three := casting value.
		lineValues at: idx put: one + two + three.
	].
	^ self fromArray: lineValues

! !

!HexaGram class methodsFor: 'instance creation' stamp: 'KenD 14/Jan/2022 12:48:43'!
fromArray: sixNumberArray
	"Line Numbers: low to high"
	^ self 
		upper: (TriGram 
			top:        (Rudiment fromNumber: (sixNumberArray at: 6))
			middle:   (Rudiment fromNumber: (sixNumberArray at: 5))
			bottom: (Rudiment fromNumber: (sixNumberArray at: 4))
			)
	 	lower: (TriGram 
			top:        (Rudiment fromNumber: (sixNumberArray at: 3))
			middle:   (Rudiment fromNumber: (sixNumberArray at: 2))
			bottom: (Rudiment fromNumber: (sixNumberArray at: 1))
			)! !

!HexaGram class methodsFor: 'instance creation' stamp: 'KenD 14/Jan/2022 12:45:09'!
upper: topHexagram lower: bottomHexagram

	^ self new :: upper: topHexagram lower: bottomHexagram! !

!HexaGram class methodsFor: 'class initialization' stamp: 'KenD 14/Jan/2022 13:51:13'!
initialize
"
	HexaGram initialize.
"
	self
		initializeNames;
		initializeKingWenLookup;
		initializePNGForms! !

!HexaGram class methodsFor: 'class initialization' stamp: 'Install-IChing 25/Feb/2026 16:02:40'!
initializeKingWenLookup

	TrigramDoubleDict2KingWenIndex := Dictionary new.
	
	TrigramDoubleDict2KingWenIndex 
		at: #heaven
		put: (Dictionary newFromPairs: 
				#(
				heaven	  1
				thunder	 34
				water	  5
				mountain 26
				earth	 11
				wind	  9
				fire	 14
				lake	 43
				)).
				
	TrigramDoubleDict2KingWenIndex 
		at: #thunder
		put: (Dictionary newFromPairs: 
				#(
				heaven	 25
				thunder	 51
				water	 3
				mountain 27
				earth	 24
				wind	42
				fire	 21
				lake	 17
				)).
			
	TrigramDoubleDict2KingWenIndex 
		at: #water
		put: (Dictionary newFromPairs: 
				#( 
				heaven	 6
				thunder 40
				water	 29
				mountain 4
				earth	 7
				wind	 59
				fire	 64
				lake	 47
				)).
				
	TrigramDoubleDict2KingWenIndex 
		at: #mountain
		put: (Dictionary newFromPairs: 
				#( 
				heaven	 33
				thunder 62
				water	 39
				mountain 52
				earth	 15
				wind	 53
				fire	 56
				lake	 31
				)).		

	TrigramDoubleDict2KingWenIndex 
		at: #earth
		put: (Dictionary newFromPairs: 
				#( 
				heaven	 12
				thunder 16
				water	 8
				mountain 23
				earth	 2
				wind	 20
				fire	 35
				lake	 45
				)).	

	TrigramDoubleDict2KingWenIndex 
		at: #wind
		put: (Dictionary newFromPairs: 
				#( 
				heaven	 44
				thunder 32
				water	 48
				mountain 18
				earth	 46
				wind	 57
				fire	 50
				lake	 28
				)).	

	TrigramDoubleDict2KingWenIndex 
		at: #fire
		put: (Dictionary newFromPairs: 
				#( 
				heaven	 13
				thunder 55
				water	 63
				mountain 22
				earth	 36
				wind	 37
				fire	 30
				lake	 49
				)).

	TrigramDoubleDict2KingWenIndex 
		at: #lake
		put: (Dictionary newFromPairs: 
				#( 
				heaven	 10
				thunder 54
				water	 60
				mountain 41
				earth	 19
				wind	 61
				fire	 38
				lake	 58
				)).
				
! !

!HexaGram class methodsFor: 'class initialization' stamp: 'KenD 14/Jan/2022 13:08:43'!
initializeNames

	"Unicode names"
	
	Names := #(
'THE CREATIVE HEAVEN'
'THE RECEPTIVE EARTH'
'DIFFICULTY AT THE BEGINNING'
'YOUTHFUL FOLLY'
'WAITING'
'CONFLICT'
'THE ARMY'
'HOLDING TOGETHER'
'SMALL TAMING'
'TREADING'
'PEACE'
'STANDSTILL'
'FELLOWSHIP'
'GREAT POSSESSION'
'MODESTY'
'ENTHUSIASM'
'FOLLOWING'
'WORK ON THE DECAYED'
'APPROACH'
'CONTEMPLATION'
'BITING THROUGH'
'GRACE'
'SPLITTING APART'
'RETURN'
'INNOCENCE'
'GREAT TAMING'
'MOUTH CORNERS'
'GREAT PREPONDERANCE'
'THE ABYSMAL WATER'
'THE CLINGING FIRE'
'INFLUENCE'
'DURATION'
'RETREAT'
'GREAT POWER'
'PROGRESS'
'DARKENING OF THE LIGHT'
'THE FAMILY'
'OPPOSITION'
'OBSTRUCTION'
'DELIVERANCE'
'DECREASE'
'INCREASE'
'BREAKTHROUGH'
'COMING TO MEET'
'GATHERING TOGETHER'
'PUSHING UPWARD'
'OPPRESSION'
'THE WELL'
'REVOLUTION'
'THE CAULDRON'
'THE AROUSING THUNDER'
'THE KEEPING STILL MOUNTAIN'
'DEVELOPMENT'
'THE MARRYING MAIDEN'
'ABUNDANCE'
'THE WANDERER'
'THE GENTLE WIND'
'THE JOYOUS LAKE'
'DISPERSION'
'LIMITATION'
'INNER TRUTH'
'SMALL PREPONDERANCE'
'AFTER COMPLETION'
'BEFORE COMPLETION'
)
! !

!HexaGram class methodsFor: 'class initialization' stamp: 'KenD 14/Jan/2022 13:50:58'!
initializePNGForms

	| dirName |
	dirName :=  ((self package) fullFileName upToLastPathSeparator), '/png/'.
	PNGForms := Array new: 64.

	1 to: 64 do: [ :idx |
		PNGForms 
			at: idx
			put: (ImageReadWriter 
				formFromFileNamed: 
					dirName , 
					'35px-Iching-hexagram-',
					idx asString, 
					'.png').
	].! !

!HexaGram class methodsFor: 'private' stamp: 'KenD 17/Jan/2022 18:55:24'!
gritterPattern

	^ #(
		#( 0 0 0 0 0 0 1 )
		#( 3 0 5 0 0 0 0 7 0 9)
		#( 0 0 0 0 0 0 11 )
		#( 13 0 15 0 0 0 0 17 0 19 )
		#(0)
		#( 21 0 23 0 0 0 0 25 0 27)
		#( 0 0 0 0 0 0 29 )
		#( 0 0 0 0 0 0 31 )
		#( 33 0 35 0 0 0 0 37 0 39)
		#( 0 0 0 0 0 0 41 )
		#( 43 0 45 0 0 0 0 47 0 49)
		#( 0 0 0 0 0 0 51 )
		#( 53 0 55 0 57 0 59 0 61)
		#( 0 0 0 0 0 0 63 )
	      ) ! !

!HexaGram class methodsFor: 'images' stamp: 'KenD 25/Feb/2026 16:16:42'!
gritterImage
	"Illustrates https://www.yijing.nl/structures/Gritter.html  
	
HexaGram gritterImage openInWorld.
	"
	| imagePlusSpace xPos yPos pattern displaySpace |
	imagePlusSpace := 35 + 14. "35@35 is image size"
	pattern := self gritterPattern. "13 rows; 5 doubled columns"
	displaySpace := BorderedBoxMorph new 
				:: color: Color orange
				:: morphExtent: (784 @ 784).
	yPos := 0.
	pattern do: [ :rowPattern |
		yPos := yPos + imagePlusSpace.
		xPos := imagePlusSpace.
		rowPattern do: [ :index |
			(index isZero) 
				ifTrue: [xPos := imagePlusSpace + xPos.] 
				ifFalse: [ | image | "Add hexagram and its pair"
					image := self imageForKingWenIndex: index.
					displaySpace addMorph: image.
					image morphPosition: xPos @ yPos.
					xPos := xPos + imagePlusSpace.
					image := self imageForKingWenIndex: 1 + index.
					displaySpace addMorph: image.
					image morphPosition: xPos @ yPos.	
					xPos := xPos + imagePlusSpace.
				]
			]
		].
	
	"Hilight inner patterns: 6 8 9 7"
	displaySpace addMorph: (BorderedBoxMorph new "7"
		:: color: (TranslucentColor r: 0.976 g: 0.958 b: 0.024 alpha: 0.255)
		:: morphPosition: 40@584; morphExtent: 700@144).
	displaySpace addMorph: (BorderedBoxMorph new "9"
		:: color: (TranslucentColor r: 0.263 g: 0.410 b: 0.882 alpha: 0.409)
		:: morphPosition: 40@434; morphExtent: 700@144).
	displaySpace addMorph: (BorderedBoxMorph new "8"
		:: color: (TranslucentColor r: 0.195 g: 0.197 b: 0.804 alpha: 0.543)
		:: morphPosition: 40@191; morphExtent: 700@144).
	displaySpace addMorph: (BorderedBoxMorph new  "6"
		:: color:  (TranslucentColor r: 0.263 g: 0.884 b: 0.376 alpha: 0.409)
		:: morphPosition: 40@44; morphExtent: 700@144).
	
	^ displaySpace! !

!HexaGram class methodsFor: 'images' stamp: 'KenD 17/Jan/2022 14:51:21'!
imageForKingWenIndex: oneTo64

	^ (oneTo64 isZero)
		ifTrue: [ ImageMorph new  "Empty (non)Image"
				image: (Form extent: 35@35 :: fillColor: Color transparent) ]
		ifFalse: [ ImageMorph new image: (PNGForms at: oneTo64) ]! !

!HexaGram class methodsFor: 'images' stamp: 'KenD 27/Feb/2026 12:36:15'!
1 temp2 temp3 |
	temp1 := self kingWenImage.
	temp2 := TranslucentColor
		r: 0.195
		g: 0.197
		b: 0.804
		alpha: 0.543.
	temp3 := TranslucentColor
		r: 0.263
		g: 0.884
		b: 0.376
		alpha: 0.409.
	temp1
		addMorphFront: ((ColoredBoxMorph new color: temp2) morphExtent: 104 @ 50)
		position: 40 @ 40.
	temp1
		addMorphFront: ((ColoredBoxMorph new color: temp2) morphExtent: 104 @ 50)
		position: 233 @ 187.
	temp1
		addMorphFront: ((ColoredBoxMorph new color: temp2) morphExtent: 104 @ 50)
		position: 135 @ 335.
	temp1
		addMorphFront: ((ColoredBoxMorph new color: temp2) morphExtent: 104 @ 50)
		position: 40 @ 385.
	temp1
		addMorphFront: ((ColoredBoxMorph new color: temp3) morphExtent: 104 @ 50)
		position: 137 @ 90.
	temp1
		addMorphFront: ((ColoredBoxMorph new color: temp3) morphExtent: 104 @ 50)
		position: 334 @ 188.
	temp1
		addMorphFront: ((ColoredBoxMorph new color: temp3) morphExtent: 104 @ 50)
		position: 40 @ 294.
	temp1
		addMorphFront: ((ColoredBoxMorph new color: temp3) morphExtent: 104 @ 50)
		position: 333 @ 382.
	^ temp1.! !

!HexaGram class methodsFor: 'images' stamp: 'KenD 27/Feb/2026 12:39:03'!
kingWenPlusSpecialsImage
	| temp1 temp2 temp3 |
	temp1 := self kingWenImage.
	temp2 := TranslucentColor
		r: 0.195
		g: 0.197
		b: 0.804
		alpha: 0.543.
	temp3 := TranslucentColor
		r: 0.263
		g: 0.884
		b: 0.376
		alpha: 0.409.
	temp1
		addMorphFront: ((ColoredBoxMorph new color: temp2) morphExtent: 104 @ 50)
		position: 40 @ 40.
	temp1
		addMorphFront: ((ColoredBoxMorph new color: temp2) morphExtent: 104 @ 50)
		position: 233 @ 187.
	temp1
		addMorphFront: ((ColoredBoxMorph new color: temp2) morphExtent: 104 @ 50)
		position: 135 @ 335.
	temp1
		addMorphFront: ((ColoredBoxMorph new color: temp2) morphExtent: 104 @ 50)
		position: 40 @ 385.
	temp1
		addMorphFront: ((ColoredBoxMorph new color: temp3) morphExtent: 104 @ 50)
		position: 137 @ 90.
	temp1
		addMorphFront: ((ColoredBoxMorph new color: temp3) morphExtent: 104 @ 50)
		position: 334 @ 188.
	temp1
		addMorphFront: ((ColoredBoxMorph new color: temp3) morphExtent: 104 @ 50)
		position: 40 @ 286.
	temp1
		addMorphFront: ((ColoredBoxMorph new color: temp3) morphExtent: 104 @ 50)
		position: 333 @ 382.
	^ temp1.! !

!Rudiment methodsFor: 'accessing' stamp: 'KenD 13/Jan/2022 12:36:44'!
number

	^ number ! !

!Rudiment methodsFor: 'accessing' stamp: 'KenD 14/Jan/2022 08:35:58'!
number: lineValue

	(#(6 7 8 9) includes: lineValue)
		ifFalse: [ lineValue signal: 'Must be 6, 7, 8, or 9']
		ifTrue: [ 
			number := lineValue.
			(#(7 9) includes: lineValue)
			ifTrue: [polarity := #whole] 
			ifFalse: [polarity := #broken]
		 ].! !

!Rudiment methodsFor: 'accessing' stamp: 'KenD 13/Jan/2022 12:36:55'!
polarity

	^ polarity ! !

!Rudiment methodsFor: 'accessing' stamp: 'KenD 13/Jan/2022 12:39:57'!
polarity: wholeOrBroken

	(#(whole broken) includes: wholeOrBroken)
		ifFalse: [ wholeOrBroken signal: 'Must be #whole or #broken']
		ifTrue: [ polarity := wholeOrBroken ].! !

!Rudiment methodsFor: 'testing' stamp: 'KenD 15/Jan/2022 13:13:16'!
willChange

	"Answer true if old yin or old yang"
	^ (number = 6) or: [number = 9]! !

!Rudiment methodsFor: 'changing' stamp: 'KenD 14/Jan/2022 12:57:57'!
lineForChange
	"6 and 9 are changing lines" 
	
	| num |
	num := self number.
	(num = 6) "Old Yin"
		ifTrue: [ ^Rudiment fromNumber: 7]. "Young Yang"
	(num = 9) "Old Yang"
		ifTrue: [ ^Rudiment fromNumber: 8]. "Young Yin"
	^ self  "No change"! !

!Rudiment class methodsFor: 'instance creation' stamp: 'KenD 13/Jan/2022 13:04:54'!
broken
	
	^ self new :: polarity: #broken! !

!Rudiment class methodsFor: 'instance creation' stamp: 'KenD 13/Jan/2022 13:10:52'!
fromNumber: sixSevenEightNine
	
	^ self new :: number: sixSevenEightNine! !

!Rudiment class methodsFor: 'instance creation' stamp: 'KenD 13/Jan/2022 13:05:06'!
whole
	
	^ self new :: polarity: #whole! !

!TriGram methodsFor: 'accessing' stamp: 'KenD 14/Jan/2022 12:40:17'!
bottom

	^ bottom ! !

!TriGram methodsFor: 'accessing' stamp: 'KenD 15/Jan/2022 13:33:18'!
lines

	^ {  bottom.  middle. top. }! !

!TriGram methodsFor: 'accessing' stamp: 'KenD 14/Jan/2022 12:40:29'!
middle

	^ middle ! !

!TriGram methodsFor: 'accessing' stamp: 'KenD 13/Jan/2022 13:21:36'!
name
	"One of #(heaven earth water fire thunder mountain wind lake)"
	
	^ self nameFromBase
	! !

!TriGram methodsFor: 'accessing' stamp: 'KenD 14/Jan/2022 12:41:13'!
top

	^ top ! !

!TriGram methodsFor: 'private' stamp: 'KenD 14/Jan/2022 12:43:47'!
midNameFromBroken

	^ ( middle polarity = #whole)
		ifTrue: [ self topNameFromBrokenWhole ] 
		ifFalse: [ self topNameFromBrokenBroken ]! !

!TriGram methodsFor: 'private' stamp: 'KenD 14/Jan/2022 12:43:40'!
midNameFromWhole

	^ ( middle polarity = #whole)
		ifTrue: [ self topNameFromWholeWhole ] 
		ifFalse: [ self topNameFromWholeBroken ]! !

!TriGram methodsFor: 'private' stamp: 'KenD 14/Jan/2022 12:43:31'!
nameFromBase

	^ ( bottom polarity = #whole)
		ifTrue: [ self midNameFromWhole ] 
		ifFalse: [ self midNameFromBroken ]! !

!TriGram methodsFor: 'private' stamp: 'KenD 14/Jan/2022 12:43:54'!
topNameFromBrokenBroken

	^ ( top polarity = #whole)
		ifTrue: [ #mountain ] 
		ifFalse: [ #earth ]! !

!TriGram methodsFor: 'private' stamp: 'KenD 14/Jan/2022 12:44:03'!
topNameFromBrokenWhole

	^ ( top polarity = #whole)
		ifTrue: [ #wind ] 
		ifFalse: [ #water ]! !

!TriGram methodsFor: 'private' stamp: 'KenD 14/Jan/2022 12:44:11'!
topNameFromWholeBroken

	^ ( top polarity = #whole)
		ifTrue: [ #fire ] 
		ifFalse: [ #thunder ]! !

!TriGram methodsFor: 'private' stamp: 'KenD 14/Jan/2022 12:44:20'!
topNameFromWholeWhole

	^ (top polarity = #whole)
		ifTrue: [ #heaven ] 
		ifFalse: [ #lake ]! !

!TriGram methodsFor: 'initialization' stamp: 'KenD 14/Jan/2022 12:42:29'!
top: upperLine middle: middleLine bottom: lowerLine

	top        := upperLine.
	middle   := middleLine.
	bottom  := lowerLine.! !

!TriGram methodsFor: 'changing' stamp: 'KenD 14/Jan/2022 12:43:01'!
trigramForChange

	^ TriGram 
		top:        (self top        lineForChange)
		middle:   (self middle  lineForChange)
		bottom: (self bottom lineForChange)! !

!TriGram class methodsFor: 'instance creation' stamp: 'KenD 14/Jan/2022 12:41:51'!
top: upperLine middle: middleLine bottom: lowerLine

	^self new :: top: upperLine middle: middleLine bottom: lowerLine! !

!HexagramDisplayPanel methodsFor: 'GUI building' stamp: 'KenD 25/Feb/2026 16:04:58'!
buildMorphicWindow
	"Column of 4 rows: hexagram; changing lines; name; changed hexagram"

	| hexagram topRow midRow changeHex lowerTitle lowerRow |
	hexagram := self model.
	self setLabel: hexagram name.
	self titleMorph 
		showButtonsNamed: #(close); 
		dontShrinkTitle.
	layoutMorph 
		beColumn;
		axisEdgeWeight: #center;
		separation: 12.
	topRow := self newRowFormAndTrigramNames: hexagram.
	midRow := self changedLinesText.
	changeHex := hexagram hexagramForChange.
	lowerTitle := LabelMorph contents: 'Changes to ', changeHex name.
	lowerRow := self newRowFormAndTrigramNames: changeHex.
	layoutMorph 
		addMorph: topRow 
			layoutSpec: (LayoutSizeSpec new :: offAxisEdgeWeight: #center);
		addMorph: midRow
			layoutSpec: (LayoutSizeSpec new :: offAxisEdgeWeight: #columnLeft);
		addMorph: lowerTitle 
			layoutSpec: (LayoutSizeSpec new ::
						offAxisEdgeWeight: #columnLeft);
		addMorph: lowerRow
			layoutSpec: (LayoutSizeSpec new :: offAxisEdgeWeight: #center).
	self morphExtent: self minimumExtent.! !

!HexagramDisplayPanel methodsFor: 'GUI building' stamp: 'KenD 15/Jan/2022 17:54:53'!
changedLinesText

	"Convert string of lines into layout of labelMorphs"
	| changes layout |
	changes := self model changedLinesText lines.
	layout := LayoutMorph newColumn ::
		axisEdgeWeight: #center ; 
		separation: 4.
	changes do: [ :aString |
		layout 
			addMorph: (LabelMorph contents: aString) 
			layoutSpec: (LayoutSpec keepMorphExtent :: offAxisEdgeWeight: #columnLeft).
	].
	layout morphExtent: layoutMorph minimumExtent.
	^ layout! !

!HexagramDisplayPanel methodsFor: 'GUI building' stamp: 'KenD 25/Feb/2026 16:04:31'!
newRowFormAndTrigramNames: aHexagram

	| rowLayout image colLayout |
	rowLayout  := LayoutMorph newRow.
	image := ImageMorph new :: image: (aHexagram form magnifyTo: 64@64).
	rowLayout 
		addMorph: image 
		layoutSpec: (LayoutSpec keepMorphExtent) :: axisEdgeWeight: #rowLeft;
		axisEdgeWeight: #center.
	colLayout := LayoutMorph newColumn.
	colLayout layoutSpec: 
		(LayoutSpec proportionalWidth: 0.6 proportionalHeight: 0.8);
		axisEdgeWeight: #center;
		separation: 6;
		addMorph: (LabelMorph contents: aHexagram upper name) 
			layoutSpec: (LayoutSizeSpec new :: offAxisEdgeWeight: #columnLeft);
		addMorph: (LabelMorph contents: aHexagram lower name) 
			layoutSpec: (LayoutSizeSpec new :: offAxisEdgeWeight: #columnLeft).
	^ rowLayout addMorph: colLayout;
		yourself
! !

!HexagramDisplayPanel class methodsFor: 'new-morph participation' stamp: 'KenD 16/Jan/2022 15:35:01'!
includeInNewMorphMenu
	"Not to be instantiated from the menu"
	^ true! !

!HexagramDisplayPanel class methodsFor: 'new-morph participation' stamp: 'KenD 16/Jan/2022 15:32:59'!
initializedInstance

	^ (HexagramDisplayPanel forHexagram: (HexaGram cast))! !

!HexagramDisplayPanel class methodsFor: 'instance creation' stamp: 'KenD 15/Jan/2022 13:58:54'!
forHexagram: aHexagram

	^ self open: aHexagram ! !
HexaGram initialize!
