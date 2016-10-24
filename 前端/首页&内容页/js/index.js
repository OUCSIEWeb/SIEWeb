window.onload = function(){
		$(".navSlideDown").css("display","none");
		$(".navBlock").hover(function(){
    		$(this).children(".navSlideDown").stop(true, false).slideDown();
		}, function(){
    	$(this).children(".navSlideDown").stop(true, false).slideUp();
		});

		$(".indexMainTittleLeft").click(function(){
			$(".indexMainTittleLeft").removeClass("mainThis");
			$(this).addClass("mainThis");
		})

		// $(".search>input").focus(function(){
		// 	$(this).placeholder('');
		// },$(".search>input").blur(function(){
		// 	$(this).placeholder('搜索');
		// }))
	}
