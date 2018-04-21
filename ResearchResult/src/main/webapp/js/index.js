/**
 * 后台管理首页
 */
Date.prototype.Format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) 
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
    
}



var userInfoManageTabs = '<table id="userInfo"  >'
' </table> '+
' <div id="toolbar"> '+
' <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">添加教师</a> '
+' <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">修改教师</a> '
+' <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除教师</a>'
+' </div>'
;
//

var teacherInfoManageTabs =    '	<div class="userSearch">标题：<input name="teacherName" id="teacherName" '+
'    class="easyui-textbox" data-options="iconCls:\'icon-search\',prompt:\'请输入教师名\'" style="width:200px"> '+
'	<a id="teacherBtn" href="#" class="easyui-linkbutton" onclick="findTeacher();">查找</a></div>' +
	'<table id="teacherInfo"  class="easyui-datagrid" style="width:100%;height:445px" ></table>';

//科研成果管理

var researchResultManageTabs = 
   '	<div class="userSearch">标题：<input name="resultTitle" id="resultTitle" '+
   '    class="easyui-textbox" data-options="iconCls:\'icon-search\',prompt:\'请输入成果标题\'" style="width:200px"> '+
   '	<a id="resultBtn" href="#" class="easyui-linkbutton" onclick="findResearchResult();">查找</a>' +
   '	<a id="resultBtn" href="#" class="easyui-linkbutton" onclick="downloadSum();">下载汇总表</a></div>' +
  ' <table id="researchResult"  class="easyui-datagrid" style="width:100%;height:445px" >'+
' </table> ';

//科研报告管理
var researchReportManageTabs =    '	<div class="userSearch">标题：<input name="reportTitle" id="reportTitle" '+
'    class="easyui-textbox" data-options="iconCls:\'icon-search\',prompt:\'请输入报告标题\'" style="width:200px"> '+
'	<a id="reportBtn" href="#" class="easyui-linkbutton" onclick="findReport();">查找</a></div>' +
'<table id="researchReport"  class="easyui-datagrid" style="width:100%;height:445px" '+
' pagination="true" ' +
'	rownumbers="true" fitColumns="true" singleSelect="true"> '+
' </table> ';

