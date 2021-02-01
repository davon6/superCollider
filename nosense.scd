

(
~ind = 0;
~pseqs =    [Pseq([1 /4],1),Pseq([1 /4],4),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /1],1),Pseq([1 /1],4),Pseq([4 /1],1)];
~pseqsm =    [Pseq([1 /4],1),Pseq([1 /1],1)];

//TO RECONSID ~thrpseqs = [ Pseq([1/3],3),  Pseq([1/12],36) ,  Pseq([1/12],12),Pseq([1/12],72), Pseq([1/12],36) ,  Pseq([1/12],12),Pseq([1/12],72) ];

~thrpseqs = [  Pseq([ (Pseq([1/24],24)/1.5) ,Pseq([1/24],24),  (Pseq([1/24],24)*1.5)  ],1) ,Pseq([ (Pseq([1/24],12)/1.5) ,Pseq([1/24],12),  (Pseq([1/24],12)*1.5)  ],1) ,Pseq([ (Pseq([1/24],6)/1.5) ,Pseq([1/24],6),  (Pseq([1/24],6)*1.5)  ],1) ];


~pseqs=  [Pseq([1/3],3),  Pseq([1/12],36) ,  Pseq([1/12],12),Pseq([1/12],72),  Pseq([1/12],12),Pseq([1 /4],1),Pseq([1 /4],4),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /1],1),Pseq([1 /1],4),Pseq([4 /1],1)];


~pseqs=  [Pseq([1/3],3),  Pseq([1/12],36) ,  Pseq([1/12],12),Pseq([1/12],72), Pseq([1 /4],1),Pseq([1 /4],4),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /1],1),Pseq([1 /1],4),Pseq([4 /1],1)];


//~pseqs =    [Pseq([1 /4],4),Pseq([1 /4],16),Pseq([1 /1],1),Pseq([1 /1],4),Pseq([1 /1],16)];
~dure = [1,1,1,1,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,16];
~busFis = [~bus4,~bus4,~bus4,~bus4,~bus5,~bus5,~bus5,~bus5,~bus7,~bus8];
~wFils = [0,2];
~revTails = [0.1936,0.3872, 0.7744,0, 0];//Pseq([1/1],1),Pseq([1/4],1)
~factors = [500,5000,5,1,1,1,1,10];
~psqRises = [Pseq([1 /1],1),Pseq([4 /1],1),Pseq([1 /4],1),Pseq([1 /16],1)];
~damps = [0.22,0.8,0.4 ];//0.022
~wetsR = [0.2,0.1];
~amps = [0.1,0.01,0.001];
~spreads = [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,40];

~freqs = [657.9895,657.9895];//, 698.46.rand ];

~insts = [~fuzz, ~melo1, ~squelch, ~rnd];

~pp;~ff;~dd;~bf;~rt;~frq;~fct;~ps;~dps;~we;~tpp;~pm;~am;~ins;~sp;


~spread = {~sp = ~spreads[2.rand];~sp;};
~amp = {~am  = ~amps[3.rand];~am;};
~pseqm= {~pm=~pseqsm[2.rand]; ~pm;};
~tpseq = {~tpp = ~thrpseqs[3.rand]; ~tpp;};
~damp = {~dps = ~damps[3.rand];~dps;};
~psqRise = {~ps = ~psqRises[4.rand];~ps;};
~factor = {~fct = ~factors[6.rand];  ~fct;};
~freq = {~frq= ~freqs[2.rand];~frq;};
~revTail = {~rt = ~revTails[4.rand]; ~rt;};
~busFi = {~bf = ~busFis[10.rand];~bf;};
~dur =  {~dd =~dure[6.rand];~dd;};
~fil =  {~ff =~wFils[2.rand];~ff;};
~pseq = {~pp =~pseqs[14.rand];~pp;};//9
~wet = { ~we =~wetsR[2.rand]; ~we;};
~inst = {~ins =~insts[4.rand];~ins;};


~transRev = {|input|
	var compared,list,list2,count;
	count = 0;

	list = [~fuzz, ~melo1, ~squelch, ~rnd];

	list2 = [\revLFuzz,\revMelo,\revSquelch,\revRnd];
	compared = list[count];

	while({input.asCompileString.compare(compared.asCompileString)!=0},{count=count+1;compared = list[count];});

	list2[count];   };


