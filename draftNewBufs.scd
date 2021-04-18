~audio = Buffer.read(s, "/Users/davidmignot/Desktop/E/E1.wav");


~audio2 = Buffer.read(s,"/Users/davidmignot/Documents/REAPER Media/consolidated.wav");

~audio3 = Buffer.read(s,"/Users/davidmignot/Documents/REAPER Media/02-consolidated.wav");

~audio3.play

~bufSnoopy.play

~audio.numFrames


~audio2.play

g = Synth(  \playBufX2,[ \impulse, 0.00001,\loo,1,\buf,~audio,\out, 0]);




g = Synth(  \playBufX,[ \impulse, 0.00001,\loo,1,\buf,~audio3,\out, 0]);




Pbind(\instrument, \playBufX,\dur, inf,\impulse, 0.00001,\loo,0,\buf,~audio3,\out, 0/*~bgFil22*/).play(t)



Pbind(\instrument, \playBufX,\dur, Pseq([16/1],inf),\impulse, 0.00001,\loo,0,\buf,~audio3,\out, 0/*~bgFil22*/).play(t)