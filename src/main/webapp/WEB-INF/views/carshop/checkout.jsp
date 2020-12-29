<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/header.jsp"%>


<style>

.order_box .list li:nth-child(4) a .middle {
    margin-left: 30px;
}

</style>

  <title>carshop - checkout</title>
	<link rel="stylesheet" href="/resources/vendors/linericon/style.css">
  <link rel="stylesheet" href="/resources/vendors/nouislider/nouislider.min.css">


	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1><img src="/resources/img/checkout/bankcash.png" style="width:80px; heigh:100%; padding-right:10px"/>상품 구매 페이지</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item">구매할 상품을 확인해주세요</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
  
  
  <!--================Checkout Area =================-->
  <section class="checkout_area section-margin--small">
    <div class="container">
        <div class="billing_details">
            <div class="row">
                <div class="col-lg-8" style="padding-top:30px; padding-bottom:30px">
                	    <!-- 일반 유저 테이블 에서 실명, 아이디, 전화번호, 이메일, 주소(대분류), 상세주소(소분류), 차종 jstl로 가져오기 (2020.12.18 재원)  -->
                    <h3>구매자 정보</h3> 
                    <form class="row contact_form" action="" method="get" novalidate="novalidate">
                       <c:forEach items="${pUser}" var="pUser">
                        <div class="col-md-6 form-group p_star">받는사람
                            <input type="text" class="form-control" name="name" value='${pUser.name}' readonly="readonly">
                            <span class="placeholder" data-placeholder="First name"></span>                            
                        </div>
                        <div class="col-md-6 form-group p_star">아이디
                            <input type="text" class="form-control" id="last" name="u_id" value='${pUser.u_id}' readonly="readonly">
                            <span class="placeholder" data-placeholder="Last name"></span>
                        </div>
                        <div class="col-md-12 form-group p_star">전화 번호
                            <input type="text" class="form-control" id="number" name="phone" value='${pUser.phone}' readonly="readonly">
                            <span class="placeholder" data-placeholder="Phone number"></span>
                        </div>
                        <div class="col-md-12 form-group p_star">이메일
                            <input type="text" class="form-control" id="email" name="email" value='${pUser.email}' readonly="readonly">
                            <span class="placeholder" data-placeholder="Email Address"></span>
                        </div>
                        <div class="col-md-12 form-group p_star">주소
                            <input type="text" class="form-control" id="add1" name="addr" value='${pUser.addr}' readonly="readonly">
                            <span class="placeholder" data-placeholder="Address line 01"></span>
                        </div>
                        <div class="col-md-12 form-group p_star">상세 주소
                            <input type="text" class="form-control" id="add2" name="addr2" value='${pUser.addr2}' readonly="readonly">
                            <span class="placeholder" data-placeholder="Address line 02"></span>
                            <button type="button" class="btn btn-outline-info font-weight-light" style="float:right;" data-toggle="modal" data-target="#exampleModalCenter1">주소 바꾸기</button>
                        </div>
                        <div class="col-md-12 form-group p_star">구매자 차종
                            <input type="text" class="form-control" id="city" name="cars" value='${pUser.cars}' readonly="readonly">
                            <span class="placeholder" data-placeholder="Town/City"></span>
                        </div>  
                    </c:forEach>                   
                    </form>
                </div>
                <div class="col-lg-4" style="padding-top:80px; padding-bottom:30px">
                 <!-- form으로 구매이력의 데이터를 넘겨야 함  (2020.12.18 재원)  -->
                 <form action="checkout" method="post" id="checkoutform">
                    <div class="order_box">
                      <h2>결제 정보</h2>
                      <!-- 장바구니 테이블 에서 상품명, 상품번호, 상품수량, 상품 금액 jstl로 가져오기 (2020.12.18 재원)  -->
                        <ul class="list">
                        	<li><a href="#"><h4>상품이름 &emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;수량<span>Total</span></h4></a></li>
                        	<c:set var="col_sum" value="0"/>
                        	<c:forEach items="${cartList}" var ="cart" varStatus="status">
                            	<li><a href="#"><c:out value="${cart.pname}"></c:out><span class="middle" style="position:absolute;left:30%;"> <c:out value="${cart.quantity}"></c:out></span> <span class="last"><c:out value="${cart.total}" /></span></a></li>
                        		<c:set var="col_sum" value="${col_sum + cart.total}" />
                        	</c:forEach>
                        </ul>
                        <hr>
                        <ul class="list list_2">
                            <li><a href="#">총 금액<span><c:out value="${col_sum}"></c:out></span></a></li>
                        </ul>
                        <!-- Todo : 결제 수단 (pay)가 구매이력(buylist) 테이블에 들어가야함 (2020.12.18 재원) -->
                        <div class="payment_item">
                            <div class="radion_btn">
                                <input type="radio" id="f-option5" name="pay" value="신용카드">
                                <label for="f-option5">신용카드</label>
                                <div class="check"></div>
                            </div>
                        </div>
                        <div class="payment_item active">
                            <div class="radion_btn">
                                <input type="radio" id="f-option6" name="pay" value="계좌이체">
                                <label for="f-option6">계좌이체</label>                                
                                <div class="check"></div>
                            </div>
                        </div>
                    <!-- a 태그에 onclick 줘서 데이터 넘겨야함  (2020.12.18 재원)  -->
                       	<div class="text-center">
                          <a class="button button-paypal" href="#">결제하기</a>
                        </div>
                    </div>
                   </form>
                </div>
            </div>
        </div>
    </div>
  </section>
  <!--================End Checkout Area =================-->
