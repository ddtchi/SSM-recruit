<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

 <html>  
  <head>  
        <meta charset="utf-8">  
        <title>Tree</title>  
  </head> 

<style>

.node circle {
  fill: #fff;
  stroke: steelblue;
  stroke-width: 1.5px;
}

.node {
  font: 12px sans-serif;
}

.nodeCall circle {
  fill: red;
  stroke: steelblue;
  stroke-width: 1.5px;
}

.nodeCall {
  font: 14px sans-serif;
}

.link {
  fill: none;
  stroke: #fff;
  stroke-width: 1.5px;
}
.linkred {
  fill: none;
  stroke: red;
  stroke-width: 1.5px;
}

.node circle {
  cursor: pointer;
  fill: #fff;
  stroke: steelblue;
  stroke-width: 1.5px;
}

.node text {
  font-size: 11px;
}

path.link {
  fill: none;
  stroke: red;
  stroke-width: 1.5px;
}
.table td{
  text-align: center;
}
td .progress {
    margin-bottom: 0;
    width: 175px;
}
td .progress-text {
    position: absolute;
    width: 175px;
    text-align: center;
}
.tdwidth{width:175px;}
.progress {
    margin-bottom: 0;
    width: 175px;
}
.progress-text {
    position: absolute;
    width: 175px;
    text-align: center;
}
 #mytable {   
    padding: 0;
    margin: 0;   
    border-collapse:collapse;
}

td {
    border: 1px solid #C1DAD7;   
    background: #fff;
    font-size:11px;
    padding: 6px 6px 6px 12px;
    color: #4f6b72;
}

td.alt {
    background: #F5FAFA;
    color: #797268;
}


.buttons a, .buttons button{
    display:block;
    float:left;
    margin:0 7px 0 0;
    background-color:#f5f5f5;
    border:1px solid #dedede;
    border-top:1px solid #eee;
    border-left:1px solid #eee;

    font-family:"Lucida Grande", Tahoma, Arial, Verdana, sans-serif;
    font-size:12px;
    line-height:130%;
    text-decoration:none;
    font-weight:bold;
    color:#565656;
    cursor:pointer;
    padding:5px 10px 6px 7px; /* Links */
}
.buttons button{
    width:auto;
    overflow:visible;
    padding:4px 10px 3px 7px; /* IE6 */
}
.buttons button[type]{
    padding:5px 10px 5px 7px; /* Firefox */
    line-height:17px; /* Safari */
}
*:first-child+html button[type]{
    padding:4px 10px 3px 7px; /* IE7 */
}
.buttons button img, .buttons a img{
    margin:0 3px -3px 0 !important;
    padding:0;
    border:none;
    width:16px;
    height:16px;
}

/* STANDARD */

button:hover, .buttons a:hover{
    background-color:#dff4ff;
    border:1px solid #c2e1ef;
    color:#336699;
}
.buttons a:active{
    background-color:#6299c5;
    border:1px solid #6299c5;
    color:#fff;
}

/* POSITIVE */

button.positive, .buttons a.positive{
    color:#529214;
}
.buttons a.positive:hover, button.positive:hover{
    background-color:#E6EFC2;
    border:1px solid #C6D880;
    color:#529214;
}
.buttons a.positive:active{
    background-color:#529214;
    border:1px solid #529214;
    color:#fff;
}

/* NEGATIVE */

.buttons a.negative, button.negative{
    color:#d12f19;
}
.buttons a.negative:hover, button.negative:hover{
    background:#fbe3e4;
    border:1px solid #fbc2c4;
    color:#d12f19;
}
.buttons a.negative:active{
    background-color:#d12f19;
    border:1px solid #d12f19;
    color:#fff;
}

/* REGULAR */

button.regular, .buttons a.regular{
    color:#336699;
}
.buttons a.regular:hover, button.regular:hover{
    background-color:#dff4ff;
    border:1px solid #c2e1ef;
    color:#336699;
}
.buttons a.regular:active{
    background-color:#6299c5;
    border:1px solid #6299c5;
    color:#fff;
}

</style>
<link rel="stylesheet" href="<%=path%>/common/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=path%>/common/css/simplemodal-dialogtable.css" type="text/css" />
<script type="text/javascript" src="<%=path%>/common/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="<%=path%>/common/js/common.js?v=0.0.2"></script>
<script type="text/javascript" src="<%=path%>/common/js/jquery.simplemodal.js"></script>
<script src="<%=path%>/common/js/js.js"></script>

