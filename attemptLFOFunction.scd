


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
~isnew =1;
~recursion =0;
)



(~lfo= {
	arg amount,scale,speed,isNew;


	if((~speedMemo == speed) && (isNew != 1),

	{
"1!".postln;

		if( ~rise==True, {
			~amount = ~amount + ~amountMov;

			if(~amount >= scale,
		{~rise =False   ;"must drop1!".postln;
						~amount;
					},
				{~rise =True ;"to rise2!".postln;
						~amount;
				});


			}  ,{ ~amount =~amount - ~amountMov;
				//"1!".postln;
				amount.postln;
				if((~amount <= amount)&&(~rise==True),
		{~rise =True ;"to rise2!".postln;

						~amount;

					},
				{
						if(~amount < 0,{
							~rise=True;
							"to rise22!".postln;
							~amount = ~amount + ~amountMov;

						},{
						~rise =False ;"must drop2!".postln;

							//~amount = ~amount - ~amountMov;


							if(~recursion != 1,{
								~lfo.(amount:~amount,scale:scale,speed:speed,isNew:2);~recursion =1},{});
							~amount;

						})
				});


			});

	}
		,
	{


			if(	 isNew ==1,{
"new serie".postln;
		~amount = amount;
		~amountMov = scale/speed;
		~speedMemo = speed;


			if(~amount >= scale,
		{"must drop!".postln;
						~rise =False
						;
						~amount;
					},
				{~rise =True ;

						"to rise!".postln;
						~amount;
				});

		~lfo.(scale:scale,speed:speed,isNew:2);

			},{

"different speed".postln;
				~speedMemo = speed;
		~amountMov = scale/speed;

				~amount;


				if((~amount >= scale) ||( ~rise==False),
		{~rise =False; "to drop3!".postln;
						//~amount = ~amount - ~amountMov;
						//~lfo.(amount:~amount,scale:scale,speed:speed,isNew:2);
						~amount;
					},
				{~rise =True ;"to rise3!".postln;
						~amount;
						//~amount = ~amount + ~amountMov;
						//~lfo.(amount:~amount,scale:scale,speed:speed,isNew:2);
				});
	//   new prob	if(~recursion != 1,{
					~lfo.(amount:~amount,scale:scale,speed:speed,isNew:2);
			})
	});

})

~amountMov
~speedMemo
~rise
~amount;
~lfo.(100,5400,16,2)
~lfo.(100,6600,4,2)

 -1250<100

100<=(-237.500000).isNegative



s.boot;
s.quit








(
~rise = True;
~amount=0 ;
~speedMemo=0;
~amountMov=0;
~isnew =1;
~recursion =0;
~botAmount = 0;
~reverse =0;
)



(~lfo= {
	arg amount,scale,speed,isNew,reverse;



	if( (reverse == 1) && (~recursion==0),{
		~rise=False;
		~recursion=1;
		~botAmount= amount;
		~amount = scale;

		 /*if((~amount == amount) && (isNew ==1),{~amount = scale; ~botAmount= amount;
				~amount = ~amount - ~amountMov;
		})*/




	},{  ~rise=True; });





	if((~speedMemo == speed) && (isNew != 1)&& (amount == (~botAmount)),

	{
"1!".postln;

		if( ~rise==True, {
			~amount = ~amount + ~amountMov;

			if(~amount >= scale,
		{~rise =False   ;"must drop1!".postln;
						~amount;
					},
				{~rise =True ;"to rise2!".postln;
						~amount;
				});


			}  ,{
				//sneaky last one  IF SPEED CHANGE WITH HIGHER SCALE AT LAST STEP DOES NOT CONSIDER NEW SClale and drop
		//		if(~amount < scale,{~amount= ~amount + ~amountMov;~amount;},
				//	{

				~amount =~amount - ~amountMov;
				//"1!".postln;
				amount.postln;
				if((~amount <= amount)&&(~rise==True),
		{~rise =True ;"to rise2!".postln;

						~amount;

					},
				{
						if(~amount <= ~botAmount,{
							~rise=True;
							"to rise22!".postln;
							~amount = ~amount + ~amountMov;
							~recursion = 0;
				"recursio back to zero".postln;
							~amount = ~amount + ~amountMov;

						},{
						~rise =False ;"must drop2!".postln;

							//~amount = ~amount - ~amountMov;


						/*	if(~recursion != 1,{
								"recursion set to1".postln;~recursion =1;
								~lfo.(amount:~botAmount,scale:scale,speed:speed,isNew:2);},
							{"recursion alread at 1, nothing happening".postln;



								/*if(~amount >= scale,{ ~amount =~amount - ~amountMov},{
									~amount = ~amount - ~amountMov;});*/
							});*/
							~amount;

						})
				});


			})

			//});

	}
		,
	{


			if(	 isNew ==1,{


				~rise = True;
~amount=0 ;
~speedMemo=0;
~amountMov=0;
~isnew =1;
~recursion =0;
				~botAmount = 0;





"new serie".postln;

				~recursion=0;
		~amount = amount;
		~amountMov = scale/speed;
		~speedMemo = speed;
				~botAmount = amount;


			if(~amount >= scale,
		{"must drop!".postln;
						~rise =False
						;
						~amount;
					},
				{~rise =True ;

						"to rise!".postln;
						~amount;
				});

		//~lfo.(amount:~botAmount,scale:scale,speed:speed,isNew:2);
				~lfo.(amount:~botAmount,scale:scale,speed:speed,isNew:2);

			},{




				if(amount!= ~botAmount,{

					"new bott amount".postln;
~botAmount = amount ;
					~speedMemo = speed;
					~amountMov = scale/speed;

					if(~amount <= ~botAmount,{
					~rise =True;
					~lfo.(amount:amount,scale:scale,speed:speed,isNew:2);

				},
					{

							if((~amount >= scale) ||( ~rise==False),
		{~rise =False; "to drop3!".postln;
						//~amount = ~amount - ~amountMov;
						~lfo.(amount:~botAmount,scale:scale,speed:speed,isNew:2);
						~amount;
					},
				{~rise =True ;"to rise3!".postln;
						~amount;
						//~amount = ~amount + ~amountMov;
						~lfo.(amount:~botAmount,scale:scale,speed:speed,isNew:2);
				});





						//~rise==False;
						//~lfo.(amount:amount,scale:scale,speed:speed,isNew:2);
					})
				},{



"different speed".postln;
				~speedMemo = speed;
		~amountMov = scale/speed;

				~amount;


				if((~amount >= scale) ||( ~rise==False),
		{~rise =False; "to drop3!".postln;
						//~amount = ~amount - ~amountMov;
						~lfo.(amount:~botAmount,scale:scale,speed:speed,isNew:2);
						~amount;
					},
				{~rise =True ;"to rise3!".postln;
						~amount;
						//~amount = ~amount + ~amountMov;
						~lfo.(amount:~botAmount,scale:scale,speed:speed,isNew:2);
				});



				})

			//})



	//   new prob	if(~recursion != 1,{
				/*~recursion = 0;
				"recursio back to zero".postln;*/
				//	~lfo.(amount:~amount,scale:scale,speed:speed,isNew:2);
			})

	});

})