~trans = {|input|

var compared,list,list2,count;

	count = 0;
/*
	list  = [Pseq([1/4],32),Pseq([1/8],32),Pseq([1 /4],1),Pseq([1 /4],4),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /1],1),Pseq([1 /1],4),Pseq([4 /1],1), Pseq([1/3],3),  Pseq([1/12],36) ,  Pseq([1/12],12),Pseq([1/12],72)];

	list2  =[Pseq([32/4],1),Pseq([32/8],1),Pseq([1 /4],1),Pseq([4 /4],1),Pseq([16 /4],1),Pseq([16 /4],1),Pseq([16 /4],1),Pseq([16 /4],1),Pseq([1 /1],1),Pseq([4 /1],1),Pseq([4 /1],1), Pseq([3/3],1),  Pseq([36/12],1) ,  Pseq([12/12],1),Pseq([72/12],1)];
	*/


		list  = [Pseq([1/4],32),Pseq([1/8],32),Pseq([1 /4],1),Pseq([1 /4],4),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /4],16),Pseq([1 /1],1),Pseq([1 /1],4),Pseq([4 /1],1),Pseq([ (Pseq([1/24],24)/1.5) ,Pseq([1/24],24),  (Pseq([1/24],24)*1.5)  ],1) ,Pseq([ (Pseq([1/24],12)/1.5) ,Pseq([1/24],12),  (Pseq([1/24],12)*1.5)  ],1) ,Pseq([ (Pseq([1/24],6)/1.5) ,Pseq([1/24],6),  (Pseq([1/24],6)*1.5)  ],1) ];

	list2  =[Pseq([32/4],1),Pseq([32/8],1),Pseq([1 /4],1),Pseq([4 /4],1),Pseq([16 /4],1),Pseq([16 /4],1),Pseq([16 /4],1),Pseq([16 /4],1),Pseq([1 /1],1),Pseq([4 /1],1),Pseq([4 /1],1),  Pseq([1 /1],1) ,Pseq([2 /1],1),Pseq([1 /2],1)];

	compared = list[count];

	while({input.asCompileString.compare(compared.asCompileString)!=0},{count=count+1;compared = list[count];});

	/*count.postln;*/list2[count];};

f = { |n=12, min=0, max=11| (min..max).scramble.keep(n) };
//~f2 = { |n=6, min=0, max=5| (min..max).scramble.keep(n) };

~boo = f.value(12, 0, 11);




//s.plotTree
//s.defaultGroup.stop



o = {
	Out.kr(~bus1, MouseY.kr(0.2,0.00)/*LFNoise1.ar(1.2875).range(0.0986,0.05)*/);

	Out.kr(~bus3, SinOsc.ar(1.2875).range(81.41,164.81));

	Out.kr(~bus2, SinOsc.ar(0.0201171875).range(164.81,81.41));

	Out.kr(~bus4, SinOsc.ar( 2.575 +SinOsc.kr(0.64375).range(0.01005859375,2.575)  ).range(20.60,1318.51));

	Out.kr(~bus5, SinOsc.ar(1.2875).range(5274.04,0.0201171875));//c3

	Out.kr(~bus6, SinOsc.ar(2.575).range(5274.04,0.0201171875));//c3
	Out.kr(~bus7, SinOsc.ar(5.15).range(5274.04,0.0201171875));
	Out.kr(~bus8, SinOsc.ar(0.321875).range(5274.04,0.0201171875));

	Out.kr(~bus9, //SinOsc.ar(1.2875).range(10.3,81.41));

		SinOsc.kr(     LFTri.kr( 0.321875).range(0.321875,10.3)).range(82.4,2637.02));


	Out.kr(~bus10,  Lag.kr(LFNoise0.kr(1.2875).range(41.2,1318.51),0.2)

		+SinOsc.kr(SelectX.kr(LFNoise0.kr(5.15).range(0,2).round(1),[1.2875,5.15,0.321875])).range(5274.04,20.6));

	Out.kr(~bus11, LFNoise0.kr(5.15).range(2.575,2637.02));
	Out.kr(~bus12, SinOsc.ar(0.64375).range(2637.02,0.0201171875));
	Out.kr(~bus13, SinOsc.ar(0.42916666666).range(20.6,41.20));

	Out.kr(~bus14, MouseY.kr(0,70));

	Out.kr(~bus15, SinOsc.ar(1.2875).range(41.2,1318.51));

}.play();


//  Ppar([      Pseq([Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16))],1),     ],inf).play(t)


//s.scope
//s.plotTree
Ppar([

Pbindef(\revLFuzz, \revtime,Pseq([1/4],inf)+~revTail.()),
	Pbindef(\revMelo, \revtime,Pseq([1/4],inf)+~revTail.()),
	Pbindef(\revSquelch, \revtime,Pseq([1/4],inf)+~revTail.()),
	Pbindef( \revRnd,\revtime,Pseq([1/4],inf)+~revTail.()),


Pseq([
	Pseq([
		Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16)),
	Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16)),
	Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16)),
		Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16)),



		Pbindf(~bassRest, \dur,Pseq([1/4],1)),
	Pbindf(~bassRest, \dur,Pseq([1/16],1)),
	Pbindf(~bassRest, \dur,Pseq([1/1],1)),



//	,Pbindef(~transRev.(~ins),\revtime,~trans.(Pseq([1/4],16)))
],4),


	Pseq([
		Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16)),
	Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16)),
	Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16)),
		Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16)),



		Pbindf(~bassRest, \dur,Pseq([1/4],1)),
	Pbindf(~bassRest, \dur,Pseq([1/16],1)),
	Pbindf(~bassRest, \dur,Pseq([1/1],1)),



//	,Pbindef(~transRev.(~ins),\revtime,~trans.(Pseq([1/4],16)))
],4),

	Pseq([
		Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16)),
	Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16)),
	Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16)),
		Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16)),



		Pbindf(~bassRest, \dur,Pseq([1/4],1)),
	Pbindf(~bassRest, \dur,Pseq([1/16],1)),
	Pbindf(~bassRest, \dur,Pseq([1/1],1)),



