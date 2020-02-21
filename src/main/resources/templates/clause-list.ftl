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
<title>法规列表</title>
</head>
<body>

<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
<span class="c-gray en">&gt;</span>
法规管理
<span class="c-gray en">&gt;</span>
法规列表
<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>


<div class="page-container">
    <div class="text-a">
        法规： <select  class="input-text" style="width:300px" id="statuteId" name="statuteId" >
                    <option value="0">请选择</option>
            </select>
    </div>
    <div class="row">
        <div class="col-md-6 col-md-offset-10">
            <a href="clauseAdd"><button type="button" class="btn btn-primary"><i class="Hui-iconfont">&#xe600;</i> 新增条款</button></a>
        </div>
    </div>
    <br/>
    <div class="mt-20">
            <table class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
            <tr class="text-c">
                <th width="80">条款号</th>
                <th width="100">条款号别名</th>
                <th width="90">条款标题</th>
                <th width="130">所属法规名称</th>
                <th width="130">版本号</th>
                <th width="60">操作</th>
            </tr>
            </thead>
            <tbody id="clausetb">
            </tbody>
        </table>
    </div>
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
    $('.table-sort').dataTable({
        "aaSorting": [[ 1, "desc" ]],//默认第几个排序
        "bStateSave": true,//状态保存
        "aoColumnDefs": [
            //{"bVisible": false, "aTargets": [ 3 ]}, //控制列的隐藏显示
            {"orderable":false,"aTargets":[5]}// 制定列不参与排序
        ]
    });
    /*获得所有法规*/
    $.post('checkStatuteByName',function (data) {
        if(data!=null){
            for(var i=0;i<data.length;i++){
                $("#statuteId").append(
                    "<option value='"+data[i].statuteId+"'>"+data[i].statuteAlias+" "+data[i].statuteName+"</option>"
                )
            }
        }
    },'json');
    //根据法规查条款
    $("#statuteId").change(function () {
        $(".table-sort").dataTable().fnDestroy();//还原初始化了datatable
        $("#clausetb tr").slice(0).remove();
        $.post('getClauseVoBystaId',{'staId':$("#statuteId").val()},function (data) {
            if(data==null||data==''){layer.msg('没有数据可用!',{icon:5,time:1600});}
            for(var i=0;i<data.length;i++) {
                $("#clausetb").append(
                    "<tr class=\"text-c\">"
                    + "<td>" + data[i].clauseNumber + "</td>"
                    + "<td>" + data[i].clauseAnothername + "</td>"
                    + "<td>" + data[i].clauseTitle + "</td>"
                    + "<td>" + data[i].statuteName + "</td>"
                    + "<td>" + data[i].clauseVersion + "</td>"
                    + "<td class=\"f-14\"><a title=\"编辑\" href='checkClauseById?clauseId="+data[i].clauseId+"' class=\"ml-5\" style=\"text-decoration:none\">编辑</a>" +
                    "<a title=\"删除\" href=\"javascript:;\" onclick=\"clause_del(this,'"+data[i].clauseId+"')\" class=\"ml-5\" style=\"text-decoration:none\">删除</a>" +
                    " </td></tr>"
                )
            }
            $('.table-sort').dataTable({
                "aaSorting": [[ 1, "desc" ]],//默认第几个排序
                "bStateSave": true,//状态保存
                "aoColumnDefs": [
                    //{"bVisible": false, "aTargets": [ 3 ]}, //控制列的隐藏显示
                    {"orderable":false,"aTargets":[5]}// 制定列不参与排序
                ]
            });
        },'json');
    });

/*删除*/
function clause_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'delClauseById',
            data:{'clauseId':id},
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			},
			error:function(data) {
                layer.msg('删除失败!',{icon:2,time:1000});
				console.log(data.msg);
			},
		});		
	});
}
</script>

</body>
</html>