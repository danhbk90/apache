function changePrepaid(size, selectedIndex) {
    for (var i = 0; i < size; i ++) {
        if (i == selectedIndex) {
            $('#processOrderingCost' + i).css('display', '');
            $('#processOrderingCost' + i).textEffects({text:$('#processOrderingCost' + i).text()});
            $('#totalprocessOrderingCost' + i).css('display', '');
            $('#totalprocessOrderingCost' + i).textEffects({text:$('#totalprocessOrderingCost' + i).text()});
            $('#finalCost' + i).css('display', '');
            $('#finalCost' + i).textEffects({text:$('#finalCost' + i).text()});
            $('#finalCostVND' + i).css('display', '');
            $('#finalCostVND' + i).textEffects({text:$('#finalCostVND' + i).text()});
            $('#remainingCostVND' + i).css('display', '');
             $('#remainingCostVND' + i).textEffects({text:$('#remainingCostVND' + i).text()});
        } else {
            $('#processOrderingCost' + i).css('display', 'none');
            $('#totalprocessOrderingCost' + i).css('display', 'none');
            $('#finalCost' + i).css('display', 'none');
            $('#finalCostVND' + i).css('display', 'none');
            $('#remainingCostVND' + i).css('display', 'none');
        }
    }
}

function validate() {
    var fullname = document.getElementById('fullname').value;
    var email = document.getElementById('email').value;
    var phone = document.getElementById('phone').value;

    if (!fullname || fullname.trim() == '') {
        alert('Quý khách vui lòng cung cấp thông tin Họ và tên!!!');
        document.getElementById('fullname').focus();
        return false;
    }

    if ((!email && !phone) || (email.trim() == '' && phone.trim() == '')) {
        alert('Quý khách vui lòng cung cấp thông tin E-mail hoặc Điện thoại!!!');
        document.getElementById('phone').focus();
        return false;
    }

    return true;
}
