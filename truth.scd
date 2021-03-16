

~buf.play


o = {Out.kr(~bus4, SinOsc.kr(Select.kr(LFNoise2.ar(10.3).range(0,1).round(1),
	[  5.15 ,0.321875	]
) ).range((-300),300));


Out.kr(~bus3, SinOsc.kr(0.3 ).range((-140),1500));

}.play;




({ BLowPass4.ar(   BHiPass4.ar(   Saw.ar(13+Saw.ar(0.001),0.1), In.kr(~bus3) +  500+In.kr(~bus4), 0.822379),In.kr(~bus3) +  700+In.kr(~bus4),0.504212 )!2 }.play)





SynthDef(\filterU, {|out=0,in, busMod, busMod2|Out.ar(out, BLowPass4.ar(   BHiPass4.ar(  In.ar(in,1) , In.kr(~bus3) +  500+In.kr(~bus4), 0.822379),In.kr(~bus3) +  700+In.kr(~bus4),0.504212 )) }).add;







SynthDef(\filterU, {|out=0,in,  busMod, busMod2 ,qfH = 0.822379, qlL = 0.504212|Out.ar(out, BLowPass4.ar(   BHiPass4.ar(  In.ar(in,1) , In.kr( busMod) +  500+In.kr(busMod2), qfH),In.kr(busMod) +  700+In.kr(busMod2),qlL )) }).add;


Pbind(\\filterU \group, ~filterGrp)



Synth(\filterU ,[\in,~filterBus2 ,\busMod, ~bus3 , \busMod2,~bus4,\out,   ~eqBus2] ,~filterGrp)




o = {Out.kr(~bus4, SinOsc.kr(Select.kr(LFNoise2.ar(10.3).range(0,1).round(1),
	[  5.15 ,0.321875	]
) ).range((-300),300));}.play;

({ BLowPass4.ar(   BHiPass4.ar(   Saw.ar(13+Saw.ar(0.001),0.1),  500+In.kr(~bus4), 0.822379), 700+In.kr(~bus4),0.504212 )!2 }.play)







({ LPF.ar(LPF.ar( HPF.ar(  HPF.ar(   Saw.ar(13+Saw.ar(0.001),0.1), 500+MouseX.kr((-300), 300)), 500+MouseX.kr((-300), 300)), 700+MouseX.kr((-300), 300)    ), 700+MouseX.kr((-300), 300)    )  }.play)



({ BLowPass4.ar(   BHiPass4.ar(   Saw.ar(13+Saw.ar(0.001),0.1), 500+MouseX.kr((-300), 300)), 700+MouseX.kr((-300), 300)    ) }.play)



s.plotTree


Synth(\playBuf,  [  \buf,~buf , \out, ~distoBus4    ]);
Synth(\playBuf,  [  \buf,~buf , \out, 0    ]);


~c=Synth(\gran2,[\amp, 1,\buf, ~buf,\gate, 1,\impulse,0.02,\duration,30
	,\pos,0,\out, 0] /*,~granuGrp*/ );


~c=Synth(\gran2,[\amp, 1,\buf, ~buf,\gate, 1,\impulse,40.02,\duration,0.1
	,\pos,0,\out, ~distoBus4] /*,~granuGrp*/ );



o = {Out.kr(~bus4, SinOsc.kr(Select.kr(LFNoise2.ar(10.3).range(0,1).round(1),
		[  5.15 ,0.321875	]
) ).range((-300),300));}.play;

({ BLowPass4.ar(   BHiPass4.ar(  In.ar(~distoBus4,1) /*Saw.ar(130+Saw.ar(0.001),0.1)*/,  500+In.kr(~bus4), 1), 700+In.kr(~bus4),1 ) }.play)





o = {Out.kr(~bus4, SinOsc.kr(Select.kr(LFNoise2.ar(10.3).range(0,1).round(1),
		[  5.15 ,0.321875	]
) ).range((-200),1200));}.play;

({ BPF.ar( In.ar(~distoBus4,1) /*Saw.ar(130+Saw.ar(0.001),0.1)*/,  300+In.kr(~bus4),1) }.play)




o = {Out.kr(~bus4, SinOsc.kr(Select.kr(LFNoise2.ar(10.3).range(0,1).round(1),
		[  5.15 ,0.321875	]
) ).range((-200),1200));}.play;

({ BPF.ar( Saw.ar(13+Saw.ar(0.001),0.1),  300+In.kr(~bus4),1) }.play)










o = {Out.kr(~bus4, SinOsc.kr(Select.kr(LFNoise2.ar(10.3).range(0,1).round(1),
		[  5.15 ,0.321875	]
) ).range((-200),1600));}.play;

({ BPF.ar( SinOsc.ar(10+SinOsc.ar(SinOsc.ar(50,mul: 5)*500,mul: 5)),  300+In.kr(~bus4),1) }.play)