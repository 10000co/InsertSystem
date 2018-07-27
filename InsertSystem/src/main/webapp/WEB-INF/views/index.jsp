<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Food DB 추가</title>
<script src="resources/jquery-3.3.1.min.js" type="text/javascript"></script>
<script>
	var idx_start = '';
	var idx_end = '';
	var rowArr = [];

	$(function(){
		$('#addData').on('click', getData);
		
	});
	
	function getData() {
		idx_start = $('#idx_start').val();
		idx_end = $('#idx_end').val();
		
		//alert('idx_start: ' + idx_start +', idx_end: ' + idx_end);
		
		$.ajax({
			method : 'GET',
			url : 'http://openapi.foodsafetykorea.go.kr/api/c6342d8932384ca4bbc4/I0750/json/' + idx_start + '/' + idx_end,
			dataType : 'text',
			success : function(response) {
				//$("#search_result").text(response);
				var rs = JSON.parse(response);
								
				//alert(rs['I0750'].row[0].FDGRP_NM);
				
				for(var i in rs['I0750'].row) {
					var num = rs['I0750'].row[i].NUM == "" ? null : rs['I0750'].row[i].NUM;
					var food_cd = rs['I0750'].row[i].FOOD_CD == "" ? null : rs['I0750'].row[i].FOOD_CD;
					var fdgrp_nm = rs['I0750'].row[i].FDGRP_NM == "" ? null : rs['I0750'].row[i].FDGRP_NM;
					var desc_kor = rs['I0750'].row[i].DESC_KOR == "" ? null : rs['I0750'].row[i].DESC_KOR;
					var serving_wt = rs['I0750'].row[i].SERVING_WT == "" ? null : parseFloat(rs['I0750'].row[i].SERVING_WT);
					var nutr_cont1 = rs['I0750'].row[i].NUTR_CONT1 == "" ? null : parseFloat(rs['I0750'].row[i].NUTR_CONT1);
					var nutr_cont2 = rs['I0750'].row[i].NUTR_CONT2 == "" ? null : parseFloat(rs['I0750'].row[i].NUTR_CONT2);
					var nutr_cont3 = rs['I0750'].row[i].NUTR_CONT3 == "" ? null : parseFloat(rs['I0750'].row[i].NUTR_CONT3);
					var nutr_cont4 = rs['I0750'].row[i].NUTR_CONT4 == "" ? null : parseFloat(rs['I0750'].row[i].NUTR_CONT4);
					var nutr_cont5 = rs['I0750'].row[i].NUTR_CONT5 == "" ? null : parseFloat(rs['I0750'].row[i].NUTR_CONT5);
					var nutr_cont6 = rs['I0750'].row[i].NUTR_CONT6 == "" ? null : parseFloat(rs['I0750'].row[i].NUTR_CONT6);
					var nutr_cont7 = rs['I0750'].row[i].NUTR_CONT7 == "" ? null : parseFloat(rs['I0750'].row[i].NUTR_CONT7);
					var nutr_cont8 = rs['I0750'].row[i].NUTR_CONT8 == "" ? null : parseFloat(rs['I0750'].row[i].NUTR_CONT8);
					var nutr_cont9 = rs['I0750'].row[i].NUTR_CONT9 == "" ? null : parseFloat(rs['I0750'].row[i].NUTR_CONT9);
					var animal_plant = rs['I0750'].row[i].ANIMAL_PLANT == "" ? null : rs['I0750'].row[i].ANIMAL_PLANT;
					var bgn_year = rs['I0750'].row[i].BGN_YEAR == "" ? null : rs['I0750'].row[i].BGN_YEAR;
					
					var addArr = {
						"num" : num,
						"food_cd" : food_cd,
						"fdgrp_nm" : fdgrp_nm,
						"desc_kor" : desc_kor,
						"serving_wt" : serving_wt,
						"nutr_cont1" : nutr_cont1,
						"nutr_cont2" : nutr_cont2,
						"nutr_cont3" : nutr_cont3,
						"nutr_cont4" : nutr_cont4,
						"nutr_cont5" : nutr_cont5,
						"nutr_cont6" : nutr_cont6,
						"nutr_cont7" : nutr_cont7,
						"nutr_cont8" : nutr_cont8,
						"nutr_cont9" : nutr_cont9,
						"animal_plant" : animal_plant,
						"bgn_year" : bgn_year
						
					};
					
					rowArr.push(addArr);
				}
				
				//alert( JSON.stringify(rowArr[0]) );
				//alert( JSON.stringify(rowArr[1]) );
				
				addData();
			}
		});
	}
	
	function addData() {
		$.ajax({
			method : 'POST',
			url : 'addData',
			data : JSON.stringify(rowArr),
			dataType : 'json',
			contentType : "application/json; charset=UTF-8",
			success : function(response) {
				alert("성공");
			}
		});
	}
	
</script>
</head>
<body>

<input id="idx_start" type="text" /> - <input id="idx_end" type="text" />
<input id="addData" type="button" value="추가" />

<div id="search_result"></div>

</body>
</html>