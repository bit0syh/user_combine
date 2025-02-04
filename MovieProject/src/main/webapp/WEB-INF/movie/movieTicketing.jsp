<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
/**
* @Class Name :  movieDetail.jsp
* @Description : 영화 세부정보
* @Modification Information
* @
* @  수정일      수정자              수정내용
* @ ---------   ---------   -------------------------------
* @ 2019.07.03     한유진      최초생성
* @ 2019.07.09     한유진      jsp로 변경
* @ 2019.07.15     한유진      7/12 회의결과 수정
* @ 2019.07.22     한유진    	 header, footer 수정(1,2 버전으로 변경)
*
* @author BIT 116기 2조
* @since 2019. 07.01
* @version 1.0
* @see
*
*  Copyright (C) by bit 2조 All right reserved.
*/
-->
<%@ include file="../header1.jsp"%>
	<link rel="stylesheet" href="<c:url value="/resources/css/yj_style.css" />">
	<link rel="stylesheet" href="<c:url value="/resources/css/kgh_style.css" />">
	<link rel="stylesheet" href="<c:url value="/resources/css/ws_ticketing.css" />">
	
<%@ include file="../header2.jsp" %>



<div class="buster-light">
	<div class="hero mv-single-hero" style="height:170px;background-color:#DAD2B4;"> <!-- <<style.css에서 배경이미지 주석처리+배경색 변경 -->
		<div class="ws_brand_selector">
			<input type="checkbox" checked value="all"><label>모든 영화관</label>
			<input type="checkbox" checked value="cgv"><label>CGV</label>
			<input type="checkbox" checked value="mega"><label>메가박스</label>
			<input type="checkbox" checked value="lotte"><label>롯데시네마</label>
		</div>
	</div>
	<div class="row" style="background-color:white;">
	<div id="ws_ticketing_box" >
	
	
	<div class="ws_ticketing_box_top">
	<div id="ws_ticketing_date">
		<div class="ws_ticketing_category">상영일</div>
		<div class="ws_ticketing_dateboard">
			<table>
				<tr>
					<td class="ws_day">월</td>
					<td class="ws_day">화</td>
					<td class="ws_day">수</td>
					<td class="ws_day">목</td>
					<td class="ws_day">금</td>
					<td class="ws_day">토</td>
					<td class="ws_day">일</td>
					<td class="ws_day">월</td>
					<td class="ws_day">화</td>
					<td class="ws_day">수</td>
				</tr>
				<tr>
					<td class="ws_date" onclick="timeSetter(this)"></td>
					<td class="ws_date" onclick="timeSetter(this)"></td>
					<td class="ws_date" onclick="timeSetter(this)"></td>
					<td class="ws_date" onclick="timeSetter(this)"></td>
					<td class="ws_date" onclick="timeSetter(this)"></td>
					<td class="ws_date" onclick="timeSetter(this)"></td>
					<td class="ws_date" onclick="timeSetter(this)"></td>
					<td class="ws_date" onclick="timeSetter(this)"></td>
					<td class="ws_date" onclick="timeSetter(this)"></td>
					<td class="ws_date" onclick="timeSetter(this)"></td>
				</tr>
			</table>
		</div>
	</div>
		
	
	</div>
	
	<div id="ws_ticketing_movies">
		<div class="ws_ticketing_category">상영 영화</div>
		<div class="ws_ticketing_infoboard">
			<table style="text-align:center;border:0px;">
				<tr id="ws_innerhead">
					<th style="width:25%;border-bottom:1px solid black;">예매율</th>
				<!--<th style="width:30%;border-bottom:1px solid black;">상영 브랜드</th>  -->	
					<th style="width:75%;border-bottom:1px solid black;">제 목</th>
				</tr>
				<tr>
					<th class="ws_movie_grade"><img src="<c:url value="/resources/images/customs/ws_img/use18.PNG"/>" style="width:20px;"></th>
				<!--<th class ="ws_cinema_brand" >
						<img src="<c:url value="/resources/images/customs/ws_img/cgv.PNG"/>" style="width:20px;">
						<img src="<c:url value="/resources/images/customs/ws_img/megabox.PNG"/>" style="width:20px;">
						<img src="<c:url value="/resources/images/customs/ws_img/lotte.PNG"/>" style="width:20px;">
					</th> -->
					<th class ="ws_movie_title" style="text-overflow: ellipsis;max-width:20%;">나는 비와 함께간다.</th>
				</tr>
				<c:forEach items="${movies}" var="list">
				<tr>
					<th class="ws_movie_grade">${list.reserveRate}</th>
					<th class="ws_movic_code">
						<a class="ws_movic_code" id="<c:out value="${list.code}"/>" onclick="ab(this.id)">${list.title}</a>
					</th>
				<!--  	<input type = "hidden" id = "code" value = <c:out value="${list.code}"/> />-->
				</tr>
				</c:forEach>
			</table>
			
			
			
			
			
		</div>
	</div>
	
	<div id="ws_ticketing_cines">
		<div class="ws_ticketing_category">극장</div>
		<div class="ws_ticketing_infoboard" style="width:50%;display:inline-block;">
			<div style="display:inline-block;width:100%;">
				<ul>
					<li style="background-color:#dad2b4;width:100%;display:block;padding:6px;">지역</li>
					<li id="GRPA" onclick="getLocalList(this.id)">서울<span></span></li>
					<li id="GRPB" onclick="getLocalList(this.id)">인천/경기<span></span></li>
					<li id="GRPC" onclick="getLocalList(this.id)">대전/충청/강원<span></span></li>
					<li id="GRPD" onclick="getLocalList(this.id)">부산/경남<span></span></li>
					<li id="GRPE" onclick="getLocalList(this.id)">대구/울산/경북<span></span></li>
					<li id="GRPF" onclick="getLocalList(this.id)">광주/전라/제주<span></span></li>
				</ul>
			</div>
		</div>
		<div class="ws_ticketing_infoboard" style="width:50%;display:inline-block;float:right;">
			<div style="display:inline-block;width:100%;">
			<div id="ws_local_detail" >
				<span id="ws_local_detail_top">상세 상영관</span>
				<div id="GRPA-detail" >
					<span id="GRPA101" data-area-group-code="GRPA" data-area-item-code="101" data-area-item-name="강남구" onclick="getCineSchedule(this.id)"><a href="#">강남구 <span>-</span></a></span>    
                    <span id="GRPA102" data-area-group-code="GRPA" data-area-item-code="102" data-area-item-name="강동구" onclick="getCineSchedule(this.id)"><a href="#">강동구 <span>-</span></a></span>    
                    <span id="GRPA103" data-area-group-code="GRPA" data-area-item-code="103" data-area-item-name="강북구" onclick="getCineSchedule(this.id)"><a href="#">강북구 <span>-</span></a></span>    
                    <span id="GRPA104" data-area-group-code="GRPA" data-area-item-code="104" data-area-item-name="강서구" onclick="getCineSchedule(this.id)"><a href="#">강서구 <span>-</span></a></span>    
                    <span id="GRPA105" data-area-group-code="GRPA" data-area-item-code="105" data-area-item-name="관악구" onclick="getCineSchedule(this.id)"><a href="#">관악구 <span>-</span></a></span>    
                    <span id="GRPA106" data-area-group-code="GRPA" data-area-item-code="106" data-area-item-name="광진구" onclick="getCineSchedule(this.id)"><a href="#">광진구 <span>-</span></a></span>    
                    <span id="GRPA107" data-area-group-code="GRPA" data-area-item-code="107" data-area-item-name="구로구" onclick="getCineSchedule(this.id)"><a href="#">구로구 <span>-</span></a></span>    
                    <span id="GRPA108" data-area-group-code="GRPA" data-area-item-code="108" data-area-item-name="금천구" onclick="getCineSchedule(this.id)"><a href="#">금천구 <span>-</span></a></span>    
                    <span id="GRPA109" data-area-group-code="GRPA" data-area-item-code="109" data-area-item-name="노원구" onclick="getCineSchedule(this.id)"><a href="#">노원구 <span>-</span></a></span>    
                    <span id="GRPA110" data-area-group-code="GRPA" data-area-item-code="110" data-area-item-name="도봉구" onclick="getCineSchedule(this.id)"><a href="#">도봉구 <span>-</span></a></span>    
                    <span id="GRPA111" data-area-group-code="GRPA" data-area-item-code="111" data-area-item-name="동대문" onclick="getCineSchedule(this.id)"><a href="#">동대문 <span>-</span></a></span>    
                    <span id="GRPA112" data-area-group-code="GRPA" data-area-item-code="112" data-area-item-name="동작구" onclick="getCineSchedule(this.id)"><a href="#">동작구 <span>-</span></a></span>    
                    <span id="GRPA113" data-area-group-code="GRPA" data-area-item-code="113" data-area-item-name="마포구" onclick="getCineSchedule(this.id)"><a href="#">마포구 <span>-</span></a></span>    
                    <span id="GRPA114" data-area-group-code="GRPA" data-area-item-code="114" data-area-item-name="서대문" onclick="getCineSchedule(this.id)"> <a href="#">서대문 <span>-</span></a></span>    
                    <span id="GRPA115" data-area-group-code="GRPA" data-area-item-code="115" data-area-item-name="서초구" onclick="getCineSchedule(this.id)"><a href="#">서초구 <span>-</span></a></span>    
                    <span id="GRPA116" data-area-group-code="GRPA" data-area-item-code="116" data-area-item-name="성동구" onclick="getCineSchedule(this.id)"><a href="#">성동구 <span>-</span></a></span>    
                    <span id="GRPA117" data-area-group-code="GRPA" data-area-item-code="117" data-area-item-name="성북구" onclick="getCineSchedule(this.id)"><a href="#">성북구 <span>-</span></a></span>    
                    <span id="GRPA118" data-area-group-code="GRPA" data-area-item-code="118" data-area-item-name="송파구" onclick="getCineSchedule(this.id)"><a href="#">송파구 <span>-</span></a></span>    
                    <span id="GRPA119" data-area-group-code="GRPA" data-area-item-code="119" data-area-item-name="양천구" onclick="getCineSchedule(this.id)"><a href="#">양천구 <span>-</span></a></span>    
                    <span id="GRPA120" data-area-group-code="GRPA" data-area-item-code="120" data-area-item-name="영등포" onclick="getCineSchedule(this.id)"><a href="#">영등포 <span>-</span></a></span>    
                    <span id="GRPA121" data-area-group-code="GRPA" data-area-item-code="121" data-area-item-name="용산구" onclick="getCineSchedule(this.id)"><a href="#">용산구 <span>-</span></a></span>    
                    <span id="GRPA122" data-area-group-code="GRPA" data-area-item-code="122" data-area-item-name="은평구" onclick="getCineSchedule(this.id)"><a href="#">은평구 <span>-</span></a></span>    
                    <span id="GRPA123" data-area-group-code="GRPA" data-area-item-code="123" data-area-item-name="종로구" onclick="getCineSchedule(this.id)"><a href="#">종로구 <span>-</span></a></span>    
                    <span id="GRPA124" data-area-group-code="GRPA" data-area-item-code="124" data-area-item-name="중구"   onclick="getCineSchedule(this.id)"><a href="#">중구 <span>-</span></a></span>    
                    <span id="GRPA125" data-area-group-code="GRPA" data-area-item-code="125" data-area-item-name="중랑구" onclick="getCineSchedule(this.id)" style="float:left;"><a href="#"> 중랑구 <span>-</span></a></span>    
				</div>
				<div id="GRPB-detail" >
					<span id="GRPB251" data-area-group-code="GRPB" data-area-item-code="251" data-area-item-name="가평" onclick="getCineSchedule(this.id)"><a href="#">가평 <span>-</span></a></span>    
                    <span id="GRPB201" data-area-group-code="GRPB" data-area-item-code="201" data-area-item-name="고양" onclick="getCineSchedule(this.id)"><a href="#">고양 <span>-</span></a></span>    
                    <span id="GRPB202" data-area-group-code="GRPB" data-area-item-code="202" data-area-item-name="과천" onclick="getCineSchedule(this.id)"><a href="#">과천 <span>-</span></a></span>    
                    <span id="GRPB203" data-area-group-code="GRPB" data-area-item-code="203" data-area-item-name="광명" onclick="getCineSchedule(this.id)"><a href="#">광명 <span>-</span></a></span>    
                    <span id="GRPB252" data-area-group-code="GRPB" data-area-item-code="252" data-area-item-name="광주" onclick="getCineSchedule(this.id)"><a href="#">광주 <span>-</span></a></span>    
                    <span id="GRPB204" data-area-group-code="GRPB" data-area-item-code="204" data-area-item-name="구리" onclick="getCineSchedule(this.id)"><a href="#">구리 <span>-</span></a></span>    
                    <span id="GRPB205" data-area-group-code="GRPB" data-area-item-code="205" data-area-item-name="군포" onclick="getCineSchedule(this.id)"><a href="#">군포 <span>-</span></a></span>    
                    <span id="GRPB206" data-area-group-code="GRPB" data-area-item-code="206" data-area-item-name="김포" onclick="getCineSchedule(this.id)"><a href="#">김포 <span>-</span></a></span>    
                    <span id="GRPB207" data-area-group-code="GRPB" data-area-item-code="207" data-area-item-name="남양주" onclick="getCineSchedule(this.id)"><a href="#">남양주 <span>-</span></a></span>    
                    <span id="GRPB208" data-area-group-code="GRPB" data-area-item-code="208" data-area-item-name="동두천" onclick="getCineSchedule(this.id)"><a href="#">동두천 <span>-</span></a></span>    
                    <span id="GRPB209" data-area-group-code="GRPB" data-area-item-code="209" data-area-item-name="부천" onclick="getCineSchedule(this.id)"><a href="#">부천 <span>-</span></a></span>    
                    <span id="GRPB210" data-area-group-code="GRPB" data-area-item-code="210" data-area-item-name="성남" onclick="getCineSchedule(this.id)"><a href="#">성남 <span>-</span></a></span>    
                    <span id="GRPB211" data-area-group-code="GRPB" data-area-item-code="211" data-area-item-name="수원" onclick="getCineSchedule(this.id)"><a href="#">수원 <span>-</span></a></span>    
                    <span id="GRPB212" data-area-group-code="GRPB" data-area-item-code="212" data-area-item-name="시흥" onclick="getCineSchedule(this.id)"><a href="#">시흥 <span>-</span></a></span>    
                    <span id="GRPB213" data-area-group-code="GRPB" data-area-item-code="213" data-area-item-name="안산" onclick="getCineSchedule(this.id)"><a href="#">안산 <span>-</span></a></span>    
                   	<span id="GRPB214" data-area-group-code="GRPB" data-area-item-code="214" data-area-item-name="안성" onclick="getCineSchedule(this.id)"><a href="#">안성 <span>-</span></a></span>    
                    <span id="GRPB215" data-area-group-code="GRPB" data-area-item-code="215" data-area-item-name="안양" onclick="getCineSchedule(this.id)"><a href="#">안양 <span>-</span></a></span>    
                    <span id="GRPB253" data-area-group-code="GRPB" data-area-item-code="253" data-area-item-name="양주" onclick="getCineSchedule(this.id)"><a href="#">양주 <span>-</span></a></span>    
                    <span id="GRPB254" data-area-group-code="GRPB" data-area-item-code="254" data-area-item-name="양평" onclick="getCineSchedule(this.id)"><a href="#">양평 <span>-</span></a></span>    
                    <span id="GRPB255" data-area-group-code="GRPB" data-area-item-code="255" data-area-item-name="여주" onclick="getCineSchedule(this.id)"><a href="#">여주 <span>-</span></a></span>    
                    <span id="GRPB256" data-area-group-code="GRPB" data-area-item-code="256" data-area-item-name="연천" onclick="getCineSchedule(this.id)"><a href="#">연천 <span>-</span></a></span>    
                    <span id="GRPB216" data-area-group-code="GRPB" data-area-item-code="216" data-area-item-name="오산" onclick="getCineSchedule(this.id)"><a href="#">오산 <span>-</span></a></span>    
                    <span id="GRPB217" data-area-group-code="GRPB" data-area-item-code="217" data-area-item-name="용인" onclick="getCineSchedule(this.id)"><a href="#">용인 <span>-</span></a></span>    
                    <span id="GRPB218" data-area-group-code="GRPB" data-area-item-code="218" data-area-item-name="의왕" onclick="getCineSchedule(this.id)"><a href="#">의왕 <span>-</span></a></span>    
                    <span id="GRPB219" data-area-group-code="GRPB" data-area-item-code="219" data-area-item-name="의정부" onclick="getCineSchedule(this.id)"><a href="#">의정부 <span>-</span></a></span>    
                    <span id="GRPB220" data-area-group-code="GRPB" data-area-item-code="220" data-area-item-name="이천" onclick="getCineSchedule(this.id)"><a href="#">이천 <span>-</span></a></span>    
                    <span id="GRPB340" data-area-group-code="GRPB" data-area-item-code="340" data-area-item-name="인천" onclick="getCineSchedule(this.id)"><a href="#">인천 <span>-</span></a></span>    
                    <span id="GRPB221" data-area-group-code="GRPB" data-area-item-code="221" data-area-item-name="파주" onclick="getCineSchedule(this.id)"><a href="#">파주 <span>-</span></a></span>    
                    <span id="GRPB222" data-area-group-code="GRPB" data-area-item-code="222" data-area-item-name="평택" onclick="getCineSchedule(this.id)"><a href="#">평택 <span>-</span></a></span>    
                    <span id="GRPB257" data-area-group-code="GRPB" data-area-item-code="257" data-area-item-name="포천" onclick="getCineSchedule(this.id)"><a href="#">포천 <span>-</span></a></span>    
                    <span id="GRPB223" data-area-group-code="GRPB" data-area-item-code="223" data-area-item-name="하남" onclick="getCineSchedule(this.id)"><a href="#">하남 <span>-</span></a></span>    
                    <span id="GRPB258" data-area-group-code="GRPB" data-area-item-code="258" data-area-item-name="화성" onclick="getCineSchedule(this.id)"><a href="#">화성 <span>-</span></a></span>    
					
				</div>
				<div id="GRPC-detail">
				    <span id="GRPC901" data-area-group-code="GRPC" data-area-item-code="901" data-area-item-name="강릉" onclick="getCineSchedule(this.id)"><a href="#">강릉 <span>-</span></a></span>    
                    <span id="GRPC801" data-area-group-code="GRPC" data-area-item-code="801" data-area-item-name="공주" onclick="getCineSchedule(this.id)"><a href="#">공주 <span>-</span></a></span>    
                    <span id="GRPC802" data-area-group-code="GRPC" data-area-item-code="802" data-area-item-name="논산" onclick="getCineSchedule(this.id)"><a href="#">논산 <span>-</span></a></span>    
                    <span id="GRPC809" data-area-group-code="GRPC" data-area-item-code="809" data-area-item-name="당진" onclick="getCineSchedule(this.id)"><a href="#">당진 <span>-</span></a></span>    
                    <span id="GRPC360" data-area-group-code="GRPC" data-area-item-code="360" data-area-item-name="대전" onclick="getCineSchedule(this.id)"><a href="#">대전 <span>-</span></a></span>    
                    <span id="GRPC902" data-area-group-code="GRPC" data-area-item-code="902" data-area-item-name="동해" onclick="getCineSchedule(this.id)"><a href="#">동해 <span>-</span></a></span>    
                    <span id="GRPC803" data-area-group-code="GRPC" data-area-item-code="803" data-area-item-name="보령" onclick="getCineSchedule(this.id)"><a href="#">보령 <span>-</span></a></span>    
                    <span id="GRPC808" data-area-group-code="GRPC" data-area-item-code="808" data-area-item-name="부여" onclick="getCineSchedule(this.id)"><a href="#">부여 <span>-</span></a></span>    
                    <span id="GRPC903" data-area-group-code="GRPC" data-area-item-code="903" data-area-item-name="삼척" onclick="getCineSchedule(this.id)"><a href="#">삼척 <span>-</span></a></span>    
                    <span id="GRPC804" data-area-group-code="GRPC" data-area-item-code="804" data-area-item-name="서산" onclick="getCineSchedule(this.id)"><a href="#">서산 <span>-</span></a></span>    
                    <span id="GRPC904" data-area-group-code="GRPC" data-area-item-code="904" data-area-item-name="속초" onclick="getCineSchedule(this.id)"><a href="#">속초 <span>-</span></a></span>    
                    <span id="GRPC805" data-area-group-code="GRPC" data-area-item-code="805" data-area-item-name="아산" onclick="getCineSchedule(this.id)"><a href="#">아산 <span>-</span></a></span>    
                    <span id="GRPC811" data-area-group-code="GRPC" data-area-item-code="811" data-area-item-name="세종" onclick="getCineSchedule(this.id)"><a href="#">세종 <span>-</span></a></span>    
                    <span id="GRPC905" data-area-group-code="GRPC" data-area-item-code="905" data-area-item-name="원주" onclick="getCineSchedule(this.id)"><a href="#">원주 <span>-</span></a></span>    
                    <span id="GRPC851" data-area-group-code="GRPC" data-area-item-code="851" data-area-item-name="제천" onclick="getCineSchedule(this.id)"><a href="#">제천 <span>-</span></a></span>    
                    <span id="GRPC855" data-area-group-code="GRPC" data-area-item-code="855" data-area-item-name="음성" onclick="getCineSchedule(this.id)"><a href="#">음성 <span>-</span></a></span>    
                    <span id="GRPC854" data-area-group-code="GRPC" data-area-item-code="854" data-area-item-name="진천" onclick="getCineSchedule(this.id)"><a href="#">진천 <span>-</span></a></span>    
                    <span id="GRPC806" data-area-group-code="GRPC" data-area-item-code="806" data-area-item-name="천안" onclick="getCineSchedule(this.id)"><a href="#">천안 <span>-</span></a></span>    
                    <span id="GRPC852" data-area-group-code="GRPC" data-area-item-code="852" data-area-item-name="청주" onclick="getCineSchedule(this.id)"><a href="#">청주 <span>-</span></a></span>    
                    <span id="GRPC906" data-area-group-code="GRPC" data-area-item-code="906" data-area-item-name="춘천" onclick="getCineSchedule(this.id)"><a href="#">춘천 <span>-</span></a></span>    
                    <span id="GRPC853" data-area-group-code="GRPC" data-area-item-code="853" data-area-item-name="충주" onclick="getCineSchedule(this.id)"><a href="#">충주 <span>-</span></a></span>    
                    <span id="GRPC807" data-area-group-code="GRPC" data-area-item-code="807" data-area-item-name="태안" onclick="getCineSchedule(this.id)"><a href="#">태안 <span>-</span></a></span>    
                    <span id="GRPC810" data-area-group-code="GRPC" data-area-item-code="810" data-area-item-name="홍성" onclick="getCineSchedule(this.id)"><a href="#">홍성 <span>-</span></a></span>    
                    <span id="GRPC908" data-area-group-code="GRPC" data-area-item-code="908" data-area-item-name="인제" onclick="getCineSchedule(this.id)"><a href="#">인제 <span>-</span></a></span>    
				</div>
				
				<div id="GRPD-detail">
					<span id="GRPD501" data-area-group-code="GRPD" data-area-item-code="501" data-area-item-name="거제" onclick="getCineSchedule(this.id)"><a href="#">거제 <span>-</span></a></span>    
                    <span id="GRPD511" data-area-group-code="GRPD" data-area-item-code="511" data-area-item-name="거창" onclick="getCineSchedule(this.id)"><a href="#">거창 <span>-</span></a></span>    
                    <span id="GRPD502" data-area-group-code="GRPD" data-area-item-code="502" data-area-item-name="김해" onclick="getCineSchedule(this.id)"><a href="#">김해 <span>-</span></a></span>    
                    <span id="GRPD503" data-area-group-code="GRPD" data-area-item-code="503" data-area-item-name="마산" onclick="getCineSchedule(this.id)"><a href="#">마산 <span>-</span></a></span>    
                    <span id="GRPD504" data-area-group-code="GRPD" data-area-item-code="504" data-area-item-name="밀양" onclick="getCineSchedule(this.id)"><a href="#">밀양 <span>-</span></a></span>    
                    <span id="GRPD310" data-area-group-code="GRPD" data-area-item-code="310" data-area-item-name="부산" onclick="getCineSchedule(this.id)"><a href="#">부산 <span>-</span></a></span>    
                    <span id="GRPD505" data-area-group-code="GRPD" data-area-item-code="505" data-area-item-name="사천" onclick="getCineSchedule(this.id)"><a href="#">사천 <span>-</span></a></span>    
                    <span id="GRPD506" data-area-group-code="GRPD" data-area-item-code="506" data-area-item-name="양산" onclick="getCineSchedule(this.id)"><a href="#">양산 <span>-</span></a></span>    
                    <span id="GRPD507" data-area-group-code="GRPD" data-area-item-code="507" data-area-item-name="진주" onclick="getCineSchedule(this.id)"><a href="#">진주 <span>-</span></a></span>    
                    <span id="GRPD508" data-area-group-code="GRPD" data-area-item-code="508" data-area-item-name="진해" onclick="getCineSchedule(this.id)"><a href="#">진해 <span>-</span></a></span>    
                    <span id="GRPD509" data-area-group-code="GRPD" data-area-item-code="509" data-area-item-name="창원" onclick="getCineSchedule(this.id)"><a href="#">창원 <span>-</span></a></span>    
                    <span id="GRPD510" data-area-group-code="GRPD" data-area-item-code="510" data-area-item-name="통영" onclick="getCineSchedule(this.id)"><a href="#">통영 <span>-</span></a></span>    

				</div>
				<div id="GRPE-detail">
					<span id="GRPE551" data-area-group-code="GRPE" data-area-item-code="551" data-area-item-name="경산" onclick="getCineSchedule(this.id)"><a href="#">경산 <span>-</span></a></span>    
                    <span id="GRPE552" data-area-group-code="GRPE" data-area-item-code="552" data-area-item-name="경주" onclick="getCineSchedule(this.id)"><a href="#">경주 <span>-</span></a></span>    
                    <span id="GRPE553" data-area-group-code="GRPE" data-area-item-code="553" data-area-item-name="구미" onclick="getCineSchedule(this.id)"><a href="#">구미 <span>-</span></a></span>    
                    <span id="GRPE554" data-area-group-code="GRPE" data-area-item-code="554" data-area-item-name="김천" onclick="getCineSchedule(this.id)"><a href="#">김천 <span>-</span></a></span>    
                    <span id="GRPE330" data-area-group-code="GRPE" data-area-item-code="330" data-area-item-name="대구" onclick="getCineSchedule(this.id)"><a href="#">대구 <span>-</span></a></span>    
                    <span id="GRPE555" data-area-group-code="GRPE" data-area-item-code="555" data-area-item-name="문경" onclick="getCineSchedule(this.id)"><a href="#">문경 <span>-</span></a></span>    
                    <span id="GRPE556" data-area-group-code="GRPE" data-area-item-code="556" data-area-item-name="상주" onclick="getCineSchedule(this.id)"><a href="#">상주 <span>-</span></a></span>    
                    <span id="GRPE557" data-area-group-code="GRPE" data-area-item-code="557" data-area-item-name="안동" onclick="getCineSchedule(this.id)"><a href="#">안동 <span>-</span></a></span>    
                    <span id="GRPE558" data-area-group-code="GRPE" data-area-item-code="558" data-area-item-name="영주" onclick="getCineSchedule(this.id)"><a href="#">영주 <span>-</span></a></span>    
                    <span id="GRPE559" data-area-group-code="GRPE" data-area-item-code="559" data-area-item-name="영천" onclick="getCineSchedule(this.id)"><a href="#">영천 <span>-</span></a></span>    
                    <span id="GRPE370" data-area-group-code="GRPE" data-area-item-code="370" data-area-item-name="울산" onclick="getCineSchedule(this.id)"><a href="#">울산 <span>-</span></a></span>    
                    <span id="GRPE560" data-area-group-code="GRPE" data-area-item-code="560" data-area-item-name="포항" onclick="getCineSchedule(this.id)"><a href="#">포항 <span>-</span></a></span>  
				</div>
				<div id="GRPF-detail">
					 <span id="GRPF601" data-area-group-code="GRPF" data-area-item-code="601" data-area-item-name="광양" onclick="getCineSchedule(this.id)"><a href="#">광양 <span>-</span></a></span>    
                     <span id="GRPF350" data-area-group-code="GRPF" data-area-item-code="350" data-area-item-name="광주" onclick="getCineSchedule(this.id)"><a href="#">광주 <span>-</span></a></span>    
                     <span id="GRPF651" data-area-group-code="GRPF" data-area-item-code="651" data-area-item-name="군산" onclick="getCineSchedule(this.id)"><a href="#">군산 <span>-</span></a></span>    
                     <span id="GRPF652" data-area-group-code="GRPF" data-area-item-code="652" data-area-item-name="김제" onclick="getCineSchedule(this.id)"><a href="#">김제 <span>-</span></a></span>    
                     <span id="GRPF602" data-area-group-code="GRPF" data-area-item-code="602" data-area-item-name="나주" onclick="getCineSchedule(this.id)"><a href="#">나주 <span>-</span></a></span>    
                     <span id="GRPF653" data-area-group-code="GRPF" data-area-item-code="653" data-area-item-name="남원" onclick="getCineSchedule(this.id)"><a href="#">남원 <span>-</span></a></span>    
                     <span id="GRPF603" data-area-group-code="GRPF" data-area-item-code="603" data-area-item-name="목포" onclick="getCineSchedule(this.id)"><a href="#">목포 <span>-</span></a></span>    
                     <span id="GRPF657" data-area-group-code="GRPF" data-area-item-code="657" data-area-item-name="부안" onclick="getCineSchedule(this.id)"><a href="#">부안 <span>-</span></a></span>    
                     <span id="GRPF710" data-area-group-code="GRPF" data-area-item-code="710" data-area-item-name="서귀포" onclick="getCineSchedule(this.id)"><a href="#">서귀포 <span>-</span></a></span>    
                     <span id="GRPF604" data-area-group-code="GRPF" data-area-item-code="604" data-area-item-name="순천" onclick="getCineSchedule(this.id)"><a href="#">순천 <span>-</span></a></span>    
                     <span id="GRPF605" data-area-group-code="GRPF" data-area-item-code="605" data-area-item-name="여수" onclick="getCineSchedule(this.id)"><a href="#">여수 <span>-</span></a></span>    
                     <span id="GRPF654" data-area-group-code="GRPF" data-area-item-code="654" data-area-item-name="익산" onclick="getCineSchedule(this.id)"><a href="#">익산 <span>-</span></a></span>    
                     <span id="GRPF655" data-area-group-code="GRPF" data-area-item-code="655" data-area-item-name="전주" onclick="getCineSchedule(this.id)"><a href="#">전주 <span>-</span></a></span>    
                     <span id="GRPF656" data-area-group-code="GRPF" data-area-item-code="656" data-area-item-name="정읍" onclick="getCineSchedule(this.id)"><a href="#">정읍 <span>-</span></a></span>    
                     <span id="GRPF720" data-area-group-code="GRPF" data-area-item-code="720" data-area-item-name="제주" onclick="getCineSchedule(this.id)"><a href="#">제주 <span>-</span></a></span>    

				</div>
				
				
			</div>
			</div>
		</div>
	</div>
	
	<div id="ws_ticketing_screens">
		<div class="ws_ticketing_category">상영관</div>
		<div class="ws_ticketing_infoboard" id="ws_cine_n_screen">
		상영관을 선택해주세요	
		
		</div>
	</div>
	
	<div id="ws_total_info_tab">
		<div class="ws_ticketing_category">선택영화</div>
		<div class="ws_ticketing_infoboard">
		
			<div > <img id="ws_movieDetail_poster" src=""></div>
			<div id="ws_movieDetail_name"></div>
			<div  id="ws_movieDetail_nameEn"></div>
			<div id="ws_movieDetail_openDate"></div>
			<div  id="ws_movieDetail_genre"></div>
		<div  id="ws_movieDetail_grade"></div>	
		
		</div>
	</div>
	
	
	</div>
	<div id="map">
	
	</div>
	
	
	
	
	<div id="ws_outer_star">
		  	포털 3사 리뷰[네이버 / 다음 / 로튼토마토]<br>
		  	<br>
		  	<br>
			<img src="<c:url value="/resources/images/customs/ws_img/naver.PNG"/>" style="width:30%;">
				<span>
					<svg class="svg-inline--fa fa-star fa-w-18 fa-2x" aria-hidden="true" data-prefix="fas" data-icon="star" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"></path></svg>
					<svg class="svg-inline--fa fa-star fa-w-18 fa-2x" aria-hidden="true" data-prefix="fas" data-icon="star" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"></path></svg>
					<svg class="svg-inline--fa fa-star fa-w-18 fa-2x" aria-hidden="true" data-prefix="fas" data-icon="star" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"></path></svg>
					<svg class="svg-inline--fa fa-star fa-w-18 fa-2x" aria-hidden="true" data-prefix="fas" data-icon="star" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"></path></svg>
					<svg class="svg-inline--fa fa-star fa-w-18 fa-1x" aria-hidden="true" data-prefix="far" data-icon="star" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M528.1 171.5L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6zM388.6 312.3l23.7 138.4L288 385.4l-124.3 65.3 23.7-138.4-100.6-98 139-20.2 62.2-126 62.2 126 139 20.2-100.6 98z"></path></svg>
				</span>
			   /10<br>
			<img src="<c:url value="/resources/images/customs/ws_img/watcha.PNG"/>" style="width:30%;">
				<span>
					<svg class="svg-inline--fa fa-star fa-w-18 fa-2x" aria-hidden="true" data-prefix="fas" data-icon="star" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"></path></svg>
					<svg class="svg-inline--fa fa-star fa-w-18 fa-2x" aria-hidden="true" data-prefix="fas" data-icon="star" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"></path></svg>
					<svg class="svg-inline--fa fa-star fa-w-18 fa-2x" aria-hidden="true" data-prefix="fas" data-icon="star" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"></path></svg>
					<svg class="svg-inline--fa fa-star fa-w-18 fa-2x" aria-hidden="true" data-prefix="fas" data-icon="star" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"></path></svg>
					<svg class="svg-inline--fa fa-star fa-w-18 fa-2x" aria-hidden="true" data-prefix="fas" data-icon="star" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"></path></svg>
				</span>
				 /10<br>
			<img src="<c:url value="/resources/images/customs/ws_img/rotten.PNG"/>" style="width:30%;">
			 	 <span>
					<svg class="svg-inline--fa fa-star fa-w-18 fa-2x" aria-hidden="true" data-prefix="fas" data-icon="star" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"></path></svg>
					<svg class="svg-inline--fa fa-star fa-w-18 fa-2x" aria-hidden="true" data-prefix="fas" data-icon="star" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"></path></svg>
					<svg class="svg-inline--fa fa-star fa-w-18 fa-2x" aria-hidden="true" data-prefix="fas" data-icon="star" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"></path></svg>
					<svg class="svg-inline--fa fa-star fa-w-18 fa-2x" aria-hidden="true" data-prefix="fas" data-icon="star" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"></path></svg>
					<svg class="svg-inline--fa fa-star fa-w-18 fa-2x" aria-hidden="true" data-prefix="fas" data-icon="star" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"></path></svg>
				</span>
				 /10<br>
			
			
	</div>
	
	
	
	
	<!--  
	<section class="section" style="padding:15px;">
	<form class="cinema_select" name="frm1" >
		<div class="ws_ticketing_nameSapce">
			<span>날 짜</span>
			<span>영 화</span>
			<span>상 영 관</span>
			<span>상 영 회 차</span>
		</div>
		<select name="gd_code" size="3" onChange="redirect(this.selectedIndex);">
			<option value="1">알라딘</option>
			<option value="2">정글북</option>
			<option value="3">악마를 보았다</option>
		</select>

		<select name="gp_color" size="8" onChange="redirect1(this.selectedIndex);">
		</select>

		<select name="gp_face" size="8" onChange = "redirect2(this.selectedIndex);">
		</select>

		<select name="gp_quantity" size="8">
		</select>
	</form>
	
</section>
	-->
<!-- 영화관 정보 시작 -->
<div class="cinema_info" >
	<div class="cinema_info_text">
		
		
	</div>
	<!-- <div id="map" style="width:300px;height:250px;"> -->
	</div>
	<!--  <div class="cinema_info_map">
		<img src="./images/.png">지도
	</div>
	-->
	
</div>

<!-- 영화관 정보 끝 -->	

<div class="cinema_tab">
	<div class="tab-wrap">
    <ul>
        <li><a href="#tab1">tab1</a></li>
        <li><a href="#tab2">tab2</a></li>
    </ul>

    <div>
        <article id="tab1">
            <h1>극장정보</h1>
            <div class="cinema_traffic">
            	<div class="cinema_traffic_info" style="">
            		<!-- 교통 / 주차 정보 데이터 -->
            		<p>- 교통편</p>
            		<p style="width: 1200px; height: 300px; border: 1px solid:#333;">교통편 설명</p>
            		<p>- 주차</p>
            		<p style="width: 1200px; height: 300px; border: 1px solid:#333;">교통편 설명</p>
            	</div>
            </div>

        </article>
        <article id="tab2">
            <h1>리뷰</h1>
           	<div class="cinema_review">
           		<div class="cinema_review_table">
           			<!-- start | 리뷰 -->
										
										<div id="review" class="tab review">
												<div class="col-md-12">
													<div class="movie-rate">
														<div class="rate">
															<i class="fas fa-star fa-3x"></i>
															<p><span>8.5</span> /10<br>
																<span class="rv">56 Reviews</span>
															</p>
														</div>
														<div class="rate-star" style="width:600px;">
				 											<i class="fas fa-star fa-2x"></i>
															<i class="fas fa-star fa-2x"></i>
															<i class="fas fa-star fa-2x"></i>
															<i class="fas fa-star-half-alt fa-2x"></i>
															<i class="far fa-star fa-2x"></i>
														</div>
													</div>
													
													<hr>
													<div class="review-write col-md-11">
														<div class="review-write-star">
															<fieldset class="rating">
																<input type="radio" id="star5" name="rating"
																	value="10" /><label class="full" for="star5"
																	title="10"></label>
																<input type="radio" id="star4half" name="rating"
																	value="9" /><label class="half" for="star4half"
																	title="9"></label>
																<input type="radio" id="star4" name="rating"
																	value="8" /><label class="full" for="star4"
																	title="8"></label>
																<input type="radio" id="star3half" name="rating"
																	value="7" /><label class="half" for="star3half"
																	title="7"></label>
																<input type="radio" id="star3" name="rating"
																	value="6" /><label class="full" for="star3"
																	title="6"></label>
																<input type="radio" id="star2half" name="rating"
																	value="5" /><label class="half" for="star2half"
																	title="5"></label>
																<input type="radio" id="star2" name="rating"
																	value="4" /><label class="full" for="star2"
																	title="4"></label>
																<input type="radio" id="star1half" name="rating"
																	value="3" /><label class="half" for="star1half"
																	title="3"></label>
																<input type="radio" id="star1" name="rating"
																	value="2" /><label class="full" for="star1"
																	title="2"></label>
																<input type="radio" id="starhalf" name="rating"
																	value="1" /><label class="half" for="starhalf"
																	title="1"></label>
															</fieldset>
														</div>
														<div class="review-write-input">
															<textarea maxlength="150" rows="3"></textarea>
														</div>
														<div class="review-write-button">
																<button class="redbtn">등록</button>
														</div>
														<hr class="mv-user-review-hr">
													</div>
													<!-- start | 사용자 리뷰 -->
													<!-- start | 한개의 리뷰 -->
													<div class="mv-user-review-item">
														<div class="user-info">
															
																<img src="images/uploads/userava1.jpg" alt="">
																<!-- <div class="user-name">사용자이름</div> 

																<div class="user-review-date">작성날짜</div> -->
																<p>사용자 이름</p>
																<p>작성날짜</p>
															
														</div>
														<div class="user-rate movie-rate movie-rate2">
															<i class="fas fa-star fa-1x"></i>
															<i class="fas fa-star fa-1x"></i>
															<i class="fas fa-star fa-1x"></i>
															<i class="fas fa-star-half-alt fa-1x"></i>
															<i class="far fa-star fa-1x"></i>
														</div>
														<div class="user-content">
														<p>아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아</p>
														</div>
														<div class="user-like">
															<div class="notmyreview" >
																<button class="thumbs-up"><img class="far fa-thumbs-up" aria-hidden="true" onclick=""> 100</button>
																<button class="thumbs-down"><img class="far fa-thumbs-down" aria-hidden="true" onclick=""> 10</button>
																<button class="warning"><img src="images/siren.png" width="40px" height="40px"></button>
															</div>
															
															<div class="myreview" hidden>
																	<button><img class="far fa-thumbs-up" aria-hidden="true" onclick="return false;"> 100</button>
																	<button><img class="far fa-thumbs-down" aria-hidden="true" onclick="return false;"> 10</button>
																<a onclick="">수정</a>
																<a onclick="">삭제</a>
															</div>
														</div>
													</div>
													<!-- end | 한개의 리뷰 -->
													<!-- start | 한개의 리뷰 -->
													<div class="mv-user-review-item">
															<div class="user-info">
																
																	<img src="images/uploads/userava1.jpg" alt="">
																	<!-- <div class="user-name">사용자이름</div> 
	
																	<div class="user-review-date">작성날짜</div> -->
																	<p>사용자 이름</p>
																	<p>작성날짜</p>
																
															</div>
															<div class="user-rate movie-rate movie-rate2">
																<i class="fas fa-star fa-1x"></i>
																<i class="fas fa-star fa-1x"></i>
																<i class="fas fa-star fa-1x"></i>
																<i class="fas fa-star-half-alt fa-1x"></i>
																<i class="far fa-star fa-1x"></i>
															</div>
															<div class="user-content">
															<p>아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아</p>
															</div>
															<div class="user-like">
																	<div class="notmyreview" >
																			<button class="thumbs-up"><img class="far fa-thumbs-up" aria-hidden="true" onclick=""> 100</button>
																			<button class="thumbs-down"><img class="far fa-thumbs-down" aria-hidden="true" onclick=""> 10</button>
																			<button class="warning"><img src="images/siren.png" width="40px" height="40px"></button>
																		</div>
																		
																		<div class="myreview" hidden>
																				<button><img class="far fa-thumbs-up" aria-hidden="true" onclick="return false;"> 100</button>
																				<button><img class="far fa-thumbs-down" aria-hidden="true" onclick="return false;"> 10</button>
																			<a onclick="">수정</a>
																			<a onclick="">삭제</a>
																		</div>
															</div>
														</div>
														<!-- end | 한개의 리뷰 -->
														<!-- start | 한개의 리뷰 -->
													<div class="mv-user-review-item">
															<div class="user-info">
																
																	<img src="images/uploads/userava1.jpg" alt="">
																	<!-- <div class="user-name">사용자이름</div> 
	
																	<div class="user-review-date">작성날짜</div> -->
																	<p>사용자 이름</p>
																	<p>작성날짜</p>
																
															</div>
															<div class="user-rate movie-rate movie-rate2">
																<i class="fas fa-star fa-1x"></i>
																<i class="fas fa-star fa-1x"></i>
																<i class="fas fa-star fa-1x"></i>
																<i class="fas fa-star-half-alt fa-1x"></i>
																<i class="far fa-star fa-1x"></i>
															</div>
															<div class="user-content">
															<p>아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아</p>
															</div>
															<div class="user-like">
																	<div class="notmyreview" >
																			<button class="thumbs-up"><img class="far fa-thumbs-up" aria-hidden="true" onclick=""> 100</button>
																			<button class="thumbs-down"><img class="far fa-thumbs-down" aria-hidden="true" onclick=""> 10</button>
																			<button class="warning"><img src="images/siren.png" width="40px" height="40px"></button>
																		</div>
																		
																		<div class="myreview" hidden>
																				<button><img class="far fa-thumbs-up" aria-hidden="true" onclick="return false;"> 100</button>
																				<button><img class="far fa-thumbs-down" aria-hidden="true" onclick="return false;"> 10</button>
																			<a onclick="">수정</a>
																			<a onclick="">삭제</a>
																		</div>
															</div>
														</div>
														<!-- end | 한개의 리뷰 -->
														<!-- start | 한개의 리뷰 -->
													<div class="mv-user-review-item">
															<div class="user-info">
																
																	<img src="images/uploads/userava1.jpg" alt="">
																	<!-- <div class="user-name">사용자이름</div> 
	
																	<div class="user-review-date">작성날짜</div> -->
																	<p>사용자 이름</p>
																	<p>작성날짜</p>
																
															</div>
															<div class="user-rate movie-rate movie-rate2">
																<i class="fas fa-star fa-1x"></i>
																<i class="fas fa-star fa-1x"></i>
																<i class="fas fa-star fa-1x"></i>
																<i class="fas fa-star-half-alt fa-1x"></i>
																<i class="far fa-star fa-1x"></i>
															</div>
															<div class="user-content">
															<p>아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아</p>
															</div>
															<div class="user-like">
																	<div class="notmyreview" >
																			<button class="thumbs-up"><img class="far fa-thumbs-up" aria-hidden="true" onclick=""> 100</button>
																			<button class="thumbs-down"><img class="far fa-thumbs-down" aria-hidden="true" onclick=""> 10</button>
																			<button class="warning"><img src="images/siren.png" width="40px" height="40px"></button>
																		</div>
																		
																		<div class="myreview" hidden>
																				<button><img class="far fa-thumbs-up" aria-hidden="true" onclick="return false;"> 100</button>
																				<button><img class="far fa-thumbs-down" aria-hidden="true" onclick="return false;"> 10</button>
																			<a onclick="">수정</a>
																			<a onclick="">삭제</a>
																		</div>
															</div>
														</div>
														<!-- end | 한개의 리뷰 -->
														<!-- start | 한개의 리뷰 -->
													<div class="mv-user-review-item">
															<div class="user-info">
																
																	<img src="images/uploads/userava1.jpg" alt="">
																	<!-- <div class="user-name">사용자이름</div> 
	
																	<div class="user-review-date">작성날짜</div> -->
																	<p>사용자 이름</p>
																	<p>작성날짜</p>
																
															</div>
															<div class="user-rate movie-rate movie-rate2">
																<i class="fas fa-star fa-1x"></i>
																<i class="fas fa-star fa-1x"></i>
																<i class="fas fa-star fa-1x"></i>
																<i class="fas fa-star-half-alt fa-1x"></i>
																<i class="far fa-star fa-1x"></i>
															</div>
															<div class="user-content">
															<p>아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아</p>
															</div>
															<div class="user-like">
																	<div class="notmyreview" >
																			<button class="thumbs-up"><img class="far fa-thumbs-up" aria-hidden="true" onclick=""> 100</button>
																			<button class="thumbs-down"><img class="far fa-thumbs-down" aria-hidden="true" onclick=""> 10</button>
																			<button class="warning"><img src="images/siren.png" width="40px" height="40px"></button>
																		</div>
																		
																		<div class="myreview" hidden>
																				<button><img class="far fa-thumbs-up" aria-hidden="true" onclick="return false;"> 100</button>
																				<button><img class="far fa-thumbs-down" aria-hidden="true" onclick="return false;"> 10</button>
																			<a onclick="">수정</a>
																			<a onclick="">삭제</a>
																		</div>
															</div>
														</div>
														<!-- end | 한개의 리뷰 -->
													<!-- end | 사용자 리뷰-->
													<div class="topbar-filter">
														<label>Reviews per page:</label>
														<select>
															<option value="range">5 Reviews</option>
															<option value="saab">10 Reviews</option>
														</select>
														<div class="pagination2">
															<span>Page 1 of 6:</span>
															<a class="active" href="#">1</a>
															<a href="#">2</a>
															<a href="#">3</a>
															<a href="#">4</a>
															<a href="#">5</a>
															<a href="#">6</a>
															<a href="#"><i class="ion-arrow-right-b"></i></a>
														</div>
													</div>
												</div>
											</div>
           		</div>
           	</div>
        </article>
    </div>
</div>
</div>
<!-- 극장 정보 탭  끝 -->

</section>
</div>	
	
	
</div>
<%@ include file="../footer1.jsp"%>
	<script src="js/yj_js.js"></script>
	<script src="<c:url value="/resources/js/ws_ticketing.js" />"></script>
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	<script src="com.google.code.gson:gson:2.8.5"></script>
	<script>
	
	var cMetaOutter;
	var todayGlobal;
	
	var time;
	var dayText;
	var date;
	var month;
	var year;
	var lastDay;
	
			function ab(mvCode) {
				
				function cd(mvCode, callback) {
					
				}
				
				//alert(mvCode);
				$.ajax({
					type: 'get',
					dataType: 'json',	//자동처리 믿지말자. json타입이어먀만 반환변수명.vo의 변수명 접근이 가능하다.
					url: '/movie/requestMovieInfos/' + mvCode+'/'+todayGlobal,
					success: function (result) {
						// result.detail 	= MovieDetailVO		detail이란 이름은 controller에서 부여했다.
						// result.cineMeta 	= List<CineInfoVO>	cineMeta라는 이름은 controller에서 부여했다.
						
						//1. 영화 상세정보 보여주기
						console.log('countLike call back  : '+result.detail.name);
							$('#ws_movieDetail_poster').attr('src','//images.maxmovie.com/thumbc'+result.detail.posterImage);
							$('#ws_movieDetail_name').html('제목 : '+result.detail.name);
							$('#ws_movieDetail_nameEn').html('('+result.detail.nameEn+')');
							$('#ws_movieDetail_genre').html('장르 : '+result.detail.genre);
							$('#ws_movieDetail_grade').html('등급 : '+result.detail.grade);
						
						//2-1. 극장(CineInfoVO)을 지역 대분류로 나누는 절차를 시작한다.
						//		가장 먼저. 각각의 대분류가 몇 개씩 있는지 숫자를 세어주자.
						var cMeta = result.cineMeta;
						
						var counterA =0;
						var counterB =0;
						var counterC =0;
						var counterD =0;
						var counterE =0;
						var counterF =0;
						
						//for문을 돌리는 목적은 새로운 제목을 눌렀을 때, 이전의 숫자값을 초기화 해주고, 0을 집어넣지 않으면 NaN 오류가 난다(최초 입력시)
						var grpaDetailCnt = new Array();
						for(j=101;j<=125;j++) {
							grpaDetailCnt[j] = 0; 										
							$('#GRPA'+j+' > a > span').text('['+grpaDetailCnt[j]+']');	
						}; 
						
						var grpbDetailCnt = new Array();
						for(j=201;j<=340;j++) {	//여기 숫자값을 조심해주자 두군데   & 시작수~끝수는 긁어오는 li의 최소수 ~최대수. 연속되지 않더라도 상관없다.
							grpbDetailCnt[j] = 0; 						// grp'b' 1군데			
							$('#GRPB'+j+' > a > span').text('['+grpbDetailCnt[j]+']'); // #GRP 'B', text(grp'b') 두 군데	
						};
						
						var grpcDetailCnt = new Array();
						for(j=360;j<=908;j++) {
							grpcDetailCnt[j] = 0; 										
							$('#GRPC'+j+' > a > span').text('['+grpcDetailCnt[j]+']');	
						};
						
						var grpdDetailCnt = new Array();
						for(j=310;j<=511;j++) {
							grpdDetailCnt[j] = 0; 										
							$('#GRPD'+j+' > a > span').text('['+grpdDetailCnt[j]+']');	
						};
						
						var grpeDetailCnt = new Array();
						for(j=330;j<=560;j++) {
							grpeDetailCnt[j] = 0; 										
							$('#GRPE'+j+' > a > span').text('['+grpeDetailCnt[j]+']');	
						};
						
						var grpfDetailCnt = new Array();
						for(j=350;j<=720;j++) {
							grpfDetailCnt[j] = 0; 										
							$('#GRPF'+j+' > a > span').text('['+grpfDetailCnt[j]+']');	
						};
						
						
						$('#ws_local_detail > div > span').css('display', 'none');					
						
						for(i=0;i<cMeta.length;i++) {
							
							switch(cMeta[i].agc) {
							
							case 'GRPA' :	counterA = counterA +1;
											
											//매번 지역코드만큼의 변수를 만들기에는 너무 벅차다. 배열을 이용해보자
											for(j=101;j<=125;j++) {
												if(cMeta[i].aic ==j){
												grpaDetailCnt[j] = grpaDetailCnt[j]+1;
												$('#GRPA'+j).css('display','inline-block');	
												$('#GRPA'+j+' > a > span').css('display','inline-block');
												$('#GRPA'+j+' > a > span').text('['+grpaDetailCnt[j]+']');
												}
											};
											
											
											
											break;
							case 'GRPB' :	counterB = counterB +1;
											
											for(j=201;j<=340;j++) {				//j = '201'; j<= '340' 두 군데 유의
												if(cMeta[i].aic ==j){
												grpbDetailCnt[j] = grpbDetailCnt[j]+1; //grp 'b'..[] = grp 'b' 두 군데 유의
												$('#GRPB'+j).css('display','inline-block');	
												$('#GRPB'+j+' > a > span').css('display','inline-block');
												$('#GRPB'+j+' > a > span').text('['+grpbDetailCnt[j]+']'); //GRP'B' 랑  .text(grp'b') 부분 유의
												}
											};
											break;
							case 'GRPC' :	counterC = counterC +1;
											
											for(j=360;j<=908;j++) {				//j = '201'; j<= '340' 두 군데 유의
												if(cMeta[i].aic ==j){
												grpcDetailCnt[j] = grpcDetailCnt[j]+1; //grp 'b'..[] = grp 'b' 두 군데 유의
												$('#GRPC'+j).css('display','inline-block');	
												$('#GRPC'+j+' > a > span').css('display','inline-block');
												$('#GRPC'+j+' > a > span').text('['+grpcDetailCnt[j]+']'); //GRP'B' 랑  .text(grp'b') 부분 유의
												}
											};
											break;				
							case 'GRPD' :	counterD = counterD +1;
							
											for(j=310;j<=511;j++) {				//j = '201'; j<= '340' 두 군데 유의
												if(cMeta[i].aic ==j){
												grpdDetailCnt[j] = grpdDetailCnt[j]+1; //grp 'b'..[] = grp 'b' 두 군데 유의
												$('#GRPD'+j).css('display','inline-block');	
												$('#GRPD'+j+' > a > span').css('display','inline-block');
												$('#GRPD'+j+' > a > span').text('['+grpdDetailCnt[j]+']'); //GRP'B' 랑  .text(grp'b') 부분 유의
												}
											};
											break;				
							case 'GRPE' :	counterE = counterE +1;
							
											for(j=330;j<=560;j++) {				//j = '201'; j<= '340' 두 군데 유의
												if(cMeta[i].aic ==j){
												grpeDetailCnt[j] = grpeDetailCnt[j]+1; //grp 'b'..[] = grp 'b' 두 군데 유의
												$('#GRPE'+j).css('display','inline-block');	
												$('#GRPE'+j+' > a > span').css('display','inline-block');
												$('#GRPE'+j+' > a > span').text('['+grpeDetailCnt[j]+']'); //GRP'B' 랑  .text(grp'b') 부분 유의
												}
											};
											break;				
							case 'GRPF' :	counterF = counterF +1;
							
											for(j=350;j<=720;j++) {				//j = '201'; j<= '340' 두 군데 유의
												if(cMeta[i].aic ==j){
												grpfDetailCnt[j] = grpfDetailCnt[j]+1; //grp 'b'..[] = grp 'b' 두 군데 유의
												$('#GRPF'+j).css('display','inline-block');	
												$('#GRPF'+j+' > a > span').css('display','inline-block');
												$('#GRPF'+j+' > a > span').text('['+grpfDetailCnt[j]+']'); //GRP'B' 랑  .text(grp'b') 부분 유의
												}
											};
											break;				
							}//swtich문 끝
							
							
						}//for문 끝
						
						
						// 대분류별 상영관 수 표기
						$('#GRPA > span').text('('+counterA+')');
						$('#GRPB > span').text('('+counterB+')');
						$('#GRPC > span').text('('+counterC+')');
						$('#GRPD > span').text('('+counterD+')');
						$('#GRPE > span').text('('+counterE+')');
						$('#GRPF > span').text('('+counterF+')');
						
						// cMeta값을 다른 함수에서도 쓸 수 있도록 밖으로 빼주자
						cMetaOutter = cMeta;
						
						}
					,
					error: function (xhr, status, er) {
						if (error) {
							alert('에러??');
							error(er);
						}
					}
				});//e_Ajax	
			};//e_ab
			
			function getLocalList(localCode) {
				localCode.stopimmediatepropagation;
				console.log(localCode);
				switch (localCode) {
				case 'GRPA'  : 	
								$('#ws_local_detail > div').css('display', 'none');
								$('#GRPA-detail').css('display', 'inline-block');
								
								break;
				case 'GRPB'  :	
								$('#ws_local_detail > div').css('display', 'none');
								
								$('#GRPB-detail').css('display', 'inline-block');
								break;
				case 'GRPC'  : 	
								$('#ws_local_detail > div').css('display', 'none');
								$('#GRPC-detail').css('display', 'inline-block');
								break;
				case 'GRPD'  : 	
								$('#ws_local_detail > div').css('display', 'none');
								$('#GRPD-detail').css('display', 'inline-block');
								break;
				case 'GRPE'  : 	
								$('#ws_local_detail > div').css('display', 'none');
								$('#GRPE-detail').css('display', 'inline-block');
								break;
				case 'GRPF'  : 	
								$('#ws_local_detail > div').css('display', 'none');
								$('#GRPF-detail').css('display', 'inline-block');
								break;
				}
			}
			
			function getCineSchedule(value) {
				// 공용 cMeta를 대입시켜준다. 그대로 사용하면 공용값이 오염될 수 있기 때문에. cMetaOutter는 static변수[혹은 전역변수]로 볼 수 있다.
				var innerCMeta = cMetaOutter;
				// onclick으로 넘어온 값은 지역 중분류 코드.
				var areaCode	= value.substring(4,7);
				var multiStacked;
				
				 
				// 초기화. 싹 밀어주자
				
				console.log('배열크기 == 전국 상영수'+innerCMeta.length);
				//
				// 값 추가.
				var resultHolder;
				for(i=0;i<innerCMeta.length;i++) {	//모든 극장정보를 순회하며 검사한다.
					if(innerCMeta[i].aic == areaCode) {	//일치값 발견 = 해당 if문 내에서 하나의 극장에 대한 정보를 완성시켜야 한다.
						
						var stacked;
						
						var cineName = innerCMeta[i].cineName;
						var brandName = innerCMeta[i].supplierType;
						
						//stacked = '<div>'+cineName;
						
						//$('#ws_cine_n_screen').html(stacked);
						
						
						var screenInfo = innerCMeta[i].screenInfos;//ex 2관, 3관, 4관, 5관 네 개의 관 정보가 si[i]에 담겨있다. 새 값이 옛 값을 지우나??
						//console.log('si == 해당 극장에서 몇 개의 스크린에서 상영하는지 '+screenInfo.length);
						//console.log('si[0] = '+screenInfo[0].screenName);
						//console.log('si[1] = '+screenInfo[1].screenName);
						//console.log('si[2] = '+screenInfo[2].screenName);
						
						multiStacked = multiStacked +'<div>'+cineName;
						for(j=0;j<screenInfo.length;j++) {	
							
							
							var screenName		= screenInfo[j].screenName;			//n관의 이름	. 왜 강남만 안되는지...						
							var playType		= screenInfo[j].playTypeName;		//상영타입. 디지털, 4D 등.
							var schedules		= screenInfo[j].scheduleInfos;		//스케쥴 배열을 꺼냈다.
							
							multiStacked = multiStacked+'<div><div class="ws_schedule_header">'+screenName+'<span class="ws_playType">'+playType+'</span></div>';
							//var resultOfSche;
							for(k=0;k<schedules.length;k++) {//for문이 하나 돌 때 마다 하나의 span이 생성된다.
								
								var seq				= schedules[k].seq;				//이걸 아이디로?
								var playDate 		= schedules[k].playDate;
								var playStartTime 	= schedules[k].playStartTime;
								//console.log(cineName+'상영관의 '+ screenName+'의 회차 '+playStartTime);
							
								multiStacked = multiStacked + '<span id="'+seq+'" value="'+
								playDate+','+brandName+','+cineName+'" onclick="ticketing(this.value)" class="ws_ticketing_detail">'+playStartTime+'</span>'
								
							}
							multiStacked = multiStacked+'</div>'
							$('#ws_cine_n_screen').html(multiStacked);
							
						}
						multiStacked = multiStacked +'</div>';
					}//if문을 닫기 전에 하나의 상영관 정보를 완성시켜야 한다.
					
					//stacked = stacked + '</div>';
					//$('#ws_cine_n_screen').html(stacked);
					
				}//하나의 극장정보 정리 종료
			
			}
			
			

			
			
			
			
			//자동으로 시작되는 함수.
			$(function(){
			
			time 	= new Date();
			dayText	= time.getDay();
			date	= time.getDate();
			month	= time.getMonth()+1;
			year	= time.getFullYear();
			lastDay = new Date(year,month+2, 0);
			lastDay = lastDay.getDate();
			
			
			var todayForm = year+'-'+month+'-'+date;
			var todaySimple = month +'/'+date;
			
			todayGlobal =todayForm;
			
			var mon = '월';
			var tue = '화';
			var wed = '수';
			var thr = '목';
			var fri = '금';
			var sat = '토';
			var sun = '일';
			
					
			
			var days = new Array();
			
			for(i=1;i<=7;i++){
				if(dayText==i){ //ex] 1이면 월요일. 즉, 각각의 요일에 해당하는 값의 처리.
					
					days[i] = mon;
					days[i+1] = tue;
					days[i+2] = wed;
					days[i+3] = thr;
					days[i+4] = fri;
					days[i+5] = sat;
					days[i+6] = sun;
					days[i+7] = mon;
					days[i+8] = tue;
					days[i+9] = wed;
					days[i+10] = thr;
					days[i+11] = fri;
					days[i+12] = sat;
					days[i+13] = sun;
					days[i+14] = mon;
					days[i+15] = tue;
					days[i+16] = wed;
					days[i+17] = thr;
					
					var startPointer = (i*2)-1;
					for(j=1;j<=10;j++){
						$('.ws_day:nth-child('+j+')').text(days[startPointer]);
						if(days[startPointer]=='토'){$('.ws_day:nth-child('+j+')').css('color','blue')};
						if(days[startPointer]=='일'){$('.ws_day:nth-child('+j+')').css('color','red')};
						
						startPointer = startPointer +1;	
					}//e_for-j
				}
			};//e_for-i
			//하드코딩이 더 쉬울거같은데...
			
			var monthChanged ='N';
			var roofMonth =month;
			
			for(i=1;i<=10;i++){
				var roofDate = date+(i-1);
				
				if(lastDay < roofDate) {
					roofDate = roofDate - lastDay
					if(monthChanged=='N')//예시로 7~10일차의 일자가 익월이라면, 최초의 월 변경인 7일차에서만 월의 변경이 일어난 후 이후에는 변경값 유지.
						roofMonth = roofMonth +1;
					monthChanged ='Y';
				}
				todaySimple = roofMonth + '-' + roofDate;
				console.log('시간은'+todaySimple);
				$('.ws_date:nth-child('+i+')').text(todaySimple);	
			};
			
			});//onload시 수행되는 함수의 끝
					
			
			function timeSetter(obj) {
				var time = $(obj).text();
				time = year +'-'+time;
				todayGlobal = time;
				
				//1. 초기화. 형제 css들을 어떻게 지정하나.
				$(obj).siblings().css('background-color','#DAD2B4');
				$(obj).siblings().css('color', 'black');
				$(obj).css('background-color','#0F2133');
				$(obj).css('color','white');
				
				//1. 
				
				//3. 날짜만큼은 아래의 보드를 초기화 시키도록.
				//$('#ws_local_detail > div > span').css('display', 'none');
				$('#ws_cine_n_screen').html('상영관을 선택해주세요');
				
				//2. 이 자리에 상영작 목록 뽑도록. 그러기 위해서는 기존의 페이지 로드에서 호출되는 서비스를 Ajax 호출방식으로 변경.
				//getMovieList(todayGlobal); 구현 마치면 주석 지우자.
				
				
				
			}
			
			function getMovieList(todayGlobal) {
				$.ajax({
					type: 'get',
					dataType: 'json',	//자동처리 믿지말자. json타입이어먀만 반환변수명.vo의 변수명 접근이 가능하다.
					url: '/movie/~~~~~/'+todayGlobal,
					success: function (result) {
						
						
						
					},
				error: function (xhr, status, er) {
					if (error) {
						alert('에러??');
						error(er);
					}
				}
			})
			}
			</script>

<%@ include file="../footer2.jsp"%>

