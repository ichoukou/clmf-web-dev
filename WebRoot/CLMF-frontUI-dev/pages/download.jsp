<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>资料下载</title>
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/bootstrap-3.3.4-dist/bootstrap-3.3.4-dist/css/bootstrap.css" />
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/css/animate.css" />
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/css/style.css" />
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/font-awesome-4.3.0/css/font-awesome.css" />

	</head>

	<body>
		<div class="row">
			
			<hr style="line-height: 3px; color: #265A88;margin-top:20px;">

			<div class="col-lg-offset-1 col-md-3  col-lg-2 mt30">
				<!-- 对话模态框 start -->
				<div class=" text-left info">
					<ul class="nav  nav-stacked nav-tabs " style="float: right;">
						<li>
							<a href="#self_info" data-toggle="tab">
							<span class="fa fa-university " style="color: #9ACFEA;"></span>&nbsp;个人信息</a>
						</li>
						<li>
							<a href="#conference_data" data-toggle="tab">
							<span class="fa fa-credit-card " style="color: #9ACFEA;"></span>&nbsp;会议资料</a>
						</li>
					</ul>
				</div>
				<!--  对话模态框 end -->
			</div>

			<div class="col-lg-8 ml20 mt30">

				<div class="tab-content">

					<!--个人基本信息下载开始-->

					<div class="tab-pane fade in active row-body" id="self_info">

						<table class="table table-striped table-responsive table-hover">

							<thead>
								<tr>

									<th>文件名</th>
									<th>有效期</th>
									<th>文件大小</th>
									<th>上传者</th>
									<th>上传时间&nbsp;<span class="fa fa-upload"></span></th>
									<th>下载次数</th>
									<th>操作</th>

								</tr>

							</thead>
							<!-- <tbody>
								<tr>
									<td><span class="fa fa-wordpress" style="color: #AFD9EE;"></span>&nbsp;会展文件资源管理.docx</td>
									<td>永久有效</td>
									<td>19.29KB</td>
									<td><a href="#">佳元</a></td>
									<td>2015/6/22</td>
									<td>6次</td>
									<td colspan="1">
										<a href="#"> <span class="fa fa-download " style="color: #5DACE4;"></span></a>
									</td>
								</tr>
								<tr>
									<td><span class="fa fa-file-pdf-o" style="color: #AC2925;"></span>&nbsp;会展文件资源管理.pdf</td>
									<td>永久有效</td>
									<td>19.29KB</td>
									<td><a href="#">大头</a></td>
									<td>2015/6/22</td>
									<td>6次</td>
									<td colspan="1">
										<a href="#"> <span class="fa fa-download " style="color: #5DACE4;"></span></a>
									</td>
								</tr>
							</tbody> -->
						</table>

					</div>
					<!--个人基本信息下载结束-->

					<!--会议资料下载开始-->

					<div class="tab-pane fade" id="conference_data">

						<table class="table table-striped table-responsive table-hover">
							<thead>
								<tr>
									<th>文件名</th>
									<th>有效期</th>
									<th>文件大小</th>
									<th>上传者</th>
									<th>上传时间&nbsp;<span class="fa fa-upload"></span></th>
									<th>下载次数</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${guestFileList}" var="gfl">
									<tr>
										<td><span class="fa fa-wordpress" style="color: #AFD9EE;"></span>&nbsp;${gfl.file_name}</td>
										<td>${gfl.valid_date}</td>
										<td>${gfl.file_size}KB</td>
										<td><a href="#">${gfl.uploader_name}</a></td>
										<td>${gfl.upload_date}</td>
										<td>${gfl.download_counte}次</td>
										<td colspan="1">
											<a href="${contextPath}/guestFile/download/${gfl.id}"> <span class="fa fa-download " style="color: #5DACE4;"></span></a>
										</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>

					</div>
					<!--会议资料下载结束-->
				</div>

			</div>
			<!-- 资料下载结束 -->
		</div>

		<!-- JavaScript files placed at the end of the document so the pages load faster
		================================================== -->
		<!-- Jquery and Bootstap core js files -->
		<!-- JavaScript files placed at the end of the document so the pages load faster
		================================================== -->
		<!-- Jquery and Bootstap core js files -->
		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
		<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

		<!-- Modernizr javascript -->
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/plugins/modernizr.js"></script>
		<!-- Isotope javascript -->
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/plugins/isotope/isotope.pkgd.min.js"></script>
		<!-- Backstretch javascript -->
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/plugins/jquery.backstretch.min.js"></script>
		<!-- Appear javascript -->
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/plugins/jquery.appear.js"></script>
		<!-- Initialization of Plugins -->
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/js/template.js"></script>
		<!-- Custom Scripts -->
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/js/custom.js"></script>
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/js/valid.js"></script>

	</body>

</html>