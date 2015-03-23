
$(document).ready(function(){
	if($.browser.msie&&($.browser.version == '6.0' || $.browser.version == '7.0' || $.browser.version == '8.0' || $.browser.version == '9.0'))
		$("#style").attr("href","style/style.css");

	//var h=highline.getWinH();
	//highline.jq_lodpar.css({"height":h+"px"});
	//highline.xManPreload(highline.loadIng,highline.loadEd);//进度
	

		highline.judgeDevice();

		highline.setSize();//调整
		$(window).resize(function(){
			highline.setSize();//调整
			highline.setPosIe6();
		});

		$(window).scroll(function(){
			highline.setPosIe6();
		});
		$(document).mousewheel(function (event, num) {
			event=event||window.event;
			event.preventDefault();
			var $dom_cur=event.target.className.indexOf("cont")==-1?$(event.target).closest(".cont"):$(event.target);
			var idx=$dom_cur.index();
			if(!highline.ifScroll) return;
			var $dom=null;
			if(num<0){
				if($dom_cur.next().length>0) $dom=$dom_cur.next();
				else $dom=highline.jq_contpar.children().eq(0);
			}else{
				if($dom_cur.prev().length>0) $dom=$dom_cur.prev();
				else return;
			}		
			highline.scroll_To($dom);
		});
		$(document).keydown(function(e){
			if(e.keyCode==40||e.which==38) e.preventDefault();
			if(e.keyCode==40) highline.triggerBtnlist(true);
			else if(e.which==38) highline.triggerBtnlist(false);
		});
		$(".btn-up").click(function(){ highline.triggerBtnlist(false); });
		$(".btn-down").click(function(){ highline.triggerBtnlist(true); });

		highline.jq_btn_down.click(function(){
			highline.scroll_To($(".cont1"));
		});


		$('.s').slides({
			preload: true,
			preloadImage: 'img/loading.gif',
			//play: 1000,
			pause: 2500,
			hoverPause: true
			,generatePagination: false
		});

		$(".videopar").videoAbo();

		setTimeout(function(){
			var url=window.location.href,urlArr=url.split("#@");
			if(urlArr.length>1){
				highline.jq_btnlistpar.children("a").eq(parseInt(urlArr[1])).trigger("click");
			}else{
				$(document.body).scrollTop(0);
				highline.jq_btnlistpar.children("a").eq(0).trigger("click");
			}
		},200);

		$(document).bind("touchmove",function(e){
			e.preventDefault();
		});

		$(".btn").each(function(){
			$(this).click(function(){
				$(this).addClass("btnvisited");
			});
		});



});


