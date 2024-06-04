$(document).ready(function() {
    $(document).on('submit', '#addSeats_search_form', function(event) {
        event.preventDefault();
        const searchOption = $('input[name="searchOption"]:checked').val();
        const search = $('input[name="add_search"]').val().toUpperCase();

        $.ajax({
            url: 'http://localhost:8080/CourseX_war_exploded/ajax/addSearchResults.jsp',
            type: 'GET',
            data: {
                searchOption: searchOption,
                search:search
            },
            success: function(response) {
                // 조회 결과가 없는 경우
                if (response.trim() === "") {
                    $('.add_table__body').html('<tr>\n' +
                        '    <td class="table__cell" colspan="10">조회 결과가 없습니다.</td>\n' +
                        '</tr>');
                } else {
                    $('.add_table__body').html(response);
                }
            },
            error: function(xhr, status, error) {
                console.error(xhr, status, error);
                $('.add_table_body').html('<tr>\n' +
                    '    <td class="table__cell" colspan="10">문제가 발생하여 데이터를 가져올 수 없습니다.</td>\n' +
                    '</tr>');
            }
        });
    });
});