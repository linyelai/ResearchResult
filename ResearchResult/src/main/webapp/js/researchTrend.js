/**
 * 
 */
window.onload = function()
{
	findResearchReportByPage(1);
	
}

function findResearchReportByPage(page)
{
	
	$.ajax(
			{
				url: BASE_PATH+"/findReportByPage.do",
				type:'POST',
				data:{'title':'',"rows":12,"page":page},
				success: 
					function(data)
					{
						$("#reportListContent").empty();
						$("#pagetion").empty();
						reportList = eval("("+data+")").rows;
						var report =null;
						var reportItem = "";
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
						for(var i=0;i<reportList.length;i++)
						{
							report = reportList[i];
							reportItem = '<li><span><img src="images/icon1.png">'+
									 '</span><a href="reportDetail.do?id='+report.id+'" '+
								 	' target="_self" title=""> '+report.title+'</a>'+
								 	new Date(report.submitDate).Format("yyyy-MM-dd");
							         ' </li>';
							$("#reportListContent").append(reportItem);
						}
						
						$("#pagetion").append("<td><a href=\"javascript:findResearchReportByPage("+prePage+");\"><<</a></td>");
						for(var i=1;i<=totalPage;i++)
						{
							var pageItem = '<td><a href="#" class="page_on">'+i+'</a></td>';
							$("#pagetion").append(pageItem);
						}
						$("#pagetion").append("<td><a href=\"javascript:findResearchReportByPage("+nextPage+");\">>></a></td>");

					}
			}
			
		);
	
}