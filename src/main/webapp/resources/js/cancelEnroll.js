$(document).ready(function() {
    $(document).on('click', '.cancel__enroll__button', function(event) {
        const enrollId = event.target.dataset.enrollId;
        const courseName = event.target.dataset.courseName;
        const courseNo = event.target.dataset.courseNo;
        const decision = confirm(`과목명: ${courseName}\n분반: ${courseNo}\n해당 과목의 수강을 취소하겠습니까?`);
        if(!decision) return;

        $.ajax({
            url: 'http://localhost:8080/CourseX_war_exploded/ajax/cancelEnroll.jsp',
            type: 'POST',
            data: { enrollId: enrollId },
            success: function(response) {
                alert('수강취소가 완료되었습니다.');
                if (response.trim() === "") {
                    $('.table__body').html('<tr>\n' +
                        '    <td class="table__cell" colspan="9">수강신청된 과목이 없습니다.</td>\n' +
                        '</tr>');
                } else {
                    $('.table__body').html(response);
                }
            },
            error: function(xhr, status, error) {
                alert('수강취소에 실패했습니다.');
            }
        });
    });
});