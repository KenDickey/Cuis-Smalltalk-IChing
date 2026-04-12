'From Cuis7.7 [latest update: #7872] on 12 April 2026 at 4:02:44 pm'!
'Description Book of Changes [I Ching] exploration.

Note HexaGram class comment.'!
!provides: 'IChing' 1 41!
!requires: 'Cuis-Base' 77 7872 nil!
!requires: 'UI-Panel' 1 19 nil!
!requires: 'Graphics-Files-Additional' 1 24 nil!
SystemOrganization addCategory: #IChing!


!classDefinition: #Hexagram category: #IChing!
Object subclass: #Hexagram
	instanceVariableNames: 'upper lower'
	classVariableNames: 'ClassicText Names PNGForms TrigramDoubleDict2KingWenIndex'
	poolDictionaries: ''
	category: 'IChing'!
!classDefinition: 'Hexagram class' category: #IChing!
Hexagram class
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

!classDefinition: #Trigram category: #IChing!
Object subclass: #Trigram
	instanceVariableNames: 'top middle bottom'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IChing'!
!classDefinition: 'Trigram class' category: #IChing!
Trigram class
	instanceVariableNames: ''!

!classDefinition: #HexagramsMorph category: #IChing!
ColoredBoxMorph subclass: #HexagramsMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IChing'!
!classDefinition: 'HexagramsMorph class' category: #IChing!
HexagramsMorph class
	instanceVariableNames: ''!

!classDefinition: #GritterTransformMorph category: #IChing!
LinearLayoutMorph subclass: #GritterTransformMorph
	instanceVariableNames: 'isGritter'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IChing'!
!classDefinition: 'GritterTransformMorph class' category: #IChing!
GritterTransformMorph class
	instanceVariableNames: ''!

!classDefinition: #HexagramPairMorph category: #IChing!
ImageMorph subclass: #HexagramPairMorph
	instanceVariableNames: 'leftKingWenIndex'
	classVariableNames: 'DuplicatedTrigrams OpposingTrigrams SymmetricTrigrams'
	poolDictionaries: ''
	category: 'IChing'!
!classDefinition: 'HexagramPairMorph class' category: #IChing!
HexagramPairMorph class
	instanceVariableNames: ''!

!classDefinition: #IChingResponsePanel category: #IChing!
Panel subclass: #IChingResponsePanel
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IChing'!
!classDefinition: 'IChingResponsePanel class' category: #IChing!
IChingResponsePanel class
	instanceVariableNames: ''!


!Hexagram commentStamp: '<historical>' prior: 0!
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

Note Nigel Richmond's observations in _The Language of he Lines_
  https://www.biroco.com/yijing/Language_of_the_Lines.pdf
According to Richmond:
  Solid line => "front/conscious/passive"
  Broken line => "back/unconscious/active"

Line number is
  6 - Old      Yin     [changing line]
  8 - Young Yin
  7 - Young Yang
  9 - Old      Yang  [changing line]!

!Trigram commentStamp: '<historical>' prior: 0!
The second discernment is among relations: above/same/below
!

!HexagramsMorph commentStamp: '<historical>' prior: 0!
Just display the King Wen order of Hexagrams!

!GritterTransformMorph commentStamp: '<historical>' prior: 0!
Display KingWen sequence; colorize specials; reaggange into Gritter pattern; hilight meta-numbers

G := GritterTransformMorph fromKingWen openInWorld.
G showSpecialsWIthSymmetrics.
G animateToGritter.

or just

GritterTransformMorph initializedInstance openInWorld.  "For final pattern"
!

!HexagramPairMorph commentStamp: '<historical>' prior: 0!
The I Ching hexagrams come in pairs.
Some are special.
= DuplicatedTrigrams => same trigram upper & lower
= OpposingTrigrams => upper & lower trigrams are (xor) opposites; 2nd hexagram inverted from first
= SymmetricTrigrams => upper inverse = lower; linked with opposite hexagram

!

!IChingResponsePanel commentStamp: '<historical>' prior: 0!
I display a hexagram, including its changes.

(HexagramDisplayPanel forHexagram: (HexaGram cast)) openInWorld.!

!Hexagram methodsFor: 'accessing' stamp: 'KenD 15/Jan/2022 13:54:33'!
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

!Hexagram methodsFor: 'accessing' stamp: 'KenD 12/Apr/2026 15:58:20'!
chineseText
	"#( description first second third fourth fifth top )"
	"Unicode srtings probably need font, e.g PingFang SC, to view'."
	^ClassicText at: self kingWenIndex ! !

!Hexagram methodsFor: 'accessing' stamp: 'KenD 14/Jan/2022 13:56:42'!
form

	^ PNGForms at: self kingWenIndex ! !

!Hexagram methodsFor: 'accessing' stamp: 'KenD 17/Jan/2022 11:30:51'!
icon
	"Answer a form"

	^ self form magnifyTo: 16@16! !

!Hexagram methodsFor: 'accessing' stamp: 'KenD 17/Jan/2022 14:04:22'!
image

	^ ImageMorph new image: (self form magnifyTo: 64@64)! !

!Hexagram methodsFor: 'accessing' stamp: 'KenD 14/Jan/2022 12:38:23'!
kingWenIndex

	^ (TrigramDoubleDict2KingWenIndex at: lower name)
		at: upper name! !

!Hexagram methodsFor: 'accessing' stamp: 'KenD 14/Jan/2022 12:38:36'!
lower

	^lower! !

!Hexagram methodsFor: 'accessing' stamp: 'KenD 14/Jan/2022 13:04:50'!
name

	^ Names at: self kingWenIndex ! !

!Hexagram methodsFor: 'accessing' stamp: 'KenD 14/Jan/2022 12:37:51'!
unicodeIndex
	"Answer unicode index for character"

	^ 19903 + self kingWenIndex! !

!Hexagram methodsFor: 'accessing' stamp: 'KenD 14/Jan/2022 12:39:11'!
upper

	^upper! !

!Hexagram methodsFor: 'initialization' stamp: 'KenD 14/Jan/2022 12:45:31'!
upper: topHexagram lower: bottomHexagram

	upper := topHexagram.
	lower  := bottomHexagram.
	! !

!Hexagram methodsFor: 'changing' stamp: 'KenD 11/Apr/2026 13:58:40'!
hexagramForChange

	^ Hexagram 
		upper: (self upper trigramForChange)
		lower:  (self lower  trigramForChange)! !

!Hexagram class methodsFor: 'accessing' stamp: 'KenD 3/Mar/2026 14:10:17'!
duplicatedTrigramColor

	^`TranslucentColor r: 0.875 g: 0.408 b: 0.854 alpha: 0.640`.! !

!Hexagram class methodsFor: 'accessing' stamp: 'KenD 3/Mar/2026 14:11:32'!
opposingTrigramColor

	^ `TranslucentColor r: 0.661 g: 0.641 b: 0.158 alpha: 0.640`! !

!Hexagram class methodsFor: 'accessing' stamp: 'KenD 3/Mar/2026 14:39:16'!
symmetricTrigramColor

	^ `TranslucentColor r: 0.000 g: 0.692 b: 0.824 alpha: 0.150`! !

!Hexagram class methodsFor: 'instance creation' stamp: 'KenD 15/Jan/2022 08:15:36'!
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

!Hexagram class methodsFor: 'instance creation' stamp: 'KenD 11/Apr/2026 14:05:02'!
fromArray: sixNumberArray
	"Line Numbers: low to high"
	^ self 
		upper: (Trigram 
			top:        (Rudiment fromNumber: (sixNumberArray at: 6))
			middle:   (Rudiment fromNumber: (sixNumberArray at: 5))
			bottom: (Rudiment fromNumber: (sixNumberArray at: 4))
			)
	 	lower: (Trigram 
			top:        (Rudiment fromNumber: (sixNumberArray at: 3))
			middle:   (Rudiment fromNumber: (sixNumberArray at: 2))
			bottom: (Rudiment fromNumber: (sixNumberArray at: 1))
			)! !

!Hexagram class methodsFor: 'instance creation' stamp: 'KenD 11/Apr/2026 13:58:40'!
initializedInstance
"
	self initializedInstance openInWorld.
"
	^ Hexagram kingWenImage! !

