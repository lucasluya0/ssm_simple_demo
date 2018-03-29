<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <% 
    String basePath=request.getContextPath();
    pageContext.setAttribute("basePath", basePath); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
 <script src="${basePath}/static/bootstrap-3.3.7/js/bootstrap.min.js"></script>
  <link href="${basePath}/static/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
<style>
	.base-row{
		height:50px;
	}
	*{
		font-size: 12px;
	}

</style>
<script type="text/javascript">
var _global_page_num;
function go_page(page){
	clear_table_source();
	$.ajax({
		 url: "${basePath}/user",
		 data:{"pn":page},
		 success: function(result){
			if(result.code == 100){
				console.log(result);
				var data=result.extend.pageInfo.list;
				$.each(data,function(index,obj){
					
					$dataTr=$("<tr></tr>").attr("mark",obj.uid);
					$dataTd1=$("<td></td>").text(obj.uname);
					$dataTd2=$("<td></td>").text(obj.uemail);
					$Td3delete=$("<button>删除</button>").addClass("btn btn-danger deteleBtn");
					$Td3update=$("<button>更新</button>").addClass("btn btn-warning updateBtn");
					$dataTd3=$("<td></td>").append($Td3delete).append("  ").append($Td3update);
					$dataTr.append($dataTd1).append($dataTd2).append($dataTd3);
					$("#maindata").append($dataTr);
				})
				_global_page_num=result.extend.pageInfo.pageNum;
				paging(result.extend.pageInfo);
				delete_record();
				update_record();
			}
		},
		});
}	
function paging(pageInfo){
	
	var _pageInfo=pageInfo.navigatepageNums;
	$pagingUl=$("<ul></ul>").addClass("pagination");
	$pagingLi1=$("<li></li>").append($("<a>&laquo;</a>"));
	$pagingUl.append($pagingLi1);
	$.each(_pageInfo,function(index,data){
		$span=$("<span></span>").text(data).addClass("page-num");
		$li=$("<li></li>").append($span);
		if(data ===  pageInfo.pageNum){
			$li.addClass("active");
		}
		$pagingUl.append($li);	
	})
	$pagingLi7=$("<li></li>").append($("<a>&raquo;</a>"));
	$pagingUl.append($pagingLi7);
	
	$("#maindata").after($pagingUl);
	go_page_num();
}
function go_page_num(){
	
	$(".table .pagination").find(".page-num").on("click", function() {
		var page_num=$(this).text();
		var _page_num=parseInt(page_num);
		go_page(_page_num);
	})
}
function clear_table_source(){
	
	$(".table #maindata tr").remove();
	$(".table ul").remove();
	$(".table ul li").removeClass("active");
}
function delete_record(){
	$(".table #maindata tr").find(".deteleBtn").on("click",function(){
		var _mark=$(this).parents().parents().attr("mark");
		if(confirm("确认删除吗？")){
			$.ajax({
				 url: "${basePath}/deleteUser/"+_mark,
				 type:"post",
				 data:{
					 _method:"delete",
				 },
				 success: function(result){
					if(result.code == 100){
						console.log("当前页"+_global_page_num);
						go_page(_global_page_num);
					}
				},
				});
		}
	})
}
function update_div(){
	var $div=$("<div id='myModal'></div>").addClass("modal fade");
	$form=$('<form class="form-horizontal formdata"></form>');
	
	$input1=$("<div class='controls'><input id='username' name='uname' type='text' /></div>");
	$div1=$("<div class='control-group'><label class='control-label' for='username'>用户名：</label></div>").append($input1);
	
	$input2=$("<div class='controls'><input id='inputEmail' name='uemail' type='text' /></div>");
	$div2=$("<div class='control-group'><label class='control-label' for='inputEmail'>邮     箱：</label></div>").append($input2);
	
	$div_body=$("<div class='modal-body'></div>");
	$subBtn=$("<button class='submitBtn'>提交</button>");
	$div_footer=$("<div class='modal-footer'></div>").append($subBtn);
	$form.append($div1).append($div2);
	$div_body.append($form);
	
	$content_div=$("<div></div>").addClass("modal-content").append($div_body).append($div_footer);
	
	$main_div = $("<div></div>").addClass('modal-dialog').append($content_div);
		
	$div.append($main_div);
	
	$("body").append($div);
}
function update_record(){
	update_div();
	var _mark;
	$(".table #maindata tr").find(".updateBtn").on("click",function(){
		$('#myModal').modal('show');
		_mark=$(this).parents().parents().attr("mark");
	})
	$(".submitBtn").on("click",function(){
		if(confirm("确定修改吗？")){
			$.ajax({
				 url: "${basePath}/updateUser/"+_mark+"?_method=put",
				 type:"post",
				 data:$(".formdata").serialize(),
				 success: function(result){
					if(result.code == 100){
						$('#myModal').modal('hide');
						go_page(_global_page_num);
					}
				},
				});
		}
		
	})
}

go_page(1);
</script>
</head>
<body>
<div class="container">
  <div class="base-row" style="display:flex;line-height:50px;">
  </div>
  <div class="base-row"></div>
  <div class="row">
  <div class="col-md-2"></div>
  <div class="col-md-8">
  
  <table class="table">
  	<thead>
  		<tr>
	  		<th>用户名</th>
	  		<th>邮    箱</th>
	  		<th>操    作</th>
  		</tr>
  	</thead>
  	<tbody id="maindata">
  	
  	</tbody>
  
  </table>
  </div>
  <div class="col-md-2"></div>
</div>
</div>
	
</body>
</html>