$(document).ready(function() {
    $(document).on('submit', '.enroll__filter__container', function(event) {
        event.preventDefault();
        console.log(event);
        //const searchValue = $(this).find('input[name="searchValue"]').val();
        // 과목코드, 과목명 검색일 때 input 요소에서 searchValue를 가져옴
        let searchValue = $(this).find('input[name="searchValue"]').val();

        // 카테고리 선택일 때 select 요소에서 searchValue를 가져옴
        if ($(this).data('searchType') === 'COURSE_CATEGORY') {
            searchValue = $(this).find('select[name="searchValue"]').val();
        }

        const searchType = $(this).data('searchType');
        console.log(searchValue);
        console.log(searchType);

        $.ajax({
            url: 'http://localhost:8080/CourseX_war_exploded/ajax/getCourseInfo.jsp',
            type: 'POST',
            data: {
                searchValue: searchValue,
                searchType: searchType
            },
            success: function(response) {
                // 조회 결과가 없는 경우
                if (response.trim() === "") {
                    $('.table__body').html('<tr>\n' +
                        '    <td h="table__cell" colspan="9">조회 결과가 없습니다.</td>\n' +
                        '</tr>');
                } else {
                    $('.table__body').html(response);
                }
            },
            error: function(xhr, status, error) {
                console.error(xhr, status, error);
                $('.search__result').html('<div>문제가 발생하여 데이터를 가져올 수 없습니다.</div>');
            }
        });
    });
});