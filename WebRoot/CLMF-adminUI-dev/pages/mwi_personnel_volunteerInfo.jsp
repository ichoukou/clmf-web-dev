<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html><html lang="en">	<head>		<meta charset="utf-8">		<meta http-equiv="X-UA-Compatible" content="IE=edge">		<meta name="viewport" content="width=device-width, initial-scale=1">		<meta name="description" content="">		<meta name="author" content="">		<title>志愿者信息</title>		<!-- Bootstrap Core CSS -->		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">		<!-- MetisMenu CSS -->		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">		<!-- Custom CSS -->		<link href="${contextPath}/CLMF-adminUI-dev/dist/css/sb-admin-2.css" rel="stylesheet">		<!-- Custom Fonts -->		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">		<link href="${contextPath}/CLMF-adminUI-dev/dist/css/mwi_tables/index.css" rel="stylesheet" type="text/css">	</head>	<body>		<div class="row-header">			<div class="col-lg-offset-2  col-lg-6">				<h1 class="page-header"></h1>			</div>			<!-- /.col-lg-12 -->		</div>		<!-- /.row -->		<div class="row-body">			<div class="col-lg-12">							<div class="panel panel-primary">					<div class="panel-heading">						<p class="text-capitalize">							<span class="fa fa-info-circle fa-2x mr10"></span>志愿者信息						</p>					</div>					<form action="${contextPath}/volunteer/importVolunteer" method="post" enctype="multipart/form-data">						<div class="pull-left query">							<span>								<a href="${contextPath}/volunteer/uploadTemplate">下载志愿者信息模板<span class="fa fa-download ml5"></span></a>							</span>							<span>								导入志愿者信息Excel表：								<input type="file" name="file" style="display: inline;"/>							</span>							<span>								<button type="submit" class="btn btn-success">批量导入<b class="fa fa-plus ml5"></b></button>							</span>														<span class="pull-right ml10">		                          	<button type="button" class="btn btn-danger" id="" data-toggle="modal" data-target="#batchdelVolunteer">批量删除<b class="fa fa-remove ml10"></b></button>							</span>							<span class="pull-right">		                          	<button type="button" class="btn btn-success" id="" data-toggle="modal" data-target="#add_info_about_volunteer">新增<b class="fa fa-plus ml10"></b></button>							</span>						</div>					</form>					<form  action="${contextPath}/volunteer" method="post">					<!-- page -->					<input type="hidden" class="pageIndex" name="currentPage" value='<c:out value="${currentPage}" default="1"/>'>					<input type="hidden" class="pageSize" name="currentSize" value='<c:out value="${currentSize}" default="10"/>'>					<input type="hidden" class="totalPages" name="totalPage" value='<c:out value="${volunteerList.totalPage}" default="1"/>'>					<!-- page -->					<!-- /.panel-heading -->					<div class="panel-body">												<table class="table table-condensed  table-hover table-striped table-responsive " cellspacing="2" width="80%">							<caption>								<div class="pull-left query">									<span>										姓名：										<input type="text"  name="realname" placeholder="请输入嘉宾名"/>									</span>									<span>										工作组：										<select name="work_group">											<option value="">请选择分组</option>											<option value="文秘信息组">文秘信息组</option>											<option value="媒体宣传组">媒体宣传组</option>											<option value="注册服务组">注册服务组</option>											<option value="嘉宾接待组">嘉宾接待组</option>											<option value="口岸迎送组">口岸迎送组</option>											<option value="酒店服务组">酒店服务组</option>											<option value="会场管理组">会场管理组</option>											<option value="会议服务组">会议服务组</option>											<option value="展览展示组">展览展示组</option>											<option value="参观考察组">参观考察组</option>											<option value="会议平台组">会议平台组</option>											<option value="志愿服务组">志愿服务组</option>											<option value="交通保障组">交通保障组</option>											<option value="应急安保组">应急安保组</option>											<option value="后勤服务组">后勤服务组</option>										</select>									</span>									<span>										学校：										<input type="text" name="unit" placeholder="请输入单位"/>									</span>									<span>										专业：										<input type="text" name="post" placeholder="请输入专业" />									</span>									<span>										技能：										<input type="text" name="skill" placeholder="请输入技能" />									</span>									<span class="ml20">										<button type="submit" class="btn btn-primary">查询<b class="fa fa-search ml5"></b></button>									</span>								</div>							</caption>							<thead>								<tr>									<th><label>全选<input type="checkbox" class="checkAll"></label></th>									<th>工作组</th>									<th>姓名</th>									<th>证件号</th>									<th>性别</th>									<th>手机号码</th>									<th>邮箱</th>									<th>微信号</th>									<th>学校</th>									<th>专业</th>									<th>技能</th>									<th>操作</th>								</tr>							</thead>							<tbody>								<c:forEach  items="${volunteerList.list}" var="vl">									<tr>									<td><input type="checkbox" name="checkbox_data" value="${vl.id}"></td>									<td class="staff" width="10%" style="position: absolute;">										工作组										<div class="table-tooltip">											<span>工作组</span>										</div>									</td>									<%-- <td>${vl.work_group}</td> --%>									<td>${vl.realname}</td>									<td>${vl.cardNum}</td>									<td>										<c:if test="${vl.sex==1}">											男										</c:if>										<c:if test="${vl.sex==2}">											女										</c:if>									</td>									<td>${vl.phone}</td>									<td>${vl.email}</td>									<td>${vl.wechat_username}</td>									<td>${vl.unit}</td>									<td>${vl.post}</td>									<td>${vl.skill}</td>									<td>										<button type="button" class="btn btn-sm btn-default mr10" data-toggle="modal" onclick="findById('${vl.id}');" data-target="#edit_info_about_volunteer">编辑<span class="fa fa-edit"></span>										</button>										<button type="button" class="btn btn-sm btn-danger"  data-toggle="modal" data-target="#delVolunteer${vl.id}">删除<span class="fa fa-remove"></span>										</button>										<div class="modal fade" id="delVolunteer${vl.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:15%;">											<div class="modal-dialog">												<div class="modal-content">													<div class="modal-header" style="border-radius:6px 6px 0 0 ;">														<button type="button" class="close" data-dismiss="modal" aria-hidden="true">															&times;														</button>														<h4 class="modal-title" id="">																					  删除志愿者														</h4>													</div>													<div class="modal-body text-center">														<div class="text-center text-info">															确定要删除该志愿者吗？														</div>														<div class="text-center mt20">															<button type="button" onclick="deleteById('${vl.id}');" class="btn btn-danger mr10">确定</button>															<button type="button" class="btn btn-success" data-dismiss="modal" aria-hidden="true">取消</button>														</div>													</div>												</div>												<!-- /.modal-content -->											</div>											<!-- /.modal -->										</div>									</td>								</tr>								</c:forEach>							</tbody>						</table>					</div>					<!-- /.panel-body -->					<div class="panel-footer ">						<div class="navbar navbar-default navbar-link">							<div class="pull-left mt25 ml10">								展示：								<select class="pageSizeSelect" name="select_items">									<c:choose>										<c:when test="${currentSize == 10}"><option selected="selected" value="10">10</option></c:when>										<c:otherwise><option value="10">10</option></c:otherwise>									</c:choose>									<c:choose>										<c:when test="${currentSize == 20}"><option selected="selected" value="20">20</option></c:when>										<c:otherwise><option value="20">20</option></c:otherwise>									</c:choose>									<c:choose>										<c:when test="${currentSize == 50}"><option selected="selected" value="50">50</option></c:when>										<c:otherwise><option value="50">50</option></c:otherwise>									</c:choose>									<c:choose>										<c:when test="${currentSize == 100}"><option selected="selected" value="100">100</option></c:when>										<c:otherwise><option value="100">100</option></c:otherwise>									</c:choose>									<c:choose>										<c:when test="${currentSize == 500}"><option selected="selected" value="500">500</option></c:when>										<c:otherwise><option value="500">500</option></c:otherwise>									</c:choose>								</select>								数据							</div>							<div class="pull-left mt25 ml20">								跳到第								<input type="number" name="select_guest_name" style="width: 70px !important;" value="${currentPage}"/>								页								<button class="btn btn-primary btn-sm">go</button>							</div>							<div class="pull-left mt30 ml20">								<a href="#">升序</a>								<a href="#">降序</a>							</div>							<div class="nav nav-tabs nav-tabs-justified pull-right">								<ul class="paginator nav nav-tabs nav-tabs-justified pull-right">								</ul>							</div>								</div>							</div>					</form>				</div>				<!-- /.panel -->			</div>			<!-- /.col-lg-12 -->		</div>		<!-- /.row -->		<!-- /#page-wrapper -->		<!---            编辑嘉宾信息     	         	         ---->		<div id="edit_info_about_volunteer" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">			<div class="modal-dialog">				<form action="${contextPath}/volunteer/update" method="post">				<div class="modal-content">					<div class="modal-body">						<div class="panel panel-primary">							<div class="panel panel-heading">								<h4>									<span class="fa fa-edit mr10"></span>志愿者信息									<div class="pull-right btn-group-sm ">										<button class="btn btn-success btn-sm">保存<span class="fa fa-save"></span></button>										<button class="btn btn-warning btn-sm" data-dismiss="modal">关闭<span class="fa fa-power-off"></span></button>									</div>								</h4>							</div>							<div class="panel panel-body">								<input type="hidden" id="vOId" name="vOId" value=""/>								<table class="table table-bordered table-hover table-responsive">									<tbody>										<tr>											<td>工作组：</td>											<td style="position:absolute;">												<input type="text" name="work_group" placeholder="请选择工作组" readonly="readonly" style="width:330px; margin-top:-20px;">												<div class="table-tooltip" style="width:160px !important;margin-left:3px !important;padding:5px;">													<span><label><input type="checkbox">文秘信息组</label></span>													<span><label><input type="checkbox">媒体宣传组</label></span>													<span><label><input type="checkbox">注册服务组</label></span>													<span><label><input type="checkbox">嘉宾接待组</label></span>													<span><label><input type="checkbox">口岸迎送组</label></span>													<span><label><input type="checkbox">酒店服务组</label></span>													<span><label><input type="checkbox">会场管理组</label></span>													<span><label><input type="checkbox">会议服务组</label></span>													<span><label><input type="checkbox">展览展示组</label></span>													<span><label><input type="checkbox">参观考察组</label></span>													<span><label><input type="checkbox">会议平台组</label></span>													<span><label><input type="checkbox">志愿服务组</label></span>													<span><label><input type="checkbox">交通保障组</label></span>													<span><label><input type="checkbox">应急安保组</label></span>													<span><label><input type="checkbox">后勤服务组</label></span>													<span class="text-center"><button type="button" class="btn btn-sm btn-primary mr5 yesToChose">确认选择</button><button type="button" class="btn btn-sm btn-primary closeTooltip">取消选择</button></span>												</div>											</td>										</tr>										<tr>											<td>姓名：</td>											<td>												<input type="text" name="realname" id="realname" placeholder="请输入姓名" value="" style="width:80%;">											</td>										</tr>										<tr>											<td>身份证号：</td>											<td>												<input type="text" name="id_no" id="id_no" placeholder="请输入身份证号" value="" style="width:80%;">											</td>										</tr>										<tr>											<td>性别：</td>											<td>												<label><input type="radio" name="sex" id="sex1" value="1" >男</label>												<label><input type="radio" name="sex" id="sex2" value="2">女</label>											</td>										</tr>										<tr>											<td>手机号码：</td>											<td>												<input type="text" name="phone" id="phone" value="" placeholder="请输入手机号码" style="width:80%;">											</td>										</tr>										<tr>											<td>邮箱：</td>											<td>												<input type="text" name="email" id="email" value="" placeholder="请输入邮箱"  style="width:80%;"/>											</td>										</tr>										<tr>											<td>微信号：</td>											<td>												<input type="text" name="wechat_username" id="wechat_username" value="" placeholder="请输入微信号"  style="width:80%;"/>											</td>										</tr>										<tr>											<td>学校:</td>											<td>												<input type="text" name="unit" id="unit" value="" placeholder="请输入学校"  style="width:80%;"/>											</td>										</tr>										<tr>											<td>专业:</td>											<td>												<input type="text" name="post" id="post" value="" placeholder="请输入专业"  style="width:80%;"/>											</td>										</tr>										<tr>											<td>技能：</td>											<td>												<input type="text" name="skill" id="skill" value="" placeholder="请输入技能"  style="width:80%;"/>											</td>										</tr>									</tbody>								</table>							</div>						</div>						<div>						</div>					</div>				</div>				<!-- /.modal-content -->				</form>			</div>		</div>		<div id="add_info_about_volunteer" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">			<div class="modal-dialog">			<form action="${contextPath}/volunteer/save" method="post">				<div class="modal-content">					<div class="modal-body">						<div class="panel panel-primary">							<div class="panel panel-heading">								<h4>									<span class="fa fa-edit mr10"></span>志愿者信息									<div class="pull-right btn-group-sm ">										<button type="submit" class="btn btn-success btn-sm">保存<span class="fa fa-save"></span></button>										<button class="btn btn-warning btn-sm" data-dismiss="modal">关闭<span class="fa fa-power-off"></span></button>									</div>								</h4>							</div>							<div class="panel panel-body">								<table class="table table-bordered table-hover table-responsive">									<tbody>										<tr>											<td>工作组：</td>											<td style="position:absolute;">												<input type="text" name="work_group" placeholder="请选择工作组" readonly="readonly" style="width:330px; margin-top:-20px;">												<div class="table-tooltip" style="width:160px !important;margin-left:3px !important;padding:5px;">													<span><label><input type="checkbox">文秘信息组</label></span>													<span><label><input type="checkbox">媒体宣传组</label></span>													<span><label><input type="checkbox">注册服务组</label></span>													<span><label><input type="checkbox">嘉宾接待组</label></span>													<span><label><input type="checkbox">口岸迎送组</label></span>													<span><label><input type="checkbox">酒店服务组</label></span>													<span><label><input type="checkbox">会场管理组</label></span>													<span><label><input type="checkbox">会议服务组</label></span>													<span><label><input type="checkbox">展览展示组</label></span>													<span><label><input type="checkbox">参观考察组</label></span>													<span><label><input type="checkbox">会议平台组</label></span>													<span><label><input type="checkbox">志愿服务组</label></span>													<span><label><input type="checkbox">交通保障组</label></span>													<span><label><input type="checkbox">应急安保组</label></span>													<span><label><input type="checkbox">后勤服务组</label></span>													<span class="text-center"><button type="button" class="btn btn-sm btn-primary mr5 yesToChose">确认选择</button><button type="button" class="btn btn-sm btn-primary closeTooltip">取消选择</button></span>												</div>											</td>										</tr>										<tr>											<td>姓名：</td>											<td>												<input type="text" name="realname"  placeholder="请输入姓名" value="" style="width:80%;">											</td>										</tr>										<tr>											<td>身份证号：</td>											<td>												<input type="text" name="id_no"  placeholder="请输入身份证号" value=""  style="width:80%;">											</td>										</tr>										<tr>											<td>性别：</td>											<td>												<label><input type="radio" name="sex"  value="1" checked="checked">男</label>												<label><input type="radio" name="sex"  value="2">女</label>											</td>										</tr>										<tr>											<td>手机号码：</td>											<td>												<input type="text" name="phone"  value="" placeholder="请输入手机号码" style="width:80%;">											</td>										</tr>										<tr>											<td>邮箱：</td>											<td>												<input type="text" name="email"  value="" placeholder="请输入邮箱"  style="width:80%;"/>											</td>										</tr>										<tr>											<td>微信：</td>											<td>												<input type="text" name="wechat_username"  value="" placeholder="请输入微信"  style="width:80%;"/>											</td>										</tr>										<tr>											<td>学校:</td>											<td>												<input type="text" name="unit"  value="" placeholder="请输入学校"  style="width:80%;"/>											</td>										</tr>										<tr>											<td>专业:</td>											<td>												<input type="text" name="post"  value="" placeholder="请输入专业"  style="width:80%;"/>											</td>										</tr>										<tr>											<td>技能：</td>											<td>												<input type="text" name="skill" value="" placeholder="请输入技能"  style="width:80%;"/>											</td>										</tr>									</tbody>								</table>							</div>						</div>						<div>						</div>					</div>				</div>				<!-- /.modal-content -->			</form>			</div>		</div>		<div class="modal fade" id="batchdelVolunteer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:15%;">			<div class="modal-dialog">				<div class="modal-content">					<div class="modal-header" style="border-radius:6px 6px 0 0 ;">						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">							&times;						</button>						<h4 class="modal-title" id="">													  删除志愿者						</h4>					</div>					<div class="modal-body text-center">						<div class="text-center text-info">							确定要删除该志愿者吗？						</div>						<div class="text-center mt20">							<button type="button" onclick="batchDel();" class="btn btn-danger mr10">确定</button>							<button class="btn btn-success" data-dismiss="modal" aria-hidden="true">取消</button>						</div>					</div>				</div>				<!-- /.modal-content -->			</div>			<!-- /.modal -->		</div>		<!-- jQuery -->		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/jquery/dist/jquery.min.js"></script>		<!-- Bootstrap Core JavaScript -->		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>		<!-- Metis Menu Plugin JavaScript -->		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/metisMenu/dist/metisMenu.min.js"></script>		<!-- Custom Theme JavaScript -->		<script src="${contextPath}/CLMF-adminUI-dev/dist/js/sb-admin-2.js"></script>		<script src="${contextPath}/CLMF-adminUI-dev/dist/js/mwi_tables/index.js"></script>				<script src="${contextPath}/CLMF-adminUI-dev/bower_components/paginator/paginator.min.js"></script>		<script src="${contextPath}/CLMF-adminUI-dev/dist/js/page/page.js"></script>		<!-- Page-Level Demo Scripts - Tables - Use for reference -->		<script type="text/javascript">			$('input[name=work_group]').on('click',function(){				$(this).next().show();			});			$('.yesToChose').on('click',function(){				var groupbox = $(this).parents('.table-tooltip').find('input[type=checkbox]:checked');				var groups = []				for(var i=0;i<groupbox.length;i++){					var group = $(groupbox).eq(i).parent().text();					groups.push(group);				}				$(this).parents('.table-tooltip').prev('input').val(groups.toString());				$(this).parents('.table-tooltip').hide();			});			$('.closeTooltip').on('click',function(){				$(this).parents('.table-tooltip').hide();			});			$(function(){				if(getCookie('responseCode') == 1){					alert("导入成功！");					delCookie('responseCode');				}else if(getCookie('responseCode') == 0){					alert("导入失败！");					delCookie('responseCode');				}			});						function getCookie(name){			    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");			    if(arr=document.cookie.match(reg))			        return (arr[2]);			    else			        return null;			}						function delCookie(name){			    var exp = new Date();			    exp.setTime(exp.getTime() - 1);			    var cval=getCookie(name);			    if(cval!=null)			        document.cookie= name + "="+cval+";expires="+exp.toGMTString();			}			function findById(id){			$.post("${contextPath}/volunteer/findByVoId/"+id, function(data){					$("#vOId").val(data.volunteer.id);					$("#realname").val(data.volunteer.realname);					$("#id_no").val(data.volunteer.id_no);					 if(data.volunteer.sex==1){						$("#sex1").attr("checked","checked");					}else{						$("#sex2").attr("checked","checked");					} 					$("#phone").val(data.volunteer.phone);					$("#unit").val(data.volunteer.unit);					$("#email").val(data.volunteer.email);					$("#wechat_username").val(data.volunteer.wechat_username);					$("#post").val(data.volunteer.post);					$("#skill").val(data.volunteer.skill);				});			}						function deleteById(id){				window.location.href = "${contextPath}/volunteer/deleteByVoId/"+id;			}						function batchDel(){					var str = "";					$("input[name='checkbox_data']:checked").each(function(){	                	str += $(this).val()+",";		            });		            str = str.substring(0, str.length - 1);					 /* $("#batchDelNews").submit(); */									window.location.href = "${contextPath}/volunteer/bathdelVolunteer?voId="+str; 				}		</script>	</body></html>