window.onload = function()
{
	
   //初始化
	init();

}
function init()
{
	//将导航栏，信息面板初始化。
	$('#userInfo').datagrid({
	    url:'findUsers.do',
	    columns:[[
	    	{field:'ck',checkbox:true,width:100},
	        {field:'username',title:'用户名',width:100},
	        {field:'type',title:'类型',width:100,
	         formatter: function(value,row,index)
	         {
				if (row.type==1)
				{
					return '管理员';
				}
				else
				{
					return  '普通用户';
				}
			}},
	        {field:'enable',title:'是否可用',width:100,align:'right',
				
				formatter: function(value,row,index)
		         {
					if (row.enable==1)
					{
						return '可用';
					}
					else
					{
						return  '不可用';
					}
				}
	        
	        }
	    ]],
	    toolbar: [{
			iconCls: 'icon-add',
			handler: function()
			{
				$('#dlg').dialog('open').dialog('setTitle','添加用户');
				$('#fm').form('clear');
				//
				
				
				
			},
			text:'添加用户'
		},'-',{
			iconCls: 'icon-edit',
			handler: function()
			{
			    var checkedRows = $("#userInfo").datagrid('getChecked');
			    if(checkedRows.lenght<1)
			    {
			    	$.messager.alert('Warning',"请选择要编辑的用户信息");
			    }
			    else if(checkedRows.lenght>1)
			    {
			    	$.messager.alert('Warning',"每次只能编辑一个用户信息");
			    }
			    else
			    {
			    	$('#newName1').textbox('setText',checkedRows[0].username);
			    	$('#newName1').textbox('setValue',checkedRows[0].username);
			    	$('#typecc1').combobox('setValue',checkedRows[0].type);
			    	$('#enablecc1').combobox('setValue',checkedRows[0].enable);
			    	$('#userId').val(checkedRows[0].id);
			    }
				$('#editUserdlg').dialog('open').dialog('setTitle','修改用户');
				
			
				
				
			},
			text:'编辑用户'
		},'-',{
			iconCls: 'icon-remove',
			handler: function()
			{
				removeUsers();
				
			},
			text:'删除用户'
		}],
		pagination:true,
		selectOnCheck:true,
		striped:true,
		rownumbers:true,
		checkOnSelect:true,
		checkbox:true
		
	});
	
	//
	$('#menu').tree({
		
		onClick: function(node)
		{
			var nodeText = node.text;
			if(nodeText=='用户管理')
			{
				$('#manageTabs').tabs('select','用户管理');
			}
			else if(nodeText=='教师信息管理'&&!$('#manageTabs').tabs('exists','教师信息管理'))
			{
				
				$('#manageTabs').tabs('add',{
				    title:'教师信息管理',
				    content:teacherInfoManageTabs,
				    closable:true,
				    tools:[{
				        iconCls:'icon-mini-refresh',
				        handler:function(){
				            
				        }
				    }]
				});
				$("#teacherInfo").datagrid({
					
					 url:'findTeachers.do',
					    columns:[[
					    	{field:'ck',checkbox:true,width:100},
					    	{field:'id',hidden:true},
					    	{field:'name',title:'姓名',width:80},
					        {field:'jobNum',title:'工号',width:150},
					        {field:'birthday',title:'出生日期',width:100,
					       
					        	formatter:function(value,row,index)
					        	{
					        		return new Date(value).Format("yyyy-MM-dd");
					        	}
					        },
					       
					        {field:'gender',title:'性别',width:50,align:'center' ,
					        	formatter: function(value,row,index)
					        	{
					        		if(value==0)
					        		{
					        			return "男";
					        		}
					        		else
					        		{
					        			return "女";
					        			
					        		}
					        	}
					        },
					        
					        {field:'degree',title:'学位',width:100,align:'center' },
					        {field:'rank',title:'职称',width:150,align:'center' },
					        {field:'position',title:'职务',width:100,align:'center'},
					        {field:'idCardNum',title:'身份证号码',width:200,align:'center'},
					        {field:'academic',title:'学院',width:100,align:'center'}
					    ]],
					    toolbar: [{
							iconCls: 'icon-add',
							handler: function()
							{
								$("#addTeacherdlg").dialog('open').dialog('setTitle','添加教师信息');
							},
							text:'添加'
						},'-',{
							iconCls: 'icon-edit',
							handler: function()
							{
								
								 var checkedRows = $("#teacherInfo").datagrid('getChecked');
								    if(checkedRows.lenght<1)
								    {
								    	$.messager.alert('Warning',"请选择要编辑的用户信息");
								    	return;
								    }
								    else if(checkedRows.lenght>1)
								    {
								    	$.messager.alert('Warning',"每次只能编辑一个用户信息");
								    	return;
								    }
								$('#editTeacherId').val(checkedRows[0].id);  
								$('#editTeacherName').textbox('setValue',checkedRows[0].name);
								$('#jobNumEdit').textbox('setValue',checkedRows[0].jobNum)
						    	$('#birthdayEdit').datebox('setValue',new Date(checkedRows[0].birthday).Format("MM/dd/yyyy"));
						    	$('#genderEdit').combobox('setValue',checkedRows[0].gender);
						    	$('#degreeEdit').combobox('setValue',checkedRows[0].degree);
						    	$('#rankEdit').textbox('setValue',checkedRows[0].rank);
						    	$('#positionEdit').textbox('setValue',checkedRows[0].position);
						    	$('#idCardNumEdit').textbox('setValue',checkedRows[0].idCardNum);
						    	$('#academicEdit').combobox('setValue',checkedRows[0].academic);
								$("#editTeacherdlg").dialog('open').dialog('setTitle','修改教师信息');
								
							},
							text:'编辑'
						},'-',{
							iconCls: 'icon-remove',
							handler: function()
							{
								removeTeacher();
							},
							text:'删除'
						}],
						pagination:true,
						selectOnCheck:true,
						striped:true,
						rownumbers:true,
						checkOnSelect:true,
						checkbox:true
				});
			}
			else if(nodeText=='教师信息管理'&&$('#manageTabs').tabs('exists','教师信息管理'))
			{
				$('#manageTabs').tabs('select','教师信息管理');
			}
			else if(nodeText=='科研成果管理'&&!$('#manageTabs').tabs('exists','科研成果管理'))
			{
				$('#manageTabs').tabs('add',{
				    title:'科研成果管理',
				    content:researchResultManageTabs,
				    closable:true,
				    tools:[{
				        iconCls:'icon-mini-refresh',
				        handler:function(){
				            
				        	
				        	
				        }
				    }]
				});
				
				
				//
				$('#researchResult').datagrid({
				    url:'findResultByPage.do',
				    columns:[[
				    	{field:'ck',checkbox:true,width:100},
				    	{field:'title',title:'标题',width:250},
				        {field:'participant',title:'参与者',width:150},
				        {field:'no',title:'成果编号',width:100},
				        {field:'type',title:'类别',width:100,align:'center',
				        	formatter: function(value,row,index)
					         {
								if (row.type==0)
								{
									return '论文';
								}
								else if(row.type==1)
								{
									return  '专利';
								}
								else if(row.type==2)
								{
									return  '专著';
								}
								else if(row.type==3)
								{
									return  '软件著作权';
								}
								else if(row.type==4)
								{
									return  '横向项目';
								}
							}
				        },
				        {field:'grade',title:'等级',width:100,align:'center',
				        	
				        	formatter: function(value,row,index)
					         {
								if (row.grade==0)
								{
									return 'SCI一区';
								}
								else if(row.grade==1)
								{
									return  'SCI二区';
								}
								else if(row.grade==2)
								{
									return  'SCI光盘';
								}
								else if(row.grade==3)
								{
									return  'EI';
								}
								else if(row.grade==4)
								{
									return  '普通刊物';
								}
							}
				        },
				        {field:'pulishDate',title:'发布日期',width:150,align:'center',
				        	
				        	formatter: function(value,row,index)
					         {
				        		return new Date(value).Format("yyyy-MM-dd");
				        		//return new Date(value);
					         }
				        },
				        
				        {field:'reward',title:'奖励金额',width:100,align:'center'}
				    ]],
				    toolbar: [{
						iconCls: 'icon-add',
						handler: function()
						{
							window.location.href = BASE_PATH +"/views/addResearchResult.jsp"
							
						},
						text:'添加科研成果'
					},'-',{
						iconCls: 'icon-edit',
						handler: function()
						{
							 editResult();
							
							
						},
						text:'编辑科研成果'
					},'-',{
						iconCls: 'icon-remove',
						handler: function()
						{
						
							removeResult();
						},
						text:'删除科研成果'
					}],
					pagination:true,
					selectOnCheck:true,
					striped:true,
					rownumbers:true,
					checkOnSelect:true,
					checkbox:true
					
				});
				
				//$('#researchResult').datagrid('load');
				
			}
			else if(nodeText=='科研成果管理'&&$('#manageTabs').tabs('exists','科研成果管理'))
			{
				$('#manageTabs').tabs('select','科研成果管理');
			}
			else if(nodeText=='科研报告管理'&&!$('#manageTabs').tabs('exists','科研报告管理'))
			{
				$('#manageTabs').tabs('add',{
				    title:'科研报告管理',
				    content:researchReportManageTabs,
				    closable:true,
				    tools:[{
				        iconCls:'icon-mini-refresh',
				        handler:function(){
				            
				        }
				    }]
				});
				//
				$("#researchReport").datagrid({
				    url:'findReportByPage.do',
				    columns:[[
				    	{field:'ck',checkbox:true,width:100},
				        {field:'title',title:'标题',width:250},
				        {field:'author',title:'作者',width:100},
				        {field:'submitDate',title:'发日期布',width:100,align:'center',
				        	formatter: function(value,row,index)
					         {
				        		return new Date(value).Format("yyyy-MM-dd");
				        		//return new Date(value);
					         }
				        },
				        
				        {field:'source',title:'来源',width:100,align:'center' },
				    ]],
				    toolbar: [{
						iconCls: 'icon-add',
						handler: function()
						{
							window.location.href = BASE_PATH +"/addResearchReport.do"
							
						},
						text:'添加科研报告'
					},'-',{
						iconCls: 'icon-edit',
						handler: function()
						{
						   editReport();
							
							
						},
						text:'编辑科研报告'
					},'-',{
						iconCls: 'icon-remove',
						handler: function()
						{
							removeReport();
							
						},
						text:'删除科研报告'
					}],
					pagination:true,
					selectOnCheck:true,
					striped:true,
					rownumbers:true,
					checkOnSelect:true,
					checkbox:true
					
				});
				
			}
			else if(nodeText=='科研报告管理'&&$('#manageTabs').tabs('exists','科研报告管理'))
			{
				$('#manageTabs').tabs('select','科研报告管理');
			}
			
		},
		data: [
			{
				text: '用户管理',
			},
			{
				text: '教师信息管理'
			}
			,
			{
				text: '科研成果管理'
			}
			,
			{
				text: '科研报告管理'
			}
			]
	
	
	});
	
	//inittabs
	initSearchUser();

}
function initTabs()
{
	$('#manageTabs').tabs({
	    border:false,
	    onSelect:function(title){
	       
	    }
	});
	
}

