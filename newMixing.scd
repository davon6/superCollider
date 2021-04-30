~mix10= Synth(\limiterStoMixer,[\c10,1,\in, ~no2ToLimit,\gain,12,\out,~no2ToStereo],~limitGrp);
// ~mix10.set(\gain,2 );
~mix18= Synth(\limiterStoMixer,[\c18,1,\in,~limitDelay,\gain,45,\out ,~stereoBus3],~limitGrp);
// ~mix18.set(\gain,45 );
~mix9= Synth(\limiterStoMixer,[ \c9,1,\in,~percuLimit, \gain,70,\out,~percuStereo],~limitGrp);
// ~mix9.set(\gain,70 );


~mix2= Synth(\limiterStoMixer,[\c2,1,\in, ~limitFuzz, \gain,90,\out,~stereoBus1],~limitGrp);
// ~mix2.set(\gain,90)
~mix4= Synth(\limiterStoMixer,[\c4,1,\in, ~toLimitFlo, \gain,28, \out,~toStereoFlo],~limitGrp);
// ~mix4.set(\gain,28)
//is  21

~mix5= Synth(\limiterStoMixer,[\c5,1,\in, ~limitFuzz23, \gain,55, \out,~stereoBus23],~limitGrp);
//i s2   ~mix5.set(\gain,55)

~mix6= Synth(\limiterStoMixer,[\c6,1,\in,~comBusCymb2, \gain,55, \out,~limitRkick2],~limitGrp);
// ~mix6.set(\gain,55)
//is 22



~mix21= Synth(\limiterStoMixer,[\c21,1,\in, ~limitBus1,\gain,40,\out,~sterBus1],~limitGrp);
// ~mix21.set(\gain,35)
~mix22= Synth(\limiterStoMixer,[\c22,1,\in, ~limitBus2,\gain,35,\out,~sterBus2],~limitGrp);
// ~mix22.set(\gain,35)

~mix20=	Synth( \limiter10toMixer,[\c20,1,\dur, inf, \in,~rythmLimit,\out,~rythmComp, \gain,40,], ~limitGrp);

~mix11= Synth(\limiterStoMixer,[\c11,1,\in, ~riToLimit,\gain,13,\out,~riToStereo],~limitGrp);
// ~mix11.set(\gain,13)


~mix15= Synth(\limiterStoMixer,[\c15,1,\in, ~limitFuzz3,\gain,70,\out,~stereoBus4],~limitGrp);
// ~mix15.set(\gain,70)  //noise start
~mix16= Synth(\limiterStoMixer,[\c16,1,\in, ~flanToLimit,\gain,15,\out,~flanToStereo],~limitGrp);
// ~mix16.set(\gain,15);
~mix14= Synth(\limiterStoMixer,[ \c14,1,\in, ~slideBusToLimit,\out,~again, \gain, 30],~limitGrp);
// ~mix14.set(\gain,30);

~mix26= Synth(\limiterToMixer,[\c26,1,\in, ~slideBusToLimit2,\gain,45,\out,~toStereoRise],~limitGrp);
~mix27= Synth(\limiterStoMixer,[\c27,1,\in, ~flanToLimit2,\gain,17,\out,~flanToStereo2],~limitGrp);
// ~mix27.set(\gain,17);

~mix28= Synth(\limiterToMixer,[\c28,1,\in,~riToLimit2 ,\gain,13,\out,~riToStereo2],~limitGrp);
// ~mix28.set(\gain,13);
~mix29= Synth(\limiterStoMixer,[\c29,1,\in,~riToLimit3 ,\gain,13,\out,~riToStereo3],~limitGrp);
// ~mix29.set(\gain,13);
~mix30= Synth(\limiterToMixer,[\c30,1,\in,~noiseToLimit ,\gain,25,\out,~noiseToStereo],~limitGrp);
// ~mix30.set(\gain,25);

~mix3= Synth(\limiterStoMixer,[\c3,1,\in, ~limitPerch, \gain,18, \out,~stereoPerch/*~perchLimiToG*/],~limitGrp);
// ~mix3.set(\gain,18)
~mix31= Synth(\limiterStoMixer,[\c31,1,\in,~limitPerch2 ,\gain,90,\out,~perchLimiToG2],~limitGrp);
// ~mix31.set(\gain,90)
~mix32= Synth(\limiterStoMixer,[\c32,1,\in, ~limitPerch3,\gain,88,\out,~perchLimiToG3],~limitGrp);
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
 //~mix37.set(\gain,95)

