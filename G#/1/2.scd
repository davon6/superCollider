1+1

~ar=Array.new(maxSize: 100)
~ar= [1,2,3];
~cnt=1


~func={~ar.pop(1)};


~ar.add(3)
~ar.add(~cnt);

~ar.appen(~cnt);


~func={
~cnt=~cnt+1;~ar.add(~cnt);};

~func.();


~cnt2=t.beatDur*8


~val=(t.beatDur*8).rrand(t.beatDur*0.0625)
~cnt2=~cnt2-~val;

~cnt2.isNegative



