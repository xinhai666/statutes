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
<title>修改目录</title>
<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span>
	修改目录
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<article class="page-container">
	<input type="button" class="btn" onclick="history.go(-1)" value="&nbsp;返 回&nbsp;" /></span>
	<input type="hidden" id="staId" value="${contents.staId!}">
	<input type="hidden" id="conId" value="${contents.conId!}">
	<form class="form form-horizontal" id="form-contents-update">
		<input type="hidden" name="contentsId" value="${contents.contentsId!}">
		<input type="hidden" name="contentsLevel" value="${contents.contentsLevel!}">
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3">*目录名称：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" style="width:250px" class="input-text" value="${contents.contentsName!}" placeholder="不超过100字" id="contentsName" name="contentsName">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3">*同级目录排序：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="number" class="input-text" value="${contents.contentsSerial!}" id="contentsSerial" name="contentsSerial">
		</div>
	</div>
	<div class="row c1">
		<label class="form-label col-xs-4 col-sm-3">*选择所属法规：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<span class="select-box" style="width: 30%">
		<select  class="select" id="statuteId" name="staId" >
			<option value="">请选择</option>
		</select></span>
		</div>
	</div>
	<br><br>
	<div class="row c1">
		<label class="form-label col-xs-4 col-sm-3">*选择父级目录：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<span class="select-box" style="width: 30%">
		<select  class="select" id="contentsId" name="conId" >
			<option value="0">无</option>
		</select></span>
		</div>
	</div><br><br>

	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;保存修改&nbsp;&nbsp;">
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
	/*加载法规*/
	$.post('checkStatuteByName',function (data) {
		var staId=$("#staId").val();
		if(data!=null){
			for(var i=0;i<data.length;i++){
				var html="";
				if(data[i].statuteId==staId){
					html+="<option selected value='"+data[i].statuteId+"'>"+data[i].statuteName+"</option>"
				}else {
					html+="<option value='"+data[i].statuteId+"'>"+data[i].statuteName+"</option>"
				}
				$("#statuteId").append(html);
			}
		}
		getContents();//加载目录
	},'json');

	/*根据法规加载目录*/
	$("#statuteId").change(function () {
		getContents();
	})

	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});

	$("#form-contents-update").validate({
		rules: {
			contentsName: {
				required: true,
				minlength: 1,
				maxlength: 101
			},
			staId: {
				required: true,
			},
		},
		onkeyup: false,
		focusCleanup: true,
		success: "valid",
		submitHandler: function (form) {
			$(form).ajaxSubmit({
				type: 'post',
				url: "updateContents",
				success: function (data) {
					layer.msg('修改已保存!', {icon: 1, time: 1000});
				},
				error: function (XmlHttpRequest, textStatus, errorThrown) {
					layer.msg('保存数据异常!', {icon: 2, time: 1000});
				}
			});
		}
	})
});
//加载目录事件
function getContents() {
	var staId=$("#statuteId").val();
	$("#contentsId option").slice(1).remove();
	$.getJSON('getAllContentsByStatuteId',{'contentsLevel':1,'staId':staId},function (data) {
		for (var i = 0; i < data.length; i++) {
			var html="";
			if(data[i].contentsId==$("#conId").val()){
				html+="<option selected value='"+data[i].contentsId+"' conid='"+data[i].contentsId+"' id='"+data[i].contentsId+"'>"+data[i].contentsName+"</option>"
			}else {
				html += "<option value='" + data[i].contentsId + "' conid='" + data[i].contentsId + "' id='" + data[i].contentsId + "'>" + data[i].contentsName + "</option>"
			}
			$("#contentsId").append(html);
		}
		$('#contentsId option').each(function () {//遍历tr
			var conId = $(this).attr('conid');
			$.getJSON('getAllContentsByStatuteId', {
				'contentsLevel': 2,
				'conId': conId,
				'staId': staId
			}, function (data) {
				if (data != null) {
					for (var i = data.length - 1; i >= 0; i--) {
						var html2="";
						if(data[i].contentsId==$("#conId").val()){
							html2+="<option selected value='"+data[i].contentsId+"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + data[i].contentsName + "</option>"
						}else {
							html2 += "<option value='" + data[i].contentsId + "'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + data[i].contentsName + "</option>"
						}
						$("#" + conId).after(html2);
					}
				}
			})
		});
	})
}
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>