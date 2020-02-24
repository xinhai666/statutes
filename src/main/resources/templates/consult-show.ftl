<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="h-ui.admin/css/style.css" />
<script>DD_belatedPNG.fix('*');</script>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<title>查看咨询</title>
</head>
  <body>
  <div class="pd-20" style="height: 260px">
    <table class="table">
      <tbody>
        <tr>
          <th width="80">咨询人：</th>
          <td style='text-align: left'><span>${consults.consultUserName!}</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>${consults.consultPhone!}</span></td>
        </tr>
        <tr><td></td></tr>
        <tr>
          <th >咨询内容：</th>
          <td style='text-align: left'>
            ${consults.consultContent!}<br>
        </tr>
        <tr><td></td></tr>
        <tr>
          <th>相关条款：</th>
          <td style='text-align: left'>${consults.consultClauseNumbers!}</td>
        </tr>
      </tbody>
    </table>
  </div>
  <p align="center"><button class="btn" style="width: 120px" id="closeWd">关 闭</button></p>
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
    $(function () {
        $("#closeWd").click(function () {
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        })
    })
  </script>
  </body>
  </html>