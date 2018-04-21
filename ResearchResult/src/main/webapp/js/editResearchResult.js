/**
 * 
 */
function editResult()
{
	var title = $("#title").val();
	var participates = $("#participates").val();
	var no = $("#no").val();
	var type = $("#type").val();
	var pulishDate = $("#pulishDate").val();
	var grade = $("#grade").val();
	var workload = $("#workload").val();
	var reward = $("#reward").val();
	var imageName = $("#imageName").val();
	var id = $("#id").val();
	var url = BASE_PATH+"/updateResult.do";
	
	$.ajax({
		
		 type : "POST", //提交方式 
	     url : url,//路径 
	     data :{ "id":id,"title" : title ,"participant" : participates,"no" : no,"type" : type,"pulishDate" : pulishDate,"grade" : grade,"workload" : workload,"reward" : reward,"imageUrl" : imageName}, 
	     dataType:"json",
	     success : function(data)
	     {//返回数据根据结果进行相应的处理 
	      
	    	 $.messager.alert('Warning',data.msg);
	    	 window.location.href=BASE_PATH+"/index.do"
	       
	     }
	});
}


function uploadEditImage()
{
	 if($("#file").val()=="")
	 {  
         $.messager.alert("提示","请选择文件夹");  
         return false;  
     }  
	  $("#uploadImage").submit();
	 
}
function editResultCancelBtn()
{
	window.location.href=BASE_PATH+"/index.do";

}