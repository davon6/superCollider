

({SinOsc.kr(1.2875,1.4)}.plot(duration:2))






({SinOsc.ar(432,1.4,MouseX.kr(-15.dbamp,-1.dbamp).ampdb)}.play)




ampA = RMS.ar(a, 1).ampdb;




({RMS.ar(SinOsc.ar(432,1.4,/*(-5).dbamp*/MouseX.kr(-15.dbamp,-1.dbamp)),1).ampdb.round(0.1).poll(label:"gg")}.play);



SynthDef(\bla,{Out.ar(0,RMS.ar(SinOsc.ar(432,1.4,/*(-5).dbamp*/MouseX.kr(-20.dbamp,-10.dbamp)),1).ampdb.round(0.1).poll(label:"gg")* [0,0,1])}.play);





({SinOsc.ar(432,1.4,/*(-5).dbamp*/MouseX.kr(-20.dbamp,-10.dbamp))/*.round(0.1).poll*/}.play);