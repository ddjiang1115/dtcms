

/*����������ö���--�����Ժ���˾ͽ����*/
function getElementsByClassName(searchClass, node,tag){  
	if(document.getElementsByClassName){return  document.getElementsByClassName(searchClass)}
	else{        
		node = node || document;        
		tag = tag || "*";        
		var classes = searchClass.split(" "),        
		elements = (tag === "*" && node.all)? node.all : node.getElementsByTagName(tag),        
		patterns = [],         
		returnElements = [],        
		current,         
		match;        
		var i = classes.length;       
		while(--i >= 0){patterns.push(new RegExp("(^|\\s)" + classes[i] + "(\\s|$)"));}        
		var j = elements.length;       
		while(--j >= 0){            
			current = elements[j];           
			match = false;            
			for(var k=0, kl=patterns.length; k<kl; k++){                
				match = patterns[k].test(current.className);                
				if (!match)  break;           
			} 
			if (match)  returnElements.push(current);        
		}        
		return returnElements;   
	} 
}

/*ͨ�ü��غ�����ҳ�������Ҫ�õ�onload�����ڴ���һ����ʱ��ִ�еĴ��룬����ֱ����ӵ���������������������onload������ִ�г�ͻ
  �������ĵ��÷�����addLoadEvent(new Function("refurFrame('���ʹ���');"));
*/
function addLoadEvent(func){
	var oldonload=window.onload;
	if(typeof window.onload!='function'){
		window.onload=func;	
	}
	else{
		window.onload=function(){
			oldonload();
			func();
		}	
	}
}

/*�ж��Ƿ���className�ĺ�������������Ϊ��o.className=o.addClass(o,"normal");*/
function hasClass(element, className) {  
	var reg = new RegExp('(\\s|^)'+className+'(\\s|$)');     
	return element.className.match(reg); 
} 
/*��̬���className�ĺ�������������Ϊ��addClass(document.getElementById("test"), "test");*/
function addClass(element, className) {  
	if (!this.hasClass(element, className)){   
		element.className += " "+className;/*����ж����ʽ���ӣ��������ַ�ʽ����class="style1 style2"*/
		/*element.className = className; */ 
	} 
}  
/*��̬ɾ��className�ĺ�������������Ϊ��removeClass(document.getElementById("test"), "test") */
function removeClass(element, className) {     
	if (hasClass(element, className)){ 
		var reg = new RegExp('(\\s|^)'+className+'(\\s|$)');         
		element.className = element.className.replace(reg,' ');     
	} 
} 
/*��ȡ��һ���ӽڵ�ĺ���������FF*/
function getFirstChild(obj){
	var firstDIV;
	for (i=0; i<obj.childNodes.length; i++){
		if (obj.childNodes[i].nodeType==1){
			firstDIV=obj.childNodes[i];
			return firstDIV;
		}
		else 
			continue;
	}
}

addLoadEvent(new Function("hovermenu('level1','level2','hove','cur');"));
//menu����˵��ܵ�ID����
//level1����һ���˵���ĸ�������level2��������˵���ĸ�������
//�������������style1,style2,style3�ֱ����������룬�Ƴ����������̬��ʽ��
addLoadEvent(new Function("submenu('level2','hove1','hove1');"));

