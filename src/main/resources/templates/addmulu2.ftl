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
	<style type="text/css">
		.select_box {width:65%; position:relative; margin:0px;padding:0; font-size:12px;}
		.submit_box {width:180px; position:relative; margin:10px;padding:0; font-size:12px; text-align:center;}
		ul,li {list-style-type:none; padding:0; margin:0}
		.select_box input {cursor:pointer; display:block; line-height:25px; width:100%; height:25px; overflow:hidden;border:1px solid #ccc; padding-right:20px; padding-left:10px; background:url(select_input_bg.gif) no-repeat 160px center;}
		.select_box ul {width:180px; position:absolute; left:0; top:25px; border:1px solid #ccc; background:#fff; overflow: hidden;display:none; background:#ebebeb; z-index:99999;}
		.select_box ul li {display:block;height:30px;overflow:hidden;line-height:30px;padding-left:5px;width:100%;cursor:pointer;}
		.hover {background:#ccc;}
	</style>
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
			<div class="select_box formControls col-xs-8 col-sm-9" style="margin-left: 15px">
				<input class="select-box" id="myselect" value="" readonly="readonly" placeholder="请选择" style="width: 34%;height: 30px">
				<ul class="select_ul" style="display: none;">
					<li>请选择</li>
				</ul>
			</div>
		</div><br><br>
<#--		<div class="row c1">-->
<#--			<label class="form-label col-xs-4 col-sm-3">*选择父级目录：</label>-->
<#--			<div class="formControls col-xs-8 col-sm-9">-->
<#--				<span class="select-box" style="width: 30%">-->
<#--			<select  class="select" id="contentsId" name="conId" >-->
<#--				<option>请选择</option>-->
<#--				<option value="0">无</option>-->
<#--			</select></span>-->
<#--			</div>-->
<#--		</div><br><br>-->

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
							"<option onmouseover='subdirectory(this,"+data[i].contentsId+")' value='"+data[i].contentsId+"' conid='"+data[i].conId+"' id='"+data[i].contentsId+"'>"+data[i].contentsName+"</option>"
					)
				}
			}
			// $('#contentsId option').each(function (i) {//遍历tr
			// 	var conId = $(this).attr('conid');
			// 	$.getJSON('getAllContentsByStatuteId', {
			// 		'contentsLevel': 2,
			// 		'conId': conId,
			// 		'staId': staId
			// 	}, function (data) {
			// 		if (data != null) {
			// 			for (var i = data.length - 1; i >= 0; i--) {
			// 				$("#" + conId).after(
			// 						"<option value='"+data[i].contentsId+"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + data[i].contentsName + "</option>"
			// 				)
			// 			}
			// 		}
			// 	})
			// });
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
		});

	function subdirectory(obj,id){
		var staId=$("#statuteId").val();
		$("[conid="+id+"]").remove();
		$("span[spid="+id+"]").html(" ");
		$.getJSON('getAllContentsByStatuteId',{'conId':id,'staId':staId},function (data) {
			for(var i=data.length-1;i>=0;i--) {
				var blanks="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
				for(var j=0;j<data[i].contentsLevel;j++){
					blanks=blanks+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
				}
				$(obj).after(
						"<option onmouseover='subdirectory(this,"+data[i].contentsId+")' value='"+data[i].contentsId+"'>" + data[i].contentsName + "</option>"
				)
			}
		});
	}
	$(document).ready(function(){
		$(".select_box input").click(function(){
			var thisinput=$(this);
			var thisul=$(this).parent().find("ul");
			if(thisul.css("display")=="none"){
				if(thisul.height()>200){thisul.css({height:"200"+"px","overflow-y":"scroll" })};
				thisul.fadeIn("100");
				thisul.hover(function(){},function(){thisul.fadeOut("100");})
				thisul.find("li").click(function(){thisinput.val($(this).text());thisul.fadeOut("100");}).hover(function(){$(this).addClass("hover");},function(){$(this).removeClass("hover");});
			}
			else{
				thisul.fadeOut("fast");
			}
		})
		$("#submit").click(function(){
			var endinfo="";
			$(".select_box input:text").each(function(i){
				endinfo=endinfo+(i+1)+":"+$(this).val()+";\n";
			})
			alert(endinfo);
		})
	});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>