~mix42= Synth(\limiterStoMixer,[\c42,1,\in, ~limitPerch9, \gain,55, \out,~perchLimiToG9],~limitGrp);
// ~mix3.set(\gain,55)
~mix43= Synth(\limiterStoMixer,[\c43,1,\in,~limitPerch10 ,\gain,65,\out,~perchLimiToG10],~limitGrp);
// ~mix31.set(\gain,65)
~mix44= Synth(\limiterStoMixer,[\c44,1,\in, ~limitPerch11,\gain,65,\out,~perchLimiToG11],~limitGrp);
// ~mix32.set(\gain,65)
~mix45= Synth(\limiterStoMixer,[\45,1,\in,~limitPerch12 ,\gain,50,\out,~perchLimiToG12],~limitGrp);




~mix17= Synth(\limiterStoMixer,[\c17,1,\in, ~bigRiToLimit, \gain,70,\out,~bigRiToStereo],~limitGrp);
// ~mix17.set(\gain,70);
~mix12= Synth(\limiterStoMixer,[\c12,1,\in, ~riTriptoLimit,\gain,20,\out,~riTriptoStereo],~limitGrp);
// ~mix12.set(\gain,20);
// ~mix14.set(\gain,31)




~mix38= Synth(\limiterStoMixer,[\c38,1,\in,~part2ToLimit ,\gain,25,\out,~part2ToStereo],~limitGrp);
 //~mix38.set(\gain,20)
~mix39= Synth(\limiterStoMixer,[\c39,1,\in,~part2SLimit ,\gain,45,\out,~part2SStereo],~limitGrp);
 //~mix39.set(\gain,45)
~mix40= Synth(\limiterStoMixer,[\c40,1,\in,~part2RiLimit ,\gain,5,\out,~part2RiStereo],~limitGrp);
// ~mix40.set(\gain,5)
~mix41= Synth(\limiterStoMixer,[\c41,1,\in,~part2SLimit2 ,\gain,45,\out,~part2SStereo2],~limitGrp);
// ~mix41.set(\gain,105)


//passant
~mix7= Synth(\limiterStoMixer,[\c7,1,\in, ~limitFuzz4, \gain,78, \out,~stereoBus14],~limitGrp);
// ~mix7.set(\gain,78)
~mix50= Synth(\limiterStoMixer,[\c50,1,\in, ~limitPass1, \gain,82, \out,~stereoPass1],~limitGrp);
// ~mix50.set(\gain,82)
~mix51= Synth(\limiterStoMixer,[\c51,1,\in, ~limitPass2, \gain,82, \out,~stereoPass2],~limitGrp);
// ~mix51.set(\gain,82)
~mix52= Synth(\limiterStoMixer,[\c52,1,\in, ~limitPass3, \gain,100, \out,~stereoPass3],~limitGrp);
// ~mix52.set(\gain,100)






~mix19= Synth(\limiterStoMixer,[\c19,1,\in, ~limitSquelch, \gain,44,\out,~stereoBus3b],~limitGrp4);
// ~mix19.set(\gain,44)

~mix23= Synth(\limiterStoMixer,[\c23,1,\in, ~limitCymb,\gain,54,\out,~toKbGate/*~comFuzz22*/],~limitGrp);
// ~mix23.set(\gain,74)
~mix24= Synth(\limiterStoMixer,[\c24,1,\in, ~limitHat,\gain,45,\out,~toKbGate/*~comFuzz22*/],~limitGrp);
// ~mix24.set(\gain,68)

~mix25= Synth(\limiterToMixer,[\c25,1,\in, ~snareLimit,\gain,35,\out,~toPan2],~limitGrp);
// ~mix25.set(\gain,55)




~mix46= Synth(\limiterStoMixer,[\c46,1,\in, ~part2Limit, \gain,40,\out,~stereoBus1],~limitGrp);
// ~mix46.set(\gain,50)
~mix47= Synth(\limiterStoMixer,[\c47,1,\in,~part2Limit2 , \gain,17.2,\out,~sterBus2],~limitGrp);
// ~mix47.set(\gain,17.2)
~mix48= Synth(\limiterStoMixer,[\c48,1,\in,~part2Limit3 , \gain,25,\out,~sterBus1],~limitGrp);
// ~mix48.set(\gain,30)
~mix49= Synth(\limiterStoMixer,[\c49,1,\in,~part2Limit4 , \gain,20,\out,~sterBus4],~limitGrp);
// ~mix49.set(\gain,25)