function initSearchUser()
{
	$('#userBtn').bind('click', function()
	{
		var name = $("#username").val();
		$('#userInfo').datagrid('load',{
			rows:20,
			page:1,
			username:name
		});
    });
}

function saveUser()
{
	var newName = $('#newName').val();
	var password= $('#password').val();
	var comfirmPass = $('#comfirmPass').val();
	var type = $('#typecc').val();
	$.ajax({
		url: BASE_PATH+"/addUser.do",
		type:'POST',
		data:{"newName":newName,"password":password,"type":type},
		success: 
			function(data)
			{
				var msg = eval("("+data+")").msg;
				if(msg=='添加成功')
				{
					//关闭关闭对话框，重新刷新页面
					$('#dlg').dialog('close');
					$("#userInfo").datagrid('reload');
					
				}
				else
				{
					$.messager.alert('Warning',msg);
				}
			}
		}
	);
}

function removeUsers()
{
	$.messager.confirm('Confirm','确定删除这些数据？',function(r){
	    if (r)
	    {
	    	var checkedRows = $("#userInfo").datagrid('getChecked');
	    	var usernames ="";
	    	for(var i = 0;i<checkedRows.length-1;i++)
	    	{
	    		usernames+=checkedRows[i].username+",";
	    	}
	    	usernames+=checkedRows[i].username;
	    	$.ajax({
	    		url: BASE_PATH+"/removeUsers.do",
	    		type:'POST',
	    		data:{"usernames":usernames},
	    		success: 
	    			function(data)
	    			{
	    				var msg = eval("("+data+")").msg;
	    				$("#userInfo").datagrid('reload');
	    				$.messager.alert('Warning',msg);
	    					
	    				
	    			}
	    		}
	    	);
	    }
	});
	//获得选中的用户信息
	
}
//编辑用户
function editUser()
{
	var newName = $('#newName1').val();
	var password = $('#password1').val();
	var comfirmPass = $("#comfirmPass1").val();
	var type = $("#typecc1").val();
	var enable = $("#enablecc1").val();
	var userId = $("#userId").val();
	if(password!=''&&comfirmPass!=''&&password!=comfirmPass)
	{
		$.messager.alert('Warning',"两次输入的密码不一致！");
		return;
	}
	$.ajax({
		url: BASE_PATH+"/updateUser.do",
		type:'POST',
		data:{'id':userId,"username":newName,"pass":password,"type":type,"enable":enable},
		success: 
			function(data)
			{
				var msg = eval("("+data+")").msg;
				if(msg=='修改成功')
				{
					//关闭关闭对话框，重新刷新页面
					$('#editUserdlg').dialog('close');
					$("#userInfo").datagrid('reload');
					$.messager.alert('Warning',msg);
					
				}
				else
				{
					$.messager.alert('Warning',msg);
				}
			}
		}
	);

}
function newResult()
{
	window.location.href= BASE_PATH+'/views/addResearchResult.jsp';
	/*$('#dd').dialog({
	    title: '新增科研结果',
	    width: 1024,
	    height: 600,
	    closed: false,
	    cache: false,
	    href: 'views/addResearchResult.jsp',
	    modal: true
	});*/
}

