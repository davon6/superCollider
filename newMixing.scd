//~eq1.set(\val, 0,\quant, 0, \gain,0,\val2,0,\quant2,0, \gain2,0 ,\in, ~eqBus1 , \out,~gateBus ),

~mixingUlti = Synth(\EQHP10, [\in, ~eqBus10, \frq, 100,\vol, 2.2], ~eqGrp2/*\val,13000,\quant,4, \gain,(-16),\val2,3600,\quant2,16, \gain2,(-8),*/);
 ~mixingUlti.set(\vol, 0.2);


~eq2=Synth(\EQHP, [\frq, 100],~eqGrp0);
~eq2.set(\val, 550,\quant, 15, \gain,(-20),\val2,2600,\quant2,6, \gain2,(-12) ,\in, ~eqBus1  , \out,~gateBus,\val4,3800,\shelf,1.1, \gain4,(-25), \val3,6600,\quant3,3.5, \gain3,(-17) , );
~rev2=Synth( \reverb ,~revRnd[~r1],~revGrp);~rev2.set( \in, ~reverbBus , \out, ~comFuzz);
~comp2=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp2.set(\thr,0.92 ,\sB, 1.16,\sA, 1/2,\atk ,0.0242, \rel ,0.968, \gain,25,\in, ~comFuzz,\out,~limitFuzz);
~mix2= Synth(\limiterStoMixer,[\c2,1,\in, ~limitFuzz, \gain,20,\out,~stereoBus1],~limitGrp);
// ~mixa.set(\in,~stereoBus1);
~mix2.set(\gain,100);

~eq3=Synth(\EQHP, [\frq, 100],~eqGrp0);
~eq3.set(\in, ~toEq , \out,~gateBus3,\val, 6700,\quant, 4, \gain,(-18),\val2,12000,\quant2,8, \gain2,(-6) , \val3,8000,\quant3,16, \gain3,(-10) );
~rev3=Synth( \reverb ,~revRnd[~r2],~revGrp); ~rev3.set(\in, ~revBus1 , \out, ~comBus1);
~comp3=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp3.set(\thr,0.82 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.3872, \gain,1,\in, ~comBus1, \out,~limitBus1);
~mix3= Synth(\limiterStoMixer,[\c3,1,\in, ~limitBus1,\gain,10,\out,~sterBus1],~limitGrp);
// ~mixa.set(\in,~sterBus1);
 ~mix3.set(\gain,75);

~eq4=Synth(\EQHP, [\frq, 100],~eqGrp0);
~eq4.set(\in, ~eqBus2x , \out,~gateBusB,\val, 3000,\quant, 8, \gain,(-20),\val2,6700,\quant2,6, \gain2,(-13) );
~rev4=Synth( \reverb ,~revRnd[~r3],~revGrp); ~rev4.set(\in, ~revBus2 , \out, ~comBus2);
~comp4=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp4.set(\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.3872, \gain,1,\in, ~comBus2, \out,~limitBus2);
~mix4= Synth(\limiterStoMixer,[\c4,1,\in, ~limitBus2,\gain,10,\out,~sterBus2],~limitGrp);
// ~mixa.set(\in,~sterBus2);
~mix4.set(\gain,58);



// (~bufSnoopy.numFrames.rrand(1400000)- 1400000)

~playM=Synth( \playBufX, [\impulse, 0.321875, \start,~main1,\buf,~bufSnoopy,\out, ~filterRnd,\loo,1]);
~eq5=Synth(\EQHP, [\frq, 100],~eqGrp0);
~eq5.set(\in, ~filterRnd , \out,~gateBus23, \val, 5000,\quant, 2, \gain,(-14),\val2, 1000,\quant2, 6, \gain2,(-8),\val3, 1000,\quant3, 8, \gain3,(-4));
~rev5=Synth( \reverb ,~revRnd[~r1],~revGrp); ~rev5.set(\in,~reverbBus23  , \out,~comFuzz23);
~comp5=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp5.set(\thr,0.9 ,\sB, 1.005,\sA, 1/2,\atk ,0.0121, \rel ,0.0968,\gain,1,\in, ~comFuzz23, \out,~limitFuzz23);
~mix5= Synth(\limiterStoMixer,[\c5,1,\in, ~limitFuzz23, \gain,4.8, \out,~stereoBus23],~limitGrp);
// ~mixa.set(\in,~stereoBus23);
~mix5.set(\gain,46);