!Hexagram class methodsFor: 'instance creation' stamp: 'KenD 14/Jan/2022 12:45:09'!
upper: topHexagram lower: bottomHexagram

	^ self new :: upper: topHexagram lower: bottomHexagram! !

!Hexagram class methodsFor: 'class initialization' stamp: 'KenD 12/Apr/2026 15:48:49'!
initialize
"
	Hexagram initialize.
"
	self
		initializeNames;
		initializeKingWenLookup;
		initializePNGForms;
		initializeClassicText! !

!Hexagram class methodsFor: 'class initialization' stamp: 'KenD 12/Apr/2026 15:51:37'!
initializeClassicText

	"Chinese received text"
	"King Wen index => #(Hexagram description first line, ..., top line)"
	ClassicText :=
#(
 "1" #( 
'乾 元亨利貞'
'初九 潛龍勿用'
'九二 見龍在田。利見大人'
'九三 君子終日乾乾。夕惕若厲。无咎'
'九四 或躍在淵。无咎'
'九五 飛龍在天。利見大人'å˚
'上九 亢龍有悔'
'用九 見羣龍无首。吉'

) "2" #(
'坤 元亨利牝馬之貞。君子有攸往。先迷後得。主利。西南得朋。東北喪朋。安貞吉。'
'初六 履霜堅冰至。'
'六二 直方大。不習无不利。'
'六三 含章可貞。或從王事。无成有終。'
'六四 括囊。无咎无譽。'
'六五 黃裳。元吉。'
'上六 龍戰于野。其血玄黃。'
'用六 利永貞。'

) "3" #(
'屯 元亨利貞。勿用有攸往。利建侯。'
'初九 磐桓。利居貞。利建侯。'
'六二 屯如邅如。乘馬班如。匪寇婚媾。女子貞不字。十年乃字。'
'六三 即鹿無虞。惟入于林中。君子幾不如舍。往吝。'
'六四 乘馬班如。求婚媾。往吉。无不利。'
'九五 屯其膏。小貞吉。大貞凶。'
'上六 乘馬班如。泣血漣如。'

) "4" #(
'蒙 亨。匪我求童蒙。童蒙求我。初筮告。再三瀆。瀆則不告。利貞。'
'初六 發蒙。利用刑人。用說桎梏。以往吝。'
'九二 包蒙吉。納婦吉。子克家。'
'六三 勿用取女。見金夫。不有躬。无攸利。'
'六四 困蒙。吝。'
'六五 童蒙。吉。'
'上九 擊蒙。不利為寇。利禦寇。'

) "5" #(
'需 有孚。光亨貞吉。利涉大川。'
'初九 需于郊。利用恆。无咎。'
'九二 需于沙。小有言。終吉。'
'九三 需于泥。致寇至。'
'六四 需于血。出自穴。'
'九五 需于酒食。貞吉。'
'上六 入于穴。有不速之客三人來。敬之終吉。'

) "6" #(
'訟 有孚。窒惕。中吉。終凶。利見大人。不利涉大川。'
'初六 不永所事。小有言。終吉。'
'九二 不克訟。歸而逋其邑。人三百戶。无眚。'
'六三 食舊德。貞。厲終吉。或從王事。无成。'
'九四 不克訟。復即命。渝安貞。吉。'
'九五 訟。元吉。'
'上九 或錫之鞶帶。終朝三褫之。'

) "7" #(
'師 貞。丈人吉。无咎。'
'初六 師出以律。否臧凶。'
'九二 在師中吉。无咎。王三錫命。'
'六三 師或輿尸。凶。'
'六四 師左次。无咎。'
'六五 田有禽。利執言。无咎。長子帥師。弟子輿尸。貞凶。'
'上六 大君有命。開國承家。小人勿用。'

) "8" #(
'比 吉。原筮元永貞。无咎。不寧方來。後夫凶。'
'初六 有孚比之。无咎。有孚盈缶。終來有它吉。'
'六二 比之自內。貞吉。'
'六三 比之匪人。'
'六四 外比之。貞吉。x1'
'九五 顯比。王用三驅。失前禽。邑人不誡。吉。'
'上六 比之无首。凶。'

) "9" #(
'小畜 亨。密雲不雨。自我西郊。'
'初九 復自道。何其咎。吉。'
'九二 牽復。吉。'
'九三 輿說輻。夫妻反目。'
'六四 有孚。血去惕出。无咎。'
'九五 有孚攣如。富以其鄰。'
'上九 既雨既處。尚德載。婦貞厲。月幾望。君子征凶。'

) "10" #(
'履 虎尾。不咥人。亨。'
'初九 素履往。无咎。'
'九二 履道坦坦。幽人貞吉。'
'六三 眇能視。跛能履。履虎尾。咥人凶。武人為于大君。'
'九四 履虎尾。愬愬終吉。'
'九五 夬履。貞厲。'
'上九 視履考祥。其旋元吉。'

) "11" #(
'泰 小往大來。吉亨。'
'初九 拔茅茹。以其彙。征吉。'
'九二 包荒。用馮河。不遐遺。朋亡。得尚于中行。'
'九三 无平不陂。无往不復。艱貞无咎。勿恤其孚。于食有福。'
'六四 翩翩。不富以其鄰。不戒以孚。'
'六五 帝乙歸妹。以祉元吉。'
'上六 城復于隍。勿用師。自邑告命。貞吝。'

) "12" #(
'否 之匪人。不利君子貞。大往小來。'
'初六 拔茅茹。以其彙。貞吉。亨。'
'六二 包承。小人吉。大人否。亨。'
'六三 包羞。'
'九四 有命无咎。疇離祉。'
'九五 休否。大人吉。其亡其亡。繫于苞桑。'
'上九 傾否。先否後喜。'

) "13" #(
'同人 于野。亨。利涉大川。利君子貞。'
'初九 同人于門。无咎。'
'六二 同人于宗。吝。'
'九三 伏戎于莽。升其高陵。三歲不興。'
'九四 乘其墉。弗克攻。吉。'
'九五 同人先號咷而後笑。大師克相遇。'
'上九 同人于郊。无悔。'

) "14" #(
'大有 元亨。'
'初九 无交害。匪咎。艱則无咎。'
'九二 大車以載。有攸往。无咎。'
'九三 公用亨于天子。小人弗克 。'
'九四 匪其彭。无咎。'
'六五 厥孚交如。威如。吉。'
'上九 自天祐之。吉无不利。'

) "15" #(
'謙 亨。君子有終。'
'初六 謙謙君子。用涉大川。吉。'
'六二 鳴謙。貞吉。'
'九三 勞謙君子。有終吉。'
'六四 无不利撝謙。'
'六五 不富以其鄰。利用侵伐。无不利。'
'上六 鳴謙。利用行師。征邑國。'

) "16" #(
'豫 利建侯行師。'
'初六 鳴豫。凶。'
'六二 介于石。不終日。貞吉。'
'六三 盱豫悔。遲有悔。'
'九四 由豫。大有得。勿疑。朋盍簪。'
'六五 貞疾。恆不死。'
'上六 冥豫。成有渝。无咎。'

) "17" #(
'隨 元亨利貞。无咎。'
'初九 官有渝。貞吉。出門交有功。'
'六二 係小子。失丈夫。'
'六三 係丈夫。失小子。隨有求得。利居貞。'
'九四 隨有獲。貞凶。有孚在道以明。何咎。'
'九五 孚于嘉。吉。'
'上六 拘係之。乃從維之。王用亨于西山。'

) "18" #(
'蠱 元亨。利涉大川。先甲三日。後甲三日。'
'初六 幹父之蠱。有子。考无咎。厲終吉。'
'九二 幹母之蠱。不可貞。'
'九三 幹父之蠱。小有悔。无大咎。'
'六四 裕父之蠱。往見吝。'
'六五 幹父之蠱。用譽。'
'上九 不事王侯。高尚其事。'

) "19" #(
'臨 元亨利貞。至于八月有凶。'
'初九 咸臨貞吉。'
'九二 咸臨吉。无不利。'
'六三 甘臨。无攸利。既憂之。无咎。'
'六四 至臨。无咎。'
'六五 知臨。大君之宜。吉。'
'上六 敦臨。吉。无咎。'

) "20" #(
'觀 盥而不薦。有孚顒若。'
'初六 童觀。小人无咎。君子吝。'
'六二 闚觀。利女貞。'
'六三 觀我生進退。'
'六四 觀國之光。利用賓于王。'
'九五 觀我生。君子无咎。'
'上九 觀其生。君子无咎。'

) "21" #(
'噬嗑 亨。利用獄。'
'初九 履校滅趾。无咎。'
'六二 噬膚滅鼻。无咎。'
'六三 噬腊肉。遇毒。小吝。无咎。'
'九四 噬乾胏。得金矢。利艱貞。吉。'
'六五 噬乾肉。得黃金。貞厲。无咎。'
'上九 何校滅耳。凶。'

) "22" #(
'賁 亨。小利有攸往。'
'初九 賁其趾。舍車而徒。'
'六二 賁其須。'
'九三 賁如濡如。永貞吉。'
'六四 賁如皤如。白馬翰如。匪寇婚媾。'
'六五 賁于丘園。束帛戔戔。吝。終吉。'
'上九 白賁。无咎。'

) "23" #(
'剝 不利有攸往。'
'初六 剝牀以足。蔑貞凶。'
'六二 剝牀以辨。蔑貞凶。'
'六三 剝之无咎。'
'六四 剝牀以膚。凶。'
'六五 貫魚。以宮人寵。无不利。'
'上九 碩果不食。君子得輿。小人剝廬。'

) "24" #(
'復 亨。出入无疾。朋來无咎。反復其道。七日來復。利有攸往。'
'初九 不遠復。无祗悔。元吉。'
'六二 休復。吉。'
'六三 頻復。厲。无咎。'
'六四 中行獨復。'
'六五 敦復。无悔。'
'上六 迷復。凶。有災眚。用行師。終有大敗。以其國君凶。至于十年不克征。'

) "25" #(
'无妄 元亨利貞。其匪正有眚。不利有攸往。'
'初九 无妄。往吉。'
'六二 不耕穫。不菑畬。則利有攸往。'
'六三 无妄之災。或繫之牛。行人之得。邑人之災。'
'九四 可貞。无咎。'
'九五 无妄之疾。勿藥有喜。'
'上九 无妄。行有眚。无攸利。'

) "26" #(
'大畜 利貞。不家食。吉。利涉大川。'
'初九 有厲。利已。'
'九二 輿說輹。'
'九三 良馬逐。利艱貞。曰閑輿衛。利有攸往。'
'六四 童牛之牿。元吉。'
'六五 豶豕之牙。吉。'
'上九 何天之衢。亨。'

) "27" #(
'頤 貞吉。觀頤。自求口實。'
'初九 舍爾靈龜。觀我朶頤。凶。'
'六二 顛頤。拂經于丘。頤征凶。'
'六三 拂頤。貞凶。十年勿用。无攸利。'
'六四 顛頤。吉。虎視眈眈。其欲逐逐。无咎。'
'六五 拂經。居貞吉。不可涉大川。'
'上九 由頤。厲吉。利涉大川。'

) "28" #(
'大過 棟撓。利有攸往。亨。'
'初六 藉用白茅。无咎。'
'九二 枯楊生稊。老夫得其女妻。无不利。'
'九三 棟橈。凶。'
'九四 棟隆。吉。有它吝。'
'九五 枯楊生華。老婦得其士夫。无咎无譽。'
'上六 過涉滅頂。凶。无咎。'

) "29" #(
'習坎。有孚。維心亨。行有尚。'
'初六 習坎。入于坎窞。凶。'
'九二 坎有險。求小得。'
'六三 來之坎坎。險且枕。入于坎窞。勿用。'
'六四 樽酒簋貳。用缶。納約自牖。終无咎。'
'九五 坎不盈。祗既平。无咎。'
'上六 係用徽纆。寘于叢棘。三歲不得。凶。'

) "30" #(
'離 利貞。亨。畜牝牛。吉。'
'初九 履錯然。敬之。无咎。'
'六二 黃離。元吉。'
'九三 日昃之離。不鼓缶而歌。則大耋之嗟。凶。'
'九四 突如其來如。焚如。死如。棄如。'
'六五 出涕沱若。戚嗟若。吉。'
'上九 王用出征。有嘉。折首。獲匪其醜。无咎。'

) "31" #(
'咸 亨。利貞。取女吉。'
'初六 咸其拇。'
'六二 咸其腓。凶。居吉。'
'九三 咸其股。執其隨。往吝。'
'九四 貞吉悔亡。憧憧往來。朋從爾思。'
'九五 咸其脢。无悔。'
'上六 咸其輔頰舌。'

) "32" #(
'恆 亨。无咎。利貞。利有攸往。'
'初六 浚恆貞凶。无攸利。'
'九二 悔亡。'
'九三 不恆其德。或承之羞。貞吝。'
'九四 田无禽。'
'六五 恒其德貞。婦人吉。夫子凶。'
'上六 振恆凶。'

) "33" #(
'遯 亨。小利貞。'
'初六 遯尾厲。勿用有攸往。'
'六二 執之用黃牛之革。莫之勝說。'
'九三 係遯。有疾厲。畜臣妾吉。'
'九四 好遯。君子吉。小人否。'
'九五 嘉遯貞吉。'
'上九 肥遯无不利。'

) "34" #(
'大壯 利貞。'
'初九 壯于趾。征凶有孚。'
'九二 貞吉。'
'九三 小人用壯。君子用罔。貞厲。羝羊觸藩。羸其角。'
'九四 貞吉。悔亡。藩決不羸。壯于大輿之輹。'
'六五 喪羊于易。无悔。'
'上六 羝羊觸藩。不能退。不能遂。无攸利。艱則吉。'

) "35" #(
'晉 康侯用錫馬蕃庶。晝日三接。'
'初六 晉如摧如。貞吉。罔孚。裕无咎。'
'六二 晉如愁如。貞吉。受茲介福。于其王母。'
'六三 眾允悔亡。'
'九四 晉如鼫鼠。貞厲。'
'六五 悔亡。失得勿恤。往吉无不利。'
'上九 晉其角。維用伐邑。厲吉无咎。貞吝。'

) "36" #(
'明夷 利艱貞。'
'初九 明夷于飛。垂其翼。君子于行。三日不食。有攸往。主人有言。'
'六二 明夷。夷于左股。用拯馬壯吉。'
'九三 明夷于南狩。得其大首。不可疾貞。'
'六四 入于左腹。獲明夷之心。于出門庭。'
'六五 箕子之明夷。利貞。'
'上六 不明晦。初登于天。後入于地。'

) "37" #(
'家人 利女貞。'
'初九 閑有家。悔亡。'
'六二 无攸遂。在中饋。貞吉。'
'九三 家人嗃嗃。悔厲吉。婦子嘻嘻。終吝。'
'六四 富家大吉。'
'九五 王假有家。勿恤吉。'
'上九 有孚威如。終吉。'

) "38" #(
'睽 小事吉。'
'初九 悔亡。喪馬勿逐自復。見惡人。无咎。'
'九二 遇主于巷。无咎。'
'六三 見輿曳。其牛掣。其人天且劓。无初有終。'
'九四 睽孤。遇元夫。交孚。厲无咎。'
'六五 悔亡。厥宗噬膚。往何咎。'
'上九 睽孤。見豕負塗。載鬼一車。先張之弧。後說之弧。匪寇婚媾。往遇雨則吉。'

) "39" #(
'蹇 利西南。不利東北。利見大人。貞吉。'
'初六 往蹇來譽。'
'六二 王臣蹇蹇。匪躬之故。'
'九三 往蹇來反。'
'六四 往蹇來連。'
'九五 大蹇朋來。'
'上六 往蹇來碩。吉。利見大人。'

) "40" #(
'解 利西南。无所往。其來復吉。有攸往。夙吉。'
'初六 无咎。'
'九二 田獲三狐。得黃矢。貞吉。'
'六三 負且乘。致寇至。貞吝。'
'九四 解而拇。朋至斯孚。'
'六五 君子維有解。吉。有孚于小人。'
'上六 公用射隼于高墉之上。獲之无不利。'

) "41" #(
'損 有孚。元吉。无咎可貞。利有攸往。曷之用。二簋可用享。'
'初九 已事遄往。无咎。酌損之。'
'九二 利貞。征凶。弗損益之。'
'六三 三人行。則損一人。一人行。則得其友。'
'六四 損其疾。使遄有喜。无咎。'
'六五 或益之十朋之龜。弗克違。元吉。'
'上九 弗損益之。无咎。貞吉。利有攸往。得臣无家。'

) "42" #(
'益 利有攸往。利涉大川。'
'初九 利用為大作。元吉无咎。'
'六二 或益之十朋之龜。弗克違。永貞吉。王用享于帝吉。'
'六三 益之用凶事。无咎。有孚中行。告公用圭。'
'六四 中行。告公從。利用為依遷國。'
'九五 有孚惠心。勿問元吉。有孚惠我德。'
'上九 莫益之。或擊之。立心勿恆。凶。'

) "43" #(
'夬 揚于王庭。孚號有厲。告自邑。不利即戎。利有攸往。'
'初九 壯于前趾。往不勝為咎。'
'九二 惕號。莫夜有戎。勿恤。'
'九三 壯于頄。有凶。君子夬夬。獨行遇雨。若濡有慍。无咎。'
'九四 臀无膚。其行次且。牽羊悔亡。聞言不信。'
'九五 莧陸夬夬。中行无咎。'
'上六 无號。終有凶。'

) "44" #(
'姤 女壯。勿用取女。'
'初六 繫于金柅。貞吉。有攸往。見凶。羸豕孚蹢躅。'
'九二 包有魚。无咎。不利賓。'
'九三 臀无膚。其行次且。厲。无大咎。'
'九四 包无魚。起凶。'
'九五 以杞包瓜。含章。有隕自天。'
'上九 姤其角。吝。无咎。'

) "45" #(
'萃 亨。王假有廟。利見大人。亨。利貞。用大牲吉。利有攸往。'
'初六 有孚不終。乃亂乃萃。若號一握為笑。勿恤。往无咎。'
'六二 引吉无咎。孚乃利用禴。'
'六三 萃如嗟如。无攸利。往无咎。小吝。'
'九四 大吉无咎。'
'九五 萃有位。无咎匪孚。元永貞。悔亡。'
'上六 齎咨涕洟。无咎。'

) "46" #(
'升 元亨。用見大人。勿恤。南征吉。'
'初六 允升大吉。'
'九二 孚乃利用禴。无咎。'
'九三 升虛邑。'
'六四 王用亨于岐山。吉。无咎。'
'六五 貞吉升階。'
'上六 冥升。利于不息之貞。'

) "47" #(
'困 亨。貞大人吉。无咎。有言不信。'
'初六 臀困于株木。入于幽谷。三歲不覿。'
'九二 困于酒食。朱紱方來。利用享祀。征凶无咎。'
'六三 困于石。據于蒺蔾。入于其宮。不見其妻。凶。'
'九四 來徐徐。困于金車。吝。有終。'
'九五 劓刖。困于赤紱。乃徐有說。利用祭祀。'
'上六 困于葛藟。于臲卼。曰動悔有悔。征吉。'

) "48" #(
'井 改邑不改井。无喪无得。往來井井。汔至亦未繘井。羸其瓶。凶。'
'初六 井泥不食。舊井无禽。'
'九二 井谷射鮒。甕敝漏。'
'九三 井渫不食。為我心惻。可用汲。王明。並受其福。'
'六四 井甃无咎。'
'九五 井冽。寒泉食。'
'上六 井收勿幕。有孚元吉。'

) "49" #(
'革 巳日乃孚。元亨。利貞。悔亡。'
'初九 鞏用黃牛之革。'
'六二 巳日乃革之。征吉无咎。'
'九三 征凶貞厲。革言三就。有孚。'
'九四 悔亡有孚。改命吉。'
'九五 大人虎變。未占有孚。'
'上六 君子豹變。小人革面。征凶。居貞吉。'

) "50" #(
'鼎 元吉。亨。'
'初六 鼎顛趾。利出否。得妾以其子。无咎。'
'九二 鼎有實。我仇有疾。不我能即。吉。'
'九三 鼎耳革。其行塞。雉膏不食。方雨虧悔。終吉。'
'九四 鼎折足。覆公餗。其形渥。凶。'
'六五 鼎黃耳金鉉。利貞。'
'上九 鼎玉鉉。大吉。无不利。'

) "51" #(
'震 亨。震來虩虩。笑言啞啞。震驚百里。不喪匕鬯。'
'初九 震來虩虩。後笑言啞啞。吉。'
'六二 震來厲。億喪貝。躋于九陵。勿逐。七日得。'
'六三 震蘇蘇。震行无眚。'
'九四 震遂泥。'
'六五 震往來厲。意无喪有事。'
'上六 震索索。視矍矍。征凶。震不于其躬。于其鄰。无咎。婚媾有言。'

) "52" #(
'艮 其背。不獲其身。行其庭。不見其人。无咎。'
'初六 艮其趾。无咎。利永貞。'
'六二 艮其腓。不拯其隨。其心不快。'
'九三 艮其限。列其夤。厲熏心。'
'六四 艮其身。无咎。'
'六五 艮其輔。言有序。悔亡。'
'上九 敦艮吉。'

) "53" #(
'漸 女歸吉。利貞。'
'初六 鴻漸于干。小子厲有言。無咎。'
'六二 鴻漸于磐。飲食衎衎。吉。'
'九三 鴻漸于陸。夫征不復。婦孕不育。凶。利禦寇。'
'六四 鴻漸于木。或得其桷。无咎。'
'九五 鴻漸于陵。婦三歲不孕。終莫之勝。吉。'
'上九 鴻漸于陸。其羽可用為儀。吉。'

) "54" #(
'歸妹 征凶。无攸利。'
'初九 歸妹以娣。跛能履。征吉。'
'九二 眇能視。利幽人之貞。'
'六三 歸妹以須。反歸以娣。'
'九四 歸妹愆期。遲歸有時。'
'六五 帝乙歸妹。其君之袂。不如其娣之袂良。月幾望吉。'
'上六 女承筐无實。士刲羊无血。无攸利。'

) "55" #(
'豐 亨。王假之。勿憂。宜日中。'
'初九 遇其配主。雖旬无咎。往有尚。'
'六二 豐其蔀。日中見斗。往得疑疾。有孚發若。吉。'
'九三 豐其沛。日中見沬。折其右肱。无咎。'
'九四 豐其蔀。日中見斗。遇其夷主。吉。'
'六五 來章。有慶譽吉。'
'上六 豐其屋。蔀其家。闚其戶。闃其无人。三歲不覿。凶。'

) "56" #(
'旅 小亨。旅貞吉。'
'初六 旅瑣瑣。斯其所取災。'
'六二 旅即次。懷其資。得童僕貞。'
'九三 旅焚其次。喪其童僕。貞厲。'
'九四 旅于處。得其資斧。我心不快。'
'六五 射雉。一矢亡。終以譽命。'
'上九 鳥焚其巢。旅人先笑後號咷。喪牛于易。凶。'

) "57" #(
'巽 小亨。利有攸往。利見大人。'
'初六 進退。利武人之貞。'
'九二 巽在牀下。用史巫。紛若。吉。无咎。'
'九三 頻巽吝。'
'六四 悔亡。田獲三品。'
'九五 貞吉悔亡。无不利。无初有終。先庚三日。後庚三日。吉。'
'上九 巽在牀下。喪其資斧。貞凶。'

) "58" #(
'兌 亨。利貞。'
'初九 和兌吉。'
'九二 孚兌吉。悔亡。'
'六三 來兌凶。'
'九四 商兌未寧。介疾有喜。'
'九五 孚于剝。有厲。'
'上六 引兌。'

) "59" #(
'渙 亨。王假有廟。利涉大川。利貞。'
'初六 用拯馬壯吉。'
'九二 渙奔其机。悔亡。'
'六三 渙其躬。无悔。'
'六四 渙其羣元吉。渙有丘。匪夷所思。'
'九五 渙汗其大號。渙。王居无咎。'
'上九 渙其血。去逖出。无咎。'

) "60" #(
'節 亨。苦節不可貞。'
'初九 不出戶庭。无咎。'
'九二 不出門庭。凶。'
'六三 不節若。則嗟若。无咎。'
'六四 安節亨。'
'九五 甘節吉。往有尚。'
'上六 苦節貞凶。悔亡。'

) "61" #(
'中孚 豚魚吉。利涉大川。利貞。'
'初九 虞吉。有他不燕。'
'九二 鳴鶴在陰。其子和之。我有好爵。吾與爾靡之。'
'六三 得敵。或鼓或罷。或泣或歌。'
'六四 月幾望。馬匹亡。无咎。'
'九五 有孚攣如。无咎。'
'上九 翰音登于天。貞凶。'

) "62" #(
'小過 亨。利貞。可小事。不可大事。飛鳥遺之音。不宜上宜下。大吉。'
'初六 飛鳥以凶。'
'六二 過其祖。遇其妣。不及其君。遇其臣。无咎。'
'九三 弗過防之。從或戕之。凶。'
'九四 无咎。弗過遇之。往厲必戒。勿用永貞。'
'六五 密雲不雨。自我西郊。公弋取彼在穴。'
'上六 弗遇過之。飛鳥離之。凶。是謂災眚。'

) "63" #(
'既濟 亨小。利貞。初吉。終亂。'
'初九 曳其輪。濡其尾。无咎。'
'六二 婦喪其茀。勿逐。七日得。'
'九三 高宗伐鬼方。三年克之。小人勿用。'
'六四 繻有衣袽。終日戒。'
'九五 東鄰殺牛。不如西鄰之禴祭。實受其福。'
'上六 濡其首。厲。'

) "64" #(
'未濟 亨。小狐汔濟。濡其尾。无攸利。'
'初六 濡其尾。吝。'
'九二 曳其輪。貞吉。'
'六三 未濟征凶。利涉大川。'
'九四 貞吉悔亡。震用伐鬼方。三年有賞于大國。'
'六五 貞吉无悔。君子之光。有孚吉。'
'上九 有孚于飲酒。无咎。濡其首。有孚失是。'
)

)
	

	
! !