function editResult()
{
	var checkedRows = $("#researchResult").datagrid('getChecked');
    if(checkedRows.lenght<1)
    {
    	$.messager.alert('Warning',"请选择要编辑的科研信息");
    }
    else if(checkedRows.lenght>1)
    {
    	$.messager.alert('Warning',"每次只能编辑一个科研信息");
    }
    else
    {
    	window.location.href = BASE_PATH+"/editResult.do?id="+checkedRows[0].id
    }

}


function findResultByPage(title,rows,page,resultList)
{
	
	$.ajax(
		
		{
			url: BASE_PATH+"/findResultByPage.do",
			type:'POST',
			data:{'title':title,"rows":rows,"page":page},
			success: 
				function(data)
				{
					resultList = eval("("+data+")").resultList;
				}
		}
		
	);
}

function removeResult()
{
	
	$.messager.confirm('Confirm','确定删除这些数据？',function(r){
	    if (r)
	    {
	    	var checkedRows = $("#researchResult").datagrid('getChecked');
	    	var ids ="";
	    	for(var i = 0;i<checkedRows.length-1;i++)
	    	{
	    		ids+=checkedRows[i].id+",";
	    	}
	    	ids+=checkedRows[i].id;
	    	$.ajax({
	    		url: BASE_PATH+"/removeResults.do",
	    		type:'POST',
	    		data:{"ids":ids},
	    		success: 
	    			function(data)
	    			{
	    				var msg = eval("("+data+")").msg;
	    				$("#researchResult").datagrid('reload');
	    				$.messager.alert('Warning',msg);
	    					
	    				
	    			}
	    		}
	    	);
	    }
	});

}

