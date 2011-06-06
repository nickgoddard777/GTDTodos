$(document).ready(function(){
    $('.button').mousedown(function(){
        $(this).addClass('active');
    }).bind('mouseup mouseout', function(){
        $(this).removeClass('active');
    });
});


$(function() {
    $('table').attr('cellpadding', 0).attr('cellspacing', 0).attr('border', 0);
    $('#page-header, #page-footer, #main-nav ul li a, #main-nav ul, #sub-nav ul li a, #page-subheader, .pagination a, input, button, .button, textarea, select, .message, .message-close, #calroot, #calhead, #calbody, .progress, .progress > span, .accordion > section, .accordion > header, .accordion, ul.tabs > li > a, ul.tabs > li, ul.tabs, .panes section, .panes, .pricing-table header, .pricing-table .popular, .pricing-table section, .pricing-table footer, .panel, .widget > header, .widget > section, .widget, .triangle-isosceles, table.datatable thead th, table.datatable tr, table.datatable td, table.datatable, .widget-placeholder, #upload-bar li, #upload-bar a, #upload-bar, .tooltip').each(function() {
        PIE.attach(this);
    });
    $('#quick-links > a').hover(function(){$('#quick-links > a').css('border-radius', '5px 5px 0 0');}, function(){setTimeout(function(){if($('#quick-links > ul').css('left')!='0px') $('#quick-links > a').css('border-radius', '5px');}, 0);});
    $('#quick-links > ul').bind('mouseleave', function(){setTimeout(function(){if($('#quick-links > ul').css('left')!='0px') $('#quick-links > a').css('border-radius', '5px');}, 0);});
    $('.widget header').hover(
        function(){$(this).addClass('hover');},
        function(){$(this).removeClass('hover');}
    );
});
