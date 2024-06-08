$(document).ready(function() {
    $(document).on('click', '#enrollButton', function(event) {
        const button = $(event.target);
        const courseId = button.data('courseId');
        const courseNo = button.data('courseNo');
        const studentId = button.data('studentId');

        if (!courseId || !courseNo || !studentId) {
            alert('수강 신청에 필요한 정보가 부족합니다.'+courseId+courseNo+studentId);
            return;
        }

        const decision = confirm(`과목코드: ${courseId}\n분반: ${courseNo}\n학생학번: ${studentId}\n해당 과목을 수강하시겠습니까?`);
        if (!decision) return;

        $.ajax({
            url: 'http://localhost:8080/CourseX_war_exploded/ajax/enrollCourse.jsp',
            type: 'POST',
            data: { studentId: studentId, courseId: courseId, courseNo: courseNo },
            success: function(response) {
                if (response.trim() === '') {
                    alert(response);
                } else {
                    alert(response);
                }
            },
            error: function(xhr, status, error) {
                console.log(`수강신청 중 오류가 발생했습니다에러: ${xhr}`);
                console.log(`수강신청 중 오류가 발생했습니다에러: ${status}`);
                console.log(`수강신청 중 오류가 발생했습니다에러: ${error}`);
            }
        });
    });
});