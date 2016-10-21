$(".navSlideDown").css("display","none");
		$(".navBlock").hover(function(){
    		$(this).children(".navSlideDown").stop(true, false).slideDown();
		}, function(){
    	$(this).children(".navSlideDown").stop(true, false).slideUp();
		});