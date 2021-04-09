{Saw.ar(70,-1)*0.2!2}.scope;
{Saw.ar(70,-1,-0.4).lincurve(-1,1,-1,1,-4)*0.2!2}.scope;




{Saw.ar(70,-1,-0.4)/*.lincurve(-1,1,-1,1,-4)*0.2*/!2}.scope;




{Saw.ar(MouseY.kr(0,41.2),-1,-0.4).range(-1,0).lincurve(-1,2,5,-3,MouseX.kr(-10,0))*0.2!2}.scope;

{LFPulse.kr(MouseY.kr(0.3,20.6),width:MouseX.kr(0.3,1) )*0.2!2}.scope;



Pbind(\instrument, \dispatch2X,\in,~toLimitFlo, \dur,Pseq([16/1],1),\tS, 0.39550810372374 ,).play(t)