<!DOCTYPE HTML>
<html>
<head>
	<meta charset="utf-8">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
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
	<title>法规管理</title>
</head>
<body>

<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span>
	法规列表
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>

<div class="page-container">
<div >
	<div class="text-a">
		法规类型：<select  class="input-text" style="width:250px" id="statutestypeId" name="statutestypeId" >
			<option value="0">请选择</option>
		</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		所属分支：<select  class="input-text" style="width:250px" id="statutesplitId" name="statutesplitId" >
			<option value="0">请选择</option>
			</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value="确 定" class="btn" onclick="getAll()">
	</div>
	<div class="row">
		<div class="col-md-6 col-md-offset-10">
			<a href="articleadd"><button type="button" class="btn btn-primary"><i class="Hui-iconfont">&#xe600;</i>新增法规</button></a>
		</div>
	</div>
	<br/>
	<div class="mt-15">
		<table class="table table-border table-bordered table-hover table-bg table-sort" id="stabs">
			<thead>
			<tr class="text-c">
				<th >部号</th>
				<th >法规部号别名</th>
				<th >版本号</th>
				<th >法规名称</th>
				<th >法规类型</th>
				<th >所属分支</th>
				<th>前台显示</th>
				<th>操作</th>
			</tr>
			</thead>
		</table>
	</div>
</div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top: 20vh;">
	<div class="modal-dialog">
		<form class="form form-horizontal" id="form-statype-add">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" align="center">此操作会同时删除该法规的所有目录和条款且不可恢复！确认请输入"OK"</h4>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"></label>
					<div class="formControls col-xs-8 col-sm-9">
						<input style="width: 60%" class="input-text" id="del_verify">
						<p></p>
					</div>
				</div>
				<div class="modal-footer">
					<p align="center">
						<input class="btn btn-primary radius" type="button" id="verify" value="&nbsp;&nbsp;确 认&nbsp;&nbsp;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" id="closemodel" class="btn btn-primary radius" data-dismiss="modal" value="&nbsp;&nbsp;取 消&nbsp;&nbsp;"></input>
					</p>
				</div>
			</div>
		</form>
	</div>
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

	function getAll(){
		$(".table-sort").dataTable().fnDestroy();//还原初始化了datatable
		var statutestypeId=$("#statutestypeId").val();
		var statutesplitId=$("#statutesplitId").val();
		$("#stabs tr").slice(1).remove();
		$.getJSON('getAllStatutes',{'statutestypeId':statutestypeId,'statutesplitId':statutesplitId},function (data) {
			if(data!=null){
				for(var i=0;i<data.length;i++) {
					var statuteReveal = '显示';
					if (data[i].statuteReveal == 0) {
						statuteReveal = '不显示';
					}
					var statutestypeName=data[i].statutestypeName;
					if(statutestypeName==undefined){
						statutestypeName='无';
					}
					var statutesplitName=data[i].statutesplitName;
					if(statutesplitName==undefined){
						statutesplitName='无';
					}
					$("#stabs").append(
							"<tr class='text-c'><td>"
							+ data[i].statutePartno + "</td><td>"
							+ data[i].statuteAlias + "</td><td>"
							+ data[i].statuteVersion + "</td><td>"
							+ data[i].statuteName + "</td><td>"
							+ statutestypeName + "</td><td>"
							+ statutesplitName + "</td><td>"
							+ statuteReveal+"</td><td>"
							+ "<a title='编辑' href='getStatuteById?statuteId="+data[i].statuteId+"'>编辑</a>"
							+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a data-target='#myModal' data-toggle='modal' href='javascript:;'>删除</a>"
							+ "</td></tr>"
					)
				}
			}
			$('.table-sort').dataTable({
				"aaSorting": [[ 1, "asc" ]],//默认第几个排序
				"bStateSave": true,//状态保存
				"aoColumnDefs": [
					//{"bVisible": false, "aTargets": [ 3 ]}, //控制列的隐藏显示
					{"orderable":false,"aTargets":[7]}// 制定列不参与排序
				]
			});
		});
	}

	$(function () {
		/*加载法规*/
		getAll();
		/*获得所有法规类型*/
		$.getJSON('getAllStatype',function (data) {
			if(data!=null){
				for(var i=0;i<data.length;i++){
					$("#statutestypeId").append(
							"<option value='"+data[i].statutestypeId+"'>"+data[i].statutestypeName+"</option>"
					)
				}
			}
		});
		/*根据法规类型加载该类型所有主分支*/
		$("#statutestypeId").change(function () {
			$("#statutesplitId option").slice(1).remove();
			var statutestypeId=$("#statutestypeId").val();
				$.getJSON('getAllStaSplit',{'statutestypeId':statutestypeId},function (data) {
					if(data!=null){
						for(var i=0;i<data.length;i++){
							$("#statutesplitId").append(
									"<option value='"+data[i].statutesplitId+"'>"+data[i].statutesplitName+"</option>"
							)
						}
					}
				})
		});
	 });

	/*-删除*/
	$("#verify").click(function () {
		var verify = $("#del_verify").val().trim();
		if (verify == 'ok' || verify == 'OK') {
			$.ajax({
				type: 'POST',
				url: 'delStatuteById',
				data: {'statuteId': id},
				success: function (data) {
					$(obj).parents("tr").remove();
					layer.msg('已删除!', {icon: 1, time: 1000});
					$("#closemodel").click();
				},
				error: function (data) {
					layer.msg('删除失败!', {icon: 2, time: 1000});
					console.log(data.msg);
				},
			});
		} else {
			layer.msg('未输入"OK",删除操作已取消！', {icon: 2, time: 2000});
			$("#closemodel").click();
		}
	})

	//  function statute_del(obj,id){
	// 	layer.confirm('确认要删除吗？',function(index){
	// 		$.ajax({
	// 			type: 'POST',
	// 			url: 'delStatuteById',
	// 			data:{'statuteId':id},
	// 			success: function(data){
	// 				$(obj).parents("tr").remove();
	// 				layer.msg('已删除!',{icon:1,time:1000});
	// 			},
	// 			error:function(data) {
	// 				layer.msg('删除失败!',{icon:2,time:1000});
	// 				console.log(data.msg);
	// 			},
	// 		});
	// 	});
	// }
</script>
</body>
</html>