//	,Pbindef(~transRev.(~ins),\revtime,~trans.(Pseq([1/4],16)))
],4)



],inf)
],1).play(t)

)
	,








Pseq([
	Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16)),
	Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16)),
	Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16)),

//	,Pbindef(~transRev.(~ins),\revtime,~trans.(Pseq([1/4],16)))
],1),

Pseq([
	Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16)),
	Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16)),
	Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16)),

//	,Pbindef(~transRev.(~ins),\revtime,~trans.(Pseq([1/4],16)))
],1)

],4)

],1).play(t)

)


Pseq([

Pseq([
		Ppar([Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16)),Pbindef(~transRev.(~ins),\dur,~trans.(Pseq([1/4],16)),\revtime,~trans.(Pseq([1/4],16)))],1),
Ppar([Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16)),Pbindef(~transRev.(~ins),\dur,~trans.(Pseq([1/4],16)),\revtime,~trans.(Pseq([1/4],16)))],1),
Ppar([Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16)),Pbindef(~transRev.(~ins),\dur,~trans.(Pseq([1/4],16)),\revtime,~trans.(Pseq([1/4],16)))],1),
	],1),
	Pseq([
		Ppar([Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16)),Pbindef(~transRev.(~ins),\dur,~trans.(Pseq([1/4],16)),\revtime,~trans.(Pseq([1/4],16)))],1),
Ppar([Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16)),Pbindef(~transRev.(~ins),\dur,~trans.(Pseq([1/4],16)),\revtime,~trans.(Pseq([1/4],16)))],1),
Ppar([Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16)),Pbindef(~transRev.(~ins),\dur,~trans.(Pseq([1/4],16)),\revtime,~trans.(Pseq([1/4],16)))],1),
	],1),
	Pseq([
		Ppar([Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16)),Pbindef(~transRev.(~ins),\dur,~trans.(Pseq([1/4],16)),\revtime,~trans.(Pseq([1/4],16)))],1),
Ppar([Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16)),Pbindef(~transRev.(~ins),\dur,~trans.(Pseq([1/4],16)),\revtime,~trans.(Pseq([1/4],16)))],1),
Ppar([Pbindf(~inst.(), \dur,Pseq([1/4],16),\decE,Pseq([1/4],16)),Pbindef(~transRev.(~ins),\dur,~trans.(Pseq([1/4],16)),\revtime,~trans.(Pseq([1/4],16)))],1),
	],1),

],16).play(t, quant:1)


/*Pseq([

Pseq([
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),
		Pbindf(~inst.(), \dur,~pseq.(),\decE,~pp),


	],4),

],1).play(t, quant:1)*/



)



