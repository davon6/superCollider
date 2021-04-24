~mix10= Synth(\limiterStoMixer,[\c10,1,\in, ~no2ToLimit,\gain,60,\out,~no2ToStereo],~limitGrp);
// ~mix10.set(\gain,60 );
~mix18= Synth(\limiterStoMixer,[\c18,1,\in,~limitDelay,\gain,92,\out ,~stereoBus3],~limitGrp);
// ~mix18.set(\gain,92 );


~mix2= Synth(\limiterStoMixer,[\c2,1,\in, ~limitFuzz, \gain,138,\out,~stereoBus1],~limitGrp);
// ~mix2.set(\gain,260)
~mix4= Synth(\limiterStoMixer,[\c4,1,\in, ~toLimitFlo, \gain,54, \out,~toStereoFlo],~limitGrp);
//is  21

~mix5= Synth(\limiterStoMixer,[\c5,1,\in, ~limitFuzz23, \gain,138, \out,~stereoBus23],~limitGrp);
//i s2   ~mix5.set(\gain,80)

~mix6= Synth(\limiterStoMixer,[\c6,1,\in,~comBusCymb2, \gain,80, \out,~limitRkick2],~limitGrp);
//is 22


~mix3= Synth(\limiterStoMixer,[\c3,1,\in, ~limitPerch, \gain,110, \out,~stereoPerch],~limitGrp);
// ~mix3.set(\gain,110)
~mix21= Synth(\limiterStoMixer,[\c21,1,\in, ~limitBus1,\gain,54,\out,~sterBus1],~limitGrp);
// ~mix21.set(\gain,54)
~mix22= Synth(\limiterStoMixer,[\c22,1,\in, ~limitBus2,\gain,80,\out,~sterBus2],~limitGrp);
// ~mix22.set(\gain,80)


~mix11= Synth(\limiterStoMixer,[\c11,1,\in, ~riToLimit,\gain,23,\out,~riToStereo],~limitGrp);
// ~mix11.set(\gain,23)


~mix15= Synth(\limiterStoMixer,[\c15,1,\in, ~limitFuzz3,\gain,70,\out,~stereoBus4],~limitGrp);
// ~mix15.set(\gain,70)  //noise start
~mix16= Synth(\limiterStoMixer,[\c16,1,\in, ~flanToLimit,\gain,42,\out,~flanToStereo],~limitGrp);
// ~mix16.set(\gain,42);
~mix14= Synth(\limiterStoMixer,[ \c14,1,\in, ~slideBusToLimit,\out,~again, \gain, 40],~limitGrp);
// ~mix14.set(\gain,40);

~mix26= Synth(\limiterToMixer,[\c26,1,\in, ~slideBusToLimit2,\gain,45,\out,~toStereoRise],~limitGrp);
~mix27= Synth(\limiterStoMixer,[\c27,1,\in, ~flanToLimit2,\gain,20,\out,~flanToStereo2],~limitGrp);
// ~mix27.set(\gain,20);

~mix28= Synth(\limiterToMixer,[\c28,1,\in,~riToLimit2 ,\gain,23,\out,~riToStereo2],~limitGrp);
~mix29= Synth(\limiterStoMixer,[\c29,1,\in,~riToLimit3 ,\gain,23,\out,~riToStereo3],~limitGrp);
~mix30= Synth(\limiterToMixer,[\c30,1,\in,~noiseToLimit ,\gain,30,\out,~noiseToStereo],~limitGrp);



/*
~mix31= Synth(\limiterStoMixer,[\c31,1,\in, ,\gain,30,\out,],~limitGrp);
~mix32= Synth(\limiterToMixer,[\c32,1,\in, ,\gain,30,\out,],~limitGrp);
~mix33= Synth(\limiterStoMixer,[\c33,1,\in, ,\gain,30,\out,],~limitGrp);*/




~mix17= Synth(\limiterStoMixer,[\c17,1,\in, ~bigRiToLimit, \gain,70,\out,~bigRiToStereo],~limitGrp);
// ~mix17.set(\gain,70);
~mix12= Synth(\limiterStoMixer,[\c12,1,\in, ~riTriptoLimit,\gain,30,\out,~riTriptoStereo],~limitGrp);

// ~mix14.set(\gain,31)








~mix9= Synth(\limiterStoMixer,[ \c9,1,\in,~percuLimit, \gain,156,\out,~percuStereo],~limitGrp);
// ~mix9.set(\gain,156 );

~mix7= Synth(\limiterStoMixer,[\c7,1,\in, ~limitFuzz4, \gain,72, \out,~stereoBus14],~limitGrp);
// ~mix7.set(\gain,72)
~mix19= Synth(\limiterStoMixer,[\c19,1,\in, ~limitSquelch, \gain,72,\out,~stereoBus3b],~limitGrp4);
// ~mix19.set(\gain,72)

~mix23= Synth(\limiterStoMixer,[\c23,1,\in, ~limitCymb,\gain,40,\out,0/*~comFuzz22*/],~limitGrp);
// ~mix23.set(\gain,40)
~mix24= Synth(\limiterStoMixer,[\c24,1,\in, ~limitHat,\gain,34,\out,0/*~comFuzz22*/],~limitGrp);
// ~mix24.set(\gain,34)

~mix25= Synth(\limiterToMixer,[\c25,1,\in, ~snareLimit,\gain,70,\out,~toPan2],~limitGrp);
// ~mix25.set(\gain,100)



