//\val, 0,\quant, 0, \gain,0,\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,0,\shelf,0, \gain4,0,

//Eq default out must be reverb in first line, enhance workflow



~compUlti= Synth(\comp10,[\ctrl, ~snBus,],~compGrp2);
~compUlti.set(\thr,0.86 ,\sB, 1.1,\sA, 1/2,\atk ,0.0968, \rel ,0.3872 ,\in, ~toCom, \out,/*~eqBus10*/  ~toGate10,\group, ~compGrp2);

~compUlti.set(\out,~toGate10)

~mixingUlti = Synth(\EQHP10, [\in, ~eqBus10, \frq, 100,\vol, 2.2], ~eqGrp2);
 ~mixingUlti.set(\vol, 0.87);//0.22


// ~eq2.free
/*~playS= Synth(\playBufX, [\impulse, 0.3 ,\start,0,\buf,~lpPrec2,\out,~eqBus1 ,\loopy,0]);
~playS.set(\start,0);*/
~eq2=Synth(\EQHP, [\frq, 100,\out, ~reverbBus],~eqGrp0);
~eq2.set(\val, 0,\quant, 0, \gain,0,\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,0,\shelf,0, \gain4,0,\in, ~eqBus1 , \out,~gateBus);
~rev2=Synth( \reverb ,~revRnd[2],~revGrp);~rev2.set( \in, ~reverbBus , \out, ~comFuzz);
~comp2=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp2.set(\thr,0.92 ,\sB, 1.16,\sA, 1/2,\atk ,0.0242, \rel ,0.968, \gain,25,\in, ~comFuzz,\out,~limitFuzz);
~mix2= Synth(\limiterStoMixer,[\c2,1,\in, ~limitFuzz, \gain,20,\out,~stereoBus1],~limitGrp);
// ~mixa.set(\in,~stereoBus1);
~mix2.set(\gain,38);
~stereo2= Synth(\stereoS,[ \dur, 9999, \in, ~stereoBus1   ,\out,~no1,],~stereoGrp);

// ~eq3.free
~eq3=Synth(\EQHP, [\frq, 100, \out, ~revBus1],~eqGrp0);
~eq3.set(\in, ~toEq , \out,~gateBus3,\val, ~val=0,\quant, ~quant=0, \gain,~gain=0,\val2,~val2=0,\quant2,~quant2=0, \gain2,~gain2=0,\val3,~val3=0,\quant3,~quant3=0, \gain3,~gain3= 0,\val4,~val4=0,\shelf,~shelf=0, \gain4,~gain4=0);
~rev3=Synth( \reverb ,~revRnd[~r2],~revGrp); ~rev3.set(\in, ~revBus1 , \out, ~comBus1);
~comp3=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp3.set(\thr,0.88 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.3872, \gain,10,\in, ~comBus1, \out,~limitBus1);
~mix3= Synth(\limiterStoMixer,[\c3,1,\in, ~limitBus1,\gain,10,\out,~sterBus1],~limitGrp);
// ~mixa.set(\in,~sterBus1);
 ~mix3.set(\gain,~gainMix=40);
~stereo3= Synth(\stereoS,[ \dur, 9999, \in, ~sterBus1   ,\out,~no1, ], ~stereoGrp);

//~eq4.free
~eq4=Synth(\EQHP, [\frq, 100, \out, ~revBus2],~eqGrp0);
~eq4.set(\in, ~eqBus2x , \out,~gateBusB,\val, 0,\quant, 0, \gain,0,\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,0,\shelf,0, \gain4,0);
~rev4=Synth( \reverb ,~revRnd[~r3],~revGrp); ~rev4.set(\in, ~revBus2 , \out, ~comBus2);
~comp4=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp4.set(\thr,0.88 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.3872, \gain,6,\in, ~comBus2, \out,~limitBus2);
~mix4= Synth(\limiterStoMixer,[\c4,1,\in, ~limitBus2,\gain,10,\out,~sterBus2],~limitGrp);
// ~mixa.set(\in,~sterBus2);
~mix4.set(\gain,40);
~stereo4= Synth(\stereoS,[  \dur, 9999, \in, ~sterBus2, \out,~no1], ~stereoGrp);
//main2





// ~main1= (~bufSnoopy.numFrames.rrand(s.sampleRate*16*t.beatDur)- s.sampleRate*16*t.beatDur)  ;
//~eq5.free

~eq5=Synth(\EQHP, [\frq, 100, \out, ~reverbBus23],~eqGrp0);
~eq5.set(\in, ~filterRnd,\out,~gateBus23,\val, 0,\quant, 0, \gain,0,\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,0,\shelf,0, \gain4,0);
~rev5=Synth( \reverb ,~revRnd[~r1],~revGrp); ~rev5.set(\in,~reverbBus23  , \out,~comFuzz23);
~comp5=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp5.set(\thr,0.9 ,\sB, 1.005,\sA, 1/2,\atk ,0.0121, \rel ,0.0968,\gain,10,\in, ~comFuzz23, \out,~limitFuzz23);
~mix5= Synth(\limiterStoMixer,[\c5,1,\in, ~limitFuzz23, \gain,4.8, \out,~stereoBus23],~limitGrp);
// ~mixa.set(\in,~stereoBus23);
~mix5.set(\gain,38);