Ppar([






	Pseq([


		~starters[4.rand],        Pseq([~perc[3],  ~ending[~boo[~ind]]],1) ,
		~starters[4.rand],         Pseq([~perc[3],  ~ending[~boo[~ind+1]]],1) ,

	 ~starters[4.rand],     Pseq([~perc[3],  ~ending[~boo[~ind+2]]],1),
		~starters[4.rand],      Pseq([~perc[3],  ~ending[~boo[~ind+3]]],1),

	~starters[4.rand],           Pseq([~perc[3],  ~ending[~boo[~ind+4]]],1),
		~starters[4.rand],              Pseq([~perc[3],  ~ending[~boo[~ind+5]]]),


		Pseq([~kbassRest,Pseq([~bassRest],47),  	Ppar([

			/*
Pbindf(~cymbal, \dur,Pseq([ Pseq([1/4],4),Pseq([1/8],8), Pseq([1/16],16), Pseq([1/32],32) ,Pseq([1/4],4),Pseq([1/32],32),Pseq([1/64],64)],1),\out,~effctBus2), Pbindf(~hat, \dur,Pseq([ Pseq([1/4],4),Pseq([1/8],8), Pseq([1/16],16), Pseq([1/32],32) ,Pseq([1/4],4),Pseq([1/32],32),Pseq([1/64],64)],1),\out,~effctBus2),Pbindf(~snare,\type, Pseq([\rest,\rest ,\note, \rest], 2)) ,
*/
			Pdef(\wNoise,Pbind(\instrument, \wNoise,\dur, Pseq([1/1], 1),\amp,0.1,\out, ~reverbBus2,))   ,
	Pbind(\instrument,\reverb,\dur , Pseq([1/1], 1), \revtime, 3.0976, \in, ~reverbBus2,\group,~revGrp2,\out,~limitNonRec,


		\roomsize, 40,  \damping, 0.09, \inputbw, 0.75, \drylevel, -0, \earlylevel, -22, \taillevel, -4,\maxRoomsize,40,\wet,0.8
)
],1)],1),



	~starters[4.rand],      Pseq([~perc[3],  ~ending[~boo[~ind+6]]],1),
		~starters[4.rand],        Pseq([~perc[3],  ~ending[~boo[~ind+7]]],1),
	~starters[4.rand],         Pseq([~perc[3],  ~ending[~boo[~ind+8]]],1),
		~starters[4.rand],         Pseq([~perc[3],  ~ending[~boo[~ind+9]]]),
		 ~starters[4.rand],      Pseq([~perc[3],  ~ending[~boo[~ind+10]]],1),
		  ~starters[4.rand],      Pseq([~perc[3],  ~ending[~boo[~ind+11]]],1),



		~specialHits[4.rand],~specialHits[4.rand],~specialHits[4.rand],~specialHits[4.rand]





],1)   ,   //.play(t);









Ppar([
//Background

		//
		Pbind(\instrument, \lead,\dur, Pseq([64/1],1), \gra, 0, \eFreq, [329.63,331.63,334.63,335.63], \subsE, 0,\amp,(-37),\whichMod,2, \decE, Pseq([64/1],1),\whichEnv,1,\bus4, ~bus2 , \which,0,\out, ~comLead6, \bus,~bus15),
		//
		//
		 Pbind(\instrument,\comp,\dur,Pseq([64/1],1),\dec,Pseq([64/1],1) ,\thr ,0.8 ,\sB , 1, \sA , 0.25, \atk , 0.001, \rel ,0.04840
		//
		 ,\in, ~comLead6 ,\in2, ~kbus,\group, ~compGrp,\out,  ~limitNonRec  ),
		//
		//
		//
		Pbind(\instrument,\reverb,\dur,Pseq([64/1],1),\roomsize, 16, \revtime, Pseq([64/1],1)+3.0976, \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-10),\maxRoomsize,16,\in,~reverbNonRec , \out,0,\group, ~revGrp,\spread, 1,   \center, 0),



	//],1).play(t)

//Pseq([



Pseq([
//4.do({

Ppar([Pbind(\instrument,\lead,		\dur,~pseqm.(),\eFreq,81.41,\which,1,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,~pm,\bus,~bus12,\bus3,24,\bus4,~busFi.(),\bus5,~bus10,\amp,(-25),\factor,~factor.(),\subsE,0,\factor2,1,\vlPE, 1318.51/~factor.(),\dcPE,~revTails.(),\out,~comSquelch),

				Pbind(\instrument,\reverb,\dur,~trans.(~pm),\roomsize, 46, \revtime,~trans.(~pm)+~revTail.() , \damping, 0.50, \inputbw, 0.8, \drylevel, (-3), \earlylevel, (-5), \taillevel, (-10),\maxRoomsize,52,\wet,0.1,\in,~reverbSquelch , \out,~comSnaGrpBus,\group, ~revGrp)],1),


Ppar([Pbind(\instrument,\lead,\dur, ~tpseq.()  ,\type,Pseq([\note,\rest,\rest,\note],inf),\eFreq,  [329.63 ,326.63 ]
,\factor2,1,\vlPE, 3.01518518519,\decC,60,\which,2,\whichEnv,1, \gra,0.0012,\bus2,34,	\decE,~tpp

		,\bus,~bus12,\bus3,~bus14,\bus4,~bus13,\amp,(-30)	,\subsE,0,\lvlDec,0  ,\out,~comMelo),

			Pbind(\instrument,\reverb,\dur,~trans.(~tpp),\roomsize, 16, \revtime, ~trans.(~tpp)+(~revTails.()/3), \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-10),\maxRoomsize,46,\in,~reverbMelo , \out,~comSnaGrpBus,\group, ~revGrp)],1)


			,




Ppar([Pbind(\instrument,\lead, \dur,Pseq([1/1],1),\decE,0,\atkE,Pseq([1/1],1),\freq,661.44.rand.postln,

	\bus,~bus5 ,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,//\bus5,~bus10,


	\subsE,0,\which,0,\whichMod,2,\whichEnv,1,\amp,(-0), \gra,5.00.rand.postln,\out,~effctBus,\group, ~micGrp),

Pbind(\instrument, \effect,\wF,1,\dur, Pseq([1/1],1), \in,~effctBus,\out,~comMiniRise,\group,~effctGrp,\dec1,Pseq([1/1],1)),

Pbind(\instrument,\reverb,  \dur, Pseq([1/1],1),\roomsize, 40, \revtime,Pseq([1/1],1)+~revTail.(), \damping, 0.42, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -8,\amp,~amp.(),\spread,10,\wet,0.2,\maxRoomsize,60,\in,~reverbMiniRise,\out,~comSnaGrpBus,\group, ~revGrp)
			],1),




Ppar([Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq,661.44.rand.postln,
	\bus,40 ,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\bus5,~bus9,
\vlPE,0,\vlPE2,661.44,\dcPE,~pp,\crvEP,2,\factor2,2,
	\subsE,0,\which,1,\whichMod,2,\whichEnv,1,\amp,(-2), \gra,5.00.rand.postln,\out,~comRnd,\group, ~micGrp),


			Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 50, \revtime,~pp+~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,10,\wet,~wet.(),\maxRoomsize,80,\in,~reverbRnd,\out,~comSnaGrpBus,\group, ~revGrp)],1)
			,

			Ppar([Pbind(\instrument,\lead,		\dur,~pseqm.(),\eFreq,81.41,\which,1,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,~pm,\bus,~bus12,\bus3,24,\bus4,~busFi.(),\bus5,~bus10,\amp,(-25),\factor,~factor.(),\subsE,0,\factor2,1,\vlPE, 1318.51/~factor.(),\dcPE,~revTails.(),\out,~comSquelch),

				Pbind(\instrument,\reverb,\dur,~trans.(~pm),\roomsize, 46, \revtime,~trans.(~pm)+~revTail.() , \damping, 0.50, \inputbw, 0.8, \drylevel, (-3), \earlylevel, (-5), \taillevel, (-10),\maxRoomsize,52,\wet,0.1,\in,~reverbSquelch , \out,~comSnaGrpBus,\group, ~revGrp)],1),


Ppar([Pbind(\instrument,\lead,\dur, ~tpseq.()  ,\type,Pseq([\note,\rest,\rest,\note],inf),\eFreq,  [329.63 ,326.63 ]
,\factor2,1,\vlPE, 3.01518518519,\decC,60,\which,2,\whichEnv,1, \gra,0.0012,\bus2,34,	\decE,~tpp

		,\bus,~bus12,\bus3,~bus14,\bus4,~bus13,\amp,(-30)	,\subsE,0,\lvlDec,0  ,\out,~comMelo),

			Pbind(\instrument,\reverb,\dur,~trans.(~tpp),\roomsize, 16, \revtime, ~trans.(~tpp)+(~revTails.()/3), \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-10),\maxRoomsize,46,\in,~reverbMelo , \out,~comSnaGrpBus,\group, ~revGrp)],1)


			,




Ppar([Pbind(\instrument,\lead, \dur,Pseq([1/1],1),\decE,0,\atkE,Pseq([1/1],1),\freq,661.44.rand.postln,

	\bus,~bus5 ,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,//\bus5,~bus10,


	\subsE,0,\which,0,\whichMod,2,\whichEnv,1,\amp,(-0), \gra,5.00.rand.postln,\out,~effctBus,\group, ~micGrp),

Pbind(\instrument, \effect,\wF,1,\dur, Pseq([1/1],1), \in,~effctBus,\out,~comMiniRise,\group,~effctGrp,\dec1,Pseq([1/1],1)),

Pbind(\instrument,\reverb,  \dur, Pseq([1/1],1),\roomsize, 40, \revtime,Pseq([1/1],1)+~revTail.(), \damping, 0.42, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -8,\amp,~amp.(),\spread,10,\wet,0.2,\maxRoomsize,60,\in,~reverbMiniRise,\out,~comSnaGrpBus,\group, ~revGrp)
			],1),




Ppar([Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq,661.44.rand.postln,
	\bus,40 ,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\bus5,~bus9,
\vlPE,0,\vlPE2,661.44,\dcPE,~pp,\crvEP,2,\factor2,2,
	\subsE,0,\which,1,\whichMod,2,\whichEnv,1,\amp,(-2), \gra,5.00.rand.postln,\out,~comRnd,\group, ~micGrp),


			Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 50, \revtime,~pp+~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,10,\wet,~wet.(),\maxRoomsize,80,\in,~reverbRnd,\out,~comSnaGrpBus,\group, ~revGrp)],1)
			,














