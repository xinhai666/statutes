<!--_meta 作为公共模版分离出去-->
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
<!--/meta 作为公共模版分离出去-->

<title>新增法规</title>
<style type="text/css">
	.w-e-text-container{
		height: 600px !important;/*!important是重点，因为原div是行内样式设置的高度300px*/
	}
</style>
<!-- <meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载"> -->
<!-- <meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。"> -->
</head>
<body>
		<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页<span
			class="c-gray en">&gt;</span> 新增法规 <a class="btn btn-success radius r"
			style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新"><i
				class="Hui-iconfont">&#xe68f;</i></a></nav>
<article class="page-container">
	<form class="form form-horizontal" id="form-article-add" enctype="multipart/form-data">
		<div class="row c1">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>*法规类型:</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box" style="width: 30%">
			<select  class="select" id="statutestypeId" name="statpId" >
				<option>请选择</option>
			</select></span>
			</div>
		</div>
		<br>
		<div class="row c1">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>*所属分支:</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box" style="width: 30%">
			<select  class="select" id="staspId" name="staspId" >
				<option value="0">请选择</option>
			</select></span>
			</div>
		</div>
		<br>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>*法规部号:</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" style="width: 30%" value="" placeholder="请输入部号数字" id="statutePartno" name="statutePartno">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">法规部号别名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" style="width: 30%" value=""  placeholder="不超过100个字" id="statuteAlias" name="statuteAlias">
			</div>
		</div>
		
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">法规版本号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" style="width: 30%" value="0" placeholder="" id="statuteVersion" name="statuteVersion">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">*法规名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" style="width: 30%" value="" placeholder="不超过100个字" id="statuteName" name="statuteName">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">*是否显示 ：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<!-- <textarea name="abstract" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="$.Huitextarealength(this,200)"></textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p> -->
				<input type="radio" name="statuteReveal" value="1" checked>显示
				<input type="radio" name="statuteReveal" value="0" style="margin-left:30px ">不显示
			</div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">*首页法规图标：</label>
			<div class="formControls col-xs-8 col-sm-9"  style="width:200px;">
				<img id="logoImg" src="image/file.png"; alt="暂无图片" style="height:120px;width:150px;" />
				<input type="file" name="logofile" id="logofile" style="position:absolute;top:0;left:0px; height:120px;width:150px;filter:alpha(opacity:0);opacity: 0" />
				<input type="hidden" value="" id="statuteIconpath" name="statuteIconpath" style="height:120px;width:150px;">
			</div>
			<div class="text ">
				<span style="font-size: 10px"><br><br>图片格式支持：jpg/png<br>图片尺寸：90*90px<br>图片大小：不超过50K</span>
			</div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">法规PDF文件名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  style="width: 30%"  placeholder="不超过100个字" id="statutePdfName" name="statutePdfName">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">法规PDF文件下载链接：</label>
			<div class="col-xs-8 col-sm-9">
				<input id="statutePdfLink" readonly name="statutePdfLink"class="input-text" style="width: 30%" placeholder="不超过100个字">
				<input type="file" name="pdffile" id="btn_file" style="display:none">
				<button type="button" class="btn btn-default ml-10" onclick="F_Open_dialog()">上传本地法规</button>
			</div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">*法规版本说明：</label>
			<div class="col-xs-8 col-sm-9" style="width:800px">
				<!--用当前元素来控制高度-->
				<div id="editor">

				</div>
			</div>
			<textarea style="display:none" id="statuteExplain" name="statuteExplain"></textarea>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button class="btn btn-primary radius" type="button" id="subt"><i class="Hui-iconfont">&#xe632;</i> 保存</button>
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
	function F_Open_dialog() {
		document.getElementById("btn_file").click();
	}
$(function(){
	var E = window.wangEditor;
	/*var editor = new E('#editor')**/
	var editor = new E( document.getElementById('editor'));
	editor.customConfig.uploadImgShowBase64 = true   // 使用 base64 保存图片
	editor.create();

	//上传预览图片
	$("#logofile").change(function () {
		//获取文件
		var file = $('#logofile')[0];
		//检测文件是否有效图片
		var regex = new RegExp("([a-zA-Z0-9\s_\\.\-:])+(.jpg|.png)$");
		console.log(file.value.toLowerCase());
		if (!regex.test(file.value.toLowerCase())){
			parent.layer.msg('图片格式不支持,请上传.jpg或.png图片');
			return false;
		}
		var filesize=$('#logofile').get(0).files[0].size/1024;
		if(filesize>50){
			layer.alert('文件不能超过50KB，当前文件'+filesize+"KB");
			return false;
		}
		//初始化FileReader对象
		var reader = new FileReader();
		//读取图片文件
		reader.readAsDataURL(file.files[0]);
		reader.onload = function (e) {
			//初始化JavaScript图片对象
			var image = new Image();
			//FileReader获得Base64字符串
			image.src = e.target.result;
			image.onload = function () {
				//获得图片高宽
				var height = this.height;
				var width = this.width;
				console.log('图片高：'+height+" 图片宽："+width);
				if(height>90||width>90){
					parent.layer.msg('图片尺寸不大于90*90px');
					return false;
				}else {
					var fd=new FormData($("#form-article-add")[0]);
					$.ajax({
						type : "post",
						url : "shangchuan",
						data : fd,
						contentType : false,// 告诉jQuery不要去设置Content-Type请求头
						processData: false,// 告诉jQuery不要去处理发送的数据
						success : function(data) {
							$("#logoImg").attr('src',data);
							$("#statuteIconpath").val(data);
						},
						error : function() {
							layer.msg('操作失败!',{icon:1,time:1000});
						}
					});
				}
			}
		}
	});
	//上传PDF
	$("#btn_file").change(function () {
		//获取文件
		var file = $('#btn_file')[0];
		//检测文件格式
		var regex = new RegExp("([a-zA-Z0-9\s_\\.\-:])+(.pdf)$");
		console.log(file.value.toLowerCase());
		if (!regex.test(file.value.toLowerCase())){
			parent.layer.msg('请上传PDF格式的文件');
			return false;
		}
		var filesize=$('#btn_file').get(0).files[0].size/1024/1024;
		if(filesize>20){
			layer.alert('文件不能超过20MB，当前文件'+filesize+"MB");
			return false;
		}
		var fd=new FormData($("#form-article-add")[0]);
		$.ajax({
			type :"post",
			url : "pdfUpload",
			data : fd,
			contentType : false,// 告诉jQuery不要去设置Content-Type请求头
			processData: false,// 告诉jQuery不要去处理发送的数据
			success : function(data) {
				$("#statutePdfLink").val(data);
			},
			error : function() {
				layer.msg('上传文件失败!',{icon:1,time:1000});
			}
		});
	})

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
		$("#staspId").empty();
		/*$("#staspId option").slice(1).remove();*/
		var statutestypeId=$("#statutestypeId").val();
		$.getJSON('getAllStaSplit',{'statutestypeId':statutestypeId},function (data) {
			if(data!=null){
				for(var i=0;i<data.length;i++){
					$("#staspId").append(
							"<option value='"+data[i].statutesplitId+"'>"+data[i].statutesplitName+"</option>"
					)
				}
			}
		})
	});

	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	//表单验证
	$("#form-article-add").validate({
		rules:{
			statpId:{
				required:true,
			},
			staspId:{
				required:true,
			},
			statutePartno:{
				required:true,
			},
			statuteAlias:{
				required:true,
			},
			statuteVersion:{
				required:true,
			},
			statuteName:{
				required:true,
			},
			statuteReveal:{
				required:true,
			},
			statuteIconpath:{
				required:true,
			},
			statutePdfName:{
				required:true,
			},
			statutePdfLink:{
				required:true,
			},
			statuteExplain:{
				required:true,
			},
		},
	});
	//提交表单数据
	$("#subt").click(function () {
		$("#statuteExplain").html(editor.txt.html());//获取富文本框内容，填入标签
		var fd=new FormData($("#form-article-add")[0]);
		$.ajax({
			type : "post",
			url : "addStatute",
			data : fd,
			contentType : false,// 告诉jQuery不要去设置Content-Type请求头
			processData: false,// 告诉jQuery不要去处理发送的数据
			success : function(data) {
				layer.msg('添加完成!',{icon:1,time:1000});
			},
			error : function() {
				layer.msg('操作失败!',{icon:1,time:1000});
			}
		});
	})
});
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>