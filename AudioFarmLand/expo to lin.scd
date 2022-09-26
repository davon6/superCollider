({



	SinOsc.ar(73.midicps*(432/440)+

		SinOsc.ar(73.midicps*(432/440)+


			SinOsc.ar(73.midicps*(432/440)/10,mul: 73.midicps*(432/440)*5/10)
			,mul: 73.midicps*(432/440)*5))


}.play)






({



	SinOsc.ar(73.midicps*(432/440)+

		SinOsc.ar(  MouseY.kr(0,73.midicps*(432/440))+


			SinOsc.ar( MouseY.kr(73.midicps*(432/440)/10),mul: 73.midicps*(432/440)*5/10)
			,mul: 73.midicps*(432/440)*5))


}.play)


({

	SinOsc.ar(100+

		SinOsc.ar(23



			,mul:9000))



}.play)


({

	SinOsc.ar(100+

		SinOsc.ar(23

			+SinOsc.ar(0,mul: 0)

			,mul:9000))



}.play)


({



	SinOsc.ar(73.midicps*(432/440)+

		SinOsc.ar(  MouseY.kr(0,73.midicps*(432/440))+


			SinOsc.ar( MouseY.kr(0,73.midicps*(432/440)/10),mul:MouseY.kr(45, 73.midicps*(432/440)*5/10))
			,mul:  MouseY.kr( 9000,   73.midicps*(432/440)*5)))


}.play)



({



	SinOsc.ar(73.midicps*(432/440)+

		SinOsc.ar(  MouseY.kr(0,73.midicps*(432/440))+


			SinOsc.ar( MouseY.kr(0,73.midicps*(432/440)/10),mul:MouseY.kr(45, 73.midicps*(432/440)*5/10))


			,mul:  MouseY.kr( 9000,   73.midicps*(432/440)*5)))


}.play)





({


	Splay.ar(CombN.ar(
	SinOsc.ar(73.midicps*(432/440)+

		SinOsc.ar(  MouseY.kr(0,73.midicps*(432/440))+


			SinOsc.ar( MouseY.kr(0,73.midicps*(432/440)/10),mul:MouseY.kr(45, 73.midicps*(432/440)*5/10))


			,mul:  MouseY.kr( 9000,   73.midicps*(432/440)*5)))

		,

		0.2, [0.23,0.26],0.2),0.21)

}.play)






({


	Splay.ar(CombN.ar(


	SinOsc.ar(73.midicps*(432/440)+

		SinOsc.ar(  MouseY.kr(0,73.midicps*(432/440))+


			SinOsc.ar( MouseY.kr(0,73.midicps*(432/440)/10),mul:MouseY.kr(45, 73.midicps*(432/440)*5/10))


			,mul:  MouseY.kr( 9000,   73.midicps*(432/440)*5))

			+LFTri.kr(0.09).range(0,500)
		)

		,

		0.2, [0.23,0.26],0.2),0.21)

}.play)




