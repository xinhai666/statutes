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

	<title>意见反馈</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户管理 <span class="c-gray en">&gt;</span> 用户列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top: 20vh;">
		<div class="modal-dialog">
			<form action="sendAlipay" method="post">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">会员</h4>
					</div>
					<div class="modal-body">
							<input type="hidden" id="WIDtotal_amount" name="WIDtotal_amount" value="88.00">
							<input type="hidden" name="WIDsubject" value="航多会员" />
							<input type="hidden" name="WIDbody" value="航多知识中心会员" />
							<input type="hidden" name="userId" id="航多会员" value="0">
						<p align="center"><span style="font-size: 16px">费用：</span><span style="color: #f37b1d;font-size: 20px;"><b id="money">88</b><b> 元</b></span></p>
						<br>
						<p align="center">
						<span style="font-size: 16px">时长(月)：</span>
						<select  style="width: 100px;height: 28px" name="month" id="month">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="12">12</option>
						</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input style="width: 90px;background-color: #f37b1d" type="submit" class="btn btn-primary" id="submit" value="去支付">
						</p>
					</div>
					<div class="modal-footer">
						<p align="center"><input type="hidden" id="closemodel" class="btn btn-default" data-dismiss="modal">
						</p>
					</div>
				</div>
			</form>
		</div>
	</div>

	<div class="mt-20">
		<table class="table table-border table-bordered table-hover table-bg table-sort">
			<thead>
			<tr class="text-c">
				<th width="50">姓名</th>
				<th width="60">手机号</th>
				<th width="30">性别</th>
				<th width="80">会员类型</th>
				<th width="50">注册日期</th>
				<th width="50">操作</th>
			</tr>
			</thead>
			<tbody id="ustab">
				<#list usersList as u>
					<tr class="text-c"><td>${u.userName!}</td>
					<td>${u.userPhone!}</td>
					<#if u.userSex=1>
						<td>男</td>
					<#else>
						<td>女</td>
					</#if>
					<td>
						<#if u.userMember==0>
							<label><input name="userMember${u.userId}" type="radio" checked value="0" />免费</label>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label><input name="userMember${u.userId}" type="radio" value="1" />付费</label>
						<#else>
							<label><input name="userMember${u.userId}" type="radio" value="0" />免费</label>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label><input name="userMember${u.userId}" type="radio" checked value="1" />付费</label>
						</#if>
					</td>
					<td>${(u.userCreatetime)?date}</td>
						<td>
							<#if u.userMember==0>
							<label><a data-target='#myModal' data-toggle='modal' href="javascript:;" onclick="upvip(${u.userId})">开通</a></label>
							<#else>
							<label><a data-target='#myModal' data-toggle='modal' href="javascript:;" onclick="upvip(${u.userId})">续费</a></label>
							</#if>
						</td>
					</tr>
				</#list>
			</tbody>
		</table>
	</div>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
	$(function(){
		$('.table-sort').dataTable({
			"aaSorting": [[ 1, "desc" ]],//默认第几个排序
			"bStateSave": true,//状态保存
			"aoColumnDefs": [
				//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
				{"orderable":false,"aTargets":[3]}// 制定列不参与排序
			]
		});

		/*会员*/
		$("#month").change(function () {
			var money=$("#month").val()*88;
			$("#money").text(money);
			$("#WIDtotal_amount").val(money);
		});
	});

	function upvip(id) {
		$("#userId").val(id);
	}
</script>
</body>
</html>