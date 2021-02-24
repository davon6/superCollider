Server.default.options.outDevice_("Audient iD14");

s.boot;


{Saw.ar(70,-1)*0.2!2}.scope;

{Saw.ar(41.2,-1,-0.4).lincurve(-1,1,-1,-4)*0.2!2}.scope;


{Saw.ar(41.2)!2 }.play;