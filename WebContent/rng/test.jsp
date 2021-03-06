<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="s" uri="/struts-tags"%>
<html ng-app="store">
<head>
	<link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css" />
	<script type="text/javascript" src="angular.min.js"></script>
	<script type="text/javascript" src="app.js"></script>
	<script>
	function changetext(id) {
		id.innerHTML = "谢谢!";
	}
	</script>
</head>
<body ng-controller="StoreController as store">
	<div class="container">
		<ul class="list-group">
			<li class="list-group-item" ng-repeat="product in store.products">
				<h3>
					{{product.name}}
					<em class="pull-right">$ {{product.price}}</em>
					<h1> {{product.name}} </h1>
					<h2> {{product.price | currency}} </h2>
					<!--<p> {{product.description}} </p>-->
					<!--<img ng-src="{{product.images[0].full}}"/>-->
					<!--<button ng-show="product.canPurchase"> Add to Cart </button>-->
				</h3>
				<section ng-controller="PanelController as panel">
					<ul class="nav nav-pills">
						<li ng-class="{ active:panel.isSelected(1) }"> 
							<a href ng-click="panel.selectTab(1)">Description</a> 
						</li>
						<li ng-class="{ active:panel.isSelected(2) }"> 
							<a href ng-click="panel.selectTab(2)">Specifications</a> 
						</li>
						<li ng-class="{ active:panel.isSelected(3) }"> 
							<a href ng-click="panel.selectTab(3)">Reviews</a> 
						</li>
					</ul>
					<div class="panel" ng-show="panel.isSelected(1)">
						<h4>Description</h4>
						<p>{{product.description}}</p>
					</div>
					<div class="panel" ng-show="panel.isSelected(2)">
						<h4>Specifications</h4>
						<p>Not Yet</p>
					</div>
					<div class="panel" ng-show="panel.isSelected(3)">
						<h4>Reviews</h4>
						<blockquote ng-repeat="review in product.reviews">
							<b>Stars: {{review.stars}}</b>
							{{review.body}}
							<cite>by: {{review.author}}</cite>
						</blockquote>
						<form name="reviewForm" class="form-horizontal" role="form" ng-controller="ReviewController as reviewCtrl" ng-submit="reviewForm.$valid && reviewCtrl.addReview(product)">
							<blockquote>
								<b>Stars: {{reviewCtrl.review.stars}}</b>
								{{review.body}}
								<cite>by: {{reviewCtrl.review.author}}</cite>
							</blockquote>
							<div class="form-group">
								<label class="col-sm-2 control-label">Stars</label>
								<div class="col-sm-10">
									<select ng-model="reviewCtrl.review.stars" class="form-control" required>
										<option value="1">1 star</option>
										<option value="2">2 stars</option>
										<option value="3">3 stars</option>
										<option value="4">4 stars</option>
										<option value="5">5 stars</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">Description</label>
								<div class="col-sm-10">
									<textarea ng-model="reviewCtrl.review.body" class="form-control" ></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">by:</label>
								<div class="col-sm-10">
									<input ng-model="reviewCtrl.review.author" type = "email" class="form-control" placeholder="Email"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">reviewForm is {{reviewForm.$valid}}</label>
								<div class="col-sm-10">  <!-- class="col-sm-offset-2 col-sm-10" -->
									<input type="submit" value="Submit" />
								</div>
							</div>
						</form>
					</div>
				</section>
			</li>
		</ul>
		add operands
		<br/>
		<s:form action="mystruts/sum.action">
			<s:textfield name="operand1" label=" operand1" />
			<s:textfield name="operand2" label=" operand2" />
			<s:submit value="sum" />
		</s:form>
</div>

<h1 onclick="changetext(this)">click me</h1>
</body>
</html>