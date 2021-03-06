<%--

    Licensed to Apereo under one or more contributor license
    agreements. See the NOTICE file distributed with this work
    for additional information regarding copyright ownership.
    Apereo licenses this file to you under the Apache License,
    Version 2.0 (the "License"); you may not use this file
    except in compliance with the License.  You may obtain a
    copy of the License at the following location:

      http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.

--%>
<%@ include file="/WEB-INF/jsp/include.jsp" %>
<%@ page import="org.jasig.portal.portlet.om.PortletLifecycleState,java.util.Set" %>

<c:set var="n"><portlet:namespace/></c:set>

<!-- START: VALUES BEING PASSED FROM BACKEND -->
<portlet:actionURL var="queryUrl">
	<portlet:param name="execution" value="${flowExecutionKey}" />
</portlet:actionURL>
<!-- END: VALUES BEING PASSED FROM BACKEND -->

<!--
PORTLET DEVELOPMENT STANDARDS AND GUIDELINES
| For the standards and guidelines that govern
| the user interface of this portlet
| including HTML, CSS, JavaScript, accessibilty,
| naming conventions, 3rd Party libraries
| (like jQuery and the Fluid Skinning System)
| and more, refer to:
| http://www.ja-sig.org/wiki/x/cQ
-->
    
<!-- Portlet -->
<div id="${n}PortletLifecycle" class="fl-widget portlet ptl-mgr view-lifecycle" role="section">

	<!-- Portlet Titlebar -->
  <div class="fl-widget-titlebar titlebar portlet-titlebar" role="sectionhead">
  	<h2 class="title" role="heading">
        <spring:message code="${ completed ? 'edit.portlet' : 'register.new.portlet' }"/>
    </h2>
  </div> <!-- end: portlet-titlebar -->
  
	<!-- Portlet Content -->
  <div class="fl-widget-content content portlet-content" role="main">
     
    <form:form modelAttribute="portlet" action="${queryUrl}" method="POST">

    <!-- Portlet Messages -->
    <spring:hasBindErrors name="portlet">
        <div class="portlet-msg-error portlet-msg error" role="alert">
            <form:errors path="*" element="div"/>
        </div> <!-- end: portlet-msg -->
    </spring:hasBindErrors>

		
    <!-- Portlet Section -->
    <div class="portlet-section" role="region">
      <div class="titlebar">
        <h3 class="title" role="heading"><spring:message code="lifecycle.management"/></h3>
      </div>
      <div class="content">
      
        <table class="portlet-table table table-hover" summary="">
          <thead>
            <tr>
              <th><spring:message code="option"/></th>
              <th><spring:message code="state"/></th>
              <th><spring:message code="description"/></th>
            </tr>
          </thead>
          <tfoot></tfoot>
          <tbody>
            <c:forEach items="${ lifecycleStates }" var="lifecycleState">
	            <tr>
	              <td align="center">
	                <form:radiobutton path="lifecycleState" value="${ lifecycleState }" cssClass="portlet-form-input-field lifecycle-state"/>
	              </td>
	              <td><spring:message code="lifecycle.name.${ lifecycleState }"/></td>
	              <td><spring:message code="lifecycle.description.${ lifecycleState }"/></td>
	            </tr>
            </c:forEach>
          </tbody>
        </table>
        
      </div>
    </div> <!-- end: portlet-section -->
    
    <!-- Portlet Section -->       
    <div class="portlet-section" id="publishingDateSection" style="display: none;">
      <div class="titlebar">
        <h3 class="title" role="heading"><spring:message code="auto.publish.optional"/></h3>
      </div>
      <div class="content"> 
 
        <table class="portlet-table table table-hover" summary="<spring:message code="publish.and.expiration.dates"/>">
          <thead>
            <tr>
              <th><spring:message code="option"/></th>
              <th><spring:message code="setting"/></th>
            </tr>
          </thead>
          <tbody>
            <tr>
                <td class="fl-text-align-right"><spring:message code="auto.publish.date.time"/></td>
                <td>
                   <form:input path="publishDate" size="10" cssClass="cal-datepicker"/>
                   <span style="${ portlet.publishDate == null ? 'display:none' : '' }">
                         <form:select path="publishHour">
                            <c:forEach begin="1" end="12" var="hour">
                                <form:option value="${ hour }"/>
                            </c:forEach>
                         </form:select>:<form:select path="publishMinute">
                            <c:forEach begin="0" end="59" var="min">
                                <fmt:formatNumber var="m" value="${ min }" minIntegerDigits="2"/>
                                <form:option value="${ m }"/>
                            </c:forEach>
                         </form:select>
                         <form:select path="publishAmPm">
                            <form:option value="0" label="AM"/>
                            <form:option value="1" label="PM"/>
                         </form:select>
                         (<a class="clear-date" href="javascript:;"><spring:message code="reset"/></a>)
                     </span>
                </td>
            </tr>  
          </tbody>
        </table>
 
      </div>
    </div> <!-- end: portlet-section -->

    <!-- Portlet Section -->
    <div class="portlet-section" id="expirationDateSection" style="display: none;">
      <div class="titlebar">
        <h3 class="title" role="heading"><spring:message code="auto.expire.optional"/></h3>
      </div>
      <div class="content"> 
 
        <table class="portlet-table table table-hover" summary="<spring:message code="publish.and.expiration.dates"/>">
          <thead>
            <tr>
              <th><spring:message code="option"/></th>
              <th><spring:message code="setting"/></th>
            </tr>
          </thead>
          <tbody>
            <tr>
                <td class="fl-text-align-right"><spring:message code="auto.expire.date.time"/></td>
                <td>
                   <form:input path="expirationDate" size="10" cssClass="cal-datepicker"/>
                     <span style="${ portlet.expirationDate == null ? 'display:none' : '' }">
                     <form:select path="expirationHour">
                        <c:forEach begin="1" end="12" var="hour">
                                <form:option value="${ hour }"/>
                        </c:forEach>
                     </form:select>:<form:select path="expirationMinute">
                            <c:forEach begin="0" end="59" var="min">
                                <fmt:formatNumber var="m" value="${ min }" minIntegerDigits="2"/>
                                <form:option value="${ m }"/>
                            </c:forEach>
                     </form:select>
                     <form:select path="expirationAmPm">
                        <form:option value="0" label="AM"/>
                        <form:option value="1" label="PM"/>
                     </form:select>
                         (<a class="clear-date" href="javascript:;"><spring:message code="reset"/></a>)
                 </span>
                </td>
           </tr>      
          </tbody>
        </table>
 
      </div>
    </div> <!-- end: portlet-section -->

    <!-- Buttons -->
    <div class="buttons">
      <c:choose>
        <c:when test="${ completed }">
          <input class="button btn btn-primary" type="submit" value="<spring:message code="review"/>" name="_eventId_review"/>
        </c:when>
        <c:otherwise>
          <input class="button btn btn-primary" type="submit" value="<spring:message code="continue"/>" name="_eventId_next"/>
          <input class="button btn" type="submit" value="<spring:message code="back"/>" name="_eventId_back"/>
        </c:otherwise>
      </c:choose>
      <input class="button btn btn-link" type="submit" value="<spring:message code="cancel"/>" name="_eventId_cancel"/>
    </div> <!-- end: Portlet Buttons --> 
    
    </form:form>  <!-- End Form -->
    
  </div> <!-- end: portlet-content -->

</div> <!-- end: portlet -->

<script type="text/javascript">
up.jQuery(function() {
    var $ = up.jQuery;
    $(document).ready(function(){
        var updateOptionalInputs = function () {
            var lifecycle = $('#${n}PortletLifecycle .lifecycle-state:checked').val();
            $('#${n}PortletLifecycle #publishingDateSection').css('display', lifecycle == "APPROVED" ? "block" : "none");
            $('#${n}PortletLifecycle #expirationDateSection').css('display', lifecycle == "PUBLISHED" ? "block" : "none");
        };
        $("#${n}PortletLifecycle .cal-datepicker").datepicker().change(function(){
            if ($(this).val()) $(this).next().css("display", "inline");
            else $(this).next().css("display", "none");
        });
        $("#${n}PortletLifecycle .clear-date").click(function(){ $(this).parent().css("display", "none").prev().val(""); });
        $("#${n}PortletLifecycle .lifecycle-state").click(function(){
            updateOptionalInputs();
        });
        updateOptionalInputs();
    });
});
</script>