$(document).ready(function() {
    $(document).on('submit', '#searchForm', function(event) {
        event.preventDefault();
        const year = $('#year').val();
        const semester = $('#semester').val();

        $.ajax({
            url: 'http://localhost:8080/CourseX_war_exploded/ajax/getEnrollInfo.jsp',
            type: 'GET',
            data: {
                year: year,
                semester: semester
            },
            success: function(response) {
                // 조회 결과가 없는 경우
                if (response.trim() === "") {
                    $('.table__body').html('<tr>\n' +
                        '    <td class="table__cell" colspan="9">조회 결과가 없습니다.</td>\n' +
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