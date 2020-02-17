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
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>*法规类型:</label>
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
			<div class="formControls col-xs-8 col-sm-9">
				<input type="file" value="选择图片" id="icofile" name="icofile">
			</div>
		</div>
		<#--<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">*首页法规图标：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<div class="uploader-thum-container">
						<div id="fileList" class="uploader-list"></div>
						<div id="filePicker">选择图片</div>
					</div>
				</div>
			</div>-->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">法规PDF文件名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  style="width: 30%"  placeholder="不超过100个字" id="statutePdfName" name="statutePdfName">
			</div>
		</div>
		<#--<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">法规PDF文件下载链接：</label>
			<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" style="width: 30%" placeholder="不超过100个字" id="sources" name="sources">
					<button  class="btn btn-default btn-uploadstar radius ml-10">上传本地法规</button>
				</div>
		</div>-->

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">*法规版本说明：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea style="width:80%;height:400px;" id="statuteExplain" name="statuteExplain"></textarea>
			</div>
		</div>
		
		<#--<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">*法规版本说明：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<script id="editor" type="text/plain" style="width:80%;height:400px;"></script> 
			</div>
		</div>-->
		<#--<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="article_save_submit();" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 保存</button>
			</div>
		</div>-->
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
			/*statuteIconpath:{
				required:true,
			},*/
			statutePdfName:{
				required:true,
			},
			/*statutePdfLink:{
				required:true,
			},*/
			statuteExplain:{
				required:true,
			},
		},
	});
	$("#subt").click(function () {
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
		/*onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			//$(form).ajaxSubmit();
			var index = parent.layer.getFrameIndex(window.name);
			//parent.$('.btn-refresh').click();
			parent.layer.close(index);
		}*/
	/*$list = $("#fileList"),
	$btn = $("#btn-star"),
	state = "pending",
	uploader;

	var uploader = WebUploader.create({
		auto: true,
		swf: 'lib/webuploader/0.1.5/Uploader.swf',

		// 文件接收服务端。
		server: 'fileupload.php',

		// 选择文件的按钮。可选。
		// 内部根据当前运行是创建，可能是input元素，也可能是flash.
		pick: '#filePicker',

		// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
		resize: false,
		// 只允许选择图片文件。
		accept: {
			title: 'Images',
			extensions: 'gif,jpg,jpeg,bmp,png',
			mimeTypes: 'image/!*'
		}
	});
	uploader.on( 'fileQueued', function( file ) {
		var $li = $(
			'<div id="' + file.id + '" class="item">' +
				'<div class="pic-box"><img></div>'+
				'<div class="info">' + file.name + '</div>' +
				'<p class="state">等待上传...</p>'+
			'</div>'
		),
		$img = $li.find('img');
		$list.append( $li );

		// 创建缩略图
		// 如果为非图片文件，可以不用调用此方法。
		// thumbnailWidth x thumbnailHeight 为 100 x 100
		uploader.makeThumb( file, function( error, src ) {
			if ( error ) {
				$img.replaceWith('<span>不能预览</span>');
				return;
			}

			$img.attr( 'src', src );
		}, thumbnailWidth, thumbnailHeight );
	});
	// 文件上传过程中创建进度条实时显示。
	uploader.on( 'uploadProgress', function( file, percentage ) {
		var $li = $( '#'+file.id ),
			$percent = $li.find('.progress-box .sr-only');

		// 避免重复创建
		if ( !$percent.length ) {
			$percent = $('<div class="progress-box"><span class="progress-bar radius"><span class="sr-only" style="width:0%"></span></span></div>').appendTo( $li ).find('.sr-only');
		}
		$li.find(".state").text("上传中");
		$percent.css( 'width', percentage * 100 + '%' );
	});

	// 文件上传成功，给item添加成功class, 用样式标记上传成功。
	uploader.on( 'uploadSuccess', function( file ) {
		$( '#'+file.id ).addClass('upload-state-success').find(".state").text("已上传");
	});

	// 文件上传失败，显示上传出错。
	uploader.on( 'uploadError', function( file ) {
		$( '#'+file.id ).addClass('upload-state-error').find(".state").text("上传出错");
	});

	// 完成上传完了，成功或者失败，先删除进度条。
	uploader.on( 'uploadComplete', function( file ) {
		$( '#'+file.id ).find('.progress-box').fadeOut();
	});
	uploader.on('all', function (type) {
        if (type === 'startUpload') {
            state = 'uploading';
        } else if (type === 'stopUpload') {
            state = 'paused';
        } else if (type === 'uploadFinished') {
            state = 'done';
        }

        if (state === 'uploading') {
            $btn.text('暂停上传');
        } else {
            $btn.text('开始上传');
        }
    });

    $btn.on('click', function () {
        if (state === 'uploading') {
            uploader.stop();
        } else {
            uploader.upload();
        }
    });*/

	/*var ue = UE.getEditor('editor');*/

});
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>