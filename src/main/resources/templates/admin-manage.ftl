<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>管理员列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 管理员管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 
		<form id="addAdminForm">
				*管理员姓名：<input name="adminName" id="adminName" class="input-text" style="width:200px" value="" placeholder="不超过100个字"/>&nbsp;&nbsp;&nbsp;
				*管理员手机号：<input name="adminPhone" id="adminPhone" class="input-text" style="width:200px" value="" placeholder="不超过100个字"/>&nbsp;&nbsp;&nbsp;
				*密码：<input name="password" id="password" class="input-text" style="width:200px" value="" placeholder="不超过100个字"/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn" id="subt" value="新增管理员" width="100px"/>
		</form>
		<br>
	</div>
	<table class="table table-border table-bordered table-bg">
		<thead>
			<tr class="text-c">
				<th width="60">手机</th>
				<th width="50">姓名</th>
				<th width="50">添加日期</th>
				<th width="30">操作</th>
			</tr>
		</thead>
		<tbody id="admtb">
			
		</tbody>
	</table>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
	$(function () {
		//加载所有管理员
		getAdmins();

		//添加管理员
		$("#subt").click(function () {
			var adminName=$("#adminName").val().trim();
			var adminPhone=$("#adminPhone").val().trim();
			var password=$("#password").val().trim();
			if(adminName==null||adminName==''){
				alert("请输入管理员名");
				return;
			}
			var pattern = /^1[34578]\d{9}$/;
			if(!pattern.test(adminPhone)) {
				alert("请输入正确的手机号");
				return;
			}
			if(password==null||password==''){
				alert("请输入密码");
				return;
			}
			var formData = {};
			var t = $('#addAdminForm').serializeArray();
			$.each(t, function() {
				formData[this.name] = this.value;
			});
			$.ajax({
				type : "post",
				url : "addAdmin",
				data : formData,
				success : function(data) {
					$("#admtb").empty();
					getAdmins();
					layer.msg('添加完成!',{icon:1,time:1000});
				},
				error : function() {
					layer.msg('操作失败!',{icon:1,time:1000});
				}
			});
		})
	});

	//加载所有管理员
	function getAdmins() {
			$.ajax({
				url:'getAllAdmin',
				dataType: 'json',
				success:function (data) {
					for(var i=0;i<data.length;i++){
						$("#admtb").append(
								"<tr class='text-c'><td >"+data[i].adminPhone+"</td>"
								+"<td>"+data[i].adminName+"</td>"
								+"<td >"+data[i].adminCreatetime+"</td>"
								+"<td><a title='编辑' href='javascript:;' onclick='admin_up(this," + data[i].adminId + ")'>编辑</a>"
								+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a title='删除' href='javascript:;' onclick='admin_del(this," + data[i].adminId + ")'>删除</a>"
								+ "</td></tr>"
						)
					}
				},
				error:function (data) {
					layer.msg('加载数据失败!',{icon:1,time:1000});
				}
			})
	}

/*管理员-删除*/
function admin_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'delAdminById',
			data:{'adminId':id},
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}
</script>
</body>
</html>