/*~playM2=Synth( \playBufX, [\impulse, 0.321875/4, \start,~main3,\buf,~bufSnoopy,\out,  ~toEqFlo,\loo,1]);
~eq6= Synth(\EQHP, [\frq, 100],~eqGrp0);
~eq6.set(\in, ~toEqFlo , \out,~toGateFlo,\val,600,\quant, 6, \gain,(-18),\val2, 7000,\quant2, 4, \gain2,(-20));
~rev6=Synth( \reverb ,~revRnd[~r2],~revGrp); ~rev6.set(\in,~toReverbFlo, \out,~toCompFlo);
// ~lim=Synth( \lim2,[\in,~toLim,\out,~toCompFlo,\ml,0.1], ~eqGrp);~lim.set(\ml,0.4,\out,0);
~comp6=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp6.set(\thr,0.9 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in,~toCompFlo, \out,~toLimitFlo);
~mix6= Synth(\limiterStoMixer,[\c6,1,\in,~toLimitFlo, \gain,35, \out,~toStereoFlo],~limitGrp);
// ~mixa.set(\in,~toStereoFlo);
~mix6.set(\gain,60);*/



~playM=Synth( \playBufX, [\impulse, 0.321875, \start,~main1,\buf,~bufSnoopy,\out, ~gateRnd,\loo,1]);
~playM.set( \start,~main1);
// ~main3= (~bufSnoopy.numFrames.rrand(s.sampleRate*16*t.beatDur)- s.sampleRate*16*t.beatDur)  ;
// ~eq7.free
// ~playM3=Synth(  \playBufX,[ \impulse, 0.321875, \start,~main3,\buf,~bufSnoopy,\out,   ~gateRnd,\loo,1]);
// ~playM3.set(  \start,~main3);
~eq7=Synth(\EQHP, [\frq, 100, \out, ~outFil],~eqGrp0);
~eq7.set(\in, ~gateRnd, \out, ~reverbMelo,\val, 0,\quant, 0, \gain,0,\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,0,\shelf,0, \gain4,0);
~rev7=Synth( \reverb ,~revRnd[~r3],~revGrp); ~rev7.set(\in, ~outFil , \out,~comBusHat2);
~comp7=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp7.set(\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~comBusHat2 , \out,~comBusCymb2);
~mix7= Synth(\limiterStoMixer,[\c7,1,\in, ~comBusCymb2, \gain,20, \out,~limitRkick2],~limitGrp);
// ~mixa.set(\in,~limitRkick2);
~mix7.set(\gain,32);




//~no2S = (~bufSnoopy.numFrames.rrand(1400000)- 1400000);
// ~eq8.free
~playNo2= Synth(\playBufX, [\impulse, 1.2875, \start, ~no2S,\buf,~bufSnoopy,\out, ~toGateX2,\loopy,1]);
~playNo2.set(\start, ~no2S,\impulse, 1.2875);
~eq8=Synth(\EQHP, [\frq, 100],~eqGrp0);
~eq8.set(\in, ~no2Eq, \out,~no2ToRev,\val, 0,\quant, 0, \gain,0,\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,0,\shelf,0, \gain4,0);
~rev8=Synth( \reverb ,~revRnd[2.rand],~revGrp); ~rev8.set(\in, ~no2ToRev , \out, ~no2ToCom,\group,~revGrp);
~comp8=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp8.set(\thr,0.8 ,\sB, 1.05,\sA, 1/2,\atk ,0.0484, \rel ,0.3872,\in,~no2ToCom ,\out,~no2ToLimit);
~mix8= Synth(\limiterStoMixer,[\c8,1,\in, ~no2ToLimit,\gain,5.2,\out,~no2ToStereo],~limitGrp);
// ~mixa.set(\in,~no2ToStereo);
~mix8.set(\gain,18 );

//~no4S = (~bufSnoopy.numFrames.rrand(80000)- 80000);
// ~eq9.free
~play4= Synth(\playBufX, [\impulse, 0.321875 ,\start, ~no4S,\buf,~bufSnoopy,\out, ~delayBus,\loopy,1]);
~play4.set(\start, ~no4S);
~del1=Synth( \pingD, [\in, ~delayBus ,\bufnum,~delay, \feedback,0.38 ,\out,~delayToEq],~revGrp);
~eq9=Synth(\EQHP2, [\frq, 100],~eqGrpplus);
~eq9.set(\in, ~delayToEq, \out, ~revDelay,\val, 0,\quant, 0, \gain,0,\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,0,\shelf,0, \gain4,0);
~rev9=Synth(  \reverbS, ~revRnd[1.rrand(2)],~delayGrp); ~rev9.set(\in,~revDelay, \out,~comDelay);
~comp9=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp9.set(\thr,0.9 ,\sB, 1.10,\sA, 1/4,\atk ,0.0484, \rel ,0.3872 ,\gain, 1,\in, ~comDelay, \out,~limitDelay);
~mix9= Synth(\limiterStoMixer,[\c9,1,\in,~limitDelay,\gain,12,\out ,~stereoBus3],~limitGrp);
// ~mixa.set(\in,~stereoBus3);
~mix9.set(\gain,14);

