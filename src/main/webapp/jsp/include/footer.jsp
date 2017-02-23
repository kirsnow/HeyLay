<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<footer class="container-fluid page-footer page-footer-dkgrey">
    <div class="row">
        <div class="pull-right text-right">
            <a class="text-muted" href="#top">
                Back to Top
                <i class="fa fa-angle-up fa-lg fa-fw" aria-hidden="true"></i>
            </a>
        </div>
        <div class="col-md-3 marginBottom">
            <a href="#" title="페이스북 페이지로 이동" class="text-muted"><i class="fa fa-facebook fa-2x" aria-hidden="true"></i></a> &nbsp;
            <a href="#" title="트위터 공식 계정으로 이동" class="text-muted"><i class="fa fa-twitter fa-2x fa-fw" aria-hidden="true"></i></a>
            <a href="#" title="인스타그램 공식 계정으로 이동" class="text-muted"><i class="fa fa-instagram fa-2x fa-fw" aria-hidden="true"></i></a>
        </div>
    </div>
    <div class="row">
        <ul class="col-md-12 list-inline list-unstyled marginTop">
            <li><a href="#" title="" class="btn-link btn-xs" style="margin-left:-5px">About</a></li>
            <li><a href="#" title="" class="btn-link btn-xs">Help</a></li>
            <li><a href="#" title="" class="btn-link btn-xs">Get Primium service</a></li>
            <li><a href="#" title="" class="btn-link btn-xs">Privacy and Terms</a></li>
            <li><a href="${ pageContext.request.contextPath }/list/sitemap.do" title="" class="btn-link btn-xs">Sitemap</a></li>
            <c:if test="">
            <li><a href="${ pageContext.request.contextPath }/jsp/admin/member_list.do?option=all" title="" class="btn-link btn-xs">admin</a></li>
            </c:if>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
            <p><small>Quration © 2017 PlanB.io</small></p>
        </div>
    </div>
</footer>
