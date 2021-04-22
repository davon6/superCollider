~mix10= Synth(\limiterStoMixer,[\c10,1,\in, ~no2ToLimit,\gain,50,\out,~no2ToStereo],~limitGrp);
/*~mix10.set(\gain,50 );*/
~mix18= Synth(\limiterStoMixer,[\c18,1,\in,~limitDelay,\gain,100,\out ,~stereoBus3],~limitGrp);
// ~mix18.set(\gain,100 );
~mix9= Synth(\limiterStoMixer,[ \c9,1,\in,~percuLimit, \gain,134,\out,~percuStereo],~limitGrp);
// ~mix9.set(\gain,134 );
~mix11= Synth(\limiterStoMixer,[\c11,1,\in, ~riToLimit,\gain,63,\out,~riToStereo],~limitGrp);

~mix15= Synth(\limiterStoMixer,[\c15,1,\in, ~limitFuzz3,\gain,60,\out,~stereoBus4],~limitGrp);

~mix16= Synth(\limiterStoMixer,[\c16,1,\in, ~flanToLimit,\gain,60,\out,~flanToStereo],~limitGrp);

~mix17= Synth(\limiterStoMixer,[\c17,1,\in, ~bigRiToLimit, \gain,55,\out,~bigRiToStereo],~limitGrp);

~mix12= Synth(\limiterStoMixer,[\c12,1,\in, ~riTriptoLimit,\gain,60,\out,~riTriptoStereo],~limitGrp);

~mix14= Synth(\limiterStoMixer,[ \c14,1,\in, ~slideBusToLimit, \gain, 31],~limitGrp);
// ~mix14.set(\gain,31)
~mix2= Synth(\limiterStoMixer,[\c2,1,\in, ~limitFuzz, \gain,70,\out,~stereoBus1],~limitGrp);
// ~mix2.set(\gain,70)
~mix4= Synth(\limiterStoMixer,[\c4,1,\in, ~toLimitFlo, \gain,62, \out,~toStereoFlo],~limitGrp);
//is  21
~mix5= Synth(\limiterStoMixer,[\c5,1,\in, ~limitFuzz23, \gain,47, \out,~stereoBus23],~limitGrp);

~mix6= Synth(\limiterStoMixer,[\c6,1,\in,~comBusCymb2, \gain,76, \out,~limitRkick2],~limitGrp);
//is 22
~mix3= Synth(\limiterStoMixer,[\c3,1,\in, ~limitPerch, \gain,200, \out,~stereoPerch],~limitGrp);
// ~mix3.set(\gain,200)
~mix7= Synth(\limiterStoMixer,[\c7,1,\in, ~limitFuzz4, \gain,38, \out,~stereoBus14],~limitGrp);

~mix19= Synth(\limiterStoMixer,[\c19,1,\in, ~limitSquelch, \gain,20,\out,~stereoBus3b],~limitGrp4);

~mix21= Synth(\limiterStoMixer,[\c21,1,\in, ~limitBus1,\gain,62,\out,~sterBus1],~limitGrp);
// ~mix21.set(\gain,62)
~mix22= Synth(\limiterStoMixer,[\c22,1,\in, ~limitBus2,\gain,76,\out,~sterBus2],~limitGrp);
// ~mix22.set(\gain,76)


~mix23= Synth(\limiterStoMixer,[\c23,1,\in, ~limitCymb,\gain,29,\out,~comFuzz22],~limitGrp);

~mix24= Synth(\limiterStoMixer,[\c24,1,\in, ~limitHat,\gain,29,\out,~comFuzz22],~limitGrp);


~mix25= Synth(\limiterToMixer,[\c25,1,\in, ~snareLimit,\gain,30,\out,~toPan2],~limitGrp);
// ~mix25.set(\gain,40)