//~eq10.free
~dist1= Synth(\disto,[\in,~vocalBus,\out,~vocToEq],~phaserGrp);
~eq10 =Synth(\EQHP96,[\in,~vocToEq,\out,~vocToRev],~distoGrp);
~eq10.set(\val, 0,\quant, 0, \gain,0,\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,0,\shelf,0, \gain4,0);
~rev10=Synth(\reverb, ~revRnd[2],~dispatchGrp); ~rev10.set(\in, ~vocToRev , \out, ~vocToFil);
~fil1=Synth(\filterS, [\in,~vocToFil, \busMod,~bus2, \rqLPF, ~bus1,\which, 0,\out,~vocToComp,\freqFil,2220],~filterGrp);
~comp10=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp10.set(\thr,0.8 ,\sB, 1.050,\sA, 1/2,\atk ,0.02, \rel ,0.3872,\gain,11,\in, ~vocToComp,  \out, ~vocToLimit);
~mix10= Synth(\limiterStoMixer,[\c10,1,\in,~vocToLimit,\out, ~vocToStereo,\gain, 10],~limitGrp);
~mix10.set(\gain,13 );
//~mixa.set(\in,~vocToStereo);


//~eq11.free
~dist2= Synth(\disto,[ \in, ~distoPercu , \out,~percuFil],~distoGrp);
~fil2=Synth( \filter, [\which,1, \in,~percuFil,\busMod, ~bus4,\qf2,0.4,\out,~percuEq],~filterGrp);
~eq11 =Synth(\EQHP96,[ \frq, 100 ], ~eqGrp0);
~eq11.set(\val, 0,\quant, 0, \gain,0,\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,0,\shelf,0, \gain4,0,\in, ~percuEq, \out , ~percuRev);
~rev11=Synth( \reverb, ~revRnd[0.rrand(2)],~revGrp);~rev11.set(\in,~percuRev, \out,~percuCom);
~comp11=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp11.set(\thr,0.8 ,\sB, 1.05,\sA, 1/2,\atk ,0.0484, \rel ,0.0968,\gain,1,\in, ~percuCom, \out,~percuLimit);
~mix11= Synth(\limiterStoMixer,[ \c11,1,\in,~percuLimit, \gain,46,\out,~percuStereo],~limitGrp);
// ~mixa.set(\in,~percuCom2);
~mix11.set(\gain,82 );



//passant
//~pass1 =(~buf.numFrames.rrand(400000)- 400000);
// ~test1=Synth(\playBufX ,[ \impulse, 5.15/6/*\dur,Pseq([6/1],1),*/,\start,~pass1 ,\buf,~bufSnoopy,\out,~filterBou,\loopy,1,\dA,0]);
//~test1.set(\start,~pass1 )
// ~eq24.free
~fil6 =Synth(\filter,[\which,0, \in ,~filterBou, \busMod, ~bus3,\freqFil,300, \qf,0.7, \out, ~gateBou],~filterGrp);
~eq24=Synth(\EQHP, [\frq, 100 ],~gateGrp2);
~eq24.set(\in, ~gateBou, \out , ~reverbBus4,\val, 0,\quant, 0, \gain,0,\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,0,\shelf,0, \gain4,0);
~rev24=Synth(\reverb,~quickFi,~revGrp);~rev24.set(\in,~reverbBus4, \out,~comFuzz4);
~comp24=Synth(\compS,[\ctrl, ~kbus],~compGrp);
~comp24.set(\thr,0.9 ,\sB, 1.026,\sA, 1/2,\atk ,0.0121, \rel ,0.0968, \gain,10,\in, ~comFuzz4, \out,~limitFuzz4);
~mix24= Synth(\limiterStoMixer,[\c24,1,\in, ~limitFuzz4, \gain,30, \out,~stereoBus14],~limitGrp);
// ~mixa.set(\in,~stereoBus14);
~mix24.set(\gain,30);
~stereo24=Synth(\stereoS,[ \dur, 9999, \in, ~stereoBus14  ,\spread,0.2 ,\out,~newCOn], ~stereoGrp);