var highline={
	jq_contpar:$("#contpar")
	,jq_btn_down:$("#btn_down")
	,jq_btnlistpar:$("#btnlistpar")
	,jq_lodpar:$("#lodpar")
	,ifScroll:1
	,moreSub:2
	,win:$(window)
	,anitime:1000
	,jq_curboxIdx:null
	,judgeDevice:function(){
		var bo=is_pc();
		if(bo) return;
		$("#btn_down").hide();
		$(".btndowntit").hide();
		highline.jq_btnlistpar.addClass("dis-none");
		$(".btn-up").show();
		$(".btn-down").show();
		$("#videopar .left,#videopar .right").css({"visibility":"hidden"});
	}
	,getWinH:function(){
		return this.win.height();
	}
	,setSize:function(){
		var w=$(window).width();
		var h=this.getWinH();
		$("#contpar .cont").css({"height":h+"px"});
		switch(true){
			case w<500||h<280:
			this.setClass(0);
			break;
			case w<720||h<430:
			this.setClass(1);
			break;
			case w<870||h<490:
			this.setClass(2);
			break;
			case w<1024||h<580:
			this.setClass(3);
			break;
			case w<1150||h<680:
			this.setClass(4);
			break;
			case w<1280||h<720:
			this.setClass(5);
			break;
			case w<1366||h<768:
			this.setClass(6);
			break;
			case w<1600||h<900:
			this.setClass(7);
			break;
			default:
			this.setClass(8);
			break;
		}
		if(highline.jq_curboxIdx!=null){
			$(document).scrollTop(highline.jq_contpar.children().eq(highline.jq_curboxIdx)[0].offsetTop);
		} 
	}
	,setClass:function(num){
		this.jq_contpar.attr("class","contpar contpar_"+num);
	}
	,scroll_To:function($obj){
		if(highline.ifScroll==0) return;
		var i=$obj.index();
		var $btnlistpar=highline.jq_btnlistpar;
		if($btnlistpar.children(".sel").index()==i) return;
		highline.ifScroll=0;
		highline.animationBack($btnlistpar.children(".sel").index());
		$btnlistpar.children(".sel").removeClass("sel").end().children("a").eq(i).addClass("sel");
		$.scrollTo($obj, {
			duration: this.anitime,
			easing: "easeInOutExpo",
			axis: "y",
			onAfter: function() {
				highline.setIfScrollOnAfter(i);
				if(i==0) highline.animationBtnDown();
				highline.animation_(i);
				highline.jq_curboxIdx=i;
				if(!is_pc()){
					if(highline.jq_curboxIdx==0)
						$(".btn-up").hide();
					else
						$(".btn-up").show();
				} 
			}
		});
	}
	,setIfScrollOnAfter:function(num){
		switch(num){
			case 1:
			setTimeout(function(){highline.ifScroll=1;},300);
			break;
			case 2:
			setTimeout(function(){highline.ifScroll=1;},1000);
			break;
			case 3:
			setTimeout(function(){highline.ifScroll=1;},1500);
			break;
			case 4:
			setTimeout(function(){highline.ifScroll=1;},1200);
			break;
			default:
			highline.ifScroll=1;
			break;
		}
	}
	,setPosIe6:function(){
		var h=this.jq_btnlistpar.height();
		var tScro=$(window).scrollTop();
		var hWin=$(window).height();
		this.jq_btnlistpar.attr({"style":"_top:"+(tScro+hWin/2)+"px"});
	}
	,triggerBtnlist:function(bo){
		var $dds=this.jq_btnlistpar.children("a").not("#bdshare");
		var i=this.jq_btnlistpar.children(".sel").eq(0).index();
		if(bo&&i<$dds.length-1)
			this.jq_btnlistpar.children("a").eq(i+1).trigger("click");
		else if(bo&&i==$dds.length-1)
			this.jq_btnlistpar.children("a").eq(0).trigger("click");
		else if(!bo&&i>0) 
			this.jq_btnlistpar.children("a").eq(i-1).trigger("click");
	}
	,animation_:function(num){
		switch(num){
			case 1:
				//this.aniCom_MtopOpacity($("#videopar"),"-512px","1",200);
				$("#videopar").addClass("videopar_ani");
			break;
			case 2:
			var time=400,time1=800;
			$("#cont2_img0").addClass("img0_ani");
			this.aniCom_MtopOpacity($(".tit-consub0"),"-290px","1",time);	
			break;
			case 3:
			var time=10,time1=1000;
			setTimeout(function(){ $("#cont3_img8").addClass("com_ani_scale_1"); },time);	
			this.aniCom_MtopOpacity($(".tit-consub1"),"-310px","1",time);	
			break;	
			case 4:
			var time=300,time1=200,time2=100,time3=700,time4=1200;
			$("#cont4_img0").addClass("img0_ani");		
			setTimeout(function(){ $("#cont4_img4").addClass("img4_ani"); },time3);	
			this.aniCom_MtopOpacity($(".tit-consub2"),"-260px","1",time);	
			break;	
			case 5:
				//this.aniCom_MtopOpacity($("#cont5_cWin"),"-167px","1",500);
				//this.aniCom_MtopOpacity($("#example"),"-172px","1",400);
				$("#cont5_cWin").addClass("cWin_ani");
				$("#example").addClass("example_ani");
			break;
		}				
	}
	,animationBack:function(num){
		switch(num){
			case 1:
				//this.aniCom_MtopOpacity($("#videopar"),"-300px","0",400);
				$("#videopar").removeClass("videopar_ani");
			break;
			case 2:
			var time=200,time1=100;
			setTimeout(function(){ $("#cont2_img0").removeClass("img0_ani"); },time);	
			this.aniCom_MtopOpacity($(".tit-consub0"),"-250px","0",time);	
			break;
			case 3:
			var time=250;
			var time1=200;
			setTimeout(function(){ $("#cont3_img8").removeClass("com_ani_scale_1"); },time);	
			this.aniCom_MtopOpacity($(".tit-consub1"),"-270px","0",time);	
			break;	
			case 4:
			var time=300;
			setTimeout(function(){ $("#cont4_img0").removeClass("img0_ani"); },time);		
			setTimeout(function(){ $("#cont4_img4").removeClass("img4_ani"); },time);	
			this.aniCom_MtopOpacity($(".tit-consub2"),"-220px","0",time);	
			break;	
			case 5:
				//var time=400;
				//this.aniCom_MtopOpacity($("#cont5_cWin"),"-107px","0",time);
				//this.aniCom_MtopOpacity($("#example"),"-112px","0",time);
				$("#cont5_cWin").removeClass("cWin_ani");
				$("#example").removeClass("example_ani");
			break;
		}						
	}
	,aniCom_MtopOpacity:function($obj,Mtop,Opacity,time){
		$obj.animate({
			"opacity":Opacity
			,"margin-top":Mtop
		},time);
	}
	,animationBtnDown:function(){
		highline.jq_btn_down.addClass("btn_down_animation");
		setTimeout(function(){
			highline.jq_btn_down.removeClass("btn_down_animation");
		},1000);	
		setTimeout(function(){
			highline.jq_btn_down.addClass("btn_down_animation");
		},1250);
		setTimeout(function(){
			highline.jq_btn_down.removeClass("btn_down_animation");
		},1500);	
	}
	,xManPreload:function(fnIng,fnEd){

		var count=0;
		var aImg=document.getElementsByTagName('img');
		var load=[];
		for(var i=0;i<aImg.length;i++){
			load[i]=new Image();
			load[i].onload=function(){
				count++;
				if(fnIng) fnIng(count,aImg.length);
				if(count>=aImg.length){
					if(fnEd) fnEd();
				}
			};
			load[i].src=aImg[i].src;
		}
	}
	,loadIng:function(cou,sum){
		var percent=parseInt(cou/sum*100);
		var $lodtit=$(".lodtit"),$lodpar=highline.jq_lodpar;
		var wWin=$(window).width();
		var wLodtit=$lodtit.width();
		var wStar=(wWin-wLodtit)/2;
		$lodpar.show();
		if(percent<=50){
			var w=percent/100*2*wStar;
			$(".lodleft,.lodright").css({"width":w+"px"});
			if(percent==50){
				$lodtit.addClass("lodtit_sel");
				$(".lodleft").css({
					"left":"auto"
					,"right":wWin-w+"px"
				});
				$(".lodright").css({
					"right":"auto"
					,"left":wWin-w+"px"
				});
			} 
		}else{
			var n=1-((percent-50)/100*2);
			var w=n*wStar;
			$(".lodleft,.lodright").css({"width":w+"px"});
			var scale=(percent-50)/100*2*2+1;
			$lodtit.css({
				"-webkit-transform":"scale("+scale+")"
				,"-moz-transform":"scale("+scale+")"
				,"-o-transform":"scale("+scale+")"
				,"transform":"scale("+scale+")"
				,"opacity":n
			});
		}

	}
	,loadEd:function(){
		var $lodtit=$(".lodtit"),$lodpar=highline.jq_lodpar;
		$lodpar.animate({"opacity":"0"},1000,function(){
			$(this).hide().remove();
		});

		

	}
}

