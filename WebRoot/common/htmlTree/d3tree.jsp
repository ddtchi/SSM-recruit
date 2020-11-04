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
  stroke: #ccc;
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
  stroke: #ccc;
  stroke-width: 1.5px;
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
							<label style="margin-left: 20px;">通话类型:</label>
							<label> 
								<select id="callType" name="callType" style="margin:0 10px 0 0; border-radius:5px;border:1px #999 solid; padding-left: 10px; width: 160px;">
									<option value="">--请选择--</option>
									<option value="1">呼出</option>
									<option value="2">接听</option>
								</select>
							</label>
							<br><br>
							<label>开始时间:</label><input onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'23:59:59',isShowClear:true,readOnly:true,minDate:'#F{$dp.$D(\'jssj\',{d:0})}',startDate:'%y-%m-%d 23:59:59'})" class="laydate-icon" type="text" name="startDate" id="kssj" style="margin:0 10px 0 10px; border-radius:5px;border:1px #999 solid; padding-left: 10px; width: 160px;" placeholder="开始时间"/>
							<label>结束时间:</label><input onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'23:59:59',isShowClear:true,readOnly:true,minDate:'#F{$dp.$D(\'kssj\',{d:0})}',startDate:'%y-%m-%d 23:59:59'})" class="laydate-icon" type="text" name="endDate" id="jssj" style="margin:0 10px 0 10px; border-radius:5px;border:1px #999 solid; padding-left: 10px; width: 160px;" placeholder="结束时间"/>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label>重点人员之间通话:</label><input id='epToep' name='epToep' type="checkbox" style="width: 20px">   &nbsp;&nbsp;
							<label>共同联系人(逆向展现):</label><input id="gtlxr" name="gtlxr"  type="checkbox" value="" style="width: 20px;padding-top: 10px;">
						
						</div>
						<input name="" type="button" class="navigation_dr" value="查询" onclick="getData();">
					</div>
					
					
					<div id="body">
    </div>
<script>

var width = 500,
height = 500;

function addExcelRecord(type,value){
	window.location="<%=path%>/callRecord/enterCallRecordImport";
}


	 function getData(){
		 var ename=$('#emphasesPersonName').val(),
			phone=$('#s_phoneNumber').val(),
			calltype=$('#callType').val(),
			stime=$('#kssj').val(),
			etime=$('#jssj').val(),
			con1= $("#epToep").is(':checked')?"epToep":"",
			con2= $("#gtlxr").is(':checked')?"gtlxr":"";
			var param='ename='+encodeURI(encodeURI(ename))+'&phone='+phone+'&callType='+calltype+'&stime='+stime+'&etime='+etime+'&con1='+con1+'&con2='+con2;
			d3.json("<%=path%>/callRecord/getCallRecordDataTree?"+param,
			 		function(error, flare) {
			   if (error) throw error;
			   root = flare;
			   if(root=='null' || root==null){
				   alert("无查询结果");
				   return;
			   }
			   root.x0 = height / 2;
			   root.y0 = 0;

			   function collapse(d) {
			     if (d.children) {
			       d._children = d.children;
			       d._children.forEach(collapse);
			       d.children = null;
			     }
			   }

			   root.children.forEach(collapse);
			   update(root);
			 });

			 d3.select(self.frameElement).style("height", "800px");
	 }

	 var margin = {top: 20, right: 120, bottom: 20, left: 120},
	     width = 960 - margin.right - margin.left,
	     height = 800 - margin.top - margin.bottom;

	 var i = 0,
	     duration = 750,
	     root;

	 var tree = d3.layout.tree()
	     .size([height, width]);

	 var diagonal = d3.svg.diagonal()
	     .projection(function(d) { return [d.y, d.x]; });

	 var svg = d3.select("body").append("svg")
	     .attr("width", width + margin.right + margin.left)
	     .attr("height", height + margin.top + margin.bottom)
	   .append("g")
	     .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

	 

	 function update(source) {

	   // Compute the new tree layout.
	   var nodes = tree.nodes(root).reverse(),
	       links = tree.links(nodes);

	   // 遍历填充
	   nodes.forEach(function(d) { d.y = d.depth * 180; });

	   // 更新节点
	   var node = svg.selectAll("g.node")
	       .data(nodes, function(d) { return d.id || (d.id = ++i); });
	   // 
	   var nodeEnter = node.enter().append("g")
	       .attr("class", "node")
	       .attr("transform", function(d) { return "translate(" + source.y0 + "," + source.x0 + ")"; })
	       .on("click", click);
	   nodeEnter.append("circle")
	       .attr("r", 1e-6)
	       .style("fill", function(d) { return d._children ? "lightsteelblue" : "#fff"; });

	   nodeEnter.append("text")
	       .attr("x", function(d) { return d.children || d._children ? -10 : 10; })
	       .attr("dy", ".35em")
	       .attr("text-anchor", function(d) { return d.children || d._children ? "end" : "start"; })
	       .text(function(d) { return d.name; })
	       .style("fill-opacity", 1e-6);

	   // 转换位置
	   var nodeUpdate = node.transition()
	       .duration(duration)
	       .attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")"; });

	   nodeUpdate.select("circle")
	       .attr("r", 4.5)
	       .style("fill", function(d) { return d._children ? "lightsteelblue" : "#fff"; });

	   nodeUpdate.select("text")
	       .style("fill-opacity", 1);

	   // Transition exiting nodes to the parent's new position.
	   var nodeExit = node.exit().transition()
	       .duration(duration)
	       .attr("transform", function(d) { return "translate(" + source.y + "," + source.x + ")"; })
	       .remove();

	   nodeExit.select("circle")
	       .attr("r", 1e-6);

	   nodeExit.select("text")
	       .style("fill-opacity", 1e-6);

	   // Update the links…
	   var link = svg.selectAll("path.link")
	       .data(links, function(d) { return d.target.id; });

	   // Enter any new links at the parent's previous position.
	   link.enter().insert("path", "g")
	       .attr("class", "link")
	       .attr("d", function(d) {
	         var o = {x: source.x0, y: source.y0};
	         return diagonal({source: o, target: o});
	       });

	   // Transition links to their new position.
	   link.transition()
	       .duration(duration)
	       .attr("d", diagonal);

	   // Transition exiting nodes to the parent's new position.
	   link.exit().transition()
	       .duration(duration)
	       .attr("d", function(d) {
	         var o = {x: source.x, y: source.y};
	         return diagonal({source: o, target: o});
	       })
	       .remove();

	   // Stash the old positions for transition.
	   nodes.forEach(function(d) {
	     d.x0 = d.x;
	     d.y0 = d.y;
	   });
	 }

	 // Toggle children on click.
	 function click(d) {
	   if (d.children) {
	     d._children = d.children;
	     d.children = null;
	     update(d);
	   } else {
		  if(d.isChild=='1'){
			  if(d.id!='' && d.id!=null && d.id!='null'){
		        	$.ajax({
		  	          url:"<%=path%>/callRecord/getCallRecordById",
		  	          type:"post",
		  	          dataType:"json",
		  	          data:{id:d.id},
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
			  }
			  
		  }else{
			  d.children = d._children;
			  d._children = null;
			  update(d);
		  }
	     
	   }
	  	
	   
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