Ppar([Pbind(\instrument,\lead,		\dur,Pseq([1/8],32),\type,Pseq([\note, \rest],inf),
				\eFreq,81.41,\which,0,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,0.0484,\bus,~bus12,\bus3,24,\bus4,~busFi.(),\amp,(-25),\factor,~factor.(),\subsE,0,\out, ~comDelayed),


Pbind(\instrument,\pingD,\dur,~trans.(Pseq([1/8],32)),\bufnum, ~delay.bufnum, \feedback, 0.5, \delayTime,0.3,\dec,~trans.(Pseq([1/8],32)),\amp,4,\in, ~delayBus,\out,~limitDelayed,\group,~delayGrp),


				Pbind(\instrument,\reverb,\dur,~trans.(Pseq([1/8],32)),\roomsize, 16, \revtime,1.5488, \damping, ~damp.(), \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-5), \taillevel, (-10),\maxRoomsize,16,\in,~delayToRevBus , \out,~comSnaGrpBus,\group, ~revGrp)],1),





Ppar([Pbind(\instrument,\lead,		\dur,~pseqm.(),\eFreq,81.41,\which,1,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,~pm,\bus,~bus12,\bus3,24,\bus4,~busFi.(),\bus5,~bus10,\amp,(-25),\factor,~factor.(),\subsE,0,\factor2,1,\vlPE, 1318.51/~factor.(),\dcPE,~revTails.(),\out,~comSquelch),

				Pbind(\instrument,\reverb,\dur,~trans.(~pm),\roomsize, 46, \revtime,~trans.(~pm)+~revTail.() , \damping, 0.50, \inputbw, 0.8, \drylevel, (-3), \earlylevel, (-5), \taillevel, (-10),\maxRoomsize,52,\wet,0.1,\in,~reverbSquelch , \out,~comSnaGrpBus,\group, ~revGrp)],1),