function removeReport()
{
	$.messager.confirm('Confirm','确定删除这些数据？',function(r){
	    if (r)
	    {
	    	var checkedRows = $("#researchReport").datagrid('getChecked');
	    	var ids ="";
	    	for(var i = 0;i<checkedRows.length-1;i++)
	    	{
	    		ids+=checkedRows[i].id+",";
	    	}
	    	ids+=checkedRows[i].id;
	    	$.ajax({
	    		url: BASE_PATH+"/removeReports.do",
	    		type:'POST',
	    		data:{"ids":ids},
	    		success: 
	    			function(data)
	    			{
	    				var msg = eval("("+data+")").msg;
	    				$("#researchReport").datagrid('reload');
	    				$.messager.alert('Warning',msg);
	    					
	    				
	    			}
	    		}
	    	);
	    }
	});

	
	

}

function findResearchResult()

{
	var title = $("#resultTitle").val();
	$('#researchResult').datagrid('load',
	{
				rows:20,
				page:1,
				'title':title
	});
}
function findReport()
{
	var title = $("#reportTitle").val();
	$('#researchReport').datagrid('load',
	{
				rows:20,
				page:1,
				'title':title
	});

}
function editReport()
{
	var checkedRows = $("#researchReport").datagrid('getChecked');
    if(checkedRows.lenght<1)
    {
    	$.messager.alert('Warning',"请选择要编辑的科研信息");
    }
    else if(checkedRows.lenght>1)
    {
    	$.messager.alert('Warning',"每次只能编辑一个科研信息");
    }
    else
    {
    	window.location.href = BASE_PATH+"/editReport.do?id="+checkedRows[0].id
    }

}

function addTeacher()
{
	
	
	var jobNum= $('#jobNum').val();
	var degree = $('#degree').val();
	var rank= $('#rank').val();
	var position = $('#position').val();
	var idCardNum = $('#idCardNum').val();
	var academic = $('#academic').val();
	var teacherName = $("#tuitorName").val();
	//validateTeacher(teacherName,jobNum,degree,rank,position,academic);
	if(validateTeacher(teacherName,jobNum,degree,rank,position,academic)&&validateIdCardNum(idCardNum))
	{
		
	
		$.ajax({
			url: BASE_PATH+"/addTeacher.do",
			type:'POST',
			data:{"name":teacherName,"jobNum":jobNum,"degree":degree
				,"rank":rank,"position":position,"idCardNum":idCardNum,"idCardNum":idCardNum,"academic":academic
			},
			success: 
				function(data)
				{
					var msg = eval("("+data+")").msg;
					if(msg=='添加成功')
					{
						//关闭关闭对话框，重新刷新页面
						$('#addTeacherdlg').dialog('close');
						$("#teacherInfo").datagrid('reload');
						
					}
					else
					{
						$.messager.alert('Warning',msg);
					}
				}
			}
		);
	}
}

