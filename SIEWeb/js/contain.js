window.onload = function(){
	var nC = document.getElementById("navContain");
	var nCl = nC.getElementsByTagName("li");

	for(var i = 0,len = nCl.length;i<len;i++){
		nCl[i].index = i;
		nCl[i].onclick = function(){
			for(var n= 0;n<len;n++){
				var nCu1 = nCl[n].getElementsByTagName("ul");
	            // if(nCu1.length!=0){
	            // 	nCu1[0].className = "hide";
	            // }
	            nCl[n].className = "";
	        }
			this.className = "on";
			// var nCu2 = nCl[this.index].getElementsByTagName("ul");
			// nCu2[0].className = "navSlide";
		}
	}
}