Ppar([Pbind(\instrument,\lead,\dur, ~tpseq.()  ,\type,Pseq([\note,\rest,\rest,\note],inf),\eFreq,  [329.63 ,326.63 ]
,\factor2,1,\vlPE, 3.01518518519,\decC,60,\which,2,\whichEnv,1, \gra,0.0012,\bus2,34,	\decE,~tpp

		,\bus,~bus12,\bus3,~bus14,\bus4,~bus13,\amp,(-30)	,\subsE,0,\lvlDec,0  ,\out,~comMelo),

			Pbind(\instrument,\reverb,\dur,~trans.(~tpp),\roomsize, 16, \revtime, ~trans.(~tpp)+(~revTails.()/3), \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-10),\maxRoomsize,46,\in,~reverbMelo , \out,~comSnaGrpBus,\group, ~revGrp)],1)


			,




Ppar([Pbind(\instrument,\lead, \dur,Pseq([1/1],1),\decE,0,\atkE,Pseq([1/1],1),\freq,661.44.rand.postln,

	\bus,~bus5 ,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,//\bus5,~bus10,


	\subsE,0,\which,0,\whichMod,2,\whichEnv,1,\amp,(-0), \gra,5.00.rand.postln,\out,~effctBus,\group, ~micGrp),

Pbind(\instrument, \effect,\wF,1,\dur, Pseq([1/1],1), \in,~effctBus,\out,~comMiniRise,\group,~effctGrp,\dec1,Pseq([1/1],1)),

Pbind(\instrument,\reverb,  \dur, Pseq([1/1],1),\roomsize, 40, \revtime,Pseq([1/1],1)+~revTail.(), \damping, 0.42, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -8,\amp,~amp.(),\spread,10,\wet,0.2,\maxRoomsize,60,\in,~reverbMiniRise,\out,~comSnaGrpBus,\group, ~revGrp)
			],1),




Ppar([Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq,661.44.rand.postln,
	\bus,40 ,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\bus5,~bus9,
\vlPE,0,\vlPE2,661.44,\dcPE,~pp,\crvEP,2,\factor2,2,
	\subsE,0,\which,1,\whichMod,2,\whichEnv,1,\amp,(-2), \gra,5.00.rand.postln,\out,~comRnd,\group, ~micGrp),


			Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 50, \revtime,~pp+~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,10,\wet,~wet.(),\maxRoomsize,80,\in,~reverbRnd,\out,~comSnaGrpBus,\group, ~revGrp)],1)
			,

			Ppar([Pbind(\instrument,\lead,		\dur,~pseqm.(),\eFreq,81.41,\which,1,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,~pm,\bus,~bus12,\bus3,24,\bus4,~busFi.(),\bus5,~bus10,\amp,(-25),\factor,~factor.(),\subsE,0,\factor2,1,\vlPE, 1318.51/~factor.(),\dcPE,~revTails.(),\out,~comSquelch),

				Pbind(\instrument,\reverb,\dur,~trans.(~pm),\roomsize, 46, \revtime,~trans.(~pm)+~revTail.() , \damping, 0.50, \inputbw, 0.8, \drylevel, (-3), \earlylevel, (-5), \taillevel, (-10),\maxRoomsize,52,\wet,0.1,\in,~reverbSquelch , \out,~comSnaGrpBus,\group, ~revGrp)],1),


Ppar([Pbind(\instrument,\lead,\dur, ~tpseq.()  ,\type,Pseq([\note,\rest,\rest,\note],inf),\eFreq,  [329.63 ,326.63 ]
,\factor2,1,\vlPE, 3.01518518519,\decC,60,\which,2,\whichEnv,1, \gra,0.0012,\bus2,34,	\decE,~tpp

		,\bus,~bus12,\bus3,~bus14,\bus4,~bus13,\amp,(-30)	,\subsE,0,\lvlDec,0  ,\out,~comMelo),

			Pbind(\instrument,\reverb,\dur,~trans.(~tpp),\roomsize, 16, \revtime, ~trans.(~tpp)+(~revTails.()/3), \damping, 0.030, \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-10), \taillevel, (-10),\maxRoomsize,46,\in,~reverbMelo , \out,~comSnaGrpBus,\group, ~revGrp)],1)


			,




Ppar([Pbind(\instrument,\lead, \dur,Pseq([1/1],1),\decE,0,\atkE,Pseq([1/1],1),\freq,661.44.rand.postln,

	\bus,~bus5 ,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,//\bus5,~bus10,


	\subsE,0,\which,0,\whichMod,2,\whichEnv,1,\amp,(-0), \gra,5.00.rand.postln,\out,~effctBus,\group, ~micGrp),

Pbind(\instrument, \effect,\wF,1,\dur, Pseq([1/1],1), \in,~effctBus,\out,~comMiniRise,\group,~effctGrp,\dec1,Pseq([1/1],1)),

Pbind(\instrument,\reverb,  \dur, Pseq([1/1],1),\roomsize, 40, \revtime,Pseq([1/1],1)+~revTail.(), \damping, 0.42, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -8,\amp,~amp.(),\spread,10,\wet,0.2,\maxRoomsize,60,\in,~reverbMiniRise,\out,~comSnaGrpBus,\group, ~revGrp)
			],1),




