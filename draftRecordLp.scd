


Pbind(\instrument,\playBufXG,\dur,


 Pwrand([ Pseq([1/4],5),seq([1/2],4), Pseq([1.25/1], 1 ) , Pseq([3/1], 1     ],[4,4,4,1].normalizeSum,1)


 ,\amp, 1,\buf,~bufSnoopy,\out,~gateMelo,\impulse,0.003,\start, ~main1,\tS, 0.39550810372374 ,\vlSub,  ~pSub , \vlSub2,Pkey(\vlSub), \atkT,~pAtkT,\decT, ~pDecT ,	\subsT, ~pSubT , \relT,~pRelT,\atckC,~pAtkC,\decC,~pDecC,\relC,~pRelC,\vlAtk , ~pvlAtk ,  \vlRel,  Pkey(\vlAtk),\loopy,0),



		Pbind(\instrument, \filterG, \dur, inf,\in,~gateMelo, \which,0,\out,0,\group,~filterGrp ),







MIDIdef.noteOn(\rec, {|vel, nn, chan, src|

	// k.set(\out,~toRecord);

x = Synth(\recLoop,[buf:~lpPrec,\recording,1, \in,0],~recGrp);

},noteNum: 43);// is 43