/*���������˵��б�*/
var temp;
var temp1;
function hovermenu(cssName1,cssName2,style2,style3){ 
    var ArrLinks=getElementsByClassName(cssName1);//һ���˵�������������
	var ArrLevel = new Array();//��һ���˵�������
	for(var i=0;i<ArrLinks.length;i++){
		var curobj= getFirstChild(ArrLinks[i]);//��õ�һ���Ӷ���		    		
		ArrLevel.push(curobj);		
	}
    var ArrDivs=getElementsByClassName(cssName2);//�����˵��ĸ��������飬Ҫ��ʾ�Ķ����˵�����
    for(var i=0;i<ArrLinks.length;i++){        
        var obj=getFirstChild(ArrLinks[i]);//��õ�һ���Ӷ���
        obj.index=i
        obj.onmouseover= function(){overme(this,ArrLevel,style2,temp)};           
        obj.onmouseout=function(){outme(this,ArrLevel,style2,temp)};
		obj.onclick=function(){clickme(this,ArrLinks,ArrDivs,style2,style3,temp)};
		obj.onfocus=function(){this.blur()};//ȥ�����߿�
    }    
}
//�����˵����¼�
function submenu(cssName2,style2,style3){ 
    var ArrLinks=getElementsByClassName(cssName2);//һ���˵�������������
	var ArrLevel = new Array();//��һ���˵�������
	for(var i=0;i<ArrLinks.length;i++){
		var sublinks= ArrLinks[i].getElementsByTagName('A');//��õ�һ���Ӷ���
		for(var m=0;m<sublinks.length;m++){
			ArrLevel.push(sublinks[m]);
		}   		
	}	
    for(var i=0;i<ArrLevel.length;i++){        
        var obj=ArrLevel[i];
        obj.index=i
        obj.onmouseover= function(){overme(this,ArrLevel,style2,temp1)};           
        obj.onmouseout=function(){outme(this,ArrLevel,style2,temp1)};
		obj.onclick=function(){subclick(this,ArrLevel,style2,style3,temp1)};
		obj.onfocus=function(){this.blur()};//ȥ�����߿�
    }    
}
function overme(o,links,style2,state){
	if (state!=o.index){	    
		addClass(o,style2);						
    }
}
function outme(o,links,style2,state){
	if (state!=o.index){
		removeClass(o,style2);	    				
	};
}
//һ���˵�����¼�
function clickme(o,links,divs,style2,style3,state){
	//Ҫ�ж��Ƿ����Ӳ˵���
	var objUl=links[o.index].getElementsByTagName('UL');
	var subNum=objUl.length;//�Ƿ��ж����˵���0Ϊ�ޣ�����0Ϊ��;
	if (state!=o.index){		
	    for(var i=0;i<divs.length;i++){ 
		    if(subNum>0){//������ڶ����˵����������
				divs[i].style.display="none";
				//closeObj(divs[i]);
			}											
	    }		
	    if(subNum>0){//������ڶ����˵����ʾ��ǰ����Ķ����˵�
	      objUl[0].style.display="block";
		  showObj(objUl[0]);
		}		
        temp=o.index;
    }	
	for(var i=0;i<links.length;i++){
		var curobj= getFirstChild(links[i]);//��õ�һ���Ӷ���		    		
		removeClass(curobj,style3);
		removeClass(curobj,style2);
	}								
	addClass(o,style3);
}
//�����˵�����¼�
function subclick(o,links,style2,style3,state){
	if (state!=o.index){
		for(var i=0;i<links.length;i++){
			removeClass(links[i],style2);	
		}
		temp1=o.index;		
	    addClass(o,style2);	
	}
}

//������ʾ
var flag=0;
function showObj(obj){
	var allhight;
	allhight=obj.getElementsByTagName("li").length*26;//26Ϊÿ���˵���ĸ߶ȣ�������������˵����ܸ߶ȡ�
   obj.style.height="1px";   
   var changeW=function(){ 	 		
	  var obj_h=parseInt(obj.style.height);
	  if(obj_h<=allhight){ 
		obj.style.height=(obj_h+Math.ceil((allhight-obj_h)/10))+"px";
	  }
	  else{ 
	  clearInterval(bw1);
	  }
   }       
   bw1= setInterval(changeW,40);//ʱ�俪��
   if(flag>0){
	 clearInterval(bw2);
   }
}
//����ر�
function closeObj(obj){	
   flag++;       
   var closeDiv=function(){	   		 
	  clearInterval(bw1);
	  var obj_h=parseInt(obj.style.height);
	  if(obj_h>1){ 
			 obj.style.height=(obj_h-Math.ceil(obj_h)/100)+"px";
	  }
	  else{
	  clearInterval(bw2);
	  obj.style.display="none";
	  }
   }         
  bw2= setInterval(closeDiv,1);
  //alert(flag)
}