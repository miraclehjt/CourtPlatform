<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/global.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/app/common.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/app/business.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/cp_common.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/app/common.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/app/business.js"></script>
<title>业务应用系统</title>
</head>
<body>

	<div class="icon-container">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/sjzx/fwqyxjk.css" />
<div class="left-col">
<p>服务器1</p>
<p>服务器2</p>
<p>服务器3</p>
<p>服务器4</p>
<p>服务器5</p>
<p>服务器6</p>
<p>服务器7</p>
<p>服务器8</p>
<p>服务器9</p>
<p>服务器10</p>
</div>
<div class="right-col"></div>
		<%-- <div class="icon-line">
			<div class="icon">
				<img src="${pageContext.request.contextPath}/images/icon/fyxt.png"/>
			</div>
			<div class="icon">
				<img src="${pageContext.request.contextPath}/images/icon/fyxt.png"/>
			</div>
			<div class="icon">
				<img src="${pageContext.request.contextPath}/images/icon/fyxt.png"/>
			</div>
			<div class="icon">
				<img src="${pageContext.request.contextPath}/images/icon/fyxt.png"/>
			</div>
			<div class="icon">
				<img src="${pageContext.request.contextPath}/images/icon/fyxt.png"/>
			</div>
			<div class="icon">
				<img src="${pageContext.request.contextPath}/images/icon/fyxt.png"/>
			</div>
		</div>
		<div class="icon-line">
			<div class="icon">
				<img src="${pageContext.request.contextPath}/images/icon/fyxt.png"/>
			</div>
			<div class="icon">
				<img src="${pageContext.request.contextPath}/images/icon/fyxt.png"/>
			</div>
			<div class="icon">
				<img src="${pageContext.request.contextPath}/images/icon/fyxt.png"/>
			</div>
			<div class="icon">
				<img src="${pageContext.request.contextPath}/images/icon/fyxt.png"/>
			</div>
			<div class="icon">
				<img src="${pageContext.request.contextPath}/images/icon/fyxt.png"/>
			</div>
		</div> --%>
	</div>







<div class="left-arrow" onclick="scroll_left()">
		<img src="${pageContext.request.contextPath}/images/arrow_left.png" />
	</div>
	<div class="btn-bar">
	
		<div class="btn-wrapper">
			<div class="index-btn unhovered" onclick="fold_models()">
				<div class="text">${menuContext.currentModel.name}</div>
			</div>
			<div class="index-btn-shadow"></div>
		</div>
		<div class="sbtns">
			<c:forEach items="${menuContext.subModels}" var="subModel" varStatus="status"> 
			<c:if test="${status.index%sessionScope.per_page == 0}">
				<div class="sbtn-group" data-page="${status.index/sessionScope.per_page}">
			</c:if>
			<div class="sbtn-wrapper">
				<div class="sbtn unhovered" onclick="show_sub_system('${subModel.c_url}',this)">
					<div class="text">${subModel.name}</div>
				</div>
				<div class="sbtn-shadow"></div>
			</div>
			<c:if test="${status.index%sessionScope.per_page == sessionScope.per_page-1}">
				</div>
			</c:if>
			</c:forEach>
		</div>
		
	</div>
	<div class="right-arrow" onclick="scroll_right()">
		<img src="${pageContext.request.contextPath}/images/arrow_right.png" />
	</div>
	<div class="board">
		<img src="${pageContext.request.contextPath}/images/board.png" />
	</div>
	<script type="text/javascript">
	function show_sub_system(url,e){
		$(".active").attr("class","sbtn unhovered");
		$(e).attr("class",$(e).attr("class")+" active");
		window.location.href="${pageContext.request.contextPath}/sjzx"+"/business";
	};
	var MODEL_COUNT = ${menuContext.subModels.size()};
	var PER_PAGE = ${sessionScope.per_page};
	var page_count = MODEL_COUNT%PER_PAGE == 0 ? MODEL_COUNT/PER_PAGE : (MODEL_COUNT/PER_PAGE+1);
	var cur_page = 0;
	$(".sbtn-group").css("width",200*PER_PAGE+"px");
	$("[data-page='"+cur_page+".0'] .sbtn-wrapper").animate({
		marginLeft:"0px"
	});
	isFold = 0;
	function scroll_left(){
		if(cur_page > 0 && !isFold){
			$(".sbtn-group").animate({
				marginLeft:"+="+200*PER_PAGE+"px"
			}); 
			cur_page--;
			for(var j = cur_page ; j < page_count ; j++){
				$("[data-page='"+j+".0']").css("margin-left","0");
			}
		}
	}
	function scroll_right(){
		if(cur_page < parseInt(page_count-1) && !isFold){
			var i = cur_page;
			for(var j = cur_page ; j>=0 ; j--){
				$("[data-page='"+j+".0']").animate({
					marginLeft:"-="+200*PER_PAGE+"px"
				}); 
			}
			cur_page++;
			for(var j = cur_page ; j < page_count ; j++){
				$("[data-page='"+j+".0']").css("margin-left","0");
			}
		}
	}
	var isFold = 0;
	function fold_models(){
		if(!isFold){
			$("[data-page='"+cur_page+".0'] .sbtn-wrapper").animate({
				marginLeft:"-="+200*PER_PAGE+"px"
			}); 
			isFold = 1;
		}else{
			$("[data-page='"+cur_page+".0'] .sbtn-wrapper").animate({
				marginLeft:"0px"
			});
			isFold = 0;
		}
	}
	</script>
</body>
</html>