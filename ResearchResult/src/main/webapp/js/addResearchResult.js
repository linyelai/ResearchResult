/**
 * 
 */
window.onload = function()
{
	
	
	$.ajax({
		
		 type : "GET", //提交方式 
	     url : '../findAllTeachers.do',//路径 
	     dataType:"json",
	     success : function(data)
	     {//返回数据根据结果进行相应的处理 
	      
	    	 $('#participates').combobox({
	    		 valueField: 'name',
	    		 textField: 'name',
	    		 data:data,
	    		 multiple:true
	    		 });
	       
	     }
	});
	
}
function addResult()
{
	var title = $("#title").val();
	var participates = $("#participates").val();
	var no = $("#no").val();
	var type = $("#type").val();
	var pulishDate = $("#pulishDate").val();
	var grade = $("#grade").val();
	var workload = $("#workload").val();
	workload = parseFloat(workload);
	if(workload<0)
	{
   	 $.messager.alert('Warning',"工作量不能小于0！");
   	 return;

	}
	var reward = $("#reward").val();
	reward = parseFloat(reward);
	if(reward<0)
	{
   	 $.messager.alert('Warning',"奖励金额不能小于0！");
   	 return;

	}
	var imageName = $("#imageName").val();
	var url = BASE_PATH+"/addResult.do";
	
	$.ajax({
		
		 type : "POST", //提交方式 
	     url : url,//路径 
	     data :{ "title" : title ,"participant" : participates,"no" : no,"type" : type,"pulishDate" : pulishDate,"grade" : grade,"workload" : workload,"reward" : reward,"imageUrl" : imageName}, 
	     dataType:"json",
	     success : function(data)
	     {//返回数据根据结果进行相应的处理 
	      
	    	 $.messager.alert('Warning',data.msg);
	    	 window.location.href=BASE_PATH+"/index.do"
	       
	     }
	});
}


function uploadImage()
{
	 if($("#file").val()=="")
	 {  
         $.messager.alert("提示","请选择文件夹");  
         return false;  
     }  
	  $("#uploadImage").submit();
	 
}