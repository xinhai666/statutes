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
	<link href="https://cdn.bootcss.com/wangEditor/3.1.1/wangEditor.min.css" rel="stylesheet">
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
			<div id="ediv">

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

<script src="https://cdn.bootcss.com/wangEditor/3.1.1/wangEditor.min.js"></script>
<#--<script type="text/javascript" src="https://unpkg.com/wangeditor@3.1.1/release/wangEditor.min.js"></script>-->
<#--<script type="text/javascript" src="https://unpkg.com/qiniu-js@2.5.5/dist/qiniu.min.js"></script>-->

<script type="text/javascript">
	var E = window.wangEditor;
	// var editor = new E( document.getElementById('ediv'));
	var editor = new E('#ediv');
	editor.customConfig.uploadImgShowBase64 = true   // 使用 base64 保存图片
	// 允许上传到七牛云存储
	// editor.customConfig.qiniu = true
	editor.create();

/*******************************************************************************/
	// 初始化七牛上传
	//uploadInit()
	// 初始化七牛上传的方法
	/*function uploadInit() {
		// 获取相关 DOM 节点的 ID
		var btnId = editor.imgMenuId;
		var containerId = editor.toolbarElemId;
		var textElemId = editor.textElemId;

		// 创建上传对象
		var uploader = qiniu.uploader({
			runtimes: 'html5,flash,html4',    //上传模式,依次退化
			browse_button: btnId,       //上传选择的点选按钮，**必需**
			uptoken_url: '/uptoken',
			//Ajax请求upToken的Url，**强烈建议设置**（服务端提供）
			// uptoken : '<Your upload token>',
			//若未指定uptoken_url,则必须指定 uptoken ,uptoken由其他程序生成
			// unique_names: true,
			// 默认 false，key为文件名。若开启该选项，SDK会为每个文件自动生成key（文件名）
			// save_key: true,
			// 默认 false。若在服务端生成uptoken的上传策略中指定了 `sava_key`，则开启，SDK在前端将不对key进行任何处理
			domain: 'http://7xrjl5.com1.z0.glb.clouddn.com/',
			//bucket 域名，下载资源时用到，**必需**
			container: containerId,           //上传区域DOM ID，默认是browser_button的父元素，
			max_file_size: '100mb',           //最大文件体积限制
			flash_swf_url: '../js/plupload/Moxie.swf',  //引入flash,相对路径
			filters: {
				mime_types: [
					//只允许上传图片文件 （注意，extensions中，逗号后面不要加空格）
					{ title: "图片文件", extensions: "jpg,gif,png,bmp" }
				]
			},
			max_retries: 3,                   //上传失败最大重试次数
			dragdrop: true,                   //开启可拖曳上传
			drop_element: textElemId,        //拖曳上传区域元素的ID，拖曳文件或文件夹后可触发上传
			chunk_size: '4mb',                //分块上传时，每片的体积
			auto_start: true,                 //选择文件后自动上传，若关闭需要自己绑定事件触发上传
			init: {
				'FilesAdded': function(up, files) {
					plupload.each(files, function(file) {
						// 文件添加进队列后,处理相关的事情
						printLog('on FilesAdded');
					});
				},
				'BeforeUpload': function(up, file) {
					// 每个文件上传前,处理相关的事情
					printLog('on BeforeUpload');
				},
				'UploadProgress': function(up, file) {
					// 显示进度
					printLog('进度 ' + file.percent)
				},
				'FileUploaded': function(up, file, info) {
					// 每个文件上传成功后,处理相关的事情
					// 其中 info 是文件上传成功后，服务端返回的json，形式如
					// {
					//    "hash": "Fh8xVqod2MQ1mocfI4S4KpRL6D98",
					//    "key": "gogopher.jpg"
					//  }
					printLog(info);
					// 参考http://developer.qiniu.com/docs/v6/api/overview/up/response/simple-response.html

					var domain = up.getOption('domain');
					var res = $.parseJSON(info);
					var sourceLink = domain + res.key; //获取上传成功后的文件的Url

					printLog(sourceLink);

					// 插入图片到editor
					editor.cmd.do('insertHtml', '<img src="' + sourceLink + '" style="max-width:100%;"/>')
				},
				'Error': function(up, err, errTip) {
					//上传出错时,处理相关的事情
					printLog('on Error');
				},
				'UploadComplete': function() {
					//队列文件处理完毕后,处理相关的事情
					printLog('on UploadComplete');
				}
				// Key 函数如果有需要自行配置，无特殊需要请注释
				//,
				// 'Key': function(up, file) {
				//     // 若想在前端对每个文件的key进行个性化处理，可以配置该函数
				//     // 该配置必须要在 unique_names: false , save_key: false 时才生效
				//     var key = "";
				//     // do something with key here
				//     return key
				// }
			}
			// domain 为七牛空间（bucket)对应的域名，选择某个空间后，可通过"空间设置->基本设置->域名设置"查看获取
			// uploader 为一个plupload对象，继承了所有plupload的方法，参考http://plupload.com/docs
		});
	}

	// 封装 console.log 函数
	function printLog(title, info) {
		window.console && console.log(title, info);
	}*/
/*******************************************************************************/
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

</script>
</body>
</html>