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

<title>网站设置</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span>
	网站设置
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
	<form class="form form-horizontal" id="form-article-add" method="post" enctype="multipart/form-data">
		<div id="tab-system" class="HuiTab">
			<div class="tabCon">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">
						<span class="c-red">*</span>
						网站状态：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<label></label><input type="radio" id="" name="sitesStatus" checked value="1">开启</label>
						<label></label><input type="radio" id="" name="sitesStatus" value="0">关闭</label>
						
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">
						<span class="c-red">*</span>
						网站标题：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" id="sitesTitle" name="sitesTitle" placeholder="不超过100字" value="${sites.sitesTitle!}" class="input-text">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">
						<span class="c-red">*</span>
						网站域名：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" id="sitesOrg" name="sitesOrg" placeholder="不超过100字" value="${sites.sitesOrg!}" class="input-text">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">
						<span class="c-red">*</span>
						网站logo：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="hidden" id="sitesLogo" name="sitesLogo" value="${sites.sitesLogo!}">
						<#if (sites.sitesLogo)??>
						<img id="logoImg" src="${sites.sitesLogo!}" alt="暂无" ; style="height:155px;width:209px;" />
						<#else>
						<img id="logoImg" src="image/file.png"; style="height:155px;width:209px;" />
						</#if >
						<#--<img id="logoImg" src="image/file.png"; style="height:155px;width:209px;" />-->
						<input type="hidden" name="logotext" id="logotext" style="border:0px;height:30px;width:120px;" value="${sites.sitesLogo!}"/>
						<input type="file" name="logofile" id="logofile" style="position:absolute;top:0;left:0px; height:155px;width:209px;filter:alpha(opacity:0);opacity: 0" onchange="document.getElementById('logotext').value=this.value" />
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">
						<span class="c-red">*</span>
						公司邮箱：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" id="sitesEmail" name="sitesEmail" placeholder="不超过100字" value="${sites.sitesEmail!}" class="input-text">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">
						<span class="c-red">*</span>
						站点语言：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<select name="sitesLanguage" id="sitesLanguage">
							<option value="1">简体中文</option>
						</select>
					</div>
				</div>
				
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="article_save_submit();" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 保存</button>
			</div>
		</div>
	</form>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
$(function(){
	//上传预览头像
	$("#logofile").change(function () {
		var fd=new FormData($("#form-article-add")[0]);
		$.ajax({
			type : "post",
			url : "shangchuan",
			data : fd,
			contentType : false,// 告诉jQuery不要去设置Content-Type请求头
			processData: false,// 告诉jQuery不要去处理发送的数据
			success : function(data) {
				$("#logoImg").attr('src',data);
				$("#sitesLogo").val(data);
			},
			error : function() {
				layer.msg('操作失败!',{icon:1,time:1000});
			}
		});
	})

	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	//提交表单数据
	$("#form-article-add").validate({
		rules:{
			sitesTitle:{
				required:true,
			},
			sitesOrg:{
				required:true,
			},
			sitesLg:{
				required:true,
			},
			sitesEmail:{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit({
				type: 'post',
				url: "updateSites",
				success: function(data){
					layer.msg('保存完成!',{icon:1,time:1000});
				},
				error: function(XmlHttpRequest, textStatus, errorThrown){
					layer.msg('error!',{icon:1,time:1000});
				}
			});
		}
	});

	$("#tab-system").Huitab({
		index:0
	});
});
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
