(
SynthDef(\test, { |out, roomsize, revtime, damping, inputbw, spread = 15, drylevel, earlylevel,
    taillevel|



	var a ;


	a = Resonz.ar(
		Pulse.ar(864, mul:EnvGen.kr(Env.perc(0,0.3)));
		,
        1760 * [1, 2, 4, 8],
        0.01
    ).sum * 10;

	//a =Pulse.ar(864, mul:EnvGen.kr(Env.perc(0,0.3)));


    //    var a = SoundIn.ar(0);
    //    var a = PlayBuf.ar(1, 0);

    Out.ar(out,
        (GVerb.ar(
            a,
            roomsize,
            revtime,
            damping,
            inputbw,
            spread,
            drylevel.dbamp,
            earlylevel.dbamp,
            taillevel.dbamp,
            roomsize, 0.3,)
		+ a )*   EnvGen.kr(Env.perc(0,revtime),Trig.kr(2,revtime),doneAction:2) ;
    )
}).add
)


// bathroom weird
a = Synth(\test, [\roomsize, 15, \revtime, 0.5, \damping, 0.5, \inputbw, 0.48, \drylevel -6, \earlylevel, -11, \taillevel, -13]);
a.free;




// bathroom
a = Synth(\test, [\roomsize, 5, \revtime, 0.6, \damping, 0.62, \inputbw, 0.48, \drylevel, -6, \earlylevel, -11, \taillevel, -13]);
a.free;

a = Synth(\test, [\roomsize, 16, \revtime, 3.24, \damping, 0.10, \inputbw, 0.95, \drylevel -3, \earlylevel, -15, \taillevel, -17]);
a.free;



a = Synth(\test, [\roomsize, 243, \revtime, 1, \damping, 0.1, \inputbw, 0.34, \drylevel -3, \earlylevel, -11, \taillevel, -9]);
a.free




a = Synth(\test, [\roomsize, 300, \revtime, 103, \damping, 0.43, \inputbw, 0.51, \drylevel -5, \earlylevel, -26, \taillevel, -20]);
a.free;