// ~eq25.free
/*~pass2= ~pass2-50000*/
//~pass2 =(~buf.numFrames.rrand(400000)- 400000);
// ~test2=Synth(\playBufX ,[ \impulse, 5.15/3/*\dur,Pseq([3/1],1),*/,\start,~pass2,\buf,~bufSnoopy,\out, ~filterPass1,\loopy,1])
// ~test2.set(\start,~pass2);
~fil7 =Synth(\filter,[\which,0, \in ,~filterPass1, \busMod, ~bus3,\freqFil,700, \qf,0.7, \out, ~eqPass1],~filterGrp);
//~fil7.set(\freqFil,700)
~eq25=Synth(\EQHP, [\frq, 100 ],~gateGrp2);
~eq25.set(\in, ~eqPass1,\out, ~revPass1,\val, 0,\quant, 0, \gain,0,\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,0,\shelf,0, \gain4,0);
~rev25=Synth(\reverb,~quickFi,~revGrp);~rev25.set(\in,~revPass1, \out,~compPass1);
~comp25=Synth(\compS,[\ctrl, ~kbus],~compGrp);
~comp25.set(\thr,0.9 ,\sB, 1.026,\sA, 1/2,\atk ,0.0121, \rel ,0.0968, \gain,1,\in, ~compPass1, \out,~limitPass1);
~mix25= Synth(\limiterStoMixer,[\c58,1,\in, ~limitPass1, \gain,24, \out,~stereoPass1],~limitGrp);
// ~mixa.set(\in,~stereoPass1);
~mix25.set(\gain,60);
~stereo25=Synth(\stereoS,[\dur, 9999, \in, ~stereoPass1  ,\spread,0.2 ,\out,~newCOn], ~stereoGrp);


// ~eq26.free
//~pass2 =(~buf.numFrames.rrand(400000)- 400000);
//~test3=Synth(\playBufX ,[ \impulse, 5.15/*\dur,Pseq([1/1],1),*/,\start,~pass3,\buf,~bufSnoopy,\out, ~filterPass2,\loopy,1])
~fil8 =Synth(\filter,[\which,0, \in ,~filterPass2, \busMod, ~bus3,\freqFil,300, \qf,0.7, \out, ~eqPass2],~filterGrp);
~eq26=Synth(\EQHP, [\frq, 100 ],~gateGrp2);
~eq26.set(\in, ~eqPass2,\out, ~revPass2,\val, 0,\quant, 0, \gain,0,\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,0,\shelf,0, \gain4,0);
~rev26=Synth(\reverb,~quickFi,~revGrp);~rev26.set(\in,~revPass2, \out,~compPass2);
~comp26=Synth(\compS,[\ctrl, ~kbus],~compGrp);
~comp26.set(\thr,0.9 ,\sB, 1.026,\sA, 1/2,\atk ,0.0121, \rel ,0.0968, \gain,6,\in, ~compPass2, \out,~limitPass2);
~mix26= Synth(\limiterStoMixer,[\c26,1,\in, ~limitPass2, \gain,30, \out,~stereoPass2],~limitGrp);
// ~mixa.set(\in,~stereoPass2);
 ~mix26.set(\gain,65,\out,~stereoPass2);
~stereo26=Synth(\stereoS,[\dur, 9999, \in, ~stereoPass2  ,\spread,0.2 ,\out,~newCOn], ~stereoGrp);



// ~eq27.free
// ~pass4=(~buf.numFrames.rrand(400000)- 400000)
// ~test4=Synth(\playBufX ,[ \impulse, 2.575/*\dur,Pseq([2/1],1),*/,\start,~pass4,\buf,~bufSnoopy,\out, ~filterPass3,\loopy,1])
//~test4.set(\start,~pass4)
~fil9 =Synth(\filter,[\which,0, \in ,~filterPass3, \busMod, ~bus3,\freqFil,500, \qf,0.7, \out, ~eqPass3],~filterGrp);
~eq27=Synth(\EQHP, [\frq, 100 ],~gateGrp2);
~eq27.set(\in, ~eqPass3,\out, ~revPass3,\val, 0,\quant, 0, \gain,0,\val2,0,\quant2,0, \gain2,0, \val3,0,\quant3,0, \gain3,0,\val4,0,\shelf,0, \gain4,0);
~rev27=Synth(\reverb,~quickFi,~revGrp);~rev27.set(\in,~revPass3, \out,~compPass3);
~comp27=Synth(\compS,[\ctrl, ~kbus],~compGrp);
~comp27.set(\thr,0.6 ,\sB, 1.026,\sA, 1/2,\atk ,0.0121, \rel ,0.0968, \gain,10,\in, ~compPass3, \out,~limitPass3);
~mix27= Synth(\limiterStoMixer,[\c56,1,\in, ~limitPass3, \gain,35, \out,~stereoPass3],~limitGrp);
// ~mixa.set(\in,~stereoPass3);
~mix27.set(\gain,70,\out,~stereoPass3, \c56,1);
~stereo27=Synth(\stereoS,[ \dur, 9999, \in, ~stereoPass3  ,\spread,0.2 ,\out,~newCOn], ~stereoGrp);


~passantComp= Synth(\comp10, [\ctrl, ~snBus, ], ~compGrp2);
~passantComp.set(\thr,0.8 ,\sB, 1.04,\sA, 1/2,\atk ,0.0968, \rel ,0.3872,\in, ~newCOn  ,\out,~comp10Pass);

