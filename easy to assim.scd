s.plotTree
s.meter


(


~micGrp = Group.new;
~ptrGrp = Group.after(~micGrp);
~recGrp = Group.after(~ptrGrp);
~granGrp = Group.after(~recGrp);

~effctGrp = Group.after(~granGrp);
~effctGrp2 = Group.after(~effctGrp);

~delayGrp =  Group.after(~effctGrp2);

~compGrp = Group.after(~delayGrp);

~revGrp = Group.after(~compGrp);
~revGrp2 = Group.after(~revGrp);

~limitGrp = Group.after(~revGrp2);

~compGrp2 = Group.after(~limitGrp);

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
	Out.kr(~bus13, SinOsc.ar(0.64375).range(20.6,41.20));   //   0.42916666666

	Out.kr(~bus14, MouseY.kr(0,70));

	Out.kr(~bus15, SinOsc.ar(1.2875).range(41.2,1318.51));

}.play();


Ppar([

		Pseq([Pbindf(~kick,\out,~kbus)],4096),
	Pseq([Pbindf(~snare,\out,~snBus)],1024),

	Pseq([Pbind(\instrument,\lead, \dur,~pseq.(),\decE,~pp,\freq, ~freq.(),\bus, ~busFi.(),\bus2,~bus1,\bus3, 40,\bus4,40,\bus7,50,\bus8, ~bus4,\subsE,0,\which,~fil.() ,\whichMod,0,\whichEnv,1,\amp,(-20),\out,~rteFil.(~ff),\group, ~micGrp)],400),
	//~fil.()

Pbind(\instrument,\comp, \dur,Pseq([64/1],1),\thr,0.2 ,\sB, 1.086,\sA, 0.2,\atk ,0.0242, \rel ,0.04840
,\in, ~comFuzz ,\in2, ~kbus, \out,~reverbBus, \group, ~compGrp),


	Pbind(\instrument,\comp, \dur,Pseq([64/1],1),\thr,0.2 ,\sB, 1.086,\sA, 0.2,\atk ,0.0242, \rel ,0.04840
,\in, ~comFuzz2 ,\in2, ~kbus, \out,~reverbBus2, \group, ~compGrp),


	Pdef(\revLFuzz,
		Pbind(\instrument,\reverb, \dur,Pseq([1024/1],1),\roomsize, 41, \revtime,~revTail.(), \damping,0.1, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,1,\spread,~spread.(),\wet,~wet.(),\maxRoomsize,70,\in,~reverbBus,\out,~limitFuzz, \group,~revGrp )),


	Pdef(\revHFuzz,
		Pbind(\instrument,\reverb, \dur,Pseq([1024/1],1),\roomsize, 41, \revtime,~revTail.(), \damping,0.1, \inputbw, 0.5, \drylevel, -10, \earlylevel, -22, \taillevel, -5,\amp,1,\spread,~spread.().postln,\wet,~wet.().postln,\maxRoomsize,70,\in,~reverbBus2,\out,~limitFuzz2, \group,~revGrp )),



	Pbind(\instrument, \limiter,\in, ~limitFuzz, \dur, Pseq([64/1],1),\du,0.3, \vol,(-0.3),\gain,3.2,\group,~limitGrp,\out,0),

	Pbind(\instrument, \limiter,\in, ~limitFuzz2, \dur, Pseq([64/1],1),\du,0.3, \vol,(-0.3),\gain,3.7,\group,~limitGrp,\out,0),
],1).play(t,quant:0)


)