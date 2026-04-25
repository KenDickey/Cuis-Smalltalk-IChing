'From Cuis7.7 [latest update: #7880] on 24 April 2026 at 6:26:35 pm'!
'Description Ken''s I Ching translation'!
!provides: 'StyledText-IChing' 1 7!
!requires: 'StyledText' 1 77 nil!
!requires: 'IChing' 1 45 nil!
SystemOrganization addCategory: #'StyledText-IChing'!


!classDefinition: #IChingText category: #'StyledText-IChing'!
Object subclass: #IChingText
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StyledText-IChing'!
!classDefinition: 'IChingText class' category: #'StyledText-IChing'!
IChingText class
	instanceVariableNames: ''!


!IChingText commentStamp: '<historical>' prior: 0!
Ken Dickey's translation of received I Ching, a Bronze Age text.!

!IChingText methodsFor: 'initialization' stamp: 'KenD 17/Apr/2026 16:33:06'!
open: nameString
	| fileName model  |
	fileName := (IChingPackage package fullFileName asFileEntry parent  // nameString) pathName.
	model := StyledTextModel fromFileNamed: fileName.
	model styleSet: StyleSet forIChing.
	^SystemWindow editFancierStyledText: model label: nameString
	! !

!IChingText class methodsFor: 'instance creation' stamp: 'KenD 17/Apr/2026 16:02:10'!
openStyledTextIChing
"
	IChingText openStyledTextIChing.
"

	STETheme beCurrent.
	^self new open: 'Kens I Ching'! !

!StyleSet methodsFor: '*StyledText-IChing' stamp: 'KenD 24/Apr/2026 18:26:10'!
createIChingCharacterStyleSet
	"Build one of the many possible sets of Styles. Maybe other methods like this will be added."
	| title name nullStyle banner fontFamily familyName |

	familyName := 'PingFang SC'. 
	fontFamily := FontFamily familyNamed:  familyName.  "Loaded by IChingPackage> prePackageInstall".
	
	title := self characterStyleNamedOrNew: 'Title'.
	title privateFamilyName: familyName pointSize: 40 emphasis: AbstractFont boldCode color: Color black.

	banner := self characterStyleNamedOrNew: 'Hexagram Banner'.
	banner privateFamilyName: familyName pointSize: 32 emphasis: AbstractFont boldCode color: Color black.

	name := self characterStyleNamedOrNew: 'Hexagram Name'.
	name privateFamilyName: familyName pointSize: 40 emphasis: AbstractFont boldCode color: Color blue darker.

	nullStyle := CharacterStyle nullStyle.

	characterStyles := {
		{$T. title}.
		{$Y. name}. "Yi Jing Hexagram Name"
		{$B. banner}.
		{$n. nullStyle}
	}.
	
	self triggerEvent: #stylesChanged! !

!StyleSet methodsFor: '*StyledText-IChing' stamp: 'KenD 17/Apr/2026 16:37:00'!
createIChingParagraphStyleSet
	"Build one of the many possible sets of Styles. Maybe other methods like this will be added."
	| heading1 heading2 heading3 emphasized normal numbered alphabetic bulleted 
	 smalltalkCode s fontFamily familyName |

	familyName := 'PingFang SC'. 
	fontFamily := FontFamily familyNamed:  familyName.  "Loaded by IChingPackage> prePackageInstall".
	familyName := "FontFamily familyNamed:" 'PingFang SC'.  "Loaded by IChingPackage> prePackageInstall"
	s := FontFamily defaultPointSize.

	normal := self paragraphStyleNamedOrNew: 'Normal'.
	normal privateFamilyName: familyName pointSize: s emphasis: 0 color: nil
		alignment: CharacterScanner justifiedCode firstIndent: s*3 restIndent: s rightIndent: s
		spaceBefore: s*8//10 spaceAfter: s*2//10.

	emphasized := self paragraphStyleNamedOrNew: 'Emphasized'.
	emphasized privateFamilyName: familyName pointSize: s emphasis: AbstractFont boldCode color: nil
		alignment: CharacterScanner justifiedCode firstIndent: s*6 restIndent: s*6 rightIndent: s*6
		spaceBefore: s spaceAfter: s*2//10.

	heading1 := self paragraphStyleNamedOrNew: 'Heading 1'.
	heading1 privateFamilyName: familyName pointSize: s*3 emphasis: 0 color: nil
		alignment: CharacterScanner centeredCode firstIndent: 0 restIndent: 0 rightIndent: 0
		spaceBefore: s*3 spaceAfter: s*2.

	heading2 := self paragraphStyleNamedOrNew: 'Heading 2'.
	heading2 privateFamilyName: familyName pointSize: s*2 emphasis: AbstractFont boldCode color: nil
		alignment: CharacterScanner centeredCode firstIndent: 0 restIndent: 0 rightIndent: 0
		spaceBefore: s*2 spaceAfter: 2.

	heading3 := self paragraphStyleNamedOrNew: 'Heading 3'.
	heading3 privateFamilyName: familyName pointSize: s*15//10 emphasis: AbstractFont italicCode color: nil
		alignment: CharacterScanner centeredCode firstIndent: 0 restIndent: 0 rightIndent: 0
		spaceBefore: s*15//10 spaceAfter: s//2.

	numbered := self paragraphStyleNamedOrNew: 'Numbered List'.
	numbered privateFamilyName: familyName pointSize: s emphasis: 0 color: nil
		alignment: CharacterScanner justifiedCode firstIndent: s restIndent: s*5 rightIndent: s
		spaceBefore: s*8//10 spaceAfter: s*2//10;
			privateListBulletPattern: '%%%. '.

	alphabetic := self paragraphStyleNamedOrNew: 'Alphabetic List'.
	alphabetic privateFamilyName: familyName pointSize: s emphasis: 0 color: nil
		alignment: CharacterScanner justifiedCode firstIndent: s restIndent: s*3 rightIndent: s
		spaceBefore: s*8//10 spaceAfter: s*2//10;
			privateListBulletPattern: 'z) '.

	bulleted := self paragraphStyleNamedOrNew: 'Bulleted List'.
	bulleted privateFamilyName: familyName pointSize: s emphasis: 0 color: nil
		alignment: CharacterScanner justifiedCode firstIndent: s restIndent: s*3 rightIndent: s
		spaceBefore: s*8//10 spaceAfter: s*2//10;
			privateListBulletPattern: '° '.

	smalltalkCode := self paragraphStyleNamedOrNew: 'Smalltalk code'.
	smalltalkCode privateFamilyName: familyName pointSize: s emphasis: 0 color: nil
		alignment: CharacterScanner leftFlushCode firstIndent: s restIndent: s rightIndent: s
		spaceBefore: 0 spaceAfter: 0;
			doShout.

	paragraphStyles := {
		{$0.	normal}.
		{$e.	emphasized}.
		{$1.	heading1}.
		{$2.	heading2}.
		{$3.	heading3}.
		{$4.	numbered}.
		{$5.	alphabetic}.
		{$6.	bulleted}.
		{$7.	smalltalkCode}
	}.
	
	self triggerEvent: #stylesChanged! !

!StyleSet class methodsFor: '*StyledText-IChing' stamp: 'KenD 17/Apr/2026 16:32:50'!
forIChing

	^ self new
			createIChingCharacterStyleSet;
			createIChingParagraphStyleSet.! !