~eq6= Synth(\EQHP, [\frq, 100],~gateGrp2);
~eq6.set(\in, ~toEqFlo , \out,~toReverbFlo,\val,3000,\quant, 2, \gain,(-15),\val2, 6800,\quant2, 7, \gain2,(-12));
~rev6=Synth( \reverb ,~revRnd[~r2],~revGrp); ~rev6.set(\in,~toReverbFlo, \out,~toCompFlo);
// ~lim=Synth( \lim2,[\in,~toLim,\out,~toCompFlo,\ml,0.1], ~eqGrp);~lim.set(\ml,0.4,\out,0);
~comp6=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp6.set(\thr,0.9 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in,~toCompFlo, \out,~toLimitFlo);
~mix6= Synth(\limiterStoMixer,[\c6,1,\in,~toLimitFlo, \gain,35, \out,~toStereoFlo],~limitGrp);
// ~mixa.set(\in,~toStereoFlo);
~mix6.set(\gain,30);


~playM3=Synth(  \playBufX,[ \impulse, 0.321875, \start,~main2,\buf,~bufSnoopy,\out,   ~gateRnd,\loo,1]);
~eq7=Synth(\EQHP, [\frq, 100],~eqGrp0);
~eq7.set(\in, ~gateRnd,/* \out,~reverbMelo,*/\val, 6780,\quant, 4, \gain,(-7),\val2, 170,\quant2, 8, \gain2,(-8));
~rev7=Synth( \reverb ,~revRnd[~r3],~revGrp); ~rev7.set(\in, ~outFil , \out,~comBusHat2);
~comp7=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp7.set(\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comBusHat2 , \out,~comBusCymb2);
~mix7= Synth(\limiterStoMixer,[\c7,1,\in, ~comBusCymb2, \gain,16, \out,~limitRkick2],~limitGrp);
// ~mixa.set(\in,~limitRkick2);
~mix7.set(\gain,55.4);


//~no2S = (~bufSnoopy.numFrames.rrand(1400000)- 1400000);

~playNo2= Synth(\playBufX, [\impulse, 1.2875, \start, ~no2S,\buf,~bufSnoopy,\out, ~toGateX2,\loopy,1]);
~playNo2.set(\start, ~no2S);
~comp8=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp8.set(\thr,0.8 ,\sB, 1.05,\sA, 1/2,\atk ,0.0484, \rel ,0.3872,\in,~no2ToCom ,\out,~no2ToLimit);
~mix8= Synth(\limiterStoMixer,[\c8,1,\in, ~no2ToLimit,\gain,5.2,\out,~no2ToStereo],~limitGrp);
// ~mixa.set(\in,~no2ToStereo);
~mix8.set(\gain,45 );

~comp9=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp9.set(\thr,0.8 ,\sB, 1.2,\sA, 1/4,\atk ,0.0484, \rel ,0.3872 ,\gain, 10,\in, ~comDelay, \out,~limitDelay);
~mix9= Synth(\limiterStoMixer,[\c9,1,\in,~limitDelay,\gain,12,\out ,~stereoBus3],~limitGrp);
// ~mixa.set(\in,~stereoBus3);
~mix9.set(\gain,71);

~comp10=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp10.set(\thr,0.8 ,\sB, 1.05,\sA, 1/2,\atk ,0.0484, \rel ,0.0968,\gain,1,\in, ~percuCom, \out,~percuLimit);
~mix10= Synth(\limiterStoMixer,[ \c10,1,\in,~percuLimit, \gain,46,\out,~percuStereo],~limitGrp);
// ~mixa.set(\in,~percuStereo);
~mix10.set(\gain,87 );