Ppar([Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq,661.44.rand.postln,
	\bus,40 ,\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\bus5,~bus9,
\vlPE,0,\vlPE2,661.44,\dcPE,~pp,\crvEP,2,\factor2,2,
	\subsE,0,\which,1,\whichMod,2,\whichEnv,1,\amp,(-2), \gra,5.00.rand.postln,\out,~comRnd,\group, ~micGrp),


			Pbind(\instrument,\reverb,  \dur,~pp,\roomsize, 50, \revtime,~pp+~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,0.1,\spread,10,\wet,~wet.(),\maxRoomsize,80,\in,~reverbRnd,\out,~comSnaGrpBus,\group, ~revGrp)],1)
			,














Ppar([Pbind(\instrument,\lead,		\dur,Pseq([1/8],32),\type,Pseq([\note, \rest],inf),
				\eFreq,81.41,\which,0,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,0.0484,\bus,~bus12,\bus3,24,\bus4,~busFi.(),\amp,(-25),\factor,~factor.(),\subsE,0,\out, ~comDelayed),


Pbind(\instrument,\pingD,\dur,~trans.(Pseq([1/8],32)),\bufnum, ~delay.bufnum, \feedback, 0.5, \delayTime,0.3,\dec,~trans.(Pseq([1/8],32)),\amp,4,\in, ~delayBus,\out,~limitDelayed,\group,~delayGrp),


				Pbind(\instrument,\reverb,\dur,~trans.(Pseq([1/8],32)),\roomsize, 16, \revtime,1.5488, \damping, ~damp.(), \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-5), \taillevel, (-10),\maxRoomsize,16,\in,~delayToRevBus , \out,~comSnaGrpBus,\group, ~revGrp)],1),







			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,(-17),\out,~comFuzz,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~trans.(~pp),\roomsize, 41, \revtime,~trans.(~pp)+~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,~amp.(),\spread,100,\wet,~wet.(),\maxRoomsize,70,\in,~reverbBus,\out,~comSnaGrpBus, \group,~revGrp ),

			],1)
			,

			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,(-17),\out,~comFuzz,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~trans.(~pp),\roomsize, 41, \revtime,~trans.(~pp)+~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,~amp.(),\spread,100,\wet,~wet.(),\maxRoomsize,70,\in,~reverbBus,\out,~comSnaGrpBus, \group,~revGrp ),




			],1),




		Pseq([


			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,(-17),\out,~comFuzz,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~trans.(~pp),\roomsize, 41, \revtime,~trans.(~pp)+~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,~amp.(),\spread,100,\wet,~wet.(),\maxRoomsize,70,\in,~reverbBus,\out,~comSnaGrpBus, \group,~revGrp ),
			],1)

			,

			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,(-17),\out,~comFuzz,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~trans.(~pp),\roomsize, 41, \revtime,~trans.(~pp)+~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,~amp.(),\spread,100,\wet,~wet.(),\maxRoomsize,70,\in,~reverbBus,\out,~comSnaGrpBus, \group,~revGrp ),




			],1)


	],~dur.()),

		Pseq([


			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,(-17),\out,~comFuzz,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~trans.(~pp),\roomsize, 41, \revtime,~trans.(~pp)+~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,~amp.(),\spread,100,\wet,~wet.(),\maxRoomsize,70,\in,~reverbBus,\out,~comSnaGrpBus, \group,~revGrp ),
			],1)

			,

			Ppar([

			Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,(-17),\out,~comFuzz,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~trans.(~pp),\roomsize, 41, \revtime,~trans.(~pp)+~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,~amp.(),\spread,100,\wet,~wet.(),\maxRoomsize,70,\in,~reverbBus,\out,~comSnaGrpBus, \group,~revGrp ),



			],1)


	],~dur.()),




			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,(-17),\out,~comFuzz,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~trans.(~pp),\roomsize, 41, \revtime,~trans.(~pp)+~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,~amp.(),\spread,100,\wet,~wet.(),\maxRoomsize,70,\in,~reverbBus,\out,~comSnaGrpBus, \group,~revGrp ),
			],1)

			,

			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,(-17),\out,~comFuzz,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~trans.(~pp),\roomsize, 41, \revtime,~trans.(~pp)+~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,~amp.(),\spread,100,\wet,~wet.(),\maxRoomsize,70,\in,~reverbBus,\out,~comSnaGrpBus, \group,~revGrp ),




			],1)


,









		].scramble,inf)

//  s.meter

		,//maybe 16

		],1)











],1).play(t,quant:1);







		)
