~passantMix= Synth(\EQHP10, [\in, ~comp10Pass , \vol, 1.2], ~eqGrp2);
~passantMix.set(\vol, 0.22);//0.2




~reverb =  Synth(\reverbMad, [\roomsize, 80, \revtime, 4.85, \damping, 0.41, \inputbw, 0.19, \drylevel, -3, \earlylevel, -9, \taillevel, -11 , \in,~reverbSquelch  , \out,~comSquelch],~extraRev);
~compReverb= Synth(\compS, [\ctrl, ~kbus],~compGrp4);
~compReverb.set(\thr,0.2 ,\sB, 1.2,\sA, 1/4,\atk ,0.0484, \rel ,0.3872 ,\gain, 5,\in, ~comSquelch , \out,~limitSquelch);
~mix30= Synth(\limiterStoMixer,[\c30,1,\in, ~limitSquelch, \gain,44,\out,~stereoBus3b],~limitGrp4);
// ~mixa.set(\in,~limitSquelch);
 ~mix30.set(\gain,36);


~delayFx =  Synth(\limiterS, [\in,~delayToLimit, \gain,40,\out , ~delayEq],~limitGrp4);
~delayFx.set(\gain,50);



~reverbEq=Synth( \EQHP10, [\in, ~eqBus310 ,\out, 0,], ~eqGrp3);
~reverbEq.set(\frq, 500/*,\val,11800,\quant,1, \gain,(-18),\val2,2600,\quant2,8, \gain2,(-16)*/,\vol, 0.2);









// ~flang1=Synth( \flanger,[ \in,~bellFlang4, \out,~riToDisto2],~phaserGrp);
// ~flang1.set(\flangefreq,1,\fdback,1);
~dist3= Synth(\distoS,[\in, ~riToDisto2 , \out,~riToEnv3], ~distoGrp);
~fil3=Synth( \filterS, [\in,~riToEnv3,\out,~riToEq, \busMod,~bus19, \which, 0,\qf,0.5],~filterGrp);
~eq12 =Synth(\EQHP2, [ \frq, 100 ], ~eqGrp0);
~eq12.set(\in, ~riToEq , \out, ~riToRev, \val,1900, \quant,1, \gain,(-8),\val2,5000,\quant2,6, \gain2,(-12));
~rev12=Synth( \reverbS, ~quickFi ,~revGrp);~rev12.set(\in,~riToRev, \out,~riToComp);
~comp12=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp12.set(\thr,0.90 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\in, ~riToComp ,\out,~riToLimit);
~mix12= Synth(\limiterStoMixer,[\c12,1,\in, ~riToLimit,\gain,13,\out,~riToStereo],~limitGrp);
// ~mixa.set(\in,~riToStereo);
~mix12.set(\gain,16.2);

~flang2=Synth( \flanger,[ \in,~bellFlang3, \out,~riToDisto3] ,~phaserGrp); ~flang2.set(\flangefreq,1.2875,\fdback,-0.4);
~dist4= Synth(\distoS,[\in, ~riToDisto3, \out,~riToEnv2],~distoGrp);
~fil4=Synth( \filterS, [\in,~riToEnv2,\out,~riToEq3 ,\busMod,~bus12, \which, 0,\qf,0.55],~filterGrp);
~fil4.set(\freqFil,2700, \qf,6);
~eq13 =Synth(\EQHP2, [ \frq, 100 ], ~eqGrp0);
~eq13.set(\in, ~riToEq3 , \out, ~riToRev3 , \val,1900, \quant,1, \gain,(-16),\val2,900,\quant2,1, \gain2,(-4),\val3,2800,\quant3,1, \gain3,(-5),\val4,3000,\shelf,1, \gain4,(-15));
~rev13=Synth( \reverbS, ~quickFi ,~revGrp); ~rev13.set(\in,~riToRev3, \out,~riToComp3);
~comp13=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp13.set(\thr,0.9 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1,\in, ~riToComp3, \out,~riToLimit3);
~mix13= Synth(\limiterStoMixer,[\c13,1,\in,~riToLimit3 ,\gain,13,\out,~riToStereo3],~limitGrp);
~mix13.set(\gain,18.5);
// ~mixa.set(\in,~riToStereo3);

// ~flang3=Synth( \flanger,[ \in,~bellFlang2, \out,~flanToDisto2] ,~phaserGrp); ~flang3.set(\flangefreq,0.075/16,\fdback,0.1);
// ~flang3.set(\in,~riToStereo3)
~dist5= Synth(\distoS,[\in, ~flanToDisto2 , \out,~flanToEq2 ],~distoGrp);
~eq14 =Synth(\EQHP2, [ \frq, 100 ], ~eqGrp0);
~eq14.set(\in, ~flanToEq2 , \out, ~flanToRev2 ,\val,4000, \quant,1, \gain,(-8),\val2,0,\quant2,0, \gain2,0);
~rev14=Synth( \reverbS, ~rShor ,~revGrp); ~rev14.set(\in,~flanToRev2, \out,~flanToComp2);
~comp14=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp14.set(\thr,0.9 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968, \in,~flanToComp2, \out,~flanToLimit2);
~mix14= Synth(\limiterStoMixer,[\c14,1,\in, ~flanToLimit2,\gain,1,\out,~flanToStereo2],~limitGrp);
// ~mixa.set(\in,~flanToStereo2);
~mix14.set(\gain,16);

