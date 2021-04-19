(
Ndef(\balance, {
	var a, b, ampA, ampB, ampAvg, ampAdjustA, ampAdjustB;

	a = Decay.ar(Impulse.ar(1/1), 5);
	a = a * LPF.ar(LFSaw.ar(52.midicps), 300);

	b = Decay.ar(Impulse.ar(1/1.125), 5);
	b = b * LPF.ar(LFSaw.ar(55.midicps), 400);
	b = -20.dbamp * b;

	ampA = RMS.ar(a, 1).ampdb;
	ampB = RMS.ar(b, 1).ampdb;
	// ampA = Amplitude.ar(a, 0.01, 1).ampdb;
	// ampB = Amplitude.ar(b, 0.01, 1).ampdb;

	ampAvg = [ampA, ampB].mean;

	ampAdjustA = (ampAvg - ampA).min(36);
	ampAdjustB = (ampAvg - ampB).min(36);

	ampA.round(0.1).poll(label:"--------------------\n      ampA");
	ampB.round(0.1).poll(label:"      ampB");
	ampAvg.round(0.1).poll(label:"    ampAvg");
	ampAdjustA.round(0.01).poll(label:" ampAdjustA");
	ampAdjustB.round(0.01).poll(label:" ampAdjustB");

	(ampA.ampdb - ampB.ampdb).round(0.1).poll(label:" difference");

	a = a * ampAdjustA.dbamp;
	b = b * ampAdjustB.dbamp;

	Amplitude.ar([a, b], 1, 6).poll;

	[a, b]
}).play;
)

Balance.ar