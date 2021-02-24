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


a = Synth(\test, [\roomsize, 61, \revtime, 3.5, \damping, 0.01, \inputbw, 0.7, \drylevel, -0, \earlylevel, -15, \taillevel, -0]);
a.free;

//
Last row of the church
a = Synth(\test, [\roomsize, 200, \revtime, 9, \damping, 0.7, \inputbw, 0.8, \drylevel, -20, \earlylevel, -15, \taillevel, -8]);
a.free;

//dave long
a = Synth(\test, [\roomsize, 41, \revtime, 13.5, \damping, 0.31, \inputbw, 0.7, \drylevel, -0, \earlylevel, -15, \taillevel, -9]);
a.free;



//dave short
a = Synth(\test, [\roomsize, 41, \revtime, 3.5, \damping, 0.81, \inputbw, 0.7, \drylevel, -0, \earlylevel, -15, \taillevel, -12]);
a.free;


//Bright, small hall
a = Synth(\test, [\roomsize, 50, \revtime, 1.5, \damping, 0.1, \inputbw, 0.75, \drylevel, -1.5, \earlylevel, -10, \taillevel, -20]);
a.free;




//Nice hall effect
a = Synth(\test, [\roomsize, 40, \revtime, 20, \damping, 0.5, \inputbw, 0.75, \drylevel, -0, \earlylevel, -10, \taillevel, -30]);
a.free;




//quick fix
a = Synth(\test, [\roomsize, 40, \revtime, 4, \damping, 0.9, \inputbw, 0.75, \drylevel, -0, \earlylevel, -22, \taillevel, -28]);
a.free;

//singing in the sewer
a = Synth(\test, [\roomsize, 6, \revtime, 15, \damping, 0.9, \inputbw, 0.1, \drylevel, -10, \earlylevel, -10, \taillevel, -10]);
a.free;




// bathroom weird
a = Synth(\test, [\roomsize, 15, \revtime, 0.5, \damping, 0.5, \inputbw, 0.48, \drylevel -6, \earlylevel, -11, \taillevel, -13]);
a.free;




// bathroom
a = Synth(\test, [\roomsize, 5, \revtime, 0.6, \damping, 0.62, \inputbw, 0.48, \drylevel, -6, \earlylevel, -11, \taillevel, -13]);
a.free;

a = Synth(\test, [\roomsize, 16, \revtime, 1.24, \damping, 0.10, \inputbw, 0.95, \drylevel -3, \earlylevel, -15, \taillevel, -17]);
a.free;



a = Synth(\test, [\roomsize, 243, \revtime, 1, \damping, 0.1, \inputbw, 0.34, \drylevel -3, \earlylevel, -11, \taillevel, -9]);
a.free




a = Synth(\test, [\roomsize, 300, \revtime, 103, \damping, 0.43, \inputbw, 0.51, \drylevel -5, \earlylevel, -26, \taillevel, -20]);
a.free;