<!-- 주소 Modal -->
<div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">주소를 새롭게 설정하시겠습니까?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        마이페이지 > 개인 정보 수정으로 이동합니다. 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" onclick="location.href='/carshop/mypage'">이동</button>
      </div>
    </div>
  </div>
</div>


<!-- 결제 Modal -->
<div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
      <h5 class="modal-title" id="exampleModalLongTitle">결제를 진행하시겠습니까?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        결제 완료 후 구매이력창으로 이동합니다.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-danger btn-creditcheck">결제하기</button>
      </div>
    </div>
  </div>
</div>


<!-- 구매 방법 Modal -->
<div class="modal fade" id="exampleModalCenter3" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
      <h5 class="modal-title" id="exampleModalLongTitle">구매방법을 결정하십시오</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        결제 완료 후 구매이력창으로 이동합니다.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-danger btn-creditcheck">결제하기</button>
      </div>
    </div>
  </div>
</div>
  
  
  <script src="/resources/vendors/jquery/jquery-3.2.1.min.js"></script>
  <!-- 결제수단 라디오 버튼 체크 확인 및 name 설정 (재원/20.12.22) -->
 	<script type="text/javascript">
 		$(document).ready(function(){
 			
 			//console.log("들어오는지");
 			//var isChecked = $('#f-option5').val();
 			//console.log("인식하는지" + isChecked);
 			
/*  			$("#getItemChange").click(function(){
  		        $("#exampleModal").appendTo("body").modal();
  		    }); */
 			
  			$("input[type='radio']").on('change', function() {
  				console.log("input[type='radio']들어오는지");
  				
 	  				if($('#f-option6').is(":checked")){
 	 					$('#f-option6').attr('name', 'pay');
 	 					$('#f-option5').removeAttr('name'); 
 	 					console.log("계좌이체 체크");
 	 				}
 	 				if($('#f-option5').is(":checked")) {
 	 					$('#f-option5').attr('name', 'pay');
 	 					$('#f-option6').removeAttr('name');
 	 					console.log("신용카드 체크");
 	 				}
 			}); 
  			
  			$('.button-paypal').click(function() {
  				
  				if(($('#f-option6').is(":checked")) || ($('#f-option5').is(":checked"))){
  						$("#exampleModalCenter2").modal('show');
  		
  				}
  				else {
  					
  				}
  			});
  			
  			$('.btn-creditcheck').click(function() {
  				
  				$('#checkoutform').submit();
  				
  			});
  			
 		
 		});
  		
  	</script>



  <!--================ Start footer Area  =================-->	

<%@ include file="../include/footer.jsp"%>