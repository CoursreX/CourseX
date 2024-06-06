<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="conn.Conn" %>
<%
    Object user = session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>

<div class="content__left">

	<div class="uploadCourse_form">
        <h2>강의 등록</h2>

            <form name="CourseForm" action="createCourse_post.jsp" method="POST">
                <div class="form_container">
                <!- 강의 등록 폼 내용 -->
                <!- row1 -->
                <div class="row1">
                    <div class="input-container" >
                        <h3 class="display_name" >과목번호</h3>
                        <input type="text" name="course_id" placeholder="과목번호" required />
                    </div>
                    <div class="input-container" >
                        <h3 class="display_name" >분반</h3>
                        <input type="number" min="1" max="9" name="course_no" placeholder="분반(1~9)" required />
                    </div>
                    <div class="input-container" >
                        <h3 class="display_name" >교수명</h3>
                        <input type="text" name="faculty_name" placeholder="교수명" required />
                    </div>
                    <div class="input-container" >
                        <h3 class="display_name" >교번</h3>
                        <input type="text" name="faculty_id" placeholder="교번" required />
                    </div>
                </div>


                <!- row2 -->
                <div class="row2">
                    <div class="input-container2" >
                        <h3 class="display_name2" >과목명</h3>
                        <input type="text" name="course_name" placeholder="과목명" required />
                        <div class="select_category">
                            <select id="category" name="category" required>
                                <option value="none" disabled>유형</option>
                                <option value="교양필수">교양필수</option>
                                <option value="교양선택">교양선택</option>
                                <option value="전공">전공</option>
                                <option value="교직">교직</option>
                                <input type="hidden" name="categories" id="categories" required>
                            </select>
                        </div>
                    </div>
                    <div class="input-container2" >
                        <h3 class="display_name2" >요일</h3>
                        <div class="day_button_container">
                            <button type="button" class="day-button" id="월" onclick="daySelection(id)">월</button>
                            <button type="button" class="day-button" id="화" onclick="daySelection(id)">화</button>
                            <button type="button" class="day-button" id="수" onclick="daySelection(id)">수</button>
                            <button type="button" class="day-button" id="목" onclick="daySelection(id)">목</button>
                            <button type="button" class="day-button" id="금" onclick="daySelection(id)">금</button>
                            <button type="button" class="day-button" id="토" onclick="daySelection(id)">토</button>
                            <input type="hidden" name="selectedDays" id="selectedDays" required>
                        </div>
                    </div>
                </div>

                <!- row3 -->
                <div class="row3">
                    <div class="input-container3" >
                        <h3 class="display_name3" >학점</h3>
                        <input type="number" min="1" max="6" name="course_credit" placeholder="학점(1~6)" required />
                    </div>
                    <div class="input-container3" >
                        <h3 class="display_name3" >정원</h3>
                        <input type="number" min="1" max="999" name="course_cap" placeholder="정원(~999)" required />
                    </div>

                    <div class="input-container3_right" >
                        <h3 class="display_name3" >장소</h3>
                        <div class="select_building">
                        <select id="building" name="building" required>
                            <option value="none" disabled>건물명</option>
                            <option value="명신관">명신관</option>
                            <option value="순헌관">순헌관</option>
                            <option value="프라임관">프라임관</option>
                            <option value="과학관">과학관</option>
                            <option value="창학관">창학관</option>
                            <option value="사회관">사회관</option>
                            <input type="hidden" name="buildings" id="buildings" required>
                        </select>
                        </div>
                        <input type="number" min="100" max="999" name="course_room" placeholder="강의실" required />
                    </div>

                </div>

                <!- row4 -->
                <div class="row4">
                    <div class="input-container4" >
                        <h3 class="display_name4" >강의 시작 시간</h3>
                        <div class="select_hour">
                            <select id="startHour" name="startHour" required>
                                <% for (int i = 7; i <= 24; i++) { %>
                                <option value="<%= i %>"><%= i %></option>
                                <% } %>
                            </select>
                        </div>
                        <p>:</p>
                        <div class="select_min">
                            <select id="startMin" name="startMin" required>
                                <% for (int i = 0; i <= 45; i+=15) { %>
                                <option value="<%= String.format("%02d", i) %>"><%= String.format("%02d", i) %></option>
                                <% } %>
                            </select>
                        </div>
                    </div>

                    <div class="input-container4" >
                        <h3 class="display_name4" >강의 종료 시간</h3>
                        <div class="select_hour">
                            <select id="endHour" name="endHour" required>
                                <% for (int i = 7; i <= 24; i++) { %>
                                <option value="<%= i %>"><%= i %></option>
                                <% } %>
                            </select>
                        </div>
                        <p>:</p>
                        <div class="select_min">
                            <select id="endMin" name="endMin" required>
                                <% for (int i = 0; i <= 45; i+=15) { %>
                                <option value="<%= String.format("%02d", i) %>"><%= String.format("%02d", i) %></option>
                                <% } %>
                            </select>
                        </div>
                    </div>
                </div>


                </div>

                <div class="upload"><button class="create__button" type="submit">등록하기</button></div>

            </form>

        </div>
</div>



<div id="content__right">
    <%@ include file="/components/adminInfo.jsp" %>
</div>