!Hexagram class methodsFor: 'class initialization' stamp: 'Install-IChing 25/Feb/2026 16:02:40'!
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

!Hexagram class methodsFor: 'class initialization' stamp: 'KenD 14/Jan/2022 13:08:43'!
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

!Hexagram class methodsFor: 'class initialization' stamp: 'KenD 14/Jan/2022 13:50:58'!
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

!Hexagram class methodsFor: 'private' stamp: 'KenD 17/Jan/2022 18:55:24'!
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

!Hexagram class methodsFor: 'images' stamp: 'KenD 25/Feb/2026 16:16:42'!
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

!Hexagram class methodsFor: 'images' stamp: 'KenD 17/Jan/2022 14:51:21'!
imageForKingWenIndex: oneTo64

	^ (oneTo64 isZero)
		ifTrue: [ ImageMorph new  "Empty (non)Image"
				image: (Form extent: 35@35 :: fillColor: Color transparent) ]
		ifFalse: [ ImageMorph new image: (PNGForms at: oneTo64) ]! !

!Hexagram class methodsFor: 'images' stamp: 'KenD 6/Mar/2026 14:10:51'!
kingWenImage

	^HexagramsMorph kingWenImage! !

!Hexagram class methodsFor: 'images' stamp: 'KenD 28/Feb/2026 12:33:39'!
kingWenPlusSpecialsImage
	"kingWen with marked out special pairs
	
