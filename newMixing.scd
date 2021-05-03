

~mixingUlti = Synth(\EQHP10, [\in, ~eqBus10, \frq, 100,\vol, 2.2], ~eqGrp2/*\val,13000,\quant,4, \gain,(-16),\val2,3600,\quant2,16, \gain2,(-8),*/);
 ~mixingUlti.set(\vol, 0.2);

~comp2=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp2.set(\thr,0.82 ,\sB, 1.16,\sA, 1/2,\atk ,0.0242, \rel ,0.3872, \gain,1,\in, ~comFuzz,\out,~limitFuzz);
~mix2= Synth(\limiterStoMixer,[\c2,1,\in, ~limitFuzz, \gain,25,\out,~stereoBus1],~limitGrp);
// ~mixa.set(\in,~stereoBus1);
~mix2.set(\gain,55);

~comp3=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp3.set(\thr,0.82 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.3872, \gain,1,\in, ~comBus1, \out,~limitBus1);
~mix3= Synth(\limiterStoMixer,[\c3,1,\in, ~limitBus1,\gain,10,\out,~sterBus1],~limitGrp);
// ~mixa.set(\in,~sterBus1);
 ~mix3.set(\gain,45);

~comp4=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp4.set(\thr,0.82 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.3872, \gain,1,\in, ~comBus2, \out,~limitBus2);
~mix4= Synth(\limiterStoMixer,[\c4,1,\in, ~limitBus2,\gain,10,\out,~sterBus2],~limitGrp);
// ~mixa.set(\in,~sterBus2);
~mix4.set(\gain,60);

// (~bufSnoopy.numFrames.rrand(1400000)- 1400000)

~playM=Synth( \playBufX, [\impulse, 0.321875, \start,~main1,\buf,~bufSnoopy,\out, ~filterRnd,\loo,1]);
~comp5=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp5.set(\thr,0.9 ,\sB, 1.005,\sA, 1/4,\atk ,0.0121, \rel ,0.0968,\gain,1,\in, ~comFuzz23, \out,~limitFuzz23);
~mix5= Synth(\limiterStoMixer,[\c5,1,\in, ~limitFuzz23, \gain,4.8, \out,~stereoBus23],~limitGrp);
// ~mixa.set(\in,~stereoBus3);
~mix5.set(\gain,66);

~playM2=Synth(  \playBufX,[ \impulse, 0.321875,\dur,inf, \start,~main2,\buf,~bufSnoopy,\out,   ~gateRnd,\loo,1]);
~comp6=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp6.set(\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comBusHat2 , \out,~comBusCymb2);
~mix6= Synth(\limiterStoMixer,[\c6,1,\in, ~comBusCymb2, \gain,16, \out,~limitRkick2],~limitGrp);
// ~mixa.set(\in,~stereoBus23);
~mix6.set(\gain,32);

~comp7=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp7.set(\thr,0.9 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in,~toCompFlo, \out,~toLimitFlo);
~mix7= Synth(\limiterStoMixer,[\c7,1,\in,~toLimitFlo, \gain,15, \out,~toStereoFlo],~limitGrp);
// ~mixa.set(\in,~limitRkick2);
~mix7.set(\gain,24);


//~no2S = (~bufSnoopy.numFrames.rrand(1400000)- 1400000);

~playNo2= Synth(\playBufX, [\impulse, 1.2875, \start, ~no2S,\buf,~bufSnoopy,\out, ~toGateX2,\loopy,1]);
~playNo2.set(\start, ~no2S);
~comp8=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp8.set(\thr,0.8 ,\sB, 1.05,\sA, 1/2,\atk ,0.0484, \rel ,0.3872,\in,~no2ToCom ,\out,~no2ToLimit);
~mix8= Synth(\limiterStoMixer,[\c8,1,\in, ~no2ToLimit,\gain,5.2,\out,~no2ToStereo],~limitGrp);
// ~mixa.set(\in,~no2ToStereo);
~mix8.set(\gain,42 );

