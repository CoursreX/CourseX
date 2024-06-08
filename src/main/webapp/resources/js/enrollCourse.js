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

                $.ajax({
                    url: 'http://localhost:8080/CourseX_war_exploded/components/userInfo.jsp', // userInfo.jsp의 경로에 맞게 수정
                    success: function(userInfoResponse) {
                        console.log('userInfo.jsp를 새로 로드합니다.');
                        $('.content__right').html(userInfoResponse);
                    },
                    error: function(xhr, status, error) {
                        alert('userInfo.jsp를 로드하는데 실패했습니다.');
                    }
                });
            },
            error: function(xhr, status, error) {
                console.log(`수강신청 중 오류가 발생했습니다에러: ${xhr}`);
                console.log(`수강신청 중 오류가 발생했습니다에러: ${status}`);
                console.log(`수강신청 중 오류가 발생했습니다에러: ${error}`);
            }
        });
    });
});