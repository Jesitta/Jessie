<div class="col-md-8 oList">
				<c:if test="${!empty categoryList }">
					<table class="table table-responsive">
						<thead>
							<tr>
								<th>IMAGE</th>
								<th>PRODUCT ID</th>
								<th>PRODUCT NAME</th>
								<th>PRODUCT DESCRIPTION</th>
								<th>CATEGORY</th>
								<th>EDIT</th>
								<th>DELETE</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${productList}" var="product">
								<tr>
									<td><img src="<c:url value='/assets/images/products/${product.id}.jpg'/>"  class="img-responsive"
							 height="30px" width="30px"></td>
									<td>${product.id}</td>
									<td>${product.name}</td>
									<td>${product.description}</td>
									<td>${product.categoryname}</td>
									<td><a href="<c:url value="/product/edit/${product.id}"/>">EDIT</a></td>
									<td><a
										href=" <c:url value="/product/delete/${product.id}"/>">DELETE</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>
			</div>
		</div>
	</div>