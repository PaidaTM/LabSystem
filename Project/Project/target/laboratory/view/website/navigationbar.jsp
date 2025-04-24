
<div style="clear:both; padding-bottom: 5px;">
    <div class="navbar">
        <c:if test="${loginUser!=null && loginUser.utid==1}" >
            <%@ include file="adminbar.html"%>
        </c:if>
        <c:if test="${loginUser!=null && loginUser.utid==2}">
            <%@ include file="studentbar.html"%>
        </c:if>
        <c:if test="${loginUser==null}">
            <%@ include file="unidentified.html"%>
        </c:if>
    </div>
</div>