HexaGram kingWenPlusSpecialsImage openInWorld.
	"
	|  displaySpace sameColor oppColor |
	displaySpace := self kingWenImage.
	
	"Hexagram is two identigal trigrams"
	sameColor := self duplicatedTrigramColor.
	"Hexagram inverted is opposing trigrams"
	oppColor   :=  self opposingTrigramColor.

	"Upper Hexagram = Lower Hexagram"
	displaySpace addMorphFront: (ColoredBoxMorph new 
							:: color: sameColor
							:: morphExtent: 104@50)
				position: 40@40.
	displaySpace addMorphFront: (ColoredBoxMorph new 
							:: color: sameColor
							:: morphExtent: 104@50)
				position: 233@187.
	displaySpace addMorphFront: (ColoredBoxMorph new 
							:: color: sameColor
							:: morphExtent: 104@50)
				position: 135@335.
	displaySpace addMorphFront: (ColoredBoxMorph new 
							:: color: sameColor
							:: morphExtent: 104@50)
				position: 40@385.				
				
	"Upper Hexagram is REVERSE of Lower Hexagram"
	displaySpace addMorphFront: (ColoredBoxMorph new 
							:: color: oppColor
							:: morphExtent: 104@50)
				position: 137@90.
	displaySpace addMorphFront: (ColoredBoxMorph new 
							:: color: oppColor
							:: morphExtent: 104@50)
				position: 334@188.
	displaySpace addMorphFront: (ColoredBoxMorph new 
							:: color: oppColor
							:: morphExtent: 104@50)
				position: 40@284.
	displaySpace addMorphFront: (ColoredBoxMorph new 
							:: color: oppColor
							:: morphExtent: 104@50)
				position: 333@382.

	^ displaySpace! !

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