function removeTeacher()
{
	$.messager.confirm('Confirm','确定删除这些数据？',function(r){
	    if (r)
	    {
	    	var checkedRows = $("#teacherInfo").datagrid('getChecked');
	    	var jobNums ="";
	    	for(var i = 0;i<checkedRows.length-1;i++)
	    	{
	    		jobNums+=checkedRows[i].jobNum+",";
	    	}
	    	jobNums+=checkedRows[i].jobNum;
	    	$.ajax({
	    		url: BASE_PATH+"/removeTeacher.do",
	    		type:'POST',
	    		data:{"jobNums":jobNums},
	    		success: 
	    			function(data)
	    			{
	    				var msg = eval("("+data+")").msg;
	    				$("#teacherInfo").datagrid('reload');
	    				$.messager.alert('Warning',msg);
	    					
	    				
	    			}
	    		}
	    	);
	    }
	});

}


function editTeacher()
{
	var id = $("#editTeacherId").val();
	var teacherName = $('#editTeacherName').val();
	var jobNum= $('#jobNumEdit').val();
	var degree = $('#degreeEdit').val();
	var rank= $('#rankEdit').val();
	var position = $('#positionEdit').val();
	var idCardNum = $('#idCardNumEdit').val();
	var academic = $('#academicEdit').val();
	if(validateTeacher(teacherName,jobNum,degree,rank,position,academic)&&validateIdCardNum(idCardNum))
	{
		$.ajax({
			url: BASE_PATH+"/updateTeacherInfo.do",
			type:'POST',
			data:{'id':id,"name":teacherName,"jobNum":jobNum,"degree":degree
				,"rank":rank,"position":position,"idCardNum":idCardNum,"idCardNum":idCardNum,"academic":academic
			},
			
			success: 
				function(data)
				{
					var msg = eval("("+data+")").msg;
					if(msg=='修改成功')
					{
						//关闭关闭对话框，重新刷新页面
						$('#editTeacherdlg').dialog('close');
						$("#teacherInfo").datagrid('reload');
						
					}
					else
					{
						$.messager.alert('Warning',msg);
					}
				}
			}
		);
	}
	
}

function logout()
{
	window.location.href = BASE_PATH+"/logout.do";

}
function validateIdCardNum(idCardNum)
{
	 //var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/; 
	 var reg = /^\d{6}(18|19|20)?\d{2}(0[1-9]|1[012])(0[1-9]|[12]\d|3[01])\d{3}(\d|[xX])$/;
	  if(reg.test(idCardNum) === false) 
	  { 
	    alert("身份证输入不合法"); 
	    return false; 
	  } 
	  else
	  {
		 return true; 
	  }	
}

function findTeacher()
{
	var name = $("#teacherName").val();
	$('#teacherInfo').datagrid('load',
	{
				rows:20,
				page:1,
				'name':name
	});

}

function validateTeacher(teacherName,jobNum,degree,rank,position,academic)
{
	if(teacherName==null||teacherName=='')
	{
		$.messager.alert('Warning',"教师姓名必须填写");
		return false;
	}
	if(jobNum==null||jobNum=='')
	{
		$.messager.alert('Warning',"工号必须填写");
		return false;
	}
	if(degree==null||degree=='')
	{
		$.messager.alert('Warning',"学位必须填写");
		return false;
	}
	if(rank==null||rank=='')
	{
		$.messager.alert('Warning',"职称必须填写");
		return false;
	}
	if(position==null||position=='')
	{
		$.messager.alert('Warning',"职位必须填写");
		return false;
	}
	if(academic==null||academic=='')
	{
		$.messager.alert('Warning',"学院必须填写");
		return false;
	}
	return true;
}

function downloadSum()
{
	
	window.location.href = BASE_PATH +"/downloadSum.do";

}