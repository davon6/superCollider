


~rise = True;
~coef;
(~lfo= {
	arg amount,scale,speed;

	var result;

	scale+ speed;


	if rise =True {
		~coef
		amount + (amount/16)
	}  ,{amount - (amount/16)}





	if   amount >= scale
	{rise =False      }







})



~lfo.(12,54,6)



~rise = True;
~amount = 100;
~speedMemo
~amountMov
(~lfo= {
	arg amount,scale,speed;

	var result,;

	if ~speedMemo == speed //|| speed == nil

	{

		if rise =True {
			~amount + ~amountMov
		}  ,{~amount - ~amountMov}





		if   amount >= scale
		{rise =False      }
		{rise =True     }

	}
	else
	{
		init everything
		~amount = amount;
		~amountMov = amount/(16 or speed)
		~speedMemo = speed

		~lfo(scale:scale,speed:speed)
	}

})

areaofEff = 5400 - 100 ==5300/speed so 16 is 331.25
each step 331.25 - or + till 5400 or 100  then bool off

~lfo.(12,5400,16)














~rise = True;
~amount=0 ;
~speedMemo=0;
~amountMov=0;
(~lfo= {
	arg amount=12,scale=5400,speed= 16;

	var result;

	if(~speedMemo == speed, //|| speed == nil

	{

		if ( ~rise==True, {
			~amount = ~amount + ~amountMov;

				~amount;
			}  ,{~amount - ~amountMov});





		if (amount >= scale,
		{~rise =False      },
				{~rise =True     });

	}
		,
	{
		~amount = amount;
		~amountMov = amount/speed;
		~speedMemo = speed;

		~lfo.(scale:scale,speed:speed);
	});

})

areaofEff = 5400 - 100 ==5300/speed so 16 is 331.25
each step 331.25 - or + till 5400 or 100  then bool off





(
~rise = True;
~amount=0 ;
~speedMemo=0;
~amountMov=0;
)


(~lfo= {
	arg amount,scale,speed;

	var result;

	if(~speedMemo == speed, //|| speed == nil

	{

		if( ~rise==True, {
			~amount = ~amount + ~amountMov;

			if(~amount >= scale,
		{~rise =False   ;
						~amount;
					},
				{~rise =True ;
						~amount;
				});


			}  ,{ ~amount =~amount - ~amountMov;
				if(~amount <= amount,
		{~rise =True ;
						~amount;
					},
				{~rise =False ;
						~amount;
				});


			});







	}
		,
	{
		~amount = amount;
		~amountMov = scale/speed;
		~speedMemo = speed;

		~lfo.(scale:scale,speed:speed);
	});

})

~lfo.(100,5400,16)
~lfo.(100,5400,4)














(
~rise = True;
~amount=0 ;
~speedMemo=0;
~amountMov=0;
~isnew = 0;
)



(~lfo= {
	arg amount,scale,speed,isNew;

	var result;

	if(~speedMemo == speed ||isNew == 2,

	{

		if( ~rise==True, {
			~amount = ~amount + ~amountMov;

			if(~amount >= scale,
		{~rise =False   ;
						~amount;
					},
				{~rise =True ;
						~amount;
				});


			}  ,{ ~amount =~amount - ~amountMov;
				//if((~amount).isNegative  ||  (amount) <= ~amount|| (amount) == nil,
				if(~amount <= amount,
		{~rise =True ;

						~amount;
					},
				{~rise =False ;
						~amount;
				});


			});







	}
		,
	{


			if(	isNew == nil || isNew ==1,{

		~amount = amount;
		~amountMov = scale/speed;
		~speedMemo = speed;


			if(~amount >= scale,
		{~rise =False   ;
						~amount;
					},
				{~rise =True ;
						~amount;
				});

		~lfo.(scale:scale,speed:speed,isNew:2);

			},{

		~amountMov = scale/speed;
		~speedMemo = speed;


			if(~amount >= scale,
		{~rise =False   ;
						~amount;
					},
				{~rise =True ;
						~amount;
				});


			})
	});

})

~lfo.(100,5400,16,2)
~lfo.(100,5400,4,2)

 -1250<100

100<=(-237.500000).isNegative