~comp9=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp9.set(\thr,0.8 ,\sB, 1.2,\sA, 1/4,\atk ,0.0484, \rel ,0.3872 ,\gain, 10,\in, ~comDelay, \out,~limitDelay);
~mix9= Synth(\limiterStoMixer,[\c9,1,\in,~limitDelay,\gain,12,\out ,~stereoBus3],~limitGrp);
// ~mixa.set(\in,~stereoBus3);
 ~mix9.set(\gain,51);

~comp10=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp10.set(\thr,0.8 ,\sB, 1.05,\sA, 1/2,\atk ,0.0484, \rel ,0.0968,\gain,1,\in, ~percuCom, \out,~percuLimit);
~mix10= Synth(\limiterStoMixer,[ \c10,1,\in,~percuLimit, \gain,46,\out,~percuStereo],~limitGrp);
// ~mixa.set(\in,~percuStereo);
~mix10.set(\gain,75 );





~mix20=	Synth( \limiter10toMixer,[\c20,1,\dur, inf, \in,~rythmLimit,\out,~rythmComp, \gain,60,], ~limitGrp);
//~mix20.set(\gain,60)
~mix11= Synth(\limiterStoMixer,[\c11,1,\in, ~riToLimit,\gain,13,\out,~riToStereo],~limitGrp);
// ~mixa.set(\in,~riToStereo);
// ~mix11.set(\gain,13)


~mix15= Synth(\limiterStoMixer,[\c15,1,\in, ~limitFuzz3,\gain,30,\out,~stereoBus4],~limitGrp);
// ~mixa.set(\in,~stereoBus4);
// ~mix15.set(\gain,30)  //noise start
~mix16= Synth(\limiterStoMixer,[\c16,1,\in, ~flanToLimit,\gain,12,\out,~flanToStereo],~limitGrp);
// ~mixa.set(\in,~flanToStereo);
// ~mix16.set(\gain,12);
~mix14= Synth(\limiterStoMixer,[ \c14,1,\in, ~slideBusToLimit,\out,~again, \gain, 30],~limitGrp);
//PROBLEM
// ~mixa.set(\in,~stereoBus3);
// ~mix14.set(\gain,30);

~mix26= Synth(\limiterToMixer,[\c26,1,\in, ~slideBusToLimit2,\gain,45,\out,~toStereoRise],~limitGrp);
~mix27= Synth(\limiterStoMixer,[\c27,1,\in, ~flanToLimit2,\gain,7,\out,~flanToStereo2],~limitGrp);
// ~mixa.set(\in,~flanToStereo2);
// ~mix27.set(\gain,7);

~mix28= Synth(\limiterToMixer,[\c28,1,\in,~riToLimit2 ,\gain,13,\out,~riToStereo2],~limitGrp);
// ~mix28.set(\gain,13);
~mix29= Synth(\limiterStoMixer,[\c29,1,\in,~riToLimit3 ,\gain,13,\out,~riToStereo3],~limitGrp);
// ~mixa.set(\in,~riToStereo3);
// ~mix29.set(\gain,13);
~mix30= Synth(\limiterToMixer,[\c30,1,\in,~noiseToLimit ,\gain,25,\out,~noiseToStereo],~limitGrp);
// ~mixa.set(\in,~noiseToStereo);
// ~mix30.set(\gain,25);