<link type="text/css" rel="stylesheet" href="<%=path%>/common/css/colorbox.css" />
<link type="text/css" rel="stylesheet" href="<%=path%>/common/css/jquery-ui-1.10.2.custom.css" />
<script type="text/javascript" src="<%=path%>/common/js/jquery-ui-1.10.2.custom.js"></script>
<script type="text/javascript" src="<%=path%>/common/js/jquery.colorbox.js"></script>
 <link rel="stylesheet" href="<%=path%>/common/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=path%>/common/css/simplemodal-dialogtable.css" type="text/css" />
<link type="text/css" rel="stylesheet" href="<%=path%>/common/css/colorbox.css" />
<link type="text/css" rel="stylesheet" href="<%=path%>/common/css/jquery-ui-1.10.2.custom.css" />
<script src="<%=path%>/common/datepicker/WdatePicker.js" defer="defer"></script>


<body style="overflow-y: auto;">
<script src="<%=path%>/common/htmlTree/d3.js"></script>
 <div class="right_navigation" style="  margin-bottom:10px; border-bottom: 1px #999 solid;">
					<div class="navigation_test">智能研判 >> 话单分析</div>
					<input name="" type="button" class="navigation_dr" value="导入话单" onclick="addExcelRecord(this,0);">
				</div>
				<div class="right_navigation">
						<div class="navigation_test">
							<label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</label><input type="text" name="emphasesPersonName" id="emphasesPersonName" style="margin:0 10px 0 10px; border-radius:5px;border:1px #999 solid; padding-left: 10px; width: 160px;" placeholder="重点人员姓名"/>
							<label>通话号码:</label><input type="text" name="phoneNumber" id="s_phoneNumber" style="margin:0 10px 0 10px; border-radius:5px;border:1px #999 solid; padding-left: 10px; width: 160px;" placeholder="联系方式"/>
							<label>通话次数:</label><input type="text" name="tgcs" id="tgcs" style="margin:0 10px 0 10px; border-radius:5px;border:1px #999 solid; padding-left: 10px; width: 160px;" placeholder=""/>
							<br><br>
							<label>开始时间:</label><input onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'23:59:59',isShowClear:true,readOnly:true,minDate:'#F{$dp.$D(\'jssj\',{d:0})}',startDate:'%y-%m-%d 23:59:59'})" class="laydate-icon" type="text" name="startDate" id="kssj" style="margin:0 10px 0 10px; border-radius:5px;border:1px #999 solid; padding-left: 10px; width: 160px;" placeholder="开始时间"/>
							<label>结束时间:</label><input onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'23:59:59',isShowClear:true,readOnly:true,minDate:'#F{$dp.$D(\'kssj\',{d:0})}',startDate:'%y-%m-%d 23:59:59'})" class="laydate-icon" type="text" name="endDate" id="jssj" style="margin:0 10px 0 10px; border-radius:5px;border:1px #999 solid; padding-left: 10px; width: 160px;" placeholder="结束时间"/>
							&nbsp;&nbsp;&nbsp;
						</div>
						<input name="" type="button" class="navigation_dr" value="查询" onclick="getData();">
					</div>
					<div>
						<div id="svg_div" style="float: left;overflow-y: auto; overflow-x:auto;width:65%  border:1px solid red">
						
						</div> 
						 <div id="info_div"  style=" width:34%;height:300px; float: left; display: none;">
							<div id="a_info_div" style="text-align: center;">
								 <button type="button" class="positive" name="save" onclick="getChart()">
							        <img src="<%=path%>/common/images/apply2.png" alt=""/> 
							        	绘制关系图
							    </button>
							</div>
							<div id="result_content" style="OVERFLOW-Y: auto; OVERFLOW-X:auto; width:100%;">
							</div> 
						</div> 
					</div>
					<div id="simpleModal" style="display: none;">
		<img id="closeImage" alt="" src="<%=path%>/common/images/close.png" style="position: absolute;right: 0px;top: 0px;cursor: pointer;">
		<div class="details-header" style=" background: #3f8cf4; text-align: center; font-size: 16px; color: #fff;">话单详情</div>
		<form id="luruform">
		<table width="800"  border="0" cellspacing="0px;" style=" background: #fff;">
		  <tr>
		  	<td class="label">本机号码：</td>
		    <td class="txt">
		    	<input name="phoneNumber" id="phoneNumber" type="text">
		    </td>
		    <td class="label">重点人员： </td>
		    <td class="txt">
				<input name="emphasesPersonIdStr" id="emphasesPersonIdStr" type="text">
		    </td>
		  </tr>
		  <tr>
		    <td class="label">对方号码：</td>
		    <td class="txt">
		    	<input name="callNumber" id="callNumber" type="text">
		    </td>
		    <td class="label">通话类型：</td>
		    <td class="txt">
		    	<input name="callTypeName" id="callTypeName" type="text">
		    </td>
		  </tr>
		  <tr>
		    <td class="label">对方归属地：</td>
		    <td class="txt">
		    	<input name="towardsCountyName" id="towardsCountyName" type="text">
		    </td>
		    <td class="label">通话时长：</td>
		    <td class="txt">
		    	<input name="callPart" id="callPart" type="text">
		    </td>
		  </tr>
		  <tr>
		    <td class="label">开始时间：</td>
		    <td class="txt">
		    	<input name="callStartDate" id="callStartDate" type="text">
		    </td>
		    <td class="label">结束时间：</td>
		    <td class="txt">
		    	<input name="callEndDate" id="callEndDate" type="text">
		    </td>
		  </tr>
		  <tr>
		    <td class="label">开始经纬度：</td>
		    <td class="txt">
		    	<input name="initLon" id="initLon" type="text">
		    </td>
		    <td class="label">结束经纬度：</td>
		    <td class="txt">
		    	<input name="endLon" id="endLon" type="text">
		    </td>
		  </tr>
		   <tr>
		    <td class="label">创建民警：</td>
		    <td class="txt">
		    	<input name="userInfoIdStr" id="userInfoIdStr" type="text">
		    </td>
		    <td class="label">创建时间：</td>
		    <td class="txt">
		    	<input name="createDateStr" id="createDateStr" type="text">
		    </td>
		  </tr>
		  
		  
		</table>
		</form>
		<div class="details-footer">
			<input class="simplemodal-close" value="关闭" type="button" style="width: 60px;">
		</div>
	</div>
