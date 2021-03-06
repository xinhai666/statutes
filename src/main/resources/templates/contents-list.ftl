﻿<!DOCTYPE HTML>
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
	<title>法规目录管理</title>
</head>
<body>

<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span>
	法规目录列表
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>

<div class="page-container">
<div >
	<div class="text-a">
		法规类型：<select  class="input-text" style="width:150px" id="statutestypeId" name="statutestypeId" >
			<option value="0">请选择</option>
		</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		所属分支：<select  class="input-text" style="width:150px" id="statutesplitId" name="statutesplitId" >
			<option value="0">请选择</option>
			</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		法规名：<select  class="input-text" style="width:250px" id="statuteId" name="statuteId" >
			<option value="0">请选择</option>
		</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value="确 定" class="btn" onclick="getAll()">
	</div>
	<br>
	<div class="row">
		<div class="col-md-6 col-md-offset-10">
			<a href="addContentsPage"><button type="button" class="btn btn-primary"><i class="Hui-iconfont">&#xe600;</i>新增目录</button></a>
		</div>
	</div>
	<br/>
	<div class="mt-15">
		<table class="table table-border table-bordered table-hover table-bg table-sort">
			<thead>
			<tr class="text-c">
				<th >目录名称</th>
				<th >排序</th>
				<th>操作</th>
			</tr>
			</thead>
			<tbody id="contsTap">

			</tbody>
		</table>
	</div>
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
		var staId=$("#statuteId").val();
		$("#contsTap tr").slice(0).remove();
		/****************/
		$.ajax({
			url: "getAllContentsByStatuteId",
			type: "POST",
			dataType: "json",
			async: false, // 设置为false发送同步请求，true发送异步请求
			data: {
				'contentsLevel':1,
				'staId':staId
			}, success:function(data) {
				if(data!=null){
					for(var i=0;i<data.length;i++) {
						$("#contsTap").append(
								"<tr class='text-c' conid='"+data[i].conId+"' id="+data[i].contentsId+"><td onclick='subdirectory(this,"+data[i].contentsId+")' style='text-align:left'><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>"
								+"<span spid="+data[i].contentsId+">＋</span>"+ data[i].contentsName + "</td><td>"
								+ data[i].contentsSerial + "</td><td>"
								+ "<a title='编辑' href='updateContentsPage?contentsId="+data[i].contentsId+"'>编辑</a>"
								+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a title='删除' href='javascript:;' onclick='content_del(this," + data[i].contentsId + ")'>删除</a>"
								+ "</td></tr>"
						)
					}
				}
			},
			error: function(xhr) {
				layer.msg('请求数据失败!',{icon:2,time:1000});
			}
		});
		$('.table-sort').dataTable({
			"bStateSave": true,//状态保存
			"ordering": false, // 禁止排序
		});
	}

	function subdirectory(obj,id){
		//obj.onclick=null;
		obj.removeAttribute("onclick");
		$(".table-sort").dataTable().fnDestroy();//还原初始化了datatable
		var staId=$("#statuteId").val();
		$("tr[conid="+id+"]").remove();
		$("span[spid="+id+"]").html(" ");
		$.getJSON('getAllContentsByStatuteId',{'conId':id,'staId':staId},function (data) {
			for(var i=data.length-1;i>=0;i--) {
				var blanks="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
				if(data[i].conId==id){
					$("span[spid="+id+"]").html("－");
				}
				for(var j=0;j<data[i].contentsLevel;j++){
					blanks=blanks+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
				}
				$(obj).parents("tr").after(
						"<tr class='text-c' conid='"+id+"' staId='"+data[i].contentsId+"'><td onclick='subdirectory(this,"+data[i].contentsId+")' style='text-align: left'><span>"+blanks+"</span>"
						+ "<span spid="+data[i].contentsId+">＋</span>"+data[i].contentsName + "</td><td>"
						+ data[i].contentsSerial + "</td><td>"
						+ "<a title='编辑' href='updateContentsPage?contentsId="+data[i].contentsId+"'>编辑</a>"
						+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a title='删除' href='javascript:;' onclick='content_del(this," + data[i].contentsId + ")'>删除</a>"
						+ "</td></tr>"
				)
			}
			$('.table-sort').dataTable({
				"bStateSave": true,//状态保存
				"ordering": false, // 禁止排序
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
			$("#statuteId option").slice(1).remove();
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
		/*根据法规主分支加载法规*/
		$("#statutesplitId").change(function () {
			var statutestypeId=$("#statutestypeId").val();
			var statutesplitId=$("#statutesplitId").val();
			$("#statuteId option").slice(1).remove();
			$.getJSON('getAllStatutes',{'statutestypeId':statutestypeId,'statutesplitId':statutesplitId},function (data) {
				if(data!=null){
					for(var i=0;i<data.length;i++){
						$("#statuteId").append(
								"<option value='"+data[i].statuteId+"'>"+data[i].statuteName+"</option>"
						)
					}
				}
			})
		})
	});

	/*-删除*/
	function content_del(obj,id){
		layer.confirm('确认要删除吗？',function(index){
			$.ajax({
				type: 'POST',
				url: 'delContents',
				data:{'contentsId':id},
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