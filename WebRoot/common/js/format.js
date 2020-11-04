 function isMobile(obj){
	 if(obj==""){
		var back =document.getElementById("check2");
    	back.removeAttribute("class");
		 renturn;
	 }
     if(/^((\d{3}-\d{8}|\d{4}-\d{7,8})|(1[3|5|7|8q][0-9]{9}))$/.test(obj))
     {
    	var back =document.getElementById("check2");
    	back.removeAttribute("class");
    }else{
    	var back =document.getElementById("check2");
    	back.setAttribute("class","bk1");
    	//alert("请输入电话号码的正确格式,如是固话请加区号");
    	swal("请输入电话号码的正确格式,如是固话请加区号");
    	
    }
}
   
function checkIdCard(obj){
	 if(obj==""){
		 var back =document.getElementById("check1");
    	back.removeAttribute("class");
		 renturn;
	 }
    if(/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/.test(obj)){   
    	var back =document.getElementById("check1");
    	back.removeAttribute("class");
    }else{
    	var back =document.getElementById("check1");
    	back.setAttribute("class","bk1");
    	swal("请输入身份证的正确格式，位数只能为15位或18位");
    }
}
function checkData(obj){
	 if(obj==""){
		  var back =document.getElementById("check3");
    	back.removeAttribute("class");
		 renturn;
	 }
	if(/^[0-9]*$/.test(obj)){ 
		 var back =document.getElementById("check3");
    	back.removeAttribute("class");
        
    } else{
    	var back =document.getElementById("check3");
    	back.setAttribute("class","bk1");
    	swal("请在QQ中输入数字!");
    }
}
function checkIdCard1(obj){
	 if(obj==""){
		 var back =document.getElementById("check1");
    	back.removeAttribute("class");
		 renturn;
	 }
	var tmpStr = "";
	var idDate = "";
	var tmpInt = 0;
	var strReturn = "";
	
    if(/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/.test(obj)){
    	var back =document.getElementById("check1");
    	back.removeAttribute("class");
       
    	if (obj.length == 15) {
			tmpStr = obj.substring(6, 12);
			tmpStr = "19" + tmpStr;
			tmpStr = tmpStr.substring(0, 4) + "-" + tmpStr.substring(4, 6) + "-" + tmpStr.substring(6)
			
			var  a =document.getElementById("detail_birthday");
			a.value=tmpStr;
			
		}else {
			tmpStr = obj.substring(6, 14);
			tmpStr = tmpStr.substring(0, 4) + "-" + tmpStr.substring(4, 6) + "-" + tmpStr.substring(6)
			
			var  a =document.getElementById("detail_birthday");
			a.value=tmpStr;
			
			}
    }else{
    	var back =document.getElementById("check1");
    	back.setAttribute("class","bk1");
    	swal("请输入身份证的正确格式，位数只能为15位或18位");
    }
   
}
function checkIdCard2(obj){
	 if(obj==""){
		 var back =document.getElementById("cardid");
    	back.style.display="none";
		 renturn;
	 }
    if(/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/.test(obj)){   
    	 var back =document.getElementById("cardid");
    	back.style.display="none";
    }else{
    	 var back =document.getElementById("cardid");
    	back.style.display="block";
    }
}
function checkIdCard3(obj){
	 if(obj==""){
		  var back =document.getElementById("cardid");
    	back.style.display="none";
		 renturn;
	 }
	var tmpStr = "";
	var idDate = "";
	var tmpInt = 0;
	var strReturn = "";
	
    if(/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/.test(obj)){
    	 var back =document.getElementById("cardid");
    	back.style.display="none";
    	
       
    	if (obj.length == 15) {
			tmpStr = obj.substring(6, 12);
			tmpStr = "19" + tmpStr;
			tmpStr = tmpStr.substring(0, 4) + "-" + tmpStr.substring(4, 6) + "-" + tmpStr.substring(6)
			
			var  a =document.getElementById("detail_birthday");
			a.value=tmpStr;
			
		}else {
			tmpStr = obj.substring(6, 14);
			tmpStr = tmpStr.substring(0, 4) + "-" + tmpStr.substring(4, 6) + "-" + tmpStr.substring(6)
			
			var  a =document.getElementById("detail_birthday");
			a.value=tmpStr;
			
			}
    }else{
    	 var back =document.getElementById("cardid");
    	back.style.display="block";
    }
   
}

 function isMobile1(obj){
	 if(obj==""){
		var back =document.getElementById("cardphone");
    	back.style.display="none";
		 renturn;
	 }
     if(/^((\d{3}-\d{8}|\d{4}-\d{7,8})|(1[3|5|7|8q][0-9]{9}))$/.test(obj))
     {
    	var back =document.getElementById("cardphone");
    	back.style.display="none";
    }else{
    	var back =document.getElementById("cardphone");
    	back.style.display="block";
    	
    }
}

function checkData1(obj){
	 if(obj==""){
		var back =document.getElementById("cardQQ");
    	back.style.display="none";
		 renturn;
	 }
	if(/^[0-9]*$/.test(obj)){ 
		var back =document.getElementById("cardQQ");
    	back.style.display="none";
        
    } else{
    	var back =document.getElementById("cardQQ");
    	back.style.display="block";
    }
}

function checkIdCard4(obj){
	
	 if(obj==""){
		 var back =document.getElementById("cardid");
    	back.innerHTML="*身份证格式为15位或18位号码";
		 renturn;
	 }
    if(/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/.test(obj)){   
    	 var back =document.getElementById("cardid");
    	back.innerHTML="*身份证格式为15位或18位号码";
    }else{
    	 var back =document.getElementById("cardid");
    	back.innerHTML="*身份证格式输入有误，请核实后再填写（15位或18位号码）";
    }
}

 function isMobile2(obj){
	 if(obj==""){
		var back =document.getElementById("cardphone");
    	back.innerHTML="*电话号码为移动格式或加区号的固话号码";
		 renturn;
	 }
     if(/^((\d{3}-\d{8}|\d{4}-\d{7,8})|(1[3|5|7|8q][0-9]{9}))$/.test(obj))
     {
    	var back =document.getElementById("cardphone");
    	back.innerHTML="*电话号码为移动格式或加区号的固话号码";
    }else{
    	var back =document.getElementById("cardphone");
    	back.innerHTML="*电话号码输入有误，请核实后再填写（移动号码或加区号的固话号）";
    	
    }
}