~comp11=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp11.set(\thr,0.9 ,\sB, 1.015,\sA, 1/2,\atk ,0.0484, \rel ,0.0968,\in, ~riToComp ,\out,~riToLimit);
~mix11= Synth(\limiterStoMixer,[\c11,1,\in, ~riToLimit,\gain,13,\out,~riToStereo],~limitGrp);
// ~mixa.set(\in,~riToStereo);
~mix11.set(\gain,34);

//PROBLEM IS MONO
~comp12=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp12.set(\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~riToComp3, \out,~riToLimit3);
~mix12= Synth(\limiterToMixer,[\c12,1,\in,~riToLimit3 ,\gain,13,\out,~riToStereo3],~limitGrp);
~mix12.set(\gain,30);
// ~mixa.set(\in,~riToStereo3);

~comp13=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp13.set(\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968, \in,~flanToComp2, \out,~flanToLimit2);
~mix13= Synth(\limiterStoMixer,[\c13,1,\in, ~flanToLimit2,\gain,7,\out,~flanToStereo2],~limitGrp);
// ~mixa.set(\in,~flanToStereo2);
~mix13.set(\gain,35);

//NO SOUND
~comp14=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp14.set(\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968, \in, ~riToComp2 ,\out,~riToLimit2);
~mix14= Synth(\limiterStoMixer,[\c14,1,\in, ~riToLimit2,\gain,7,\out,~riToStereo2],~limitGrp);
// ~mixa.set(\in,~riToStereo2);
// ~mix14.set(\gain,31);

// IS MONO
~comp15=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp15.set(\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\in,~noiseToComp, \out,~noiseToLimit);
~mix15= Synth(\limiterStoMixer,[\c15,1,\in,~noiseToLimit ,\gain,25,\out,~noiseToStereo],~limitGrp);
// ~mixa.set(\in,~noiseToStereo);
// ~mix15.set(\gain,25);

//NO SOUND
~comp16=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp16.set(\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,10,\in, ~comFuzz3 , \out,~limitFuzz3);
~mix16= Synth(\limiterStoMixer,[\c16,1,\in, ~limitFuzz3,\gain,30,\out,~stereoBus4],~limitGrp);
// ~mixa.set(\in,~stereoBus4);
// ~mix16.set(\gain,30)

//NO SOUND
~comp17=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp17.set(\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,2,\in, ~flanToComp, \out,~flanToLimit);
~mix17= Synth(\limiterStoMixer,[\c17,1,\in, ~flanToLimit,\gain,12,\out,~flanToStereo],~limitGrp);
// ~mixa.set(\in,~flanToStereo);
// ~mix17.set(\gain,12);

//NO SOUND
~comp18=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp18.set(\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,20,\in, ~riTriptoComp,\out,~riTriptoLimit);
~mix18= Synth(\limiterStoMixer,[\c18,1,\in, ~riTriptoLimit,\gain,20,\out,~riTriptoStereo],~limitGrp);
// ~mixa.set(\in,~riTriptoStereo);
// ~mix18.set(\gain,31)

//NO SOUND
~comp19= Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp19.set(\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,12, \in,~slideEq, \out,~slideBusToLimit);
~mix19= Synth(\limiterStoMixer,[ \c14,1,\in, ~slideBusToLimit,\out,~slideBusToStereo, \gain, 30],~limitGrp);
// ~mixa.set(\in,~stereoBus3);
// ~mix19.set(\gain,30);

~mix20= Synth(\limiterToMixer,[\c20,1,\in, ~slideBusToLimit2,\gain,45,\out,~toStereoRise],~limitGrp);

~mix21= Synth(\limiterStoMixer,[\c21,1,\in, ~bigRiToLimit, \gain,40,\out,~bigRiToStereo],~limitGrp);
// ~mixa.set(\in,~bigRiToStereo);
// ~mix21.set(\gain,40);