//I THINK PART 2 BELOW
~mix31= Synth(\limiterStoMixer,[\c31,1,\in,~limitPerch2 ,\gain,6,\out,~stereoPerch],~limitGrp);
// ~mixa.set(\in,~stereoPerch);
// ~mix31.set(\gain,6)
/*~mix32= Synth(\limiterStoMixer,[\c32,1,\in, ~limitPerch3,\gain,88,\out,~perchLimiToG3],~limitGrp);
// ~mix32.set(\gain,88)
~mix33= Synth(\limiterStoMixer,[\c33,1,\in,~limitPerch4 ,\gain,90,\out,~perchLimiToG4],~limitGrp);
//~mix33.set(\gain,90)
~mix34= Synth(\limiterStoMixer,[\c34,1,\in,~limitPerch5 ,\gain,90,\out,~perchLimiToG5],~limitGrp);
// ~mix33.set(\gain,90)
~mix35= Synth(\limiterStoMixer,[\c35,1,\in, ~limitPerch6,\gain,105,\out,~perchLimiToG6],~limitGrp);
// ~mix35.set(\gain,105)
~mix36= Synth(\limiterStoMixer,[\c36,1,\in,~limitPerch7 ,\gain,90,\out,~perchLimiToG7],~limitGrp);
// ~mix36.set(\gain,90)
~mix37= Synth(\limiterStoMixer,[\c37,1,\in,~limitPerch8 ,\gain,95,\out,~perchLimiToG8],~limitGrp);
 //~mix37.set(\gain,95)*/

/*~mix42= Synth(\limiterStoMixer,[\c42,1,\in, ~limitPerch9, \gain,55, \out,~perchLimiToG9],~limitGrp);
// ~mix3.set(\gain,55)
~mix43= Synth(\limiterStoMixer,[\c43,1,\in,~limitPerch10 ,\gain,65,\out,~perchLimiToG10],~limitGrp);
// ~mix31.set(\gain,65)
~mix44= Synth(\limiterStoMixer,[\c44,1,\in, ~limitPerch11,\gain,65,\out,~perchLimiToG11],~limitGrp);
// ~mix32.set(\gain,65)
~mix45= Synth(\limiterStoMixer,[\45,1,\in,~limitPerch12 ,\gain,50,\out,~perchLimiToG12],~limitGrp);*/




~mix17= Synth(\limiterStoMixer,[\c17,1,\in, ~bigRiToLimit, \gain,40,\out,~bigRiToStereo],~limitGrp);
// ~mixa.set(\in,~bigRiToStereo);
// ~mix17.set(\gain,40);
~mix12= Synth(\limiterStoMixer,[\c12,1,\in, ~riTriptoLimit,\gain,20,\out,~riTriptoStereo],~limitGrp);
// ~mixa.set(\in,~riTriptoStereo);
// ~mix12.set(\gain,20);
// ~mix14.set(\gain,31)




~mix38= Synth(\limiterStoMixer,[\c38,1,\in,~part2ToLimit ,\gain,25,\out,~part2ToStereo],~limitGrp);
// ~mixa.set(\in,~part2ToStereo);
 //~mix38.set(\gain,20)
~mix39= Synth(\limiterStoMixer,[\c39,1,\in,~part2SLimit ,\gain,45,\out,~part2SStereo],~limitGrp);
// ~mixa.set(\in,~part2SStereo);
 //~mix39.set(\gain,45)
~mix40= Synth(\limiterStoMixer,[\c40,1,\in,~part2RiLimit ,\gain,5,\out,~part2RiStereo],~limitGrp);
// ~mixa.set(\in,~part2RiStereo);
// ~mix40.set(\gain,5)
~mix41= Synth(\limiterStoMixer,[\c41,1,\in,~part2SLimit2 ,\gain,45,\out,~part2SStereo2],~limitGrp);
// ~mixa.set(\in,~part2SStereo2);
// ~mix41.set(\gain,105)


//passant
~mix7= Synth(\limiterStoMixer,[\c7,1,\in, ~limitFuzz4, \gain,30, \out,~stereoBus14],~limitGrp);
// ~mixa.set(\in,~stereoBus14);
// ~mix7.set(\gain,30)
~mix50= Synth(\limiterStoMixer,[\c50,1,\in, ~limitPass1, \gain,24, \out,~stereoPass1],~limitGrp);
// ~mixa.set(\in,~stereoPass1);
// ~mix50.set(\gain,24)
~mix51= Synth(\limiterStoMixer,[\c51,1,\in, ~limitPass2, \gain,30, \out,~stereoPass2],~limitGrp);
// ~mixa.set(\in,~stereoPass2);
// ~mix51.set(\gain,30)
~mix52= Synth(\limiterStoMixer,[\c52,1,\in, ~limitPass3, \gain,35, \out,~stereoPass3],~limitGrp);
// ~mixa.set(\in,~stereoPass3);
// ~mix52.set(\gain,35)