// ~eq15.free
//one hit // rise below
~dist6= Synth(\distoS,[\in, ~riToDisto , \out,~riToEnv], ~distoGrp);
~fil5=Synth( \filterS, [\in,~riToEnv,\out, ~riToEq2,\busMod,~bus20, \which, 0,\qf,0.6],~filterGrp);
~eq15 =Synth(\EQHP2, [ \frq, 100 ], ~eqGrp0);
~eq15.set(\in, ~riToEq2 , \out, ~riToRev2, \val,1900, \quant,0.4, \gain,(-9.4),\val2,240,\quant2,2, \gain2,(-14));
~rev15=Synth( \reverbS, ~rShor ,~revGrp); ~rev15.set(\in,~riToRev2, \out,~riToComp2);
~comp15=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp15.set(\thr,0.8 ,\sB, 1.085,\sA, 1/2,\atk ,0.0242, \rel ,0.0968, \in, ~riToComp2 ,\out,~riToLimit2,\gain,1);
~mix15= Synth(\limiterStoMixer,[\c15,1,\in, ~riToLimit2,\gain,7,\out,~riToStereo2],~limitGrp);
// ~mixa.set(\in,~riToStereo2);
~mix15.set(\gain,12.4);

~mix16a= Synth(\limiterStoMixer,[ \in,~noiseToMixA , \out,~eqNoise],~distoGrp0);~mix16a.set(\gain,70);
~mix16b= Synth(\limiterStoMixer,[ \in,~noiseToMixB , \out,~eqNoise],~distoGrp0);~mix16b.set(\gain,30);
~mix16c= Synth(\limiterStoMixer,[ \in,~noiseToMixC , \out,~eqNoise],~distoGrp0);~mix16c.set(\gain,50);
~mix16d= Synth(\limiterStoMixer,[ \in,~noiseToMixD , \out,~eqNoise],~distoGrp0);~mix16d.set(\gain,55);
~eq16 =Synth(\EQHP2, [ \frq, 100 ], ~eqGrp0);
~eq16.set(\in, ~eqNoise, \out, ~noiseRev ,\val2,0,\quant2,0, \gain2,0);
~rev16=Synth( \reverbS, ~revRnd[0.rrand(3)],~revGrp);~rev16.set(\in,~noiseRev, \out,~noiseToComp);
~comp16=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp16.set(\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\in,~noiseToComp, \out,~noiseToLimit);
~mix16= Synth(\limiterStoMixer,[\c16,1,\in,~noiseToLimit ,\gain,25,\out,~noiseToStereo],~limitGrp);
// ~mixa.set(\in,~noiseToStereo);
// ~mix16.set(\gain,25);

~eq17 =Synth(\EQHP2, [ \frq, 100 ], ~eqGrp0);
~eq17.set(\in, ~eqDs , \out, ~reverbBus3, \val2,0,\quant2,0, \gain2,0,);
~rev17=Synth( \reverb, ~quickFi ,~revGrp); ~rev17.set(\in,~reverbBus3, \out,~comFuzz3);
~comp17=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp17.set(\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,10,\in, ~comFuzz3 , \out,~limitFuzz3);
~mix17= Synth(\limiterStoMixer,[\c17,1,\in, ~limitFuzz3,\gain,30,\out,~stereoBus4],~limitGrp);
// ~mixa.set(\in,~stereoBus4);
 ~mix17.set(\gain,40);

~flang4=Synth( \flanger,[ \in,~bellFlang, \out,~flanToDisto],~phaserGrp);~flang4.set(\flangefreq,0.3,\fdback,0.1);
~dist7= Synth(\distoS,[\in, ~flanToDisto, \out,~flanToEq],~distoGrp);
~eq18 =Synth(\EQHP2, [ \frq, 100 ], ~eqGrp0);
~eq18.set(\in, ~flanToEq , \out, ~flanToRev , \val,6700, \quant,1, \gain,(-16),\val2,0,\quant2,0, \gain2,0);
~rev18=Synth( \reverbS, ~rLon ,~revGrp);~rev18.set( \in,~flanToRev, \out,~flanToComp);
~comp18=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp18.set(\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,25,\in, ~flanToComp, \out,~flanToLimit);
~mix18= Synth(\limiterStoMixer,[\c18,1,\in, ~flanToLimit,\gain,12,\out,~flanToStereo],~limitGrp);
// ~mixa.set(\in,~flanToStereo);
~mix18.set(\gain,18);


