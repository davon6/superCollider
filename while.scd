~bru = [\rest,\note];
~bra = [];
~bra[0] = \rest.asCompileString;
~bra.add(\rest)

for(~i = 0;~i>~bru.size,~i = ~i+1)





for (3, 7, { arg i; i.postln });

~i = 0

while({~i<~bru.size},
	{


		if(~bru[~i].asCompileString.compare(\note.asCompileString)==0,


			{~bra.add(\rest); ~i = ~i+1;    },{~bra.add(\note) ; ~i = ~i+1;             });


		//"po".postln; ~i = ~i+1;

} );





.asCompileString.compare(compared.asCompileString)!=0




~bru[0].asCompileString.compare(\note.asCompileString)==0