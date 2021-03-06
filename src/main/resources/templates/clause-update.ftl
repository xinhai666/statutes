﻿<!DOCTYPE HTML>
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
	<!--/meta 作为公共模版分离出去-->
<title>修改条款</title>
	<style type="text/css">
		.w-e-text-container{
			height: 600px !important;/*!important是重点，因为原div是行内样式设置的高度300px*/
		}
	</style>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 法规管理 <span class="c-gray en">&gt;</span> 修改条款 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<article class="page-container">
	<input type="button" class="btn" onclick="history.go(-1)" value="&nbsp;返 回&nbsp;" /></span>
	<input type="hidden" id="staId" value="${clause.staId!}">
	<input type="hidden" id="conId" value="${clause.conId!}">
	<form class="form form-horizontal" id="form-clause-add">
		<input type="hidden" id="clauseId" name="clauseId" value="${clause.clauseId!}">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span>*</span>法规：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box" style="width:30%">
				<select  name="staId" id="statuteId" class="select">
					<option value="0">请选择</option>
				</select>
				</span></div>
		</div>
		<div class="row c1">
			<label class="form-label col-xs-4 col-sm-2"><span>*</span>所在目录：</label>
			<div class="formControls col-xs-8 col-sm-9"><span class="select-box" style="width: 30%">
			<select  class="select" id="contentsId" name="conId" >
				<option value="0">请选择</option>
			</select>
			</span></div>
		</div><br>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span>*</span>条款编号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input style="width:30%" class="input-text"  value="${clause.clauseNumber!}" id="clauseNumber" name="clauseNumber">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">条款编号别名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input style="width:30%" class="input-text" value="${clause.clauseAnothername!}" id="clauseAnothername" name="clauseAnothername">
			</div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">*条款版本号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input style="width:30%" class="input-text" value="${clause.clauseVersion!}" id="clauseVersion" name="clauseVersion">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span>*</span>条款标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input style="width:30%" class="input-text"  value="${clause.clauseTitle!}" id="clauseTitle" name="clauseTitle">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">*条款内容：</label>
			<div class="col-xs-8 col-sm-9" style="width:800px">
				<!--用当前元素来控制高度-->
				<div id="editor">

				</div>
			</div>
			<textarea style="display:none" id="clauseContent" name="clauseContent">${clause.clauseContent!}</textarea>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">关键词：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input style="width:30%" class="input-text"  value="${clause.clauseAntistop!}" id="clauseAntistop" name="clauseAntistop">
			</div>
		</div>

		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;保 存&nbsp;">
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="lib/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="https://unpkg.com/wangeditor@3.1.1/release/wangEditor.min.js"></script>
<script type="text/javascript">
	$(function(){
		var E = window.wangEditor;
		/*var editor = new E('#editor')**/
		var editor = new E( document.getElementById('editor'));
		editor.customConfig.uploadImgShowBase64 = true   // 使用 base64 保存图片
		editor.create();
		editor.txt.html($("#clauseContent").text());//设置文本编辑器内容

		$('.skin-minimal input').iCheck({
			checkboxClass: 'icheckbox-blue',
			radioClass: 'iradio-blue',
			increaseArea: '20%'
		});

		/*获得所有法规*/
		$.post('checkStatuteByName',function (data) {
			data=data.result;
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
			getContents();
		},'json');
		/*根据法规加载目录*/
		$("#statuteId").change(function () {
			getContents();
		})
		/*$("#statuteId").change(function () {
			var staId=$("#statuteId").val();
			var conId=$("#conId").val();
			$("#contentsId option").slice(1).remove();
			$.getJSON('getAllContentsByStatuteId',{'contentsLevel':1,'staId':staId},function (data) {
				if (data != null) {
					html="";
					for (var i = 0; i < data.length; i++) {
						if(data[i].contentsId==conId){
							html+="<option value='"+data[i].contentsId+"' conid='"+data[i].contentsId+"' id='"+data[i].contentsId+"'>"+data[i].contentsName+"</option>"
						}else{
							html+="<option selected value='"+data[i].contentsId+"' conid='"+data[i].contentsId+"' id='"+data[i].contentsId+"'>"+data[i].contentsName+"</option>"
						}
						$("#contentsId").append(html);
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
		});*/

		//表单验证
		$("#form-clause-add").validate({
			rules:{
				staId:{
					required:true,
				},
				conId:{
					required:true,
				},
				clauseNumber:{
					required:true,
				},
				clauseVersion:{
					required:true,
				},
				clauseTitle:{
					required:true,
				},
				clauseContent:{
					required:true,
				},
			},
			onkeyup:false,
			focusCleanup:true,
			success:"valid",
			submitHandler:function(form){
				$("#clauseContent").html(editor.txt.html());
				$(form).ajaxSubmit({
					type: 'post',
					url: "updateClause",
					success: function(data){
						layer.msg('保存修改完成!',{icon:1,time:1000});
					},
					error: function(XmlHttpRequest, textStatus, errorThrown){
						layer.msg('保存数据异常!',{icon:2,time:1000});
					}
				});
			}
		});
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