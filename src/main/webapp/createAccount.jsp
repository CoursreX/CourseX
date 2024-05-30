<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="content__left">
	<div class="upload_form">
            <form action="upload" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                <div class="file_upload">
                    <input type="file" name="file" id="file" accept=".xlsx" onchange="displayFileName()">
                    <div class="file_name" id="file-name">*.xlsx 파일만 업로드 가능합니다.</div>
                    <label for="file">파일선택</label>
                </div>
                <div class="upload"><button class="create__button" type="submit">등록하기</button></div>
                
            </form>
        </div>
	</div>
<div id="content__right">
    <%@ include file="/views/adminInfo.jsp" %>
</div>