!Trigram methodsFor: 'accessing' stamp: 'KenD 14/Jan/2022 12:40:17'!
bottom

	^ bottom ! !

!Trigram methodsFor: 'accessing' stamp: 'KenD 15/Jan/2022 13:33:18'!
lines

	^ {  bottom.  middle. top. }! !

!Trigram methodsFor: 'accessing' stamp: 'KenD 14/Jan/2022 12:40:29'!
middle

	^ middle ! !

!Trigram methodsFor: 'accessing' stamp: 'KenD 13/Jan/2022 13:21:36'!
name
	"One of #(heaven earth water fire thunder mountain wind lake)"
	
	^ self nameFromBase
	! !

!Trigram methodsFor: 'accessing' stamp: 'KenD 14/Jan/2022 12:41:13'!
top

	^ top ! !

!Trigram methodsFor: 'private' stamp: 'KenD 14/Jan/2022 12:43:47'!
midNameFromBroken

	^ ( middle polarity = #whole)
		ifTrue: [ self topNameFromBrokenWhole ] 
		ifFalse: [ self topNameFromBrokenBroken ]! !

!Trigram methodsFor: 'private' stamp: 'KenD 14/Jan/2022 12:43:40'!
midNameFromWhole

	^ ( middle polarity = #whole)
		ifTrue: [ self topNameFromWholeWhole ] 
		ifFalse: [ self topNameFromWholeBroken ]! !

!Trigram methodsFor: 'private' stamp: 'KenD 14/Jan/2022 12:43:31'!
nameFromBase

	^ ( bottom polarity = #whole)
		ifTrue: [ self midNameFromWhole ] 
		ifFalse: [ self midNameFromBroken ]! !

!Trigram methodsFor: 'private' stamp: 'KenD 14/Jan/2022 12:43:54'!
topNameFromBrokenBroken

	^ ( top polarity = #whole)
		ifTrue: [ #mountain ] 
		ifFalse: [ #earth ]! !

!Trigram methodsFor: 'private' stamp: 'KenD 14/Jan/2022 12:44:03'!
topNameFromBrokenWhole

	^ ( top polarity = #whole)
		ifTrue: [ #wind ] 
		ifFalse: [ #water ]! !

!Trigram methodsFor: 'private' stamp: 'KenD 14/Jan/2022 12:44:11'!
topNameFromWholeBroken

	^ ( top polarity = #whole)
		ifTrue: [ #fire ] 
		ifFalse: [ #thunder ]! !

!Trigram methodsFor: 'private' stamp: 'KenD 14/Jan/2022 12:44:20'!
topNameFromWholeWhole

	^ (top polarity = #whole)
		ifTrue: [ #heaven ] 
		ifFalse: [ #lake ]! !

!Trigram methodsFor: 'initialization' stamp: 'KenD 14/Jan/2022 12:42:29'!
top: upperLine middle: middleLine bottom: lowerLine

	top        := upperLine.
	middle   := middleLine.
	bottom  := lowerLine.! !

!Trigram methodsFor: 'changing' stamp: 'KenD 11/Apr/2026 14:05:02'!
trigramForChange

	^ Trigram 
		top:        (self top        lineForChange)
		middle:   (self middle  lineForChange)
		bottom: (self bottom lineForChange)! !

!Trigram class methodsFor: 'instance creation' stamp: 'KenD 14/Jan/2022 12:41:51'!
top: upperLine middle: middleLine bottom: lowerLine

	^self new :: top: upperLine middle: middleLine bottom: lowerLine! !

!HexagramsMorph class methodsFor: 'instance creation' stamp: 'KenD 11/Apr/2026 13:58:40'!
kingWenImage
	"Answer simple 8x8 display , left to right
	
HexagramsMorph kingWenImage openInWorld.
	"
	| imagePlusSpace  displaySpace |
	imagePlusSpace := 35 + 14. "35@35 is image size"
	displaySpace := self new 
				:: color: Color orange
				:: morphExtent: (480 @ 480).
	1 to: 8 do: [ :col |
		1 to: 8 do: [ :row | | hexImage |
			hexImage := Hexagram imageForKingWenIndex: row - 1 * 8 + col.
			displaySpace addMorph: hexImage.
			hexImage morphPosition: (col @ row) * imagePlusSpace
		]
	].
	
	^ displaySpace! !

!HexagramsMorph class methodsFor: 'new-morph participation' stamp: 'KenD 6/Mar/2026 14:09:05'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	
	^ true! !

!HexagramsMorph class methodsFor: 'new-morph participation' stamp: 'KenD 6/Mar/2026 14:16:02'!
initializedInstance
"
	self initializedInstance openInWorld.
"

	^self kingWenImage ! !

!GritterTransformMorph methodsFor: 'initialization' stamp: 'KenD 1/Mar/2026 10:09:32'!
initialize

	super initialize.
	isGritter := false.! !

!GritterTransformMorph methodsFor: 'initialization' stamp: 'KenD 28/Feb/2026 14:31:23'!
initializeKingWen

	"King Wen Square"
	0 to: 7 do: [ :rowIndex | | newRow |
		newRow := LayoutMorph newRow :: color: self color.
		1 to: 7 by: 2 do: [ :kwIndex | 
			newRow addMorph: (HexagramPairMorph forKingWenPair: (8 * rowIndex + kwIndex))
		].
		self addMorph: newRow
	]

	! !

!GritterTransformMorph methodsFor: 'geometry' stamp: 'KenD 4/Mar/2026 15:24:31'!
animateToGritter

	"Show Gritter Pattern."
	|  hexPairCollection |
	self isGritter ifTrue: [ ^self ]. "Done"

	"hexPairs in King Wen Order."
	hexPairCollection := OrderedCollection new.
	"Note that submorph display is reverse ordered."
	self submorphs reverseDo: [ :aRow |
		aRow submorphs reverseDo: [ :hexPair |
			hexPairCollection addLast: hexPair
		]
	].

	"Continuation Passing Style"

	self animate6from: hexPairCollection next: 
		[ self animate8from: hexPairCollection next:
			[ self animate2from: hexPairCollection next:
				[ self animate9from: hexPairCollection next:
					[ self animate7from: hexPairCollection next: 
						[ self isGritter: true;  redrawNeeded ]
					]
				]
			]
		]
! !

!GritterTransformMorph methodsFor: 'geometry' stamp: 'KenD 4/Mar/2026 15:08:46'!
transformToGritter

	"Show Gritter Pattern."
	|  nextRow hexPairCollection |

	"hexPairs in King Wen Order."
	hexPairCollection := OrderedCollection new.
	"Note that submorph display is reverse ordered."
	self submorphs reverseDo: [ :aRow |
		aRow submorphs reverseDo: [ :hexPair |
			hexPairCollection addLast: hexPair
		]
	].

	"Transcript log: hexPairCollection size printString, ' pairs'. --> 32 pairs"
	
	"6 "
	nextRow := LinearLayoutMorph newColumn :: color: Color transparent.
	self addMorphFront: nextRow.
	nextRow addMorphFront:  (self centerPairFrom: hexPairCollection).
	nextRow addMorphFront:  (self quadPairsFrom: hexPairCollection).
	nextRow addMorphFront:  (self centerPairFrom: hexPairCollection).
	self removeEmptyRows.
	nextRow borderColor: Color green; borderWidth: 4.
 
	"8"
	nextRow := LinearLayoutMorph newColumn :: color: Color transparent.
	self addMorphFront: nextRow.
	nextRow addMorphFront: (self quadPairsFrom: hexPairCollection).
	nextRow addMorphFront: (self emptyFive).
	nextRow addMorphFront: (self quadPairsFrom: hexPairCollection).
	self removeEmptyRows.
	nextRow borderColor: Color blue; borderWidth: 4.

	"center"
	nextRow := LinearLayoutMorph newColumn :: color: Color transparent.
	self addMorphFront: nextRow.
	nextRow addMorphFront:  (self centerPairFrom: hexPairCollection).
	nextRow addMorphFront:  (self centerPairFrom: hexPairCollection).
	self removeEmptyRows.

	"9"
	nextRow := LinearLayoutMorph newColumn :: color: Color transparent.
	self addMorphFront: nextRow.
	nextRow addMorphFront: (self quadPairsFrom: hexPairCollection).
	nextRow addMorphFront: (self centerPairFrom: hexPairCollection).
 	nextRow addMorphFront: (self quadPairsFrom: hexPairCollection).
	self removeEmptyRows.
	nextRow borderColor: Color yellow; borderWidth: 4.

	"7"
	nextRow := LinearLayoutMorph newColumn :: color: Color transparent.
	self addMorphFront: nextRow.
	nextRow addMorphFront:  (self centerPairFrom: hexPairCollection).
	nextRow addMorphFront:  (self fivePairsFrom: hexPairCollection).
	nextRow addMorphFront:  (self centerPairFrom: hexPairCollection).
	self removeEmptyRows.
	nextRow borderColor: Color red; borderWidth: 4.

	self isGritter: true.
	self redrawNeeded.
	! !

!GritterTransformMorph methodsFor: 'private-animation' stamp: 'KenD 5/Mar/2026 13:36:15'!
animate2from: hexPairCollection next:  nextAction

	"Center 2 hexPairs"
	| outerRow |
	outerRow := LinearLayoutMorph newColumn ::
		color: Color transparent;
		morphExtent: 593@102.
		
	self addMorph: outerRow behind: hexPairCollection first owner; layoutSubmorphs.
	
	self centerPairAnimateFrom: hexPairCollection to: outerRow next: 
		[  self centerPairAnimateFrom: hexPairCollection to: outerRow next: 
			[  self removeEmptyRows.
			   Delay forSeconds: self rowMoveDelay.
			    nextAction value.
			]
		]

	
! !

!GritterTransformMorph methodsFor: 'private-animation' stamp: 'KenD 5/Mar/2026 13:36:26'!
animate6from: hexPairCollection next:  nextAction

	"6 "
	| outerRow |
	outerRow := LinearLayoutMorph newColumn :: 
		color: Color transparent;
		morphExtent: 593@161;
		borderColor: Color green; 
		borderWidth: 4.
		
	self addMorph: outerRow behind: hexPairCollection first owner; layoutSubmorphs.
	
	self centerPairAnimateFrom: hexPairCollection to: outerRow next: 
		[ self quadPairsAnimateFrom: hexPairCollection to: outerRow next: 
			[ self centerPairAnimateFrom: hexPairCollection to: outerRow next: 
				[ self removeEmptyRows.
				   Delay forSeconds: self rowMoveDelay.
				    nextAction value.
				]
			]
		]

	
! !

!GritterTransformMorph methodsFor: 'private-animation' stamp: 'KenD 6/Mar/2026 14:30:10'!
animate7from: hexPairCollection next:  nextAction

	"7 "
	| outerRow |
	outerRow := LinearLayoutMorph newColumn :: 
		color: Color transparent;
		borderColor: Color red;
		borderWidth: 4.

	self addMorph: outerRow behind: hexPairCollection first owner; layoutSubmorphs.
	
	self centerPairAnimateFrom: hexPairCollection to: outerRow next: 
		[ self fivePairsAnimateFrom: hexPairCollection to: outerRow next: 
			[ self centerPairAnimateFrom: hexPairCollection to: outerRow next: 
				[ self removeEmptyRows.
				   Delay forSeconds: self rowMoveDelay.
				    nextAction value.
				]
			]
		]

	
! !

!GritterTransformMorph methodsFor: 'private-animation' stamp: 'KenD 5/Mar/2026 13:36:39'!
animate8from: hexPairCollection next:  nextAction

	"8 "
	| outerRow |
	outerRow := LinearLayoutMorph newColumn :: 
		color: Color transparent;
		morphExtent: 593@161;
		borderColor: Color blue; 
		borderWidth: 4.

	self addMorph: outerRow behind: hexPairCollection first owner; layoutSubmorphs.
	
	self quadPairsAnimateFrom: hexPairCollection to: outerRow next: 
		[  outerRow addMorphFront: (self emptyFive).
		    self quadPairsAnimateFrom: hexPairCollection to: outerRow next: 
			[ self removeEmptyRows.
			  Delay forSeconds: self rowMoveDelay.
			  nextAction value.
			]
		]

	
! !

!GritterTransformMorph methodsFor: 'private-animation' stamp: 'KenD 5/Mar/2026 13:36:46'!
animate9from: hexPairCollection next:  nextAction

	"9 "
	| outerRow |
	outerRow := LinearLayoutMorph newColumn :: 
		color: Color transparent;
		morphExtent: 593@161;
		borderColor: Color yellow;
		borderWidth: 4.

	self addMorph: outerRow behind: hexPairCollection first owner; layoutSubmorphs.
	
	self quadPairsAnimateFrom: hexPairCollection to: outerRow next: 
		[  self centerPairAnimateFrom: hexPairCollection to: outerRow next:
		    [ self quadPairsAnimateFrom: hexPairCollection to: outerRow next: 
			[ self removeEmptyRows.
			  Delay forSeconds: self rowMoveDelay.
			  nextAction value.
			]
		   ]
		]
	
! !

!GritterTransformMorph methodsFor: 'private-animation' stamp: 'KenD 4/Mar/2026 16:02:58'!
centerPairAnimateFrom: hexPairCollection to: outerRow next: nextAction

	"Add a row with next hexPair"
	| innerRow |
	innerRow := LinearLayoutMorph newRow :: 
		color: Color transparent; 
		axisEdgeWeight: #center;
		gap: 20;
		morphExtent: 585@51.
	outerRow addMorphFront: innerRow; layoutSubmorphs.
	
	hexPairCollection removeFirst 
		animateMoveTo: innerRow next: nextAction

	! !

!GritterTransformMorph methodsFor: 'private-animation' stamp: 'KenD 4/Mar/2026 16:03:10'!
fivePairsAnimateFrom: hexPairCollection to: outerRow next: nextAction

	"Add a row with next 5 hexPairs"
	| innerRow |
	innerRow := LinearLayoutMorph newRow :: 
		color: Color transparent; 
		gap: 20;
		morphExtent: 585@51.
	outerRow addMorphFront: innerRow; layoutSubmorphs.
	
	hexPairCollection removeFirst  animateMoveTo: innerRow next: 
		[ hexPairCollection removeFirst  animateMoveTo: innerRow next: 
			[ hexPairCollection removeFirst  animateMoveTo: innerRow next: 
				[ hexPairCollection removeFirst  animateMoveTo: innerRow next: 
					[ hexPairCollection removeFirst  animateMoveTo: innerRow next:  nextAction ]
				]
			]
		]
	! !

!GritterTransformMorph methodsFor: 'private-animation' stamp: 'KenD 4/Mar/2026 16:03:16'!
quadPairsAnimateFrom: hexPairCollection to: outerRow next: nextAction

	"Add a row with next 4 hexPairs"
	| innerRow |
	innerRow := LinearLayoutMorph newRow :: 
		color: Color transparent; 
		gap: 20;
		morphExtent: 585@51.
	outerRow addMorphFront: innerRow; layoutSubmorphs.
	
	hexPairCollection removeFirst  animateMoveTo: innerRow next: 
		[ hexPairCollection removeFirst  animateMoveTo: innerRow next: 
			[ innerRow addMorph: HexagramPairMorph emptyPair.
			  hexPairCollection removeFirst  animateMoveTo: innerRow next: 
				[ hexPairCollection removeFirst  animateMoveTo: innerRow next:  nextAction ]
			]
		]
	! !

!GritterTransformMorph methodsFor: 'private-animation' stamp: 'KenD 5/Mar/2026 13:36:03'!
rowMoveDelay

	^3 "seconds between row moves"! !

!GritterTransformMorph methodsFor: 'private' stamp: 'KenD 1/Mar/2026 14:09:30'!
centerPairFrom: hexPairCollection

	"Answer a row with next hexPair"
	^LinearLayoutMorph newRow :: 
		color: Color transparent; 
		axisEdgeWeight: #center;
		gap: 20;
		addMorph: hexPairCollection removeFirst! !

!GritterTransformMorph methodsFor: 'private' stamp: 'KenD 1/Mar/2026 14:09:25'!
emptyFive

	"Answer an empty row"
	^LinearLayoutMorph newRow :: 
		color: Color transparent;
		gap: 20; 
		axisEdgeWeight: #center;
		addMorph:HexagramPairMorph emptyPair  "defines size"! !

!GritterTransformMorph methodsFor: 'private' stamp: 'KenD 1/Mar/2026 14:09:20'!
fivePairsFrom: hexPairCollection

	"Answer a row with 4 hexPairs, empty center"
	| newRow |
	newRow := LinearLayoutMorph newRow :: 
		color: Color transparent;
		gap: 20.
	
	newRow addMorph: hexPairCollection removeFirst.
	newRow addMorph: hexPairCollection removeFirst.
	newRow addMorph: hexPairCollection removeFirst.
	newRow addMorph: hexPairCollection removeFirst.
	newRow addMorph: hexPairCollection removeFirst.
	
	^newRow! !

!GritterTransformMorph methodsFor: 'private' stamp: 'KenD 4/Mar/2026 14:45:24'!
quadPairsFrom: hexPairCollection

	"Answer a row with 4 hexPairs, empty center"
	| newRow |
	newRow := LinearLayoutMorph newRow :: 
		color: Color transparent;
		gap: 20.
	
	newRow addMorph: hexPairCollection removeFirst.
	newRow addMorph: hexPairCollection removeFirst.
	newRow addMorph: HexagramPairMorph emptyPair.
	newRow addMorph: hexPairCollection removeFirst.
	newRow addMorph: hexPairCollection removeFirst.
	^newRow! !

!GritterTransformMorph methodsFor: 'private' stamp: 'KenD 4/Mar/2026 15:06:40'!
removeEmptyRows

	(self submorphs select: [ :s | s submorphs size = 0 ]) do: 
						[ :emptyRow | emptyRow hide; delete ]! !

!GritterTransformMorph methodsFor: 'colorize' stamp: 'KenD 11/Apr/2026 13:58:40'!
showSpecials

	self submorphsDo: [ :rowLayout |
		rowLayout submorphsDo: [ :hexPair |
		(HexagramPairMorph duplicatedTrigrams includes: hexPair leftKingWenIndex) 
			ifTrue: [ hexPair color: Hexagram duplicatedTrigramColor ].
		(HexagramPairMorph opposingTrigrams includes: hexPair leftKingWenIndex) 
			ifTrue: [ hexPair color: Hexagram opposingTrigramColor ].
		]
	]
! !

!GritterTransformMorph methodsFor: 'colorize' stamp: 'KenD 11/Apr/2026 13:58:40'!
showSpecialsWIthSymmetrics

	self submorphsDo: [ :rowLayout |
		rowLayout submorphsDo: [ :hexPair |
		(HexagramPairMorph duplicatedTrigrams includes: hexPair leftKingWenIndex) 
			ifTrue: [ hexPair color: Hexagram duplicatedTrigramColor ].
		(HexagramPairMorph opposingTrigrams includes: hexPair leftKingWenIndex) 
			ifTrue: [ hexPair color: Hexagram opposingTrigramColor ].
		(HexagramPairMorph symmetricTrigrams includes: hexPair leftKingWenIndex) 
			ifTrue: [ hexPair color: Hexagram symmetricTrigramColor ].
		]
	]
! !

!GritterTransformMorph methodsFor: 'testing' stamp: 'KenD 1/Mar/2026 10:10:15'!
isGritter

	^isGritter! !

!GritterTransformMorph methodsFor: 'testing' stamp: 'KenD 1/Mar/2026 10:10:30'!
isGritter: aBoolean

	isGritter := aBoolean ! !

!GritterTransformMorph class methodsFor: 'instance creation' stamp: 'KenD 28/Feb/2026 14:25:11'!
fromKingWen

	| newSelf |
	newSelf := self newColumn.
	^newSelf color: Color orange; 
			padding: 25;
			initializeKingWen;
			yourself
	! !

!GritterTransformMorph class methodsFor: 'instance creation' stamp: 'KenD 6/Mar/2026 14:18:56'!
initializedInstance
"
	self initializedInstance openInWorld.
"
	^self fromKingWen :: showSpecials; transformToGritter! !

!HexagramPairMorph methodsFor: 'animation' stamp: 'KenD 5/Mar/2026 11:36:58'!
animateMoveTo: newContainer next: nextAction
	"Animate move of the top Card in aPile into aContainer."

	| worldPos oldContainer |
	oldContainer := self owner.
	worldPos := self positionInWorld.
	
	"Transfer card to World"
	oldContainer world addMorph: self.
	self morphPosition: worldPos.
	
	"Animate the image move -- in World coordinates"
	self slideTo: newContainer positionInWorld + (newContainer morphExtent // 2)
		  nSteps: self numberOfMoveSteps 
		  delay: self moveDelay
		  next: [
				"Give the card to otherContainer."
				self world removeMorph: self.
				newContainer addMorphFront: self.
				nextAction value
		  ].

! !

!HexagramPairMorph methodsFor: 'animation' stamp: 'KenD 4/Mar/2026 15:27:50'!
moveDelay

	^40
	! !

!HexagramPairMorph methodsFor: 'animation' stamp: 'KenD 4/Mar/2026 15:18:18'!
numberOfMoveSteps

	^20
	! !

!HexagramPairMorph methodsFor: 'animation' stamp: 'KenD 4/Mar/2026 14:32:27'!
slideTo: endPoint nSteps: numSteps delay: milliSecondsDelay next: nextAction
	"Slide self from current to new position -- in owner's coordinates"
	"Nota Bene: Asynchronous.  When complete,  nextAction value"

	| startPoint delta stepCount |
	startPoint := self morphPosition.
	delta := (endPoint - startPoint) / numSteps.
	stepCount := 0.
	self when: #morphicStep 
		evaluate: [ :ignoredArgument |
			stepCount := stepCount + 1.
			(stepCount < numSteps)
			ifTrue: [ 
				self morphPosition: (startPoint + (stepCount  * delta)) rounded; 
				redrawNeeded 
			]
			ifFalse: [ "done"
				self stopStepping.
				self morphPosition: endPoint.
				self removeActionsForEvent: #morphicStep.
				nextAction value
			]
	].
	self startSteppingStepTime: milliSecondsDelay! !

!HexagramPairMorph methodsFor: 'colorize' stamp: 'KenD 11/Apr/2026 13:58:40'!
color: backgroundColor

	"Replace my image with same hexagrams but new backgroundColor."
	| composer |
	composer := LinearLayoutMorph newRow ::
		color: backgroundColor;
		separation: 15 ; padding: 8;
		addMorph: ( Hexagram imageForKingWenIndex: leftKingWenIndex);
		addMorph: ( Hexagram imageForKingWenIndex: leftKingWenIndex + 1).
	self image: (composer imageForm: nil depth: 32); redrawNeeded ! !

!HexagramPairMorph methodsFor: 'accessing' stamp: 'KenD 28/Feb/2026 13:15:32'!
leftKingWenIndex

	^leftKingWenIndex! !

!HexagramPairMorph methodsFor: 'accessing' stamp: 'KenD 28/Feb/2026 13:15:56'!
leftKingWenIndex: anIndex

	leftKingWenIndex := anIndex! !

!HexagramPairMorph class methodsFor: 'class initialization' stamp: 'KenD 3/Mar/2026 14:57:51'!
initialize
"
	self initialize.
"
	"Set of 1st KingWen Index for pair"
	DuplicatedTrigrams := `{  1.  "2"   29. "30"  51. "52"  57. "58" }`.
	OpposingTrigrams   := `{ 11. "12"  63. "64"  31. "32"  41. "42" }`.
	SymmetricTrigrams := `{ "also 1 & 2 " 27. "28" 61. "62" }`. "same when inverted"
	! !

!HexagramPairMorph class methodsFor: 'accessing' stamp: 'KenD 3/Mar/2026 14:44:43'!
duplicatedTrigrams

	"Top trigram is same as bottom trigram"
	^DuplicatedTrigrams! !

!HexagramPairMorph class methodsFor: 'accessing' stamp: 'KenD 3/Mar/2026 14:44:57'!
opposingTrigrams

	"Top trigram is (xor) opposite of bottom trigram"
	^OpposingTrigrams ! !

!HexagramPairMorph class methodsFor: 'accessing' stamp: 'KenD 3/Mar/2026 14:43:25'!
symmetricTrigrams

	"Hexagrams inverted are same as original"
	^SymmetricTrigrams ! !

!HexagramPairMorph class methodsFor: 'instance creation' stamp: 'KenD 28/Feb/2026 14:47:28'!
emptyPair

	| newSelf composer |
	composer := ColoredBoxMorph new ::
		morphExtent: 101@51;
		color: Color transparent.
	newSelf := self newWith: (composer imageForm: nil depth: 32).
	^newSelf leftKingWenIndex: 0;
		yourself! !

!HexagramPairMorph class methodsFor: 'instance creation' stamp: 'KenD 11/Apr/2026 13:58:40'!
forKingWenPair: firstIndex

	| newSelf composer |
	composer := LinearLayoutMorph newRow ::
		color: Color transparent ;
		separation: 15 ; padding: 8;
		addMorph: ( Hexagram imageForKingWenIndex: firstIndex);
		addMorph: ( Hexagram imageForKingWenIndex: firstIndex + 1).
	newSelf := self newWith: (composer imageForm: nil depth: 32).
	^newSelf leftKingWenIndex: firstIndex;
		yourself! !

!HexagramPairMorph class methodsFor: 'instance creation' stamp: 'KenD 11/Apr/2026 13:58:40'!
forKingWenPair: firstIndex colorize: addColor

	| newSelf composer color |
	addColor ifTrue: [
		color := Color transparent.
		(DuplicatedTrigrams includes: firstIndex) 
			ifTrue: [ color := Hexagram duplicatedTrigramColor ].
		(OpposingTrigrams includes: firstIndex) 
			ifTrue: [ color := Hexagram opposingTrigramColor ].
	].
	composer := LinearLayoutMorph newRow ::
		color: color;
		separation: 15 ; padding: 8;
		addMorph: ( Hexagram imageForKingWenIndex: firstIndex);
		addMorph: ( Hexagram imageForKingWenIndex: firstIndex + 1).
	newSelf := self newWith: (composer imageForm: nil depth: 32).
	^newSelf leftKingWenIndex: firstIndex;
		yourself! !

!HexagramPairMorph class methodsFor: 'new-morph participation' stamp: 'KenD 6/Mar/2026 13:43:45'!
includeInNewMorphMenu
	"Return true for all classes that can be instantiated from the menu"
	^ false! !

!IChingResponsePanel methodsFor: 'GUI building' stamp: 'KenD 25/Feb/2026 16:04:58'!
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

!IChingResponsePanel methodsFor: 'GUI building' stamp: 'KenD 15/Jan/2022 17:54:53'!
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

!IChingResponsePanel methodsFor: 'GUI building' stamp: 'KenD 25/Feb/2026 16:04:31'!
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

!IChingResponsePanel class methodsFor: 'new-morph participation' stamp: 'KenD 16/Jan/2022 15:35:01'!
includeInNewMorphMenu
	"Not to be instantiated from the menu"
	^ true! !

!IChingResponsePanel class methodsFor: 'new-morph participation' stamp: 'KenD 11/Apr/2026 13:58:40'!
initializedInstance

	^ (IChingResponsePanel forHexagram: (Hexagram cast))! !

!IChingResponsePanel class methodsFor: 'instance creation' stamp: 'KenD 15/Jan/2022 13:58:54'!
forHexagram: aHexagram

	^ self open: aHexagram ! !
Hexagram initialize!
HexagramPairMorph initialize!
