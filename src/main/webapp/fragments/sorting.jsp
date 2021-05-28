<%--
  Created by IntelliJ IDEA.
  User: Legion
  Date: 28.05.2021
  Time: 13:27
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="text-decoration: none" var="none_line"/>
<c:set value="color: yellowgreen" var="color"/>

<a style="${none_line}; ${color}" href="facultyList#faculty?sort=${param.sort}&order=asc">
    <span class="span_tag">&uarr;</span>
</a>
<a style="${none_line}; ${color}" href="facultyList#faculty?sort=${param.sort}&order=desc">
    <span class="span_tag">&darr;</span>
</a>