window.onload = function(){
		// $(".navSlideDown").css("display","none");
		$("ul.notice").css("display","none");
		$(".navBlock").hover(function(){
    		$(this).children(".navSlideDown").stop(true, false).slideDown();
		}, function(){
    	$(this).children(".navSlideDown").stop(true, false).slideUp();
		});

		$(".indexMainTittleLeft").click(function(){
			$(".indexMainTittleLeft").removeClass("mainThis");
			$(this).addClass("mainThis");
		})

		$(".indexMainTittleSecond").click(function(){
			$("ul.notice").css("display","block");
			$("ul.news").css("display","none");
		})
		$(".indexMainTittleFirst").click(function(){
			$("ul.notice").css("display","none");
			$("ul.news").css("display","block");
		})
	}