function openFlinks(obj){
	var $obj=$(obj);
	var $p=$obj.parent();
	if($p.is(".flinks_sel")){
		$p.removeClass("flinks_sel");
	}else{
		$p.addClass("flinks_sel");
	}
}

//video
$.fn.videoAbo=function(){
	var vHtmla='<object width="800" height="450" id="FLVPlayera" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000">';
	vHtmla+='<param name="movie" value="./video/FLVPlayer_Progressive.swf">';
	vHtmla+='<param name="quality" value="high">';
	vHtmla+='<param name="wmode" value="transparent">';
	vHtmla+='<param name="scale" value="noscale">';
	vHtmla+='<param name="salign" value="lt">';
	vHtmla+='<param name="FlashVars" value="&amp;MM_ComponentVersion=1&amp;skinName=./video/Clear_Skin_2&amp;streamName=../flash/uc&amp;autoPlay=true&amp;autoRewind=false">';
	vHtmla+='<param name="swfversion" value="8,0,0,0">';
	vHtmla+='<!--[if !IE]>-->';
	vHtmla+='<object type="application/x-shockwave-flash" data="./video/FLVPlayer_Progressive.swf" width="800" height="450">';
	vHtmla+='<!--<![endif]-->';
	vHtmla+='<param name="quality" value="high">';
	vHtmla+='<param name="wmode" value="transparent">';
	vHtmla+='<param name="scale" value="noscale">';
	vHtmla+='<param name="salign" value="lt">';
	vHtmla+='<param name="FlashVars" value="&amp;MM_ComponentVersion=1&amp;skinName=./video/Clear_Skin_2&amp;streamName=../flash/uc&amp;autoPlay=true&amp;autoRewind=false">';
	vHtmla+='<param name="swfversion" value="8,0,0,0">';
	vHtmla+='<param name="expressinstall" value="./flash/uc.flv">';
	vHtmla+='<!--[if !IE]>-->';
	vHtmla+='</object>';
	vHtmla+='<!--<![endif]-->';
	vHtmla+='</param name="swfversion">';
	vHtmla+='</object>';
	var vHtmlb='<object width="800" height="450" id="FLVPlayerb" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000">';
	vHtmlb+='<param name="movie" value="./video/FLVPlayer_Progressive.swf">';
	vHtmlb+='<param name="quality" value="high">';
	vHtmlb+='<param name="wmode" value="transparent">';
	vHtmlb+='<param name="scale" value="noscale">';
	vHtmlb+='<param name="salign" value="lt">';
	vHtmlb+='<param name="FlashVars" value="&amp;MM_ComponentVersion=1&amp;skinName=./video/Clear_Skin_2&amp;streamName=../flash/video2&amp;autoPlay=true&amp;autoRewind=false">';
	vHtmlb+='<param name="swfversion" value="8,0,0,0">';
	vHtmlb+='<!--[if !IE]>-->';
	vHtmlb+='<object type="application/x-shockwave-flash" data="./video/FLVPlayer_Progressive.swf" width="800" height="450">';
	vHtmlb+='<!--<![endif]-->';
	vHtmlb+='<param name="quality" value="high">';
	vHtmlb+='<param name="wmode" value="transparent">';
	vHtmlb+='<param name="scale" value="noscale">';
	vHtmlb+='<param name="salign" value="lt">';
	vHtmlb+='<param name="FlashVars" value="&amp;MM_ComponentVersion=1&amp;skinName=./video/Clear_Skin_2&amp;streamName=../flash/video2&amp;autoPlay=true&amp;autoRewind=false">';
	vHtmlb+='<param name="swfversion" value="8,0,0,0">';
	vHtmlb+='<param name="expressinstall" value="./flash/video2.flv">';
	vHtmlb+='<!--[if !IE]>-->';
	vHtmlb+='</object>';
	vHtmlb+='<!--<![endif]-->';
	vHtmlb+='</param name="swfversion">';
	vHtmlb+='</object>';
	var vHtmlc='<object width="800" height="450" id="FLVPlayerb" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000">';
	vHtmlc+='<param name="movie" value="./video/FLVPlayer_Progressive.swf">';
	vHtmlc+='<param name="quality" value="high">';
	vHtmlc+='<param name="wmode" value="transparent">';
	vHtmlc+='<param name="scale" value="noscale">';
	vHtmlc+='<param name="salign" value="lt">';
	vHtmlc+='<param name="FlashVars" value="&amp;MM_ComponentVersion=1&amp;skinName=./video/Clear_Skin_2&amp;streamName=../flash/ucge&amp;autoPlay=true&amp;autoRewind=false">';
	vHtmlc+='<param name="swfversion" value="8,0,0,0">';
	vHtmlc+='<!--[if !IE]>-->';
	vHtmlc+='<object type="application/x-shockwave-flash" data="./video/FLVPlayer_Progressive.swf" width="800" height="450">';
	vHtmlc+='<!--<![endif]-->';
	vHtmlc+='<param name="quality" value="high">';
	vHtmlc+='<param name="wmode" value="transparent">';
	vHtmlc+='<param name="scale" value="noscale">';
	vHtmlc+='<param name="salign" value="lt">';
	vHtmlc+='<param name="FlashVars" value="&amp;MM_ComponentVersion=1&amp;skinName=./video/Clear_Skin_2&amp;streamName=../flash/ucge&amp;autoPlay=true&amp;autoRewind=false">';
	vHtmlc+='<param name="swfversion" value="8,0,0,0">';
	vHtmlc+='<param name="expressinstall" value="./flash/ucge.flv">';
	vHtmlc+='<!--[if !IE]>-->';
	vHtmlc+='</object>';
	vHtmlc+='<!--<![endif]-->';
	vHtmlc+='</param name="swfversion">';
	vHtmlc+='</object>';
	if(!is_pc()){
		vHtmla='<video class="v" src="./flash/uc.mp4" autoPlay controls></video>';
		vHtmlb='<video class="v" src="./flash/video2.mp4" autoPlay controls></video>';
		vHtmlc='<video class="v" src="./flash/ucge.mp4" autoPlay controls></video>';
	}
	var bo=0
		,numpos=800
		,time=200
		,$par=$(this)
		,$barLeft=$par.children(".left")
		,$barRight=$par.children(".right")
		,$ul=$par.children(".video").children("ul")
		,$tit_lis=$par.children(".tit").children("li");

	var ani=function(i){
		$ul.animate({"left":-i*numpos+"px"},time);
		i>0?$barLeft.show():"";
		i==0?$barLeft.hide():"";
		i<2?$barRight.show():"";
		i==2?$barRight.hide():"";
		$tit_lis.eq(i).addClass("current").siblings().removeClass("current");
		$par.find(".videodetail").empty();
		$(".video ul li").children("img").show();
		$(".video ul li").children("span").show();
	};
	$barRight.click(function(){
		if(bo) return;
		bo=1;
		var i=-parseInt($ul.css("left"))/numpos;
		i+1<=2? ani(i+1):"";
		setTimeout(function(){bo=0;},time+100);
	});
	$barLeft.click(function(){
		if(bo) return;
		bo=1;
		var i=-parseInt($ul.css("left"))/numpos;
		i-1>=0? ani(i-1):"";
		setTimeout(function(){bo=0;},time+100);
	});
	$tit_lis.click(function(){
		ani($(this).index());	
	})
	$(".video ul li span").each(function(i){
		$(this).click(function(){
			$(".video ul li").children("img").show();
			$(".video ul li").children("span").show();
			$(this).parent().children("img").hide();
			$(this).parent().children("span").hide();
			var v=null;
			switch(i){
				case 0:
				v=vHtmla;
				break;
				case 1:
				v=vHtmlb;
				break;
				case 2:
				v=vHtmlc;
				break;
			}
			$(this).parent().children(".videodetail").append(v);
		});
	});

};

function is_pc(){
// 其他类型的移动操作系统类型，自行添加
    var os = new Array("Android","iPhone","Windows Phone","iPod","iPad","BlackBerry","MeeGo","SymbianOS");  
    var info = navigator.userAgent;
    var len = os.length;
    for (var i = 0; i < len; i++) {
        if (info.indexOf(os[i]) > 0){
            return false;
        }
    }
    return true;
}