~botAmount
~recursion = 0;
~amountMov
~speedMemo
~rise
~amount;
~lfo.(100,5400,16,2,1)
~lfo.(100,6600,4,2,1)

~lfo.(400,3000,4,2)





















(
~rise = True;
~amount=0 ;
~speedMemo=0;
~amountMov=0;
~isnew =1;
~recursion =0;
~botAmount = 0
)



(~lfo= {
	arg amount,scale,speed,isNew;


	if((~speedMemo == speed) && (isNew != 1)&& (amount == (~botAmount)),

	{
//"1!".postln;

			if( (~rise==True) && (~amount<scale),

				{
			~amount = ~amount + ~amountMov;

			if(~amount >= scale,
		{~rise =False   ;//"must drop1!".postln;
						~amount;
					},
				{~rise =True ;//"to rise2!".postln;
						~amount;
				});


			}  ,{
				~amount =~amount - ~amountMov;
				//"1!".postln;
				//amount.postln;
				if((~amount <= amount)&&(~rise==True),
		{~rise =True ;//"to rise2!".postln;

						~amount;

					},
				{
						if(~amount < ~botAmount,{
							~rise=True;
							//"to rise22!".postln;
							~amount = ~amount + ~amountMov;
							~recursion = 0;
				//"recursio back to zero".postln;
							~amount = ~amount + ~amountMov;

						},{
						~rise =False ;//"must drop2!".postln;

							~amount;

						})
				});


			})

			//});

	}
		,
	{


			if(	 isNew ==1,{


				~rise = True;
~amount=0 ;
~speedMemo=0;
~amountMov=0;
~isnew =1;
~recursion =0;
				~botAmount = 0;


//"new serie".postln;
		~amount = amount;
		~amountMov = scale/speed;
		~speedMemo = speed;
				~botAmount = amount;


			if(~amount >= scale,
		{//"must drop!".postln;
						~rise =False
						;
						~amount;
					},
				{~rise =True ;

						//"to rise!".postln;
						~amount;
				});

		~lfo.(amount:~botAmount,scale:scale,speed:speed,isNew:2);

			},{




				if(amount!= ~botAmount,{

					//"new bott amount".postln;
~botAmount = amount ;
					~speedMemo = speed;
					~amountMov = scale/speed;

					if(~amount <= ~botAmount,{
					~rise =True;
					~lfo.(amount:amount,scale:scale,speed:speed,isNew:2);

				},
					{

							if((~amount >= scale) ||( ~rise==False),
		{~rise =False; //"to drop3!".postln;
						~lfo.(amount:~botAmount,scale:scale,speed:speed,isNew:2);
						~amount;
					},
				{~rise =True ;//"to rise3!".postln;
						~amount;

						~lfo.(amount:~botAmount,scale:scale,speed:speed,isNew:2);
				});

					})
				},{



//"different speed".postln;
				~speedMemo = speed;
		~amountMov = scale/speed;

				~amount;


				if((~amount >= scale) ||( ~rise==False),
		{~rise =False; //"to drop3!".postln;
						~lfo.(amount:~botAmount,scale:scale,speed:speed,isNew:2);
						~amount;
					},
				{~rise =True ;//"to rise3!".postln;
						~amount;
						~lfo.(amount:~botAmount,scale:scale,speed:speed,isNew:2);
				});



				})

			})

	});

})

~botAmount
~recursion = 0;
~amountMov
~speedMemo
~rise
~amount;
~lfo.(100,5400,16,2)
~lfo.(100,6600,4,2)

~lfo.(400,3000,4,2)

