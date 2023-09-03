// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract School {
    event RequestApproval(address indexed student, address[] teachers);
    event ApprovalReceived(address indexed student);
    event GradeAssigned(address indexed student, string grade);
    event TeacherAdded(address indexed student, address teacher);
    struct Request {
        address[] teachers;
        mapping(address => bool) approvals;
    } 
    
    mapping(address => Request) private requests;
    mapping(address => string) private studentGrades;

    function requestApproval(address[] calldata teachers) external {
        Request storage newRequest = requests[msg.sender];
        newRequest.teachers = teachers;
        emit RequestApproval(msg.sender, teachers);
    }

    function approveRequest(address student) external {
        Request storage request = requests[student];
        require(isTeacher(request, msg.sender), "Only requested teacher can approve.");
        require(!request.approvals[msg.sender], "Teacher has already approved.");

        request.approvals[msg.sender] = true;

        if(isApproved(request)) {
            emit ApprovalReceived(student);
        }
    }

    function assignGrade(address student, string calldata grade) external {
        require(isTeacher(requests[student], msg.sender), "Only assigned teacher can assign grade.");
        studentGrades[student] = grade;
        emit GradeAssigned(student, grade);
    }

    function addTeacherToRequest(address student, address newTeacher) external {
        require(isTeacher(requests[student], msg.sender), "Only assigned teacher can add another teacher.");
        requests[student].teachers.push(newTeacher);
        emit TeacherAdded(student, newTeacher);
    }

    function isTeacher(Request storage request, address teacher) private view returns(bool) {
        for(uint i = 0; i < request.teachers.length; i++) {
            if(request.teachers[i] == teacher) {
                return true;
            }
        }
        return false;
    }

    function isApproved(Request storage request) private view returns(bool) {
        for(uint i = 0; i < request.teachers.length; i++) {
            if(!request.approvals[request.teachers[i]]) {
                return false;
            }
        }
        return true;
    }

    function getStudentGrade(address student) external view returns (string memory) {
        return studentGrades[student];
    }


    event RequestApprovalA(address indexed student, address[] teachers);
    event ApprovalReceivedA(address indexed student);
    event GradeAssignedA(address indexed student, string grade);
    event TeacherAddedA(address indexed student, address teacher);
    struct RequestA {
        address[] teachers;
        mapping(address => bool) approvals;
    } 
    
    mapping(address => RequestA) private requestsA;
    mapping(address => string) private studentGradesA;

    function requestApprovalA(address[] calldata teachers) external {
        RequestA storage newRequestA = requestsA[msg.sender];
        newRequestA.teachers = teachers;
        emit RequestApprovalA(msg.sender, teachers);
    }

    function approveRequestA(address student) external {
        RequestA storage requestA = requestsA[student];
        require(isTeacherA(requestA, msg.sender), "Only requested teacher can approve.");
        require(!requestA.approvals[msg.sender], "Teacher has already approved.");

        requestA.approvals[msg.sender] = true;

        if(isApprovedA(requestA)) {
            emit ApprovalReceivedA(student);
        }
    }

    function assignGradeA(address student, string calldata grade) external {
        require(isTeacherA(requestsA[student], msg.sender), "Only assigned teacher can assign grade.");
        studentGradesA[student] = grade;
        emit GradeAssignedA(student, grade);
    }

    function addTeacherToRequestA(address student, address newTeacher) external {
        require(isTeacherA(requestsA[student], msg.sender), "Only assigned teacher can add another teacher.");
        requestsA[student].teachers.push(newTeacher);
        emit TeacherAddedA(student, newTeacher);
    }

    function isTeacherA(RequestA storage requestA, address teacher) private view returns(bool) {
        for(uint i = 0; i < requestA.teachers.length; i++) {
            if(requestA.teachers[i] == teacher) {
                return true;
            }
        }
        return false;
    }

    function isApprovedA(RequestA storage requestA) private view returns(bool) {
        for(uint i = 0; i < requestA.teachers.length; i++) {
            if(!requestA.approvals[requestA.teachers[i]]) {
                return false;
            }
        }
        return true;
    }

    function getStudentGradeA(address student) external view returns (string memory) {
        return studentGradesA[student];
    }


    event RequestApprovalB(address indexed student, address[] teachers);
    event ApprovalReceivedB(address indexed student);
    event GradeAssignedB(address indexed student, string grade);
    event TeacherAddedB(address indexed student, address teacher);
    struct RequestB {
        address[] teachers;
        mapping(address => bool) approvals;
    } 
    
    mapping(address => RequestB) private requestsB;
    mapping(address => string) private studentGradesB;

    function requestApprovalB(address[] calldata teachers) external {
        RequestB storage newRequestB = requestsB[msg.sender];
        newRequestB.teachers = teachers;
        emit RequestApprovalB(msg.sender, teachers);
    }

    function approveRequestB(address student) external {
        RequestB storage requestB = requestsB[student];
        require(isTeacherB(requestB, msg.sender), "Only requested teacher can approve.");
        require(!requestB.approvals[msg.sender], "Teacher has already approved.");

        requestB.approvals[msg.sender] = true;

        if(isApprovedB(requestB)) {
            emit ApprovalReceivedB(student);
        }
    }

    function assignGradeB(address student, string calldata grade) external {
        require(isTeacherB(requestsB[student], msg.sender), "Only assigned teacher can assign grade.");
        studentGradesB[student] = grade;
        emit GradeAssignedB(student, grade);
    }

    function addTeacherToRequestB(address student, address newTeacher) external {
        require(isTeacherB(requestsB[student], msg.sender), "Only assigned teacher can add another teacher.");
        requestsB[student].teachers.push(newTeacher);
        emit TeacherAddedB(student, newTeacher);
    }

    function isTeacherB(RequestB storage requestB, address teacher) private view returns(bool) {
        for(uint i = 0; i < requestB.teachers.length; i++) {
            if(requestB.teachers[i] == teacher) {
                return true;
            }
        }
        return false;
    }

    function isApprovedB(RequestB storage requestB) private view returns(bool) {
        for(uint i = 0; i < requestB.teachers.length; i++) {
            if(!requestB.approvals[requestB.teachers[i]]) {
                return false;
            }
        }
        return true;
    }

    function getStudentGradeB(address student) external view returns (string memory) {
        return studentGradesB[student];
    }


    event RequestApprovalAA(address indexed student, address[] teachers);
    event ApprovalReceivedAA(address indexed student);
    event GradeAssignedAA(address indexed student, string grade);
    event TeacherAddedAA(address indexed student, address teacher);
    struct RequestAA {
        address[] teachers;
        mapping(address => bool) approvals;
    } 
    
    mapping(address => RequestAA) private requestsAA;
    mapping(address => string) private studentGradesAA;

    function requestApprovalAA(address[] calldata teachers) external {
        RequestAA storage newRequestAA = requestsAA[msg.sender];
        newRequestAA.teachers = teachers;
        emit RequestApprovalAA(msg.sender, teachers);
    }

    function approveRequestAA(address student) external {
        RequestAA storage requestAA = requestsAA[student];
        require(isTeacherAA(requestAA, msg.sender), "Only requested teacher can approve.");
        require(!requestAA.approvals[msg.sender], "Teacher has already approved.");

        requestAA.approvals[msg.sender] = true;

        if(isApprovedAA(requestAA)) {
            emit ApprovalReceivedAA(student);
        }
    }

    function assignGradeAA(address student, string calldata grade) external {
        require(isTeacherAA(requestsAA[student], msg.sender), "Only assigned teacher can assign grade.");
        studentGradesAA[student] = grade;
        emit GradeAssignedAA(student, grade);
    }

    function addTeacherToRequestAA(address student, address newTeacher) external {
        require(isTeacherAA(requestsAA[student], msg.sender), "Only assigned teacher can add another teacher.");
        requestsAA[student].teachers.push(newTeacher);
        emit TeacherAddedAA(student, newTeacher);
    }

    function isTeacherAA(RequestAA storage requestAA, address teacher) private view returns(bool) {
        for(uint i = 0; i < requestAA.teachers.length; i++) {
            if(requestAA.teachers[i] == teacher) {
                return true;
            }
        }
        return false;
    }

    function isApprovedAA(RequestAA storage requestAA) private view returns(bool) {
        for(uint i = 0; i < requestAA.teachers.length; i++) {
            if(!requestAA.approvals[requestAA.teachers[i]]) {
                return false;
            }
        }
        return true;
    }

    function getStudentGradeAA(address student) external view returns (string memory) {
        return studentGradesAA[student];
    }

    event RequestApprovalBB(address indexed student, address[] teachers);
    event ApprovalReceivedBB(address indexed student);
    event GradeAssignedBB(address indexed student, string grade);
    event TeacherAddedBB(address indexed student, address teacher);
    struct RequestBB {
        address[] teachers;
        mapping(address => bool) approvals;
    } 
    
    mapping(address => RequestBB) private requestsBB;
    mapping(address => string) private studentGradesBB;

    function requestApprovalBB(address[] calldata teachers) external {
        RequestBB storage newRequestBB = requestsBB[msg.sender];
        newRequestBB.teachers = teachers;
        emit RequestApprovalBB(msg.sender, teachers);
    }

    function approveRequestBB(address student) external {
        RequestBB storage requestBB = requestsBB[student];
        require(isTeacherBB(requestBB, msg.sender), "Only requested teacher can approve.");
        require(!requestBB.approvals[msg.sender], "Teacher has already approved.");

        requestBB.approvals[msg.sender] = true;

        if(isApprovedBB(requestBB)) {
            emit ApprovalReceivedBB(student);
        }
    }

    function assignGradeBB(address student, string calldata grade) external {
        require(isTeacherBB(requestsBB[student], msg.sender), "Only assigned teacher can assign grade.");
        studentGradesBB[student] = grade;
        emit GradeAssignedBB(student, grade);
    }

    function addTeacherToRequestBB(address student, address newTeacher) external {
        require(isTeacherBB(requestsBB[student], msg.sender), "Only assigned teacher can add another teacher.");
        requestsBB[student].teachers.push(newTeacher);
        emit TeacherAddedBB(student, newTeacher);
    }

    function isTeacherBB(RequestBB storage requestBB, address teacher) private view returns(bool) {
        for(uint i = 0; i < requestBB.teachers.length; i++) {
            if(requestBB.teachers[i] == teacher) {
                return true;
            }
        }
        return false;
    }

    function isApprovedBB(RequestBB storage requestBB) private view returns(bool) {
        for(uint i = 0; i < requestBB.teachers.length; i++) {
            if(!requestBB.approvals[requestBB.teachers[i]]) {
                return false;
            }
        }
        return true;
    }

    function getStudentGradeBB(address student) external view returns (string memory) {
        return studentGradesBB[student];
    }

    event CourseRequestApprovalC(address indexed student, address teacher);
    event CourseApprovalReceivedC(address indexed student);
    event CourseApprovalRejectedC(address indexed student);
    event CourseGradeAssignedC(address indexed student, string grade);

    enum ApplicationStatusC { Beginning, Pending, Approved, Rejected }


    struct CourseRequestC {
        address teacher;
        ApplicationStatusC status;
    } 
    
    mapping(address => CourseRequestC) private courseRequestsC;
    mapping(address => string) private studentGradesC;

    function requestCourseApprovalC(address teacher) external {
        //require(teacher != address(0), "Invalid teacher address");
        require(courseRequestsC[msg.sender].status == ApplicationStatusC.Beginning, "Application has not been used before. So okay to use.");
        // require(courseRequestsC[msg.sender].status != ApplicationStatusC.Pending, "Application already submitted. Can submit application again");
        // require(courseRequestsC[msg.sender].status != ApplicationStatusC.Approved, "Application already approved. Can't apply again");
        // require(courseRequestsC[msg.sender].status != ApplicationStatusC.Rejected, "Application already rejected. Can't apply again");
        courseRequestsC[msg.sender].teacher = teacher;
        courseRequestsC[msg.sender].status = ApplicationStatusC.Pending;
        emit CourseRequestApprovalC(msg.sender, teacher);
    }

    function approveCourseRequestC(address student) external {
        CourseRequestC storage requestC = courseRequestsC[student];
        require(requestC.teacher == msg.sender, "Only assigned teacher can approve.");
        require(requestC.status == ApplicationStatusC.Pending, "Application already processed.");

        requestC.status = ApplicationStatusC.Approved;
        emit CourseApprovalReceivedC(student);
    }

    function rejectCourseRequestC(address student) external {
        CourseRequestC storage requestC = courseRequestsC[student];
        require(requestC.teacher == msg.sender, "Only assigned teacher can reject.");
        require(requestC.status == ApplicationStatusC.Pending, "Application already processed.");

        requestC.status = ApplicationStatusC.Rejected;
        emit CourseApprovalRejectedC(student);
    }

    function assignCourseGradeC(address student, string calldata grade) external {
        CourseRequestC storage requestC = courseRequestsC[student];
        require(requestC.teacher == msg.sender, "Only assigned teacher can assign grade.");
        require(requestC.status == ApplicationStatusC.Approved, "Student must be approved to assign grade.");

        studentGradesC[student]= grade;
        emit CourseGradeAssignedC(student, grade);
    }

    function isTeacherC(address teacher, address student) private view returns(bool) {
        return courseRequestsC[student].teacher == teacher;
    }

    function getStudentGradeC(address student) external view returns (string memory) {
        return studentGradesC[student];
    }

    function getCourseRequestStatusC(address student) external view returns (ApplicationStatusC) {
        return courseRequestsC[student].status;
    }

    event CourseRequestApprovalD(address indexed student, address teacher);
    event CourseApprovalReceivedD(address indexed student);
    event CourseApprovalRejectedD(address indexed student);
    event CourseGradeAssignedD(address indexed student, string grade);

    enum ApplicationStatusD { Beginning, Pending, Approved, Rejected }


    struct CourseRequestD {
        address teacher;
        ApplicationStatusD status;
    } 
    
    mapping(address => CourseRequestD) private courseRequestsD;
    mapping(address => string) private studentGradesD;

    function requestCourseApprovalD(address teacher) external {
        //require(teacher != address(0), "Invalid teacher address");
        require(courseRequestsD[msg.sender].status == ApplicationStatusD.Beginning, "Application has not been used before. So okay to use.");
        // require(courseRequestsD[msg.sender].status != ApplicationStatusD.Pending, "Application already submitted. Can submit application again");
        // require(courseRequestsD[msg.sender].status != ApplicationStatusD.Approved, "Application already approved. Can't apply again");
        // require(courseRequestsD[msg.sender].status != ApplicationStatusD.Rejected, "Application already rejected. Can't apply again");
        courseRequestsD[msg.sender].teacher = teacher;
        courseRequestsD[msg.sender].status = ApplicationStatusD.Pending;
        emit CourseRequestApprovalD(msg.sender, teacher);
    }

    function approveCourseRequestD(address student) external {
        CourseRequestD storage requestD = courseRequestsD[student];
        require(requestD.teacher == msg.sender, "Only assigned teacher can approve.");
        require(requestD.status == ApplicationStatusD.Pending, "Application already processed.");

        requestD.status = ApplicationStatusD.Approved;
        emit CourseApprovalReceivedD(student);
    }

    function rejectCourseRequestD(address student) external {
        CourseRequestD storage requestD = courseRequestsD[student];
        require(requestD.teacher == msg.sender, "Only assigned teacher can reject.");
        require(requestD.status == ApplicationStatusD.Pending, "Application already processed.");

        requestD.status = ApplicationStatusD.Rejected;
        emit CourseApprovalRejectedD(student);
    }

    function assignCourseGradeD(address student, string calldata grade) external {
        CourseRequestD storage requestD = courseRequestsD[student];
        require(requestD.teacher == msg.sender, "Only assigned teacher can assign grade.");
        require(requestD.status == ApplicationStatusD.Approved, "Student must be approved to assign grade.");

        studentGradesD[student]= grade;
        emit CourseGradeAssignedD(student, grade);
    }

    function isTeacherD(address teacher, address student) private view returns(bool) {
        return courseRequestsD[student].teacher == teacher;
    }

    function getStudentGradeD(address student) external view returns (string memory) {
        return studentGradesD[student];
    }

    function getCourseRequestStatusD(address student) external view returns (ApplicationStatusD) {
        return courseRequestsD[student].status;
    }
}


// pragma solidity ^0.8.0;

// contract School {
//     event RequestApproval(address indexed student, address[] teachers);
//     event ApprovalReceived(address indexed student);

//     struct Request {
//         address[] teachers;
//         mapping(address => bool) approvals;
//     } 
    
//     mapping(address => Request) private requests;

//     function requestApproval(address[] calldata teachers) external {
//         Request storage newRequest = requests[msg.sender];
//         newRequest.teachers = teachers;
//         emit RequestApproval(msg.sender, teachers);
//     }

//     function approveRequest(address student) external {
//         Request storage request = requests[student];
//         require(isTeacher(request, msg.sender), "Only requested teacher can approve.");
//         require(!request.approvals[msg.sender], "Teacher has already approved.");

//         request.approvals[msg.sender] = true;

//         if(isApproved(request)) {
//             emit ApprovalReceived(student);
//         }
//     }

//     function isTeacher(Request storage request, address teacher) private view returns(bool) {
//         for(uint i = 0; i < request.teachers.length; i++) {
//             if(request.teachers[i] == teacher) {
//                 return true;
//             }
//         }
//         return false;
//     }

//     function isApproved(Request storage request) private view returns(bool) {
//         for(uint i = 0; i < request.teachers.length; i++) {
//             if(!request.approvals[request.teachers[i]]) {
//                 return false;
//             }
//         }
//         return true;
//     }
// }
