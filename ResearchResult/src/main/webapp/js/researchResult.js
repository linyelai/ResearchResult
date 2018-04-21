/**
 * 
 */
window.onload = function()
{
	
	findResearchByPage(1);
	
}


function findResearchByPage(page)
{
	
$.ajax(
			
			{
				url: BASE_PATH+"/findResultByPage.do",
				type:'POST',
				data:{'title':'',"rows":12,"page":page},
				success: 
					function(data)
					{
						$("#resultListContent").empty();
						$("#pagetion").empty();
						resultList = eval("("+data+")").rows;
						var result =null;
						var resutItem = "";
						var total = eval("("+data+")").total;
						var totalPage = parseInt(total/12)+1;
						var currentPage = eval("("+data+")").currentPage;
						var prePage = currentPage-1;
						var nextPage = currentPage+1;
						if(prePage<=0)
						{
							prePage = 1;
						}
						if(nextPage>totalPage)
						{
							nextPage = totalPage;
						}
						for(var i=0;i<resultList.length;i++)
						{
						   
							result = resultList[i];
							if((i+1)%4!=0)
							{
								 resutlItem = '<div class="maximg_l"> '
						          +' <div class="minimg"><a href="resultDetail.do?id='+result.id+'" '
								  +' target="_self" title=""><img src="'+result.imageUrl+'"></a></div>'
						          +' <div class="jlje">奖励金额：'+result.reward+' 元</div><br>	'
						          +' <div class="mintxt"><a href="resultDetail.do?id='+result.id+'" '
								  +' target="_self" title="">'+result.title+'</a></div>'
						      	
							}
							else
							{
								 resutlItem = '<div class="maximg_r">'
							          +' <div class="minimg"><a href="resultDetail.do?id='+result.id+'" '
									  +' target="_self" title=""><img src="'+result.imageUrl+'"></a></div>'
							          +' <div class="jlje">奖励金额：'+result.reward+' 元</div><br>	'
							          +' <div class="mintxt"><a href="resultDetail.do?id='+result.id+'" '
									  +' target="_self" title="">'+result.title+'</a></div>'
								
							}
							$("#resultListContent").append(resutlItem);
						}
						$("#pagetion").append("<td><a href=\"javascript:findResearchByPage("+prePage+");\"><<</a></td>");
						for(var i=1;i<=totalPage;i++)
						{
							var pageItem = '<td><a href="#" class="page_on">'+i+'</a></td>';
							$("#pagetion").append(pageItem);
						}
						$("#pagetion").append("<td><a href=\"javascript:findResearchByPage("+nextPage+");\">>></a></td>");
					}
			}
			
		);
	
	
}