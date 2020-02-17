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
<title>法规类型管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 法规类型管理-分支管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<input type="hidden" value="${(statutestype.statutestypeId)!}" id="statutestypeId" name="statutesplitId">
	<div class="cl pd-5 bg-1 bk-gray mt-10">
		<input type="button" class="btn" style="float: right" onclick="history.go(-1)" value="返回" /></span>
		<span class="l"><a href="javascript:;" onclick="admin_add('添加法规主分支','stasplitAdd?statutestypeId=${(statutestype.statutestypeId)!}','500','200')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加主分支</a></span>
	</div>
	<table class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="9">${(statutestype.statutestypeName)!}&nbsp;的主分支</th>
			</tr>
			<tr class="text-c">
				<th width="40">分支编号</th>
				<th width="150">分支名称</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody id="splittb">

		</tbody>
	</table>
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
	$(function () {
		/*获得所分支*/
		$.getJSON('getAllStaSplit',{'statutestypeId':$("#statutestypeId").val()},function (data) {
			if(data!=null){
				for(var i=0;i<data.length;i++){
					$("#splittb").append(
							"<tr class='text-c'><td>"
							+data[i].statutesplitId+"</td><td>"
							+data[i].statutesplitName+"</td><td class='td-manage'>"
							//+"<a title='详情' href='' class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe6df;详情</i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
							+"<a title='删除' href='javascript:;' onclick='admin_del(this,"+data[i].statutesplitId+")' class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe6e2;删除</i></a></td>"
							+"</tr>"
					)
				}
			}
		});
	})

/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
/*增加*/
function admin_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*删除*/
function admin_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'delStatueSplitById',
			data:{'statutesplitId':id},
			dataType: 'json',
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

/*管理员-编辑*/
function admin_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
</script>
</body>
</html>