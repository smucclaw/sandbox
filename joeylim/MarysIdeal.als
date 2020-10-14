/*
(From Summers 1968, puzzle 5).
Mary's ideal man is tall, dark, and handsome. She knows four men: Alec, Bill, Carl, and Dave. 
Only one of the four men has all of the characteristics Mary requires.
Only three of the men are tall, only two are dark, and only one is handsome.
Each of the four men has at least one of the required traits.
Alec and Bill have the same complexion.
Bill and Carl are the same height.
Carl and Dave are not both tall.
Which one of the four men satisfies all of Mary's requirements?
*/

enum Height {Tall, Short}
enum Complexion {Dark, Pale}
enum Looks {Handsome, Average}

abstract sig Man {
	height: Height,
	complexion: Complexion,
	looks: Looks
}

one sig A extends Man {}
one sig B extends Man {}
one sig C extends Man {}
one sig D extends Man {}

pred constraints {
	one m: Man | m.height = Tall && m.complexion = Dark && m.looks = Handsome
	one m: Man | m.height = Short
	#{m: Man | m.complexion = Dark} = 2
	one m: Man | m.looks = Handsome
	all m: Man | m.height = Tall || m.complexion = Dark || m.looks = Handsome
	one a: A, b: B | a.complexion = b.complexion
	one b: B, c: C | b.height = c.height
	one c: C, d: D | c.height = Short && d.height = Tall || c.height = Tall && d.height = Short
	
}

run constraints


