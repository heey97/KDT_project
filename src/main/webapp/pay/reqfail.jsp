<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고거래</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <style type="text/css">
		  #myModal{
		  	display: block;
		  }
  </style>
</head>
<body>
<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content" id="content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">결제 실패</h4>
        <button type="button" class="btn-close" onclick="location.href='/KDT_TeamProject'"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        	<p>${payErr}</p>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" onclick="location.href='/KDT_TeamProject'">Close</button>
      </div>

    </div>
  </div>
</div>

</html>