(
Ppar([


	//Pbind(\instrument, \lead, \dur,Pseq([1024/1],1),\bus5,~bus10,\type,\rest),




	Pseq([
		Pseq([~specialHits[1],Ppar([~specialHits[2],     Ppar([
	Pdef(\wNoise,Pbind(\instrument, \wNoise,\dur, Pseq([1/1], 1),\amp,0.008,\out, ~reverbBus2,))   ,
	Pbind(\instrument,\reverb,\dur , Pseq([1/1], 1), \revtime, 3.0976, \in, ~reverbBus2,\group,~revGrp2,\out,~limitNonRec,


		\roomsize, 40,  \damping, 0.09, \inputbw, 0.75, \drylevel, -0, \earlylevel, -22, \taillevel, -4,\maxRoomsize,40,\wet,0.8
		)],1) ,~specialHits[3]     ],1),~specialHits[0]  ],1),~arrSpecialKB[~boo[~ind]], Pseq([~perc[5]],2) ,~arrSpecialKB[~boo[~ind+1]],~arrSpecialKB[~boo[~ind+2]], Pseq([~perc[5]],2) ,~arrSpecialKB[~boo[~ind+3]],~arrSpecialKB[~boo[~ind+4]], Pseq([~perc[5]],2) ,~arrSpecialKB[~boo[~ind+5]],~arrSpecialKB[~boo[~ind+6]], Pseq([~perc[5]],2) ,~arrSpecialKB[~boo[~ind+7]],~arrSpecialKB[~boo[~ind+8]], Pseq([~perc[5]],2) ,~arrSpecialKB[~boo[~ind+9]],~arrSpecialKB[~boo[~ind+10]], Pseq([~perc[5]],2) ,~arrSpecialKB[~boo[~ind+11]]


	, Pseq([~perc[5]],3),~half16],1),






Pseq([

		Pseq([


			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,(-23),\out,~comFuzz,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~trans.(~pp),\roomsize, 41, \revtime,~trans.(~pp)+~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,~amp.(),\spread,100,\wet,~wet.(),\maxRoomsize,70,\in,~reverbBus,\out,~comSnaGrpBus, \group,~revGrp ),

			],1)
			,

			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,(-23),\out,~comFuzz,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~trans.(~pp),\roomsize, 41, \revtime,~trans.(~pp)+~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,~amp.(),\spread,100,\wet,~wet.(),\maxRoomsize,70,\in,~reverbBus,\out,~comSnaGrpBus, \group,~revGrp ),




			],1)


	],~dur.()),

		Pseq([


			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,(-23),\out,~comFuzz,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~trans.(~pp),\roomsize, 41, \revtime,~trans.(~pp)+~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,~amp.(),\spread,100,\wet,~wet.(),\maxRoomsize,70,\in,~reverbBus,\out,~comSnaGrpBus, \group,~revGrp ),
			],1)

			,

			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,(-23),\out,~comFuzz,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~trans.(~pp),\roomsize, 41, \revtime,~trans.(~pp)+~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,~amp.(),\spread,100,\wet,~wet.(),\maxRoomsize,70,\in,~reverbBus,\out,~comSnaGrpBus, \group,~revGrp ),




			],1)


	],~dur.()),

		Pseq([


			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,(-23),\out,~comFuzz,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~trans.(~pp),\roomsize, 41, \revtime,~trans.(~pp)+~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,~amp.(),\spread,100,\wet,~wet.(),\maxRoomsize,70,\in,~reverbBus,\out,~comSnaGrpBus, \group,~revGrp ),
			],1)

			,

			Ppar([

			Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,(-23),\out,~comFuzz,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~trans.(~pp),\roomsize, 41, \revtime,~trans.(~pp)+~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,~amp.(),\spread,100,\wet,~wet.(),\maxRoomsize,70,\in,~reverbBus,\out,~comSnaGrpBus, \group,~revGrp ),



			],1)


	],~dur.()),

		Pseq([


			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,(-23),\out,~comFuzz,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~trans.(~pp),\roomsize, 41, \revtime,~trans.(~pp)+~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,~amp.(),\spread,100,\wet,~wet.(),\maxRoomsize,70,\in,~reverbBus,\out,~comSnaGrpBus, \group,~revGrp ),
			],1)

			,

			Ppar([

				Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.(),\whichMod,2,\whichEnv,1,\amp,(-23),\out,~comFuzz,\group, ~micGrp),

				Pbind(\instrument,\reverb,  \dur,~trans.(~pp),\roomsize, 41, \revtime,~trans.(~pp)+~revTail.(), \damping, ~damp.(), \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,~amp.(),\spread,100,\wet,~wet.(),\maxRoomsize,70,\in,~reverbBus,\out,~comSnaGrpBus, \group,~revGrp ),




			],1)


	],~dur.()),



],16)

	//],inf)



	],1).play(t, quant:1);)




//],inf),

//],1)

//.play(t)







)
s.defaultGroups.freeAll
s.scope
s.plotTree

FreqScope.new



//INSPO FOR LOOSE BIT AROUND


Ppar([

	Pbind(\instrument,\lead,		\dur,Pseq([1/1],1),\eFreq,81.41,\which,0,\whichMod,2,\whichEnv,1,/*\wCar,1,*/ \gra,0,\bus2,34,	\decE,Pseq([1/1],1)/*~pp*/,\bus,~bus12,\bus3,24,\bus4,~busFi.(),\amp,0.1,\factor,~factor.(),\subsE,0,\out, ~delayBus),




	Pbind(\instrument,\pingD,\dur,Pseq([1/1],1),\bufnum, ~delay.bufnum, \feedback, 0.5, \delayTime,0.3,\dec,5,\in, ~delayBus,\out,0,\group,~effctGrp),




Pbind(\instrument,\reverb,\dur,Pseq([1/1],1),\roomsize, 16, \revtime,Pseq([1/1],1)+1.5488 , \damping, ~damp.(), \inputbw, 0.5, \drylevel, (-3), \earlylevel, (-5), \taillevel, (-10),\maxRoomsize,16,\in,~reverbBus , \out,0,\group, ~revGrp)],1).play(t)