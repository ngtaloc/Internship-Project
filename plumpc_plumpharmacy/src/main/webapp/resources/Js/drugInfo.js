/**
 * 
 */



function activeTab(obj)
{
    // Xóa class active tất cả các tab
    $('.tabs ul li a').removeClass('active');
 
    // Thêm class active vòa tab đang click
    $(obj).addClass('active');
 
    // Lấy href của tab để show content tương ứng
    var id = $(obj).attr('href');
 
    // Ẩn hết nội dung các tab đang hiển thị
    $('.tab-item').hide();
 
    // Hiển thị nội dung của tab hiện tại
    $(id).show();
}

//Sự kiện click đổi tab
$('.nav-tabs li a').click(function(){
    activeTab(this);
    return false;
});
activeTab($('.nav-tabs li:first-child a'));