~mix19= Synth(\limiterStoMixer,[\c19,1,\in, ~limitSquelch, \gain,44,\out,~stereoBus3b],~limitGrp4);
// ~mixa.set(\in,~limitSquelch);
// ~mix19.set(\gain,24)

~mix23= Synth(\limiterStoMixer,[\c23,1,\in, ~limitCymb,\gain,20,\out,~comFuzz22],~limitGrp);
// ~mixa.set(\in,~comFuzz22);
// ~mix23.set(\gain,20)
~mix24= Synth(\limiterStoMixer,[\c24,1,\in, ~limitHat,\gain,16,\out,~comFuzz22],~limitGrp);
// ~mixa.set(\in,~comFuzz22);
// ~mix24.set(\gain,16)

~mix25= Synth(\limiterToMixer,[\c25,1,\in, ~snareLimit,\gain,40,\out,~toPan2],~limitGrp);
// ~mix25.set(\gain,40)



/*~comp46=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp46.set(\thr,0.72 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.0968, \gain,80,\in, ~comFuzz ,\out,~part2Limit);
~mix46= Synth(\limiterStoMixer,[\c46,1,\in, ~part2Limit, \gain,6,\out,~stereoBus1],~limitGrp);
// ~mixa.set(\in,~stereoBus1);
 ~mix46.set(\gain,6);*/

~comp46 = Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp46.set(\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\in, ~comPerch , \out,~limitPerch);
~mix46= Synth(\limiterStoMixer,[\c46,1,\in, ~limitPerch, \gain,6, \out,~stereoPerch],~limitGrp);
// ~mixa.set(\in,~stereoPerch);
 ~mix46.set(\gain,26.5);

~comp47=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp47.set(\thr,0.72 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.0968, \gain,80,\in, ~comBus1 ,\out,~part2Limit2);
~mix47= Synth(\limiterStoMixer,[\c47,1,\in,~part2Limit2 , \gain,6,\out,~sterBus2],~limitGrp);
// ~mixa.set(\in,~sterBus2);
 ~mix47.set(\gain,20);

~comp48=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp48.set(\thr,0.9 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.3872, \gain,1,\in, ~comBus2 ,\out,~part2Limit3);
~mix48= Synth(\limiterStoMixer,[\c48,1,\in,~part2Limit3 , \gain,5,\out,~sterBus1],~limitGrp);
// ~mixa.set(\in,~sterBus1);
 ~mix48.set(\gain,33);

~comp49=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp49.set(\thr,0.92 ,\sB, 1.026,\sA, 1/2,\atk ,0.0121, \rel ,0.0968, \gain,80,\in, ~comBus4,\out,~part2Limit4);
~mix49= Synth(\limiterStoMixer,[\c49,1,\in,~part2Limit4 , \gain,8,\out,~sterBus4],~limitGrp);
// ~mixa.set(\in,~sterBus4);
 ~mix49.set(\gain,12);

/*Vocals to set

Pbind(\instrument,\compS, \dur,inf,\thr,0.95 ,\sB, 1.050,\sA, 1/2,\atk ,0.02, \rel ,0.3872
		,\gain,1,\in, ~vocToComp ,\ctrl, ~kbus, \out, ~vocToLimit, \group,~compGrp ),
	Pbind(\instrument,\limiterS,\in,~vocToLimit,\out, ~vocToStereo,\group,~limitGrp,\dur,inf,\gain, 11),*/

