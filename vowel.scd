// Start internal server

		s = Server.internal.boot;

		Server.default = Server.internal;



		// Create analyzer in a window you might want to see the spectrum of your vowels

		(

		w = Window("Frequency Spectrum", Rect(0, 0, 300, 200)); // width should be 511

		f = FreqScopeView(w, w.view.bounds);

		f.active_(true); 	// turn it on the first time;

		f.dbRange_(100); 	// turn it on the first time;

		w.onClose_({ f.kill }); // you must have this

		w.front;

		)

		Vowel(); // defaults to A bass

		Vowel(\a, \bass);

		Vowel(\e, \tenor);

		Vowel(\i, \counterTenor);

		Vowel(\o, \alto);

		Vowel(\u, \soprano);



		{Formants.ar(100, Vowel(\e, \bass)) * 0.1 }.play

		{Formants.ar(200, Vowel(\o, \alto)) * 0.1 }.play

{Formants.ar(MouseX.kr(100,2600), Vowel(\i, \soprano)) * 0.1 }.play