~dist8= Synth(\distoS,[ \in, ~riTriptoDisto , \out,~riTriptoEq], ~distoGrp);
~eq19 =Synth(\EQHP2, [ \frq, 100 ], ~eqGrp0);
~eq19.set(\in, ~riTriptoEq , \out, ~riTriptoRev ,\frq, 600, \val,0, \quant,0, \gain,0,\val2,0,\quant2,0, \gain2,0);
~rev19=Synth( \reverbS, ~rLon ,~revGrp); ~rev19.set(\in,~riTriptoRev, \out,~riTriptoComp);
~comp19=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp19.set(\thr,0.92 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,20,\in, ~riTriptoComp,\out,~riTriptoLimit);
~mix19= Synth(\limiterStoMixer,[\c19,1,\in, ~riTriptoLimit,\gain,20,\out,~riTriptoStereo],~limitGrp);
// ~mixa.set(\in,~riTriptoStereo);
 ~mix19.set(\gain,55);

~eq20 =Synth(\EQHP2, [ \frq, 100 ], ~eqGrp0);
~eq20.set(\in, ~slideBus , \out, ~slideEq ,\frq, 300, \val,12000, \quant,1, \gain,(-30),\val2,0,\quant2,0, \gain2,0, \vol,1);
~comp20= Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp20.set(\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,1, \in,~slideEq, \out,~slideBusToLimit);
~mix20= Synth(\limiterStoMixer,[ \c20,1,\in, ~slideBusToLimit,\out,~slideBusToStereo, \gain, 30],~limitGrp);
// ~mixa.set(\in,~slideBusToStereo);
 ~mix20.set(\gain,8);


~fil10= Synth(\filter, [\in,~bgSfil,\which,0, \out,~slideBus2, \busMod, ~bus8 ],~ptrGrp);
~eq21 =Synth(\EQHP96,[\frq, 400 ],~recGrp);
~eq21.set( \in, ~slideBus2, \out, ~slideEq2, \val,0, \quant,0, \gain,0,\val2,0,\quant2,0, \gain2,0, \vol,1);
~comp21=Synth(\comp, [\ctrl, ~kbus ],~compGrp);
~comp21.set(\thr,0.9 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,10, \in,~slideEq2  , \out,~slideBusToLimit2);
~mix21= Synth(\limiterToMixer,[\c21,1,\in, ~slideBusToLimit2,\gain,45,\out,~toStereoRise],~limitGrp);
 ~mix21.set(\gain,20);
//~mixa.set(\in,~toStereoRise);

~mix22= Synth(\limiter10,[\in, ~bangLimit, \out, ~again, \gain,50], ~limitGrp);
~mix22.set(\gain,30)

~mix23=	Synth(\comp10, [\ctrl, ~snBus],~compGrp2);
~mix23.set(\thr,0.9 ,\sB, 1.04,\sA, 1/2,\atk ,0.0242, \rel ,0.3872 ,\in,~again,\gain,0.6, \out,~gateRise);





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






Synth(\playB10,[\buf, ~leTout,\out,~finGran ]   );

// PART 3 BELOW



~shift1 =  Synth(\shiftEx,[\in,~limitBus1,\out,  ~distoPerch2 ],~filterGrp);
~disto35=Synth(\distoS, [\in, ~distoPerch2 , \out,~eqPerch2], ~distoGrp0);
~eq35= Synth(\EQHP2, [\in, ~eqPerch2, \out, ~revPerch2 ], ~eqGrp0);
~rev35=Synth(\reverbS, ~quickFi ,~revGrp);~rev35.set(\in,~revPerch2, \out,~comPerch2 );
~comp35=Synth(\compS, [\ctrl, ~kbus],~compGrp);
~comp35.set(\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.04840, \gain,1,\in, ~comPerch2, \out,~limitPerch2, );
~mix35= Synth(\limiterStoMixer,[\c31,1,\in,~limitPerch2 ,\gain,6,\out,~stereoPerch],~limitGrp);
~mix35.set(\gain,6);
~stereo35=Synth(\stereoS,[ \dur, 9999, \in, ~stereoPerch ,\spread,1 , \out,~absoFinalGate3], ~dispatchGrp2 );




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













~disto43=Synth( \distoS,[ \in, ~bigRiToDisto , \out,~bigRiToEnv ], ~distoGrp);
~fil11= Synth( \filterS,[ \in,~bigRiToEnv ,\out,~bigRiToEq,\which, 0, \busMod, ~bus17,\qf,0.67],~filterGrp );
~eq43= Synth( \EQHP2, [\frq, 300],~eqGrp0);
~eq43.set(\in, ~bigRiToEq, \out, ~bigRiToRev,\val,0, \quant,0, \gain,0,\val2,0,\quant2,0, \gain2,0);
~rev43= Synth( \reverbS, ~rShor, \instrument, \reverbS, \dur,inf, \in,~bigRiToRev  , \out,~bigRiToComp,\group,~revGrp),
~comp43= Synth(\compS, [\ctrl, ~kbus],~compGrp);
~comp43.set(\thr,0.8 ,\sB, 1.015,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\gain,20,\in, ~bigRiToComp , \out,~bigRiToLimit);
~mix43= Synth(\limiterStoMixer,[\c43,1,\in, ~bigRiToLimit, \gain,40,\out,~bigRiToStereo],~limitGrp);
~mix43.set( \gain,40);
~stereo43= Synth(\stereoS, [\dur, 9999, \in, ~bigRiToStereo  ,\spread,1,\out,0,\atkT,1,\decT,0], ~stereoGrp);





~mix32=	Synth( \limiter10toMixer,[\c32,1,\dur, inf, \in,~rythmLimit,\out,~rythmComp, \gain,60,], ~limitGrp);
//~mix20.set(\gain,60)



~mix31= Synth(\limiterStoMixer,[\c31,1,\in, ~limitCymb,\gain,20,\out,~comFuzz22],~limitGrp);
// ~mixa.set(\in,~comFuzz22);
 ~mix31.set(\gain,12);
~mix33= Synth(\limiterStoMixer,[\c33,1,\in, ~limitHat,\gain,16,\out,~comFuzz22],~limitGrp);
// ~mixa.set(\in,~comFuzz22);
 ~mix33.set(\gain,14);

~mix34= Synth(\limiterToMixer,[\c34,1,\in, ~snareLimit,\gain,40,\out,~toPan2],~limitGrp);
 ~mix34.set(\gain,40);



~eq49=Synth(\EQHP,[\frq, 100],~eqGrp0);
~eq3.set(\in, ~toEq , \out,~gateBus3,\val, ~val=0,\quant, ~quant=0, \gain,~gain=0,\val2,~val2=0,\quant2,~quant2=0, \gain2,~gain2=0,\val3,~val3=0,\quant3,~quant3=0, \gain3,~gain3= 0,\val4,~val4=0,\shelf,~shelf=0, \gain4,~gain4=0);
~rev49=Synth( \reverb ,~revRnd[~r2],~revGrp);~rev49.set(\in, ~revBus4 , \out, ~comBus4);
~comp49=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp49.set(\thr,0.92 ,\sB, 1.026,\sA, 1/2,\atk ,0.0121, \rel ,0.0968, \gain,80,\in, ~comBus4,\out,~part2Limit4);
~mix49= Synth(\limiterStoMixer,[\c49,1,\in,~part2Limit4 , \gain,8,\out,~sterBus4],~limitGrp);
// ~mixa.set(\in,~sterBus4);
 ~mix49.set(\gain,~gainMix);


~stereo49=Synth(\stereoS,[ \dur,9999, \in, ~sterBus4   ,\out,~toCom ],~stereoGrp);
~compAbso1 = Synth(\comp10, [\ctrl, ~snBus], ~compGrp2);
~compAbso1.set(\thr,0.94 ,\sB, 1.04,\sA, 1/2,\atk ,0.0968, \rel ,0.3872 ,\in, ~toCom, \out,~absoFinalGate);

/*~comp46=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp46.set(\thr,0.72 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.0968, \gain,80,\in, ~comFuzz ,\out,~part2Limit);
~mix46= Synth(\limiterStoMixer,[\c46,1,\in, ~part2Limit, \gain,6,\out,~stereoBus1],~limitGrp);
// ~mixa.set(\in,~stereoBus1);
 ~mix46.set(\gain,6);*/

/*~comp46 = Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp46.set(\thr,0.85 ,\sB, 1.086,\sA, 1/2,\atk ,0.0242, \rel ,0.0968,\in, ~comPerch , \out,~limitPerch);
~mix46= Synth(\limiterStoMixer,[\c46,1,\in, ~limitPerch, \gain,6, \out,~stereoPerch2],~limitGrp);
// ~mixa.set(\in,~stereoPerch2);
 ~mix46.set(\gain,26);

~comp47=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp47.set(\thr,0.72 ,\sB, 1.086,\sA, 1/2,\atk ,0.0121, \rel ,0.0968, \gain,80,\in, ~comBus5 ,\out,~part2Limit2);
~mix47= Synth(\limiterStoMixer,[\c47,1,\in,~part2Limit2 , \gain,6,\out,~sterBus5],~limitGrp);
// ~mixa.set(\in,~sterBus5);
 ~mix47.set(\gain,26);

~comp48=Synth(\compS, [\ctrl, ~kbus ],~compGrp);
~comp48.set(\thr,0.9 ,\sB, 1.086,\sA, 1/2,\atk ,0.0248, \rel ,0.3872, \gain,1,\in, ~comBus3 ,\out,~part2Limit3);
~mix48= Synth(\limiterStoMixer,[\c48,1,\in,~part2Limit3 , \gain,5,\out,~sterBus6],~limitGrp);
// ~mixa.set(\in,~sterBus6);
 ~mix48.set(\gain,44);

*/


