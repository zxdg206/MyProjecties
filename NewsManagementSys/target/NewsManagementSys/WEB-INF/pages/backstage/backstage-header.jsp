<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <!--限定文本显示长度-->
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="/adminlte/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/adminlte/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/adminlte/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="/adminlte/plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="/adminlte/plugins/morris/morris.css">
    <link rel="stylesheet" href="/adminlte/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="/adminlte/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="/adminlte/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="/adminlte/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="/adminlte/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="/adminlte/plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="/adminlte/plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="/adminlte/plugins/select2/select2.css">
    <link rel="stylesheet" href="/adminlte/plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="/adminlte/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="/adminlte/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="/adminlte/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="/adminlte/css/style.css">
    <link rel="stylesheet" href="/adminlte/plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="/adminlte/plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="/adminlte/plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet" href="/adminlte/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
</head>

<script src="/adminlte/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/adminlte/plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);

</script>
<script src="/adminlte/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="/adminlte/plugins/raphael/raphael-min.js"></script>
<script src="/adminlte/plugins/morris/morris.min.js"></script>
<script src="/adminlte/plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="/adminlte/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="/adminlte/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="/adminlte/plugins/knob/jquery.knob.js"></script>
<script src="/adminlte/plugins/daterangepicker/moment.min.js"></script>
<script src="/adminlte/plugins/daterangepicker/daterangepicker.js"></script>
<script src="/adminlte/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script src="/adminlte/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="/adminlte/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="/adminlte/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="/adminlte/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="/adminlte/plugins/fastclick/fastclick.js"></script>
<script src="/adminlte/plugins/iCheck/icheck.min.js"></script>
<script src="/adminlte/plugins/adminLTE/js/app.min.js"></script>
<script src="/adminlte/plugins/treeTable/jquery.treetable.js"></script>
<script src="/adminlte/plugins/select2/select2.full.min.js"></script>
<script src="/adminlte/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="/adminlte/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="/adminlte/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="/adminlte/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="/adminlte/plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="/adminlte/plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="/adminlte/plugins/ckeditor/ckeditor.js"></script>
<script src="/adminlte/plugins/input-mask/jquery.inputmask.js"></script>
<script src="/adminlte/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="/adminlte/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="/adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/adminlte/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="/adminlte/plugins/chartjs/Chart.min.js"></script>
<script src="/adminlte/plugins/flot/jquery.flot.min.js"></script>
<script src="/adminlte/plugins/flot/jquery.flot.resize.min.js"></script>
<script src="/adminlte/plugins/flot/jquery.flot.pie.min.js"></script>
<script src="/adminlte/plugins/flot/jquery.flot.categories.min.js"></script>
<script src="/adminlte/plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="/adminlte/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="/adminlte/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="/adminlte/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>

