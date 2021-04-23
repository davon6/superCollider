~mix10= Synth(\limiterStoMixer,[\c10,1,\in, ~no2ToLimit,\gain,91,\out,~no2ToStereo],~limitGrp);
// ~mix10.set(\gain,91 );
~mix18= Synth(\limiterStoMixer,[\c18,1,\in,~limitDelay,\gain,92,\out ,~stereoBus3],~limitGrp);
// ~mix18.set(\gain,92 );


~mix2= Synth(\limiterStoMixer,[\c2,1,\in, ~limitFuzz, \gain,107,\out,~stereoBus1],~limitGrp);
// ~mix2.set(\gain,107)
~mix4= Synth(\limiterStoMixer,[\c4,1,\in, ~toLimitFlo, \gain,62, \out,~toStereoFlo],~limitGrp);
//is  21
~mix5= Synth(\limiterStoMixer,[\c5,1,\in, ~limitFuzz23, \gain,80, \out,~stereoBus23],~limitGrp);
//i s2   ~mix5.set(\gain,80)
~mix6= Synth(\limiterStoMixer,[\c6,1,\in,~comBusCymb2, \gain,82, \out,~limitRkick2],~limitGrp);
//is 22
~mix3= Synth(\limiterStoMixer,[\c3,1,\in, ~limitPerch, \gain,150, \out,~stereoPerch],~limitGrp);
// ~mix3.set(\gain,150)
~mix21= Synth(\limiterStoMixer,[\c21,1,\in, ~limitBus1,\gain,62,\out,~sterBus1],~limitGrp);
// ~mix21.set(\gain,92)
~mix22= Synth(\limiterStoMixer,[\c22,1,\in, ~limitBus2,\gain,82,\out,~sterBus2],~limitGrp);
// ~mix22.set(\gain,82)


~mix11= Synth(\limiterStoMixer,[\c11,1,\in, ~riToLimit,\gain,56,\out,~riToStereo],~limitGrp);
// ~mix11.set(\gain,56)


~mix15= Synth(\limiterStoMixer,[\c15,1,\in, ~limitFuzz3,\gain,70,\out,~stereoBus4],~limitGrp);
// ~mix15.set(\gain,70)  //noise start
~mix16= Synth(\limiterStoMixer,[\c16,1,\in, ~flanToLimit,\gain,52,\out,~flanToStereo],~limitGrp);
// ~mix16.set(\gain,52);
~mix14= Synth(\limiterStoMixer,[ \c14,1,\in, ~slideBusToLimit,\out,~again, \gain, 40],~limitGrp);
// ~mix14.set(\gain,40);
//below temp
~mix26= Synth(\limiterToMixer,[/*\c2,1,*/\in, ~slideBusToLimit2,\gain,45,\out,~toStereoRise],~limitGrp);
~mix27= Synth(\limiterStoMixer,[/*\c3,1,*/\in, ~flanToLimit2,\gain,48,\out,~flanToStereo2],~limitGrp);
// ~mix27.set(\gain,48);


~mix17= Synth(\limiterStoMixer,[\c17,1,\in, ~bigRiToLimit, \gain,70,\out,~bigRiToStereo],~limitGrp);

~mix12= Synth(\limiterStoMixer,[\c12,1,\in, ~riTriptoLimit,\gain,50,\out,~riTriptoStereo],~limitGrp);

// ~mix14.set(\gain,31)








~mix9= Synth(\limiterStoMixer,[ \c9,1,\in,~percuLimit, \gain,102,\out,~percuStereo],~limitGrp);
// ~mix9.set(\gain,98 );

~mix7= Synth(\limiterStoMixer,[\c7,1,\in, ~limitFuzz4, \gain,52, \out,~stereoBus14],~limitGrp);
// ~mix7.set(\gain,52)
~mix19= Synth(\limiterStoMixer,[\c19,1,\in, ~limitSquelch, \gain,72,\out,~stereoBus3b],~limitGrp4);
// ~mix19.set(\gain,72)

~mix23= Synth(\limiterStoMixer,[\c23,1,\in, ~limitCymb,\gain,40,\out,~comFuzz22],~limitGrp);
// ~mix23.set(\gain,40)
~mix24= Synth(\limiterStoMixer,[\c24,1,\in, ~limitHat,\gain,34,\out,~comFuzz22],~limitGrp);
// ~mix24.set(\gain,34)

~mix25= Synth(\limiterToMixer,[\c25,1,\in, ~snareLimit,\gain,70,\out,~toPan2],~limitGrp);
// ~mix25.set(\gain,100)



