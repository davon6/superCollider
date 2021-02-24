//Distortion



Adding new components into a signal to make it richer; modulation side effects are examples of these.



//use a unary or binary operation (see the top of the AbstractFunctions or bottom of the Signal help files for some more)



{SinOsc.ar(440,0,0.5)}.play



{SinOsc.ar(440,0,0.5).distort}.play



{SinOsc.ar(440,0,0.5).cubed}.play //squared would put it an octave up; recall ring modulation and C+M, C-M



{SinOsc.ar(440,0,0.1).pow(MouseX.kr(0.1,1.0))}.scope



{SinOsc.ar(440,0,0.5).clip(-0.2,0.3)}.scope



{SinOsc.ar(440,0,0.5).round(2**(-8))}.scope //bit reduction to 7 bit signal



{Latch.ar(SinOsc.ar(440,0,0.1),Impulse.ar(MouseX.kr(100,20000)))}.scope //sr change; Latch allows crude resampling with aliasing (sample and hold signal values at assigned rate)








//a limiter forces an absolute limit, and is very useful as a final stage in a patch to avoid overloading





(

SynthDef(\impulse, {

Out.ar(0,Pan2.ar(Saw.ar(440,Decay2.ar(Impulse.ar(1),0.001,0.1,0.5)),0.0));

}).add;)



(

SynthDef(\fxexamplelimiter, {



	arg gain=1;

var input, effect;



input=In.ar(0,2); //get two channels of input starting (and ending) on bus 0



effect= Limiter.ar(gain*input,-40.dbamp, 0.01);



ReplaceOut.ar(0,effect); //replaces bus 0 where original signal is already playing

}).add;

)





s.meter

x.free



x= Synth.head(a, \impulse);



y= Synth.tail(a, \fxexamplelimiter);



y.set(\gain, 10) //careful with your ears!



y.free;







//Reverb

~gosh = Group.new;

(

SynthDef(\fxexamplereverb, {arg delaytime=0.01, decaytime=1;

var input;

var numc,numa,temp;



input=In.ar(0,2); //get two channels of input starting (and ending) on bus 0



numc = 4; // number of comb delays

numa = 6; // number of allpass delays



// reverb predelay time :

temp = DelayN.ar(input, 0.0048,0.0048);



temp=Mix.fill(numc,{CombL.ar(temp,0.1,rrand(0.01, 0.1),5)});



// chain of 4 allpass delays on each of two channels (8 total) :

numa.do({ temp = AllpassN.ar(temp, 0.051, [rrand(0.01, 0.05),rrand(0.01, 0.05)], 1) });



// add original sound to reverb and play it :

Out.ar(0,(0.2*temp));

}).add;

)
s.meter
s.plotTree
x= Synth.head(a, \impulse, \group, ~gosh);

~master.tail(~gosh, \fxexamplereverb);
y= Synth.tail(a, \fxexamplereverb);



y.free;