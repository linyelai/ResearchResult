function xSliderFun(slideId)
{
    var objer=new Object();
    objer.xfIndex=0;
    objer.xlIndex=1;

    objer.xqhLength = $("#" + slideId + " .xslideItem").length;
    //如果是带小图滚动，不需要以下代码。如是无小图滚动，则需要以下代码
    for(var ixx=0;ixx<objer.xqhLength;ixx++)
    {
        if(ixx==0)
                $("#"+slideId+" .xslideList").append("<li class=\"on\" rel=\""+ixx+"\">&nbsp;</li>");
        else
               $("#"+slideId+" .xslideList").append("<li rel=\""+ixx+"\">&nbsp;</li>");
    }
    $("#" + slideId + " .xslideList li").bind("click", function() {
        objer.xSetSlide(parseInt($(this).attr("rel")));
    })
    objer.xSetSlide = function(tIndex) {
        if (objer.xslideFun != null)
            clearTimeout(objer.xslideFun);
        objer.xlIndex = tIndex;
        objer.xSlideImg();
    }

    objer.xSlideImg=function()
    {
        if(objer.xlIndex!=objer.xfIndex)
        {
            $($("#"+slideId+" .xslideItem")[objer.xfIndex]).fadeOut(1000);
            $($("#"+slideId+" .xslideItem")[objer.xlIndex]).fadeIn(1000);
            $("#"+slideId+" .xslideList li").removeClass("on");
            $($("#"+slideId+" .xslideList li")[objer.xlIndex]).addClass("on");
        }  
        objer.xslideFun=setTimeout(objer.xSlideImg,5000); 
        objer.xfIndex=objer.xlIndex;
        if(objer.xlIndex+1>=objer.xqhLength)
            objer.xlIndex=0;
        else
            objer.xlIndex=objer.xlIndex+1;  
    }
    objer.xSetSlide(0); 
}