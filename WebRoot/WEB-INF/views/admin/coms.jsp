<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%    
String path = request.getContextPath();
%>    
<!doctype html>
  <head> 
    <title>My JSP 'emps.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="<%=path%>/common/js/jquery-1.9.1.js"></script>
<script src="<%=path%>/js/formValidator-4.0.1.js" type="text/javascript" charset="UTF-8"></script>
<script src="<%=path%>/js/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
<script type="text/javascript" src="<%=path%>/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/easyui/locale/easyui-lang-zh_CN.js" ></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/easyui/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/easyui/themes/icon.css">
		<script type="text/javascript">
var $obj;  
$(function() {  
    $obj = $("#tt");  
    $obj.datagrid({  
        loadMsg : '数据加载中请稍后……',  
        url : '<%=path%>/admin/findComList',  
        //url : root + 'js/app/sysManagement/sysConfig.json',  
        fitColumns : true,  
        autoRowHeight : true,  
        pagination : true,  
        pagePosition : 'bottom',  
        pageSize : 10,  
        toolbar: '#tb',  
        pageList : [ 10, 20, 30 ],  
        border : false,  
        singleSelect:true,  
        idField:'comId',
        				iconCls: 'icon-edit',
				pagination:true,
			collapsible:true,
			rownumbers:true,
			remoteSort : false,
                striped: true, //行背景交换
                nowap: true, //列内容多时自动折至第二行
                border: false,  
        columns : [ [ {  
                field : 'comId',  
                title : 'comId',  
                hidden : true  
              
            },{  
                field : 'username',  
                title : "用户名称",  
                width : 200,  
                editor : 'text',  
                sortable : true  
            }, {  
                field : 'pwd',  
                title : "密码",  
                editor : 'text',  
                width : 200,  
                sortable : true  
            }, {  
                field : 'fullname',  
                title : "公司名称",  
                editor : 'text',  
                width : 200,  
                sortable : true  
            }, {  
                field : 'comtype',  
                title : "公司类型",  
                editor : 'text',  
                width : 200,  
                sortable : true  
            }, 
             {  
                field : 'description',  
                title : "公司介绍",  
                editor : 'text',  
                width : 200,  
                sortable : true  
            }, {  
                field : 'empcount',  
                title : "人数",  
                editor : 'text',  
                width : 200,  
                sortable : true  
            },
               {  
                field : 'address',  
                title : "地址",  
                editor : 'text',  
                width : 200,  
                sortable : true  
            },{  
                field : 'tel',  
                title : "电话",  
                editor : 'text',  
                width : 200,  
                sortable : true  
            }, {  
                field : 'email',  
                title : "邮箱",  
                editor : 'text',  
                width : 200,  
                sortable : true  
            },{  
                field : 'manager',  
                title : "负责人",  
                editor : 'text',  
                width : 200,  
                sortable : true  
            }, {  
                field : 'opt',  
                title : "详情",  
                width : 150,  
                align : 'center',  
                formatter:function(value,row,index){  
                    if (row.editing){  
                        var s = '<a href="#" class="ope-save" onclick="saverow('+index+',this)">保存</a> ';  
                        var c = '<a href="#" class="ope-cancel" onclick="cancelrow('+index+',this)">取消</a>';  
                        return s+c;  
                    } else {  
                        var e = '<a href="#" class="ope-edit" onclick="editrow('+index+',this)">修改</a> ';  
                        var d = '<a href="#" class="ope-remove" onclick="deleterow('+index+',this)">删除</a>';  
                        return e+d;  
                    }  
                }  
        } ] ],  
        onLoadSuccess : function(data) {  
  
        },  
        onBeforeEdit:function(index,row){  
            row.editing = true;  
            $obj.datagrid('refreshRow', index);  
        },  
        onAfterEdit:function(index,row){  
            row.editing = false;  
            $obj.datagrid('refreshRow', index);  
        },  
        onCancelEdit:function(index,row){  
            row.editing = false;  
            $obj.datagrid('refreshRow', index);  
        }  
    });  
  
});  
  
    function selectCurRow(obj){  
        var $a = $(obj);  
        var $tr = $a.parent().parent().parent();  
        var tmpId = $tr.find("td:eq(0)").text();  
        $obj.datagrid('selectRecord', tmpId);  
    }  
      
    function getIndexAfterDel(){  
        var selected = $obj.datagrid('getSelected');  
        var index = $obj.datagrid('getRowIndex', selected);  
        return index;  
    }  
      
    function editrow(index,obj){  
        selectCurRow(obj);  
          
        var tmpIndex = getIndexAfterDel();    
        $obj.datagrid('beginEdit', tmpIndex);  
    }  
      
    function deleterow(index,obj){  
        $.messager.confirm('Confirm','确认删除?',function(r){  
            if (r){               
                selectCurRow(obj);  
                var index = getIndexAfterDel();  
                var node = $obj.datagrid('getSelected');  
                var id = node.id;   
                $.ajax({  
                    url :'<%=path%>/com/deleteCompanyInfo?id='+id,  
                    type : 'GET',                     
                    timeout : 60000,  
                    success : function(data, textStatus, jqXHR) {     
                        var msg = '删除';  
                        if(data == 'o') {  
                            $obj.datagrid('deleteRow', index);  
                            return;  
                        }else if (data == "1") {  
                            $obj.datagrid('deleteRow', index);  
                            //$obj.datagrid('reload');  
                            $.messager.alert('提示', msg + '成功！', 'info', function() {  
                                //window.location.href = root + 'esbService/initSysConfig.do';  
                            });  
                        } else {  
                            $.messager.alert('提示', msg + '失败！', 'error', function() {  
                                //window.location.href = root + 'esbService/initSysConfig.do';  
                            });  
                        }  
                    }  
                });   
                  
            }  
        });  
    }  
    function saverow(index,obj){  
        selectCurRow(obj);  
        var tmpIndex = getIndexAfterDel();    
        $obj.datagrid('endEdit', tmpIndex);  
        var node = $obj.datagrid('getSelected');  
        //var data = JSON.stringify(node);  
        var json = {};  
        json.comId = node.comId;  
        json.username = node.username;  
        json.pwd = node.pwd;  
        json.fullname   = node.fullname;  
        json.comtype  = node.comtype;
          json.description = node.description;  
        json.empcount = node.address;  
        json.tel = node.tel;  
        json.email   = node.email;  
        json.manager   = node.manager;  
		var id = node.id;
        $.ajax({  
            url : '<%=path%>/com/updateByUserId',
            type : 'POST',  
            data : json,  
            timeout : 60000,  
            success : function(data, textStatus, jqXHR) {     
                var msg = '';  
                if (data == 1) {  
                    $.messager.alert('提示', '保存成功！', 'info', function() {  
                        $obj.datagrid('refreshRow', tmpIndex);  
                    });  
                } else{  
                      msg = "保存失败！";  
                    $.messager.alert('提示', msg , 'error', function() {  
                        $obj.datagrid('beginEdit', tmpIndex);  
                    });  
                }                     
  
            }  
        });  
          
    }  
    function cancelrow(index,obj){  
        selectCurRow(obj);  
        var tmpIndex = getIndexAfterDel();    
        $obj.datagrid('cancelEdit', tmpIndex);  
    }  
      
    function appendRow(){  
        $obj.datagrid('appendRow',{  
            id: new Date().getTime(),  
            configName: '',  
            configNameCn: "",  
            configType: "",  
            configValue:"",  
            opt:""  
        });  
          
        var length = $obj.datagrid("getRows").length;  
        if(length > 0){  
            editIndex = length - 1;  
        }else{  
            editIndex = 0;  
        }         
        //$obj.datagrid("selectRow", editIndex);  
        $obj.datagrid("beginEdit", editIndex);  
    }  
      function dosearch(){
        var p=$('#param').val();
      				$('#tt').datagrid('reload', {
					param : p
				});
      }
		</script>
  </head>
  
  <body>
    <form>
	<span>搜索：</span>		 <input id="param" type="text">						
	<a href="#" class="easyui-linkbutton" iconCls="search"  onclick="dosearch();">查询</a>
</form>
	<table id="tt" ></table>
  </body>
</html>
