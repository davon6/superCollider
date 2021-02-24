(




o = {

	/*



	Out.kr(~bus9, SinOsc.ar(1.2875).range(10.3,81.41);
	Out.kr(~bus10, SinOsc.ar(0.1609375).range(0.0201171875,2637.02));

*/

	Out.kr(~bus1, MouseY.kr(0.2,0.00)/*LFNoise1.ar(1.2875).range(0.0986,0.05)*/);

	Out.kr(~bus3, SinOsc.ar(1.2875).range(81.41,164.81));



	Out.kr(~bus2, SinOsc.ar(0.0201171875).range(164.81,81.41));// useless





	Out.kr(~bus4, SinOsc.ar( 2.575 +SinOsc.kr(0.64375).range(0.01005859375,2.575)  ).range(20.60,1318.51));

	Out.kr(~bus5, SinOsc.ar(1.2875).range(5274.04,0.0201171875));//c3


	Out.kr(~bus6, SinOsc.ar(2.575).range(5274.04,0.0201171875));//c3
	Out.kr(~bus7, SinOsc.ar(5.15).range(5274.04,0.0201171875));
	Out.kr(~bus8, SinOsc.ar(0.321875).range(5274.04,0.0201171875));

	Out.kr(~bus9, SinOsc.ar(1.2875).range(10.3,81.41));

	Out.kr(~bus10,  MouseY.kr(0,957.9895));//,doneAction:2));


	Out.kr(~bus11, LFNoise0.kr(5.15).range(2.575,2637.02));
	Out.kr(~bus12, SinOsc.ar(0.64375).range(2637.02,0.0201171875));
	Out.kr(~bus13, SinOsc.ar(0.0201171875).range(81.41,164.81));//useless





 }.play;

/*
~micGrp = Group.new;
~ptrGrp = Group.after(~micGrp);
~recGrp = Group.after(~ptrGrp);
~granGrp = Group.after(~recGrp);

~effctGrp = Group.after(~granGrp);
~revGrp = Group.after(~effctGrp);*/

//Pseq([~bar14,   Pbindf(~kick, \dur, ~ending[0][0]          )  ],1).play(t)


Pseq([  Pseq([~bar14S,  ~ending[~boo[~ind]]],1) , Pseq([~bar14S,  ~ending[~boo[~ind+1]]],1) ,
	 Pseq([~bar14S,  ~ending[~boo[~ind+2]]],1), Pseq([~bar14S,  ~ending[~boo[~ind+3]]],1),
	Pseq([~bar14S,  ~ending[~boo[~ind+4]]],1), Pseq([~bar14S,  ~ending[~boo[~ind+5]]]),

	 Pseq([~bar14S,  ~ending[~boo[~ind+6]]],1), Pseq([~bar14S,  ~ending[~boo[~ind+7]]],1),
	Pseq([~bar14S,  ~ending[~boo[~ind+8]]],1), Pseq([~bar14S,  ~ending[~boo[~ind+9]]]),
		 Pseq([~bar14S,  ~ending[~boo[~ind+10]]],1), Pseq([~bar14S,  ~ending[~boo[~ind+11]]],1)
],1).play(t)



)