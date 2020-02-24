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
<title>添加目录</title>
<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span>
	新增目录
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<article class="page-container">
	<form class="form form-horizontal" id="form-admin-add">
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3">*目录名称：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" style="width:250px" class="input-text" value="" placeholder="不超过100字" id="contentsName" name="contentsName">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3">同级目录排序：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="number" class="input-text" value="1" placeholder="1" id="contentsSerial" name="contentsSerial">
		</div>
	</div>
		<div class="row c1">
			<label class="form-label col-xs-4 col-sm-3">*选择法规类型：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box" style="width: 30%">
			<select  class="select" id="statutestypeId" name="statutestypeId" >
				<option>请选择</option>
			</select></span>
			</div>
		</div>
		<br><br>
		<div class="row c1">
			<label class="form-label col-xs-4 col-sm-3">*选择类型分支：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box" style="width: 30%">
			<select  class="select" id="statutesplitId" name="statutesplitId" >
				<option>请选择</option>
			</select></span>
			</div>
		</div>
		<br><br>
		<div class="row c1">
			<label class="form-label col-xs-4 col-sm-3">*选择所属法规：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box" style="width: 30%">
			<select  class="select" id="statuteId" name="staId" >
				<option>请选择</option>
			</select></span>
			</div>
		</div>
		<br><br>
		<div class="row c1">
			<label class="form-label col-xs-4 col-sm-3">*选择父级目录：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box" style="width: 30%">
			<select  class="select" id="contentsId" name="conId" >
				<option>请选择</option>
				<option value="0">无</option>
			</select></span>
			</div>
		</div><br><br>

	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;新增目录&nbsp;&nbsp;">
		</div>
	</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去--> 
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script> 
<script type="text/javascript">
$(function(){
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
		$("#contentsId option").slice(2).remove();
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
		$("#contentsId option").slice(2).remove();
		$.getJSON('getAllStatutes',{'statutestypeId':statutestypeId,'statutesplitId':statutesplitId},function (data) {
			if(data!=null){
				for(var i=0;i<data.length;i++){
					$("#statuteId").append(
							"<option value='"+data[i].statuteId+"'>"+data[i].statuteName+"</option>"
					)
				}
			}
		})
	});

	/*根据法规加载目录*/
	$("#statuteId").change(function () {
		var statutestypeId=$("#statutestypeId").val();
		var statutesplitId=$("#statutesplitId").val();
		var staId=$("#statuteId").val();
		$("#contentsId option").slice(2).remove();
		$.getJSON('getAllContentsByStatuteId',{'contentsLevel':1,'staId':staId},function (data) {
			if (data != null) {
				for (var i = 0; i < data.length; i++) {
					$("#contentsId").append(
							"<option value='"+data[i].contentsId+"' conid='"+data[i].contentsId+"' id='"+data[i].contentsId+"'>"+data[i].contentsName+"</option>"
					)
				}
			} else {
				return
			}
			$('#contentsId option').each(function (i) {//遍历tr
				var conId = $(this).attr('conid');
				$.getJSON('getAllContentsByStatuteId', {
					'contentsLevel': 2,
					'conId': conId,
					'staId': staId
				}, function (data) {
					if (data != null) {
						for (var i = data.length - 1; i >= 0; i--) {
							$("#" + conId).after(
									"<option value='"+data[i].contentsId+"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + data[i].contentsName + "</option>"
							)
						}
					}
				})
			});
		})
	});



			$('.skin-minimal input').iCheck({
				checkboxClass: 'icheckbox-blue',
				radioClass: 'iradio-blue',
				increaseArea: '20%'
			});

			$("#form-admin-add").validate({
				rules: {
					contentsName: {
						required: true,
						minlength: 1,
						maxlength: 101
					},
				},
				onkeyup: false,
				focusCleanup: true,
				success: "valid",
				submitHandler: function (form) {
					$(form).ajaxSubmit({
						type: 'post',
						url: "addContents",
						success: function (data) {
							layer.msg('添加成功!', {icon: 1, time: 1000});
						},
						error: function (XmlHttpRequest, textStatus, errorThrown) {
							layer.msg('添加失败!', {icon: 2, time: 1000});
						}
					});
					var index = parent.layer.getFrameIndex(window.name);
					parent.$('.btn-refresh').click();
					parent.layer.close(index);
				}
			})
		})
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>