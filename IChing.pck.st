'From Cuis 6.0 [latest update: #5041] on 14 January 2022 at 1:57:44 pm'!
'Description Book of Changes [I Ching] exploration'!
!provides: 'IChing' 1 4!
!requires: 'Cuis-Base' 60 5041 nil!
!requires: 'Graphics-Files-Additional' 1 24 nil!
SystemOrganization addCategory: 'IChing'!


!classDefinition: #HexaGram category: 'IChing'!
Object subclass: #HexaGram
	instanceVariableNames: 'upper lower'
	classVariableNames: 'Names PNGForms TrigramDoubleDict2KingWenIndex'
	poolDictionaries: ''
	category: 'IChing'!
!classDefinition: 'HexaGram class' category: 'IChing'!
HexaGram class
	instanceVariableNames: ''!

!classDefinition: #Rudiment category: 'IChing'!
Object subclass: #Rudiment
	instanceVariableNames: 'number polarity'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IChing'!
!classDefinition: 'Rudiment class' category: 'IChing'!
Rudiment class
	instanceVariableNames: ''!

!classDefinition: #TriGram category: 'IChing'!
Object subclass: #TriGram
	instanceVariableNames: 'top middle bottom'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IChing'!
!classDefinition: 'TriGram class' category: 'IChing'!
TriGram class
	instanceVariableNames: ''!


!HexaGram commentStamp: '<historical>' prior: 0!
The third discernment is among compositions of preexisting categories.

Coin Casting:

 (HexaGram fromArray: #( 8 9 6 7 8 8 )) hexagramForChange name.
!

!Rudiment commentStamp: '<historical>' prior: 0!
The LINE is a rudiment of descernment.

polarity is #whole (yang/found/+/sun) or #broken (yin/absent/-/shade)

number is
  6 - Old      Yin     [changing line]
  8 - Young Yin
  7 - Young Yang
  9 - Old      Yang  [changing line]!

!TriGram commentStamp: '<historical>' prior: 0!
The second discernment is among relations: above/same/below
!

!HexaGram methodsFor: 'accessing' stamp: 'KenD 1/14/2022 13:04:50'!
name

	^ Names at: self kingWenIndex ! !

!TriGram methodsFor: 'accessing' stamp: 'KenD 1/13/2022 13:21:36'!
name
	"One of #(heaven earth water fire thunder mountain wind lake)"
	
	^ self nameFromBase
	! !

!HexaGram methodsFor: 'accessing' stamp: 'KenD 1/14/2022 13:56:42'!
form

	^ PNGForms at: self kingWenIndex ! !

!HexaGram methodsFor: 'accessing' stamp: 'KenD 1/14/2022 12:38:23'!
kingWenIndex

	^ (TrigramDoubleDict2KingWenIndex at: lower name)
		at: upper name! !

!HexaGram methodsFor: 'accessing' stamp: 'KenD 1/14/2022 12:38:36'!
lower

	^lower! !

!HexaGram methodsFor: 'accessing' stamp: 'KenD 1/14/2022 12:37:51'!
unicodeIndex
	"Answer unicode index for character"

	^ 19903 + self kingWenIndex! !

!HexaGram methodsFor: 'accessing' stamp: 'KenD 1/14/2022 12:39:11'!
upper

	^upper! !

!HexaGram methodsFor: 'initialization' stamp: 'KenD 1/14/2022 12:45:31'!
upper: topHexagram lower: bottomHexagram

	upper := topHexagram.
	lower  := bottomHexagram.
	! !

!HexaGram methodsFor: 'changing' stamp: 'KenD 1/14/2022 12:45:54'!
hexagramForChange

	^ HexaGram 
		upper: (self upper trigramForChange)
		lower:  (self lower  trigramForChange)! !

!HexaGram class methodsFor: 'instance creation' stamp: 'KenD 1/14/2022 12:48:43'!
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

!HexaGram class methodsFor: 'instance creation' stamp: 'KenD 1/14/2022 12:45:09'!
upper: topHexagram lower: bottomHexagram

	^ self new :: upper: topHexagram lower: bottomHexagram! !

!HexaGram class methodsFor: 'class initialization' stamp: 'KenD 1/14/2022 13:51:13'!
initialize
"
	HexaGram initialize.
"
	self
		initializeNames;
		initializeKingWenLookup;
		initializePNGForms! !

!HexaGram class methodsFor: 'class initialization' stamp: 'KenD 1/14/2022 13:08:12'!
initializeKingWenLookup

	TrigramDoubleDict2KingWenIndex := Dictionary new: 8.
	
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

!HexaGram class methodsFor: 'class initialization' stamp: 'KenD 1/14/2022 13:08:43'!
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

!HexaGram class methodsFor: 'class initialization' stamp: 'KenD 1/14/2022 13:50:58'!
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

!Rudiment methodsFor: 'accessing' stamp: 'KenD 1/13/2022 12:36:44'!
number

	^ number ! !

!Rudiment methodsFor: 'accessing' stamp: 'KenD 1/14/2022 08:35:58'!
number: lineValue

	(#(6 7 8 9) includes: lineValue)
		ifFalse: [ lineValue signal: 'Must be 6, 7, 8, or 9']
		ifTrue: [ 
			number := lineValue.
			(#(7 9) includes: lineValue)
			ifTrue: [polarity := #whole] 
			ifFalse: [polarity := #broken]
		 ].! !

!Rudiment methodsFor: 'accessing' stamp: 'KenD 1/13/2022 12:36:55'!
polarity

	^ polarity ! !

!Rudiment methodsFor: 'accessing' stamp: 'KenD 1/13/2022 12:39:57'!
polarity: wholeOrBroken

	(#(whole broken) includes: wholeOrBroken)
		ifFalse: [ wholeOrBroken signal: 'Must be #whole or #broken']
		ifTrue: [ polarity := wholeOrBroken ].! !

!Rudiment methodsFor: 'changing' stamp: 'KenD 1/14/2022 12:57:57'!
lineForChange
	"6 and 9 are changing lines" 
	
	| num |
	num := self number.
	(num = 6) "Old Yin"
		ifTrue: [ ^Rudiment fromNumber: 7]. "Young Yang"
	(num = 9) "Old Yang"
		ifTrue: [ ^Rudiment fromNumber: 8]. "Young Yin"
	^ self  "No change"! !

!Rudiment class methodsFor: 'instance creation' stamp: 'KenD 1/13/2022 13:04:54'!
broken
	
	^ self new :: polarity: #broken! !

!Rudiment class methodsFor: 'instance creation' stamp: 'KenD 1/13/2022 13:10:52'!
fromNumber: sixSevenEightNine
	
	^ self new :: number: sixSevenEightNine! !

!Rudiment class methodsFor: 'instance creation' stamp: 'KenD 1/13/2022 13:05:06'!
whole
	
	^ self new :: polarity: #whole! !

!TriGram methodsFor: 'private' stamp: 'KenD 1/14/2022 12:43:47'!
midNameFromBroken

	^ ( middle polarity = #whole)
		ifTrue: [ self topNameFromBrokenWhole ] 
		ifFalse: [ self topNameFromBrokenBroken ]! !

!TriGram methodsFor: 'private' stamp: 'KenD 1/14/2022 12:43:40'!
midNameFromWhole

	^ ( middle polarity = #whole)
		ifTrue: [ self topNameFromWholeWhole ] 
		ifFalse: [ self topNameFromWholeBroken ]! !

!TriGram methodsFor: 'private' stamp: 'KenD 1/14/2022 12:43:31'!
nameFromBase

	^ ( bottom polarity = #whole)
		ifTrue: [ self midNameFromWhole ] 
		ifFalse: [ self midNameFromBroken ]! !

!TriGram methodsFor: 'private' stamp: 'KenD 1/14/2022 12:43:54'!
topNameFromBrokenBroken

	^ ( top polarity = #whole)
		ifTrue: [ #mountain ] 
		ifFalse: [ #earth ]! !

!TriGram methodsFor: 'private' stamp: 'KenD 1/14/2022 12:44:03'!
topNameFromBrokenWhole

	^ ( top polarity = #whole)
		ifTrue: [ #wind ] 
		ifFalse: [ #water ]! !

!TriGram methodsFor: 'private' stamp: 'KenD 1/14/2022 12:44:11'!
topNameFromWholeBroken

	^ ( top polarity = #whole)
		ifTrue: [ #fire ] 
		ifFalse: [ #thunder ]! !

!TriGram methodsFor: 'private' stamp: 'KenD 1/14/2022 12:44:20'!
topNameFromWholeWhole

	^ (top polarity = #whole)
		ifTrue: [ #heaven ] 
		ifFalse: [ #lake ]! !

!TriGram methodsFor: 'accessing' stamp: 'KenD 1/14/2022 12:40:17'!
bottom

	^ bottom ! !

!TriGram methodsFor: 'accessing' stamp: 'KenD 1/14/2022 12:41:00'!
lines

	^ { top , middle , bottom }! !

!TriGram methodsFor: 'accessing' stamp: 'KenD 1/14/2022 12:40:29'!
middle

	^ middle ! !

!TriGram methodsFor: 'accessing' stamp: 'KenD 1/14/2022 12:41:13'!
top

	^ top ! !

!TriGram methodsFor: 'initialization' stamp: 'KenD 1/14/2022 12:42:29'!
top: upperLine middle: middleLine bottom: lowerLine

	top        := upperLine.
	middle   := middleLine.
	bottom  := lowerLine.! !

!TriGram methodsFor: 'changing' stamp: 'KenD 1/14/2022 12:43:01'!
trigramForChange

	^ TriGram 
		top:        (self top        lineForChange)
		middle:   (self middle  lineForChange)
		bottom: (self bottom lineForChange)! !

!TriGram class methodsFor: 'instance creation' stamp: 'KenD 1/14/2022 12:41:51'!
top: upperLine middle: middleLine bottom: lowerLine

	^self new :: top: upperLine middle: middleLine bottom: lowerLine! !
HexaGram initialize!