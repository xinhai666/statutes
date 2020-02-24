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

	<title>公司介绍</title>
	<style type="text/css">
		.w-e-text-container{
			height: 600px !important;/*!important是重点，因为原div是行内样式设置的高度300px*/
		}
	</style>

</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span>
	公司介绍
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>

<article class="page-container">
	<form class="form form-horizontal" id="form-article-add">
		<br>
		<!--用父容器来控制宽度-->
		<div style="width:800px">
			<!--用当前元素来控制高度-->
			<div id="editor">

			</div>
			<#--<p align="center"><button class="btn btn-primary radius" id="getV"><i class="Hui-iconfont">&#xe632;</i> 保存</button></p>-->
		</div>
	</form>
	<div style="width: 800px">
		<br>
		<p align="center"><button class="btn btn-primary radius" id="getV"><i class="Hui-iconfont">&#xe632;</i> 保存</button></p>
	</div>
</article>

<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="h-ui.admin/js/H-ui.admin.js"></script>

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
	var E = window.wangEditor;
	/*var editor = new E('#editor')**/
	var editor = new E( document.getElementById('editor'));
	editor.customConfig.uploadImgShowBase64 = true   // 使用 base64 保存图片
	editor.create();
	/*获取数据库内容*/
	$.get('getCompanyContent?companyType=1',function (data) {
		editor.txt.html(data);
	});
	/*存入数据库*/
	$("#getV").click(function () {
		var companyContent=editor.txt.html();
		$.post('updateCompany',{'companyContent':companyContent,'companyType':1},function (data) {
			if(data=="true"){
				layer.msg('保存完成!',{icon:1,time:1000});
			}else {
				layer.msg('保存数据时异常!',{icon:2,time:1000});
			}
		});
	})

	/*设置内容*/
	/*editor.txt.text('用 JS 设置的内容');*/

	/*获取内容*/
	/*document.getElementById('getV').addEventListener('click', function () {
        // 读取 text
        alert(editor.txt.text())
    }, false)*/
</script>
</body>
</html>