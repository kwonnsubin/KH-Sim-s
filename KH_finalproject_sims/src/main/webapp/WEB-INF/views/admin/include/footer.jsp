<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>심즈</title>
</head>
<body>
<!-- Required Js -->
    <script src="<%=request.getContextPath()%>/resources/admin/flat-able-lite/dist/assets/js/vendor-all.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/admin/flat-able-lite/dist/assets/js/plugins/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/admin/flat-able-lite/dist/assets/js/pcoded.min.js"></script>


<!-- prism Js -->
<script src="<%=request.getContextPath()%>/resources/admin/flat-able-lite/src/assets/js/plugins/prism.js"></script>





<script src="<%=request.getContextPath()%>/resources/admin/flat-able-lite/dist/assets/js/horizontal-menu.js"></script>
<script>
    (function() {
        if ($('#layout-sidenav').hasClass('sidenav-horizontal') || window.layoutHelpers.isSmallScreen()) {
            return;
        }
        try {
            window.layoutHelpers._getSetting("Rtl")
            window.layoutHelpers.setCollapsed(
                localStorage.getItem('layoutCollapsed') === 'true',
                false
            );
        } catch (e) {}
    })();
    $(function() {
        $('#layout-sidenav').each(function() {
            new SideNav(this, {
                orientation: $(this).hasClass('sidenav-horizontal') ? 'horizontal' : 'vertical'
            });
        });
        $('body').on('click', '.layout-sidenav-toggle', function(e) {
            e.preventDefault();
            window.layoutHelpers.toggleCollapsed();
            if (!window.layoutHelpers.isSmallScreen()) {
                try {
                    localStorage.setItem('layoutCollapsed', String(window.layoutHelpers.isCollapsed()));
                } catch (e) {}
            }
        });
    });
    $(document).ready(function() {
        $("#pcoded").pcodedmenu({
            themelayout: 'horizontal',
            MenuTrigger: 'hover',
            SubMenuTrigger: 'hover',
        });
    });
</script>

<script src="<%=request.getContextPath()%>/resources/admin/flat-able-lite/dist/assets/js/analytics.js"></script>
</body>
</html>