<script>

var width = 500,
height = 500;

function addExcelRecord(type,value){
	window.location="<%=path%>/callRecord/enterCallRecordImport";
}

var w = document.body.clientWidth*0.64;
var body_h=document.body.clientHeight;
document.getElementById("info_div").style.height=body_h*0.8;
document.getElementById("result_content").style.height=body_h*0.8-20;

var h = 600;
var nodes = [];
var edges = [];
	 function getData(){
		 var ename=$('#emphasesPersonName').val(),
			phone=$('#s_phoneNumber').val(),
			stime=$('#kssj').val(),
			etime=$('#jssj').val(),
			count= $('#tgcs').val();
			var param='ename='+encodeURI(encodeURI(ename))+'&phone='+phone+'&stime='+stime+'&etime='+etime+'&count='+count;
			d3.json("<%=path%>/callRecord/getCallRecordCountData?"+param,
			 		function(error, flare) {
				document.getElementById("result_content").innerHTML="";
			   if (error) throw error;
			   root = flare;
			   if(root=='null' || root==null){
				   alert("无查询结果");
				   $("#info_div").hide();
				   return;
			   }
			   $("#info_div").show();
			   if(root!=null && root.length>0){
				   var str="<table  id='mytable' border='1' width='100%'>"+
				   "<tr><th width='15%'><input style='width:20px;' type='checkbox' name='ischeckall' onclick='ischeckall(this)'/>全选</th>"+
				   "<th>重点人员号码</th><th>呼出号码</th><th>次数</th></tr>";
				   for(var i=0;i<root.length;i++){
					   if(root[i].phoneNumber==null || root[i].callNumber==null)break;
					   str+="<tr>";
					   str+="<td width='15%' align='center'><input style='width:20px;' type='checkbox' id="+i+" style='' value='"+root[i].phoneNumber+','+root[i].callNumber+"' name='tablecheckbox'/></td>";
					   str+="<td width='35%'>"+root[i].phoneNumber+"</td><td width='35%'>"+root[i].callNumber+"</td><td>"+root[i].callType+"</td>"
					   str+="</tr>";
				   }
				   str+="</table>";
			   }
			   
			   document.getElementById("result_content").innerHTML=str;
			 	/* nodes=root[0].node;
			 	edges=root[0].link;
			 	setDot();  */
			 });
	 }
	 function getChart(){
		 var ename=$('#emphasesPersonName').val(),
			phone=$('#s_phoneNumber').val(),
			stime=$('#kssj').val(),
			etime=$('#jssj').val(),
			count= $('#tgcs').val();
		 var tel='';
		 var c=document.getElementsByName("tablecheckbox");
			if(c.length>0){
				for(var i=0;i<c.length;i++){
					if(c[i].checked){
						tel+=c[i].value+'@';
					}
				}
			}
			tel=tel.substring(0,tel.length-1);
			if(tel==''){
				alert("请选择联系人");
				return;
			}
			var param='ename='+encodeURI(encodeURI(ename))+'&phone='+phone+'&stime='+stime+'&etime='+etime+'&tel='+tel;
			d3.json("<%=path%>/callRecord/getCallRecordDataDot?"+param,
			 		function(error, flare) {
			   if (error) throw error;
			   root = flare;
			   if(root=='null' || root==null){
				   alert("无查询结果");
				   return;
			   }
			 	nodes=root[0].node;
			 	edges=root[0].link;
			 	setDot();  
			 });
	 }
	 function ischeckall(obj){
			if(obj.checked){   //如果全选复选框选中
				var c=document.getElementsByName("tablecheckbox");
				if(c.length>0){
					for(var i=0;i<c.length;i++){
						c[i].checked=true;
					}
				}
			}else{
				var c=document.getElementsByName("tablecheckbox");
				if(c.length>0){
					for(var i=0;i<c.length;i++){
						c[i].checked=false;
					}
				}
			}
		}
	   var svg = d3.select("#svg_div")
	   	                 .append("svg")
	   	                 .attr("width", w)
	   	                 .attr("height", h);
	    function setDot(){
	    	//下面开始画图
	   	    var color = d3.scale.category20();
			if(document.querySelector('svg')!=null){
				document.querySelector('svg').innerHTML = '';					
			}
	   	     var force2 = d3.layout.force()
	   	                    .nodes(nodes)
	   	                    .links(edges)
	   	                    .size([w, h])
	   	                    .linkDistance([130])
	   	                    .charge([-2000])
	   	                    .gravity(0.15);
	   	     force2.start();
	   	     var stroke_color = "black";
	   	     var stroke_width = "0.5";
	   	     var touch_stroke_color = "#9F5FBF";//紫色
	   	     var touch_stroke_width = "1";
	   	     var switch_color = "#FF3420"//红
	   	     var vswitch_color = "#7FFF00";//绿
	   	     var vm_color = "#1E90FF";//蓝
	   	     var edges2 = svg.selectAll(".line")
	   	                     .data(edges)
	   	                     .enter()
	   	                     .append("line")
	   	                     .style("stroke", "#fff")
	   	                     .style("stroke-width", 2)
	   	                     .call(force2.drag);
	   	     //link
	   	     var link2 = svg.selectAll(".link");
	   	     link2 = link2.data(edges);
	   	    //加次数
	   	     var linkEnter2 = link2.enter()
	   	                           .append("g")
	   	                           .attr("class","link")
	   	                           .call(force2.drag);
	   	     linkEnter2.append("text")
	   	               .attr("dy", ".35em")
	   	 				.style("color","red")
	   	               .text(function(d){ return d.des; }).on("click", function(d){
	   		 				
	   		 
			   		$.ajax({
			  	          url:"<%=path%>/callRecord/getCallRecordById",
			  	          type:"post",
			  	          dataType:"json",
			  	          data:{id:d.callid},
			  	          success:function(data, textStatus, jqXHR){
			  	        	  
			  	          		$.each(data,function(i,v){
			  	          			if(i=='createDate'){
			  	          				v=new Date(v).toString();
			  	          			}
			  	          			$("#"+i).val(v);
			  	          		});
				  	          	$("#simpleModal").modal({
				  		  			close:true,
				  		  			opacity:80,
				  		  			closeHTML:"#closeImage",
				  		  			autoResize:true,
				  		  			maxHeight:600,
				  		  			minHeight:300
				  		  		});	
			  	          },
			  	          error:function(){
			  	           	 	alert("查询异常信息!");
			  	          }
			  	   });
	   		});
	   	     //node
	   	     var node2 = svg.selectAll("node");
	   	     node2 = node2.data(nodes);
	   	     var nodeEnter2 = node2.enter()
	   	                           .append("g")
	   	                           .attr("class", "node")
	   	                           .call(force2.drag);
	   	     nodeEnter2.append("circle")
	   	               .attr("r", function(d)
	   	                          {
	   	                            if(d.type == "circle") return 10;
	   	                            else return 0;
	   	                          })
	   	               .style("fill", function(d, i)
	   	                              {
	   	                                if(d.type == "circle")
	   	                                {
	   	                                  if(d.switch_type == "1") return switch_color; else if(d.switch_type == "2") return vswitch_color;}
	   	                                  else if(d.type == "rect"){return vm_color;}   
	   	                              })
	   	               /* .on("mouseover", function(x,i)  //鼠标移动到一个节点上时，将其及与其邻接的节点突出显示
	   	                                {
	   	                                  node2.style("stroke",function(d) { if(d.index == x.index)return touch_stroke_color; })
	   	                                       .style("stroke-width", function(d) { if(d.index == x.index)return touch_stroke_width; });
	   	                                    
	   	                                  link2.style("stroke", function(d) { if(d.source.index == x.index || d.target.index == x.index) return touch_stroke_color; })
	   	                                       .style("stroke-width", function(d) { if(d.source.index == x.index || d.target.index == x.index) return touch_stroke_width; });
	   	  
	   	                                  svg.selectAll("text")
	   	                                     .style("fill",function(d) { if(d.index == x.index) return touch_stroke_color; })
	   	                                     .style("fill",function(d) { if(d.source.index == x.index || d.target.index == x.index) return touch_stroke_color; });
	   	                                })
	   	               .on("mouseout", function()  //鼠标离开时还原
	   	                               {
	   	                                 node2.style("stroke-width","0");
	   	                                 node2.style("stroke", stroke_color);
	   	                                 link2.style("stroke", stroke_color);
	   	                                 link2.style("stroke-width","0");
	   	                                 svg.selectAll("text").style("fill","black");
	   	                               }) */;
	   	      
	   	     nodeEnter2.append("rect")
	   	               .attr("width",function(d)
	   	                         {
	   	                  if(d.type == "rect") return 20;
	   	                  else return 0;
	   	                             })
	   	               .attr("height",function(d)
	   	                              {
	   	                                if(d.type == "rect") return 20;
	   	                                else return 0;
	   	                              })
	   	                .style("fill", function(d, i)
	   	                           {
	   	                                 if(d.type == "circle")
	   	                                 {
	   	                                   if(d.switch_type == "1") return switch_color;
	   	                                   else if(d.switch_type == "2") return vswitch_color;
	   	                                 }
	   	                                 else if(d.type == "rect")
	   	                                 {
	   	                                   return vm_color;
	   	                                 }      
	   	                               })
	   	               .on("mouseover", function(x,i)  //鼠标移动到一个节点上时，将其及与其邻接的节点突出显示
	   	                                {
	   	                                  node2.style("stroke",function(d) { if(d.index == x.index)return touch_stroke_color; })
	   	                                       .style("stroke-width", function(d) { if(d.index == x.index)return touch_stroke_width; });
	   	                                    
	   	                                  link2.style("stroke", function(d) { if(d.source.index == x.index || d.target.index == x.index) return touch_stroke_color; })
	   	                                       .style("stroke-width", function(d) { if(d.source.index == x.index || d.target.index == x.index) return touch_stroke_width; });
	   	  
	   	                                  svg.selectAll("text")
	   	                                     .style("fill",function(d) { if(d.index == x.index) return touch_stroke_color; })
	   	                                     .style("fill",function(d) { if(d.source.index == x.index || d.target.index == x.index) return touch_stroke_color; });
	   	                                })
	   	               .on("mouseout", function()  //鼠标离开时还原
	   	                               {
	   	                                 node2.style("stroke-width","0");
	   	                                 node2.style("stroke", stroke_color);
	   	                                 link2.style("stroke", stroke_color);
	   	                                 link2.style("stroke-width","0");
	   	                                 svg.selectAll("text").style("fill","black");
	   	                               });
	   	     nodeEnter2.append("text")
	   	       .attr("dy", ".35em")
	   	       .text(function(d) { return d.name; })
	   	       .on("mouseover", function(x,i)  //鼠标移动到一个节点上时，将其及与其邻接的节点突出显示
	   	                                {
	   	                                  node2.style("stroke",function(d) { if(d.index == x.index)return touch_stroke_color; })
	   	                                       .style("stroke-width", function(d) { if(d.index == x.index)return touch_stroke_width; });
	   	                                    
	   	                                  link2.style("stroke", function(d) { if(d.source.index == x.index || d.target.index == x.index) return touch_stroke_color; })
	   	                                       .style("stroke-width", function(d) { if(d.source.index == x.index || d.target.index == x.index) return touch_stroke_width; });
	   	  
	   	                                  svg.selectAll("text")
	   	                                     .style("fill",function(d) { if(d.index == x.index) return touch_stroke_color; })
	   	                                     .style("fill",function(d) { if(d.source.index == x.index || d.target.index == x.index) return touch_stroke_color; });
	   	                                })
	   	               .on("mouseout", function()  //鼠标离开时还原
	   	                               {
	   	                                 node2.style("stroke-width","0");
	   	                                 node2.style("stroke", stroke_color);
	   	                                 link2.style("stroke", stroke_color);
	   	                                 link2.style("stroke-width","0");
	   	                                 svg.selectAll("text").style("fill","black");
	   	                               });
	   	  
	   	     force2.on("tick", function()
	   	                       {
	   	                         edges2.attr("x1", function(d) { return d.source.x; })
	   	                               .attr("y1", function(d) { return d.source.y; })
	   	                               .attr("x2", function(d) { return d.target.x; })
	   	                               .attr("y2", function(d) { return d.target.y; });
	   	                         link2.attr("transform", function(d) { return "translate(" + (d.source.x+d.target.x)/2 + "," + (d.source.y+d.target.y)/2 + ")"; });
	   	                         node2.attr("transform", function(d)
	   	                                                 {
	   	                                                   if(d.type == "circle") return "translate(" + d.x + "," + d.y + ")";
	   	                                                   else
	   	                                                   {
	   	                                                     var dx = parseFloat(d.x) - 10;
	   	                                                     var dy = parseFloat(d.y) - 10;
	   	                                                     return "translate(" + dx + "," + dy + ")";
	   	                                                   }
	   	                                                 });
	   	                       }); 
	    }
	 function click(){
		 alert()
	 }