//passant
~mix22= Synth(\limiterStoMixer,[\c22,1,\in, ~limitFuzz4, \gain,30, \out,~stereoBus14],~limitGrp);
// ~mixa.set(\in,~stereoBus14);
~mix22.set(\gain,14);
~mix21= Synth(\limiterStoMixer,[\c21,1,\in, ~limitPass1, \gain,24, \out,~stereoPass1],~limitGrp);
// ~mixa.set(\in,~stereoPass1);
~mix21.set(\gain,16);
~mix23= Synth(\limiterStoMixer,[\c23,1,\in, ~limitPass2, \gain,30, \out,~stereoPass2],~limitGrp);
// ~mixa.set(\in,~stereoPass2);
 ~mix23.set(\gain,15);
~mix24= Synth(\limiterStoMixer,[\c24,1,\in, ~limitPass3, \gain,35, \out,~stereoPass3],~limitGrp);
// ~mixa.set(\in,~stereoPass3);
~mix24.set(\gain,16);






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








~mix32=	Synth( \limiter10toMixer,[\c32,1,\dur, inf, \in,~rythmLimit,\out,~rythmComp, \gain,60,], ~limitGrp);
//~mix20.set(\gain,60)

~mix30= Synth(\limiterStoMixer,[\c30,1,\in, ~limitSquelch, \gain,44,\out,~stereoBus3b],~limitGrp4);
// ~mixa.set(\in,~limitSquelch);
// ~mix19.set(\gain,24)

~mix31= Synth(\limiterStoMixer,[\c31,1,\in, ~limitCymb,\gain,20,\out,~comFuzz22],~limitGrp);
// ~mixa.set(\in,~comFuzz22);
// ~mix23.set(\gain,20)
~mix33= Synth(\limiterStoMixer,[\c33,1,\in, ~limitHat,\gain,16,\out,~comFuzz22],~limitGrp);
// ~mixa.set(\in,~comFuzz22);
// ~mix24.set(\gain,16)

~mix34= Synth(\limiterToMixer,[\c34,1,\in, ~snareLimit,\gain,40,\out,~toPan2],~limitGrp);
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
~comp47.set(\thr,0.72 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.0968, \gain,80,\in, ~comBus5 ,\out,~part2Limit2);
~mix47= Synth(\limiterStoMixer,[\c47,1,\in,~part2Limit2 , \gain,6,\out,~sterBus2],~limitGrp);
// ~mixa.set(\in,~sterBus2);
 ~mix47.set(\gain,20);

~comp48=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp48.set(\thr,0.9 ,\sB, 1.086,\sA, 1/2,\atk ,0.0248, \rel ,0.3872, \gain,1,\in, ~comBus3 ,\out,~part2Limit3);
~mix48= Synth(\limiterStoMixer,[\c48,1,\in,~part2Limit3 , \gain,5,\out,~sterBus1],~limitGrp);
// ~mixa.set(\in,~sterBus1);
 ~mix48.set(\gain,34);

~comp49=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp49.set(\thr,0.92 ,\sB, 1.026,\sA, 1/2,\atk ,0.0121, \rel ,0.0968, \gain,80,\in, ~comBus4,\out,~part2Limit4);
~mix49= Synth(\limiterStoMixer,[\c49,1,\in,~part2Limit4 , \gain,8,\out,~sterBus4],~limitGrp);
// ~mixa.set(\in,~sterBus4);
 ~mix49.set(\gain,12);

/*Vocals to set

Pbind(\instrument,\compS, \dur,inf,\thr,0.95 ,\sB, 1.050,\sA, 1/2,\atk ,0.02, \rel ,0.3872
		,\gain,1,\in, ~vocToComp ,\ctrl, ~kbus, \out, ~vocToLimit, \group,~compGrp ),
	Pbind(\instrument,\limiterS,\in,~vocToLimit,\out, ~vocToStereo,\group,~limitGrp,\dur,inf,\gain, 11),*/

