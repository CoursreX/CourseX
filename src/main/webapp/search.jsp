<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section id="search">
    <div class="search__left">
        <form class="search__filter">
            <div class="search__filter__element">
                <label for="year">학년도</label>
                <select id="year" name="year">
                    <option value="none" disabled>학년도</option>
                    <option value="2024">2024</option>
                    <option value="2023">2023</option>
                    <option value="2023">2022</option>
                    <option value="2023">2021</option>
                    <option value="2023">2020</option>
                    <option value="2023">2019</option>
                </select>
            </div>
            <div class="search__filter__element">
                <label for="semester">학기</label>
                <select id="semester" name="semester">
                    <option value="none" disabled>학기</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                </select>
            </div>
            <button class="search__submit">검색</button>
        </form>
        <div class="search__result"></div>
    </div>
    <div class="search__right">
        <%@ include file="/views/userInfo.jsp" %>
    </div>
</section>