</script>
		
		<div id="simpleModal" style="display: none;">
		<img id="closeImage" alt="" src="<%=path%>/common/images/close.png" style="position: absolute;right: 0px;top: 0px;cursor: pointer;">
		<div class="details-header" style=" background: #3f8cf4; text-align: center; font-size: 16px; color: #fff;">话单详情</div>
		<form id="luruform">
		<table width="800"  border="0" cellspacing="0px;" style=" background: #fff;">
		  <tr>
		  	<td class="label">本机号码：</td>
		    <td class="txt">
		    	<input name="phoneNumber" id="phoneNumber" type="text">
		    </td>
		    <td class="label">重点人员： </td>
		    <td class="txt">
				<input name="emphasesPersonIdStr" id="emphasesPersonIdStr" type="text">
		    </td>
		  </tr>
		  <tr>
		    <td class="label">对方号码：</td>
		    <td class="txt">
		    	<input name="callNumber" id="callNumber" type="text">
		    </td>
		    <td class="label">通话类型：</td>
		    <td class="txt">
		    	<input name="callTypeName" id="callTypeName" type="text">
		    </td>
		  </tr>
		  <tr>
		    <td class="label">对方归属地：</td>
		    <td class="txt">
		    	<input name="towardsCountyName" id="towardsCountyName" type="text">
		    </td>
		    <td class="label">通话时长：</td>
		    <td class="txt">
		    	<input name="callPart" id="callPart" type="text">
		    </td>
		  </tr>
		  <tr>
		    <td class="label">开始时间：</td>
		    <td class="txt">
		    	<input name="callStartDate" id="callStartDate" type="text">
		    </td>
		    <td class="label">结束时间：</td>
		    <td class="txt">
		    	<input name="callEndDate" id="callEndDate" type="text">
		    </td>
		  </tr>
		  <tr>
		    <td class="label">开始经纬度：</td>
		    <td class="txt">
		    	<input name="initLon" id="initLon" type="text">
		    </td>
		    <td class="label">结束经纬度：</td>
		    <td class="txt">
		    	<input name="endLon" id="endLon" type="text">
		    </td>
		  </tr>
		   <tr>
		    <td class="label">创建民警：</td>
		    <td class="txt">
		    	<input name="userInfoIdStr" id="userInfoIdStr" type="text">
		    </td>
		    <td class="label">创建时间：</td>
		    <td class="txt">
		    	<input name="createDateStr" id="createDateStr" type="text">
		    </td>
		  </tr>
		  
		  
		</table>
		</form>
		<div class="details-footer">
			<input class="simplemodal-close" value="关闭" type="button" style="width: 60px;">
		</div>
	</div>
		
	<div id="treebody" stylr="border:2px solid red">
	</div>
		
		
    </body>  
</html>
