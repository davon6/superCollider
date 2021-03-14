
f = { |x, y| sin(x) - (sin(y) * log(x * x + 1)) / 10 };

// check the surface produced by the function with GeoGebra

// copy and paste this syntax into GeoGebra Input, it needs ln for the natural logarithm
// (sin(x) - (sin(y) * ln(x * x + 1))) / 10


// circular path through the terrain, mouse control for distance from origin

(
x = {
	var r = MouseX.kr(0, 25);
	// stereo expansion
	var phi = LFSaw.ar([50, 50.1], -1).range(0, 2pi);
	var x = r * cos(phi);
	var y = r * sin(phi);
	Limiter.ar(f.(x, y), 0.2)
}.play
)

x.release

(
SynthDef.new(\leopard_b, {
	arg radius=1, a_centreX=0, a_centreY=0, circlefreq = #[440, 440], amp = 0.2;
	var x, y, grey;
	x = a_centreX + (radius * SinOsc.ar(circlefreq));
	y = a_centreY + (radius * SinOsc.ar(circlefreq, pi/2));
	grey = (x.sin + y.sin).sqrt /2;
	Out.ar(0, grey * amp);
}).add;
)

(
c = Synth.new(\leopard_b, [
	\circlefreq, [70, 70.1],
	\radius, 10,
	\a_centreX, 1,
	\a_centreY, 1
]);
)

(
a = Bus.audio(s, 1);
b = Bus.audio(s, 1);

x = { Out.ar(a, SinOsc.ar(70.03) * LFDNoise3.ar(0.2).range(1, 10)) }.play;
y = { Out.ar(b, SinOsc.ar(70.06) * LFDNoise3.ar(0.2).range(1, 10)) }.play;

c.map(\a_centreX, a);
c.map(\a_centreY, b);
)


x.free;
y.free;
c.free;








(
// allocate buffers for path points
~numPoints = 2000;

b = Buffer.alloc(s, ~numPoints, 1);
c = Buffer.alloc(s, ~numPoints, 1);
)

(
// function for path drawing and filling the buffers
// graph is reversed due to different convention

~fillWithPath = { |pointArray, buf1, buf2, drawMul = 30, drawAddX = 200, drawAddY = 200|
	var numPoints = buf1.numFrames;
	// I encountered some quirks in examples with looping the \bspline type
	// so I took \hermite
	var iplPath = pointArray.resize(numPoints, \hermite, loop: true);
	var visualPath = iplPath.collect(_ * drawMul + (drawAddX@drawAddY));

	w = Window.new.front;
	w.drawFunc = {
		Pen.moveTo(visualPath[0]);
		visualPath.do(Pen.lineTo(_));
    	Pen.stroke
	};
	w.refresh;

	buf1.loadCollection(iplPath.collect(_.x),  0, { "done".postln });
	buf2.loadCollection(iplPath.collect(_.y),  0, { "done".postln });
}
)


// fill buffers and check path

~fillWithPath.([1@2, 1@1, 1@(-1), -2@(-3), -2@1, -2@3], b, c);


// test: "play the path"

x = { BufRd.ar(1, [b, c], Phasor.ar(0, 5, 0, ~numPoints)) * 0.1 }.play;

x.release;


(
// SynthDef now with array arg for center (audio control) but only one input for frequency

SynthDef.new(\leopard_c, {
	arg radius = 1, a_centre = #[0, 0], circlefreq = 440, bufX, bufY, pan = 0, amp = 0.1;
	var x, y, grey;
	#x, y = BufRd.ar(
		1,
		[bufX, bufY],
		Phasor.ar(0, circlefreq * BufFrames.ir(bufX) / SampleRate.ir, 0, BufFrames.ir(bufX)),
		interpolation: 4
	) * radius + a_centre;
	grey = (x.sin + y.sin).sqrt / 2;
	Out.ar(0, Limiter.ar(Pan2.ar(grey, pan), amp) * EnvGate.new);
}).add;
)

(
// start two synths with decorrelated frequencies
// use group for easy mapping
g = Group.new;

x = (
	instrument: \leopard_c,
	type: \on,
	circlefreq: [70, 70.1],
	bufX: b,
	bufY: c,
	radius: 1,
	pan: [-1, 1],
	amp: 0.1,
	group: g
).play
)

// modulate center of both synths
(
a = Bus.audio(s, 1);
u = { Out.ar(a, SinOsc.ar(5).range(0.2, 2)) }.play;
g.map(\radius, a);
)

// while running draw new paths and fill buffers on the fly

~fillWithPath.([5@1, -1@1, 1@(-2), 2@5, -2@2 , 2@(-1)], b, c, drawMul: 20);

~fillWithPath.([4@1, -1@1, 1@(-2), -2@0, -2@2 , -2@(-1)], b, c, drawMul: 20);

~fillWithPath.([4@1, -3@1, 1@(-2), -2@10, -2@2 , -2@(-1)], b, c, drawMul: 15);

~fillWithPath.([25@1, -3@10, 1@(-2), 2@2, -2@2 , -2@(-1)], b, c, drawMul: 5);


(
x.release;
y.release;
u.release;
)