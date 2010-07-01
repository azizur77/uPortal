<%--

    Licensed to Jasig under one or more contributor license
    agreements. See the NOTICE file distributed with this work
    for additional information regarding copyright ownership.
    Jasig licenses this file to you under the Apache License,
    Version 2.0 (the "License"); you may not use this file
    except in compliance with the License. You may obtain a
    copy of the License at:

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on
    an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied. See the License for the
    specific language governing permissions and limitations
    under the License.

--%>

<%@ include file="/WEB-INF/jsp/include.jsp" %>

<c:set var="n"><portlet:namespace/></c:set>
<portlet:actionURL var="permissionsUrl">
    <portlet:param name="execution" value="${flowExecutionKey}" />
    <portlet:param name="_eventId" value="permissions"/>
</portlet:actionURL>
<portlet:actionURL var="ownerUrl">
    <portlet:param name="execution" value="${flowExecutionKey}" />
    <portlet:param name="_eventId" value="owner"/>
</portlet:actionURL>

<portlet:actionURL var="createUrl">
  <portlet:param name="execution" value="${flowExecutionKey}" />
  <portlet:param name="_eventId" value="createPermission"/>
</portlet:actionURL>
<portlet:actionURL var="editUrl">
  <portlet:param name="execution" value="${flowExecutionKey}" />
  <portlet:param name="_eventId" value="editPermission"/>
  <portlet:param name="owner" value="OWNER"/>
  <portlet:param name="activity" value="ACTIVITY"/>
  <portlet:param name="target" value="TARGET"/>
</portlet:actionURL>
<portlet:actionURL var="deleteUrl">
  <portlet:param name="execution" value="${flowExecutionKey}" />
  <portlet:param name="_eventId" value="deletePermission"/>
  <portlet:param name="owner" value="OWNER"/>
  <portlet:param name="principalType" value="PRINCIPALTYPE"/>
  <portlet:param name="principalName" value="PRINCIPALNAME"/>
  <portlet:param name="activity" value="ACTIVITY"/>
  <portlet:param name="target" value="TARGET"/>
  <portlet:param name="permissionType" value="PERMISSIONTYPE"/>
</portlet:actionURL>

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
<div class="fl-widget portlet prm-mgr" role="section">
  
  <!-- Portlet Titlebar -->
  <div class="fl-widget-titlebar portlet-titlebar" role="sectionhead">
  	<div class="breadcrumb">
    	<span class="breadcrumb-1"><a href="${ permissionsUrl }">Permissions</a></span>
        <span class="separator"> &gt; </span> 
        <span class="breadcrumb-2"><a href="${ ownerUrl }">${ owner.name }</a></span>
        <span class="separator"> &gt; </span> 
    </div>
    <h2 class="title" role="heading">
        ${ activity.name }
    </h2>
    <h3 class="subtitle">${ activity.description }</h3>
  </div> <!-- end: portlet-titlebar -->
  
  <!-- Portlet Content -->
  <div class="fl-widget-content portlet-content" role="main">
  
    <!-- Portlet Section -->
    <div id="${n}permissionAddingTabs" class="portlet-section" role="region">
        <div class="titlebar">
            <h3 class="title" role="heading">Assignments</h3>   

        
            <div class="fl-col-mixed-200 options">
                <div class="fl-col-fixed fl-force-left view-filter">
                <!-- This space left blank for future filtering options... -->
                </div>
                <div class="fl-col-flex view-pager flc-pager-top">
                    <ul id="pager-top" class="fl-pager-ui">
                        <li class="flc-pager-previous"><a href="#">&lt; <spring:message code="listPermissions.pagerPrevious"/></a></li>
                        <li>
                            <ul class="fl-pager-links flc-pager-links" style="margin:0; display:inline">
                                <li class="flc-pager-pageLink"><a href="javascript:;">1</a></li>
                                <li class="flc-pager-pageLink-disabled">2</li>
                                <li class="flc-pager-pageLink"><a href="javascript:;">3</a></li>
                            </ul>
                        </li>
                        <li class="flc-pager-next"><a href="#"><spring:message code="listPermissions.pagerNext"/> &gt;</a></li>
                        <li>
                            <span class="flc-pager-summary"><spring:message code="listPermissions.pagerPerPagePrefix"/></span>
                            <span> <select class="pager-page-size flc-pager-page-size">
                                <option value="5">5</option>
                                <option value="10">10</option>
                                <option value="20">20</option>
                                <option value="50">50</option>
                            </select></span> <spring:message code="listPermissions.pagerPerPageSuffix"/>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        
        <div class="content">
        
            <table class="portlet-table" id="${n}permissionsTable" summary="" xmlns:rsf="http://ponder.org.uk" style="width:100%;">
                <thead>
                    <tr rsf:id="header:">
                        <th id="${n}permissionPrincipal" class="flc-pager-sort-header"><a rsf:id="permissionPrincipal" title="Click to sort" href="javascript:;"><spring:message code="listPermissions.permissionPrincipalHeading"/></a></th>
                        <th id="${n}permissionTarget" class="flc-pager-sort-header"><a rsf:id="permissionTarget" title="Click to sort" href="javascript:;"><spring:message code="listPermissions.permissionTargetHeading"/></a></th>
                        <th id="${n}permissionType" class="flc-pager-sort-header"><a rsf:id="permissionType" title="Click to sort" href="javascript:;"><spring:message code="listPermissions.permissionTypeHeading"/></a></th>
                        <th id="${n}permissionEdit" rsf:id="permissionEdit"><spring:message code="listPermissions.permissionEditHeading"/></th>
                        <th id="${n}permissionDelete" rsf:id="permissionDelete"><spring:message code="listPermissions.permissionDeleteHeading"/></th>
                    </tr>
                </thead>
                <tbody id="${n}permissionsBody">
                    <tr rsf:id="row:">
                        <td headers="${n}permissionPrincipal"><span rsf:id="permissionPrincipal"></span></td>
                        <td headers="${n}permissionTarget"><span rsf:id="permissionTarget"></span></td>
                        <td headers="${n}permissionType"><span rsf:id="permissionType"></span></td>
                        <td headers="${n}permissionEdit"><a href="" rsf:id="permissionEdit"></a></td>
                        <td headers="${n}permissionDelete"><a href="" rsf:id="permissionDelete"></a></td>
                    </tr>
                </tbody>
            </table>
        
        </div>
        
        <a href="${ createUrl }">Assign to a new target</a>


    </div> <!-- end: portlet-section -->

  </div> <!-- end: portlet-content -->

</div> <!-- end: portlet -->


<script type="text/javascript">
up.jQuery(function() {
    var $ = up.jQuery;

    var pager;
    var editUrl = "${editUrl}";
    var deleteUrl = "${deleteUrl}";

    var getPermissions = function() {
        var rslt;
        $.ajax({
             url: "<c:url value="/mvc/permissionsList"/>",
             async: false,
             cache: false,
             data: { owner: '${ owner.fname }', activity: '${ activity.fname }' },
             dataType: "json",
             error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert(textStatus + " : " + errorThrown);
             },
             success: function(data) {
                rslt = data.permissionsList;
             }
        });
        return rslt;
    };

    // Initialize the pager
    var options = {
        dataModel: getPermissions(),
        columnDefs: [
            { key: "permissionPrincipal", valuebinding: "*.principalName", sortable: true },
            { key: "permissionTarget", valuebinding: "*.targetName", sortable: true },
            { key: "permissionType", valuebinding: "*.permissionType", sortable: true },
            { key: "permissionEdit", valuebinding: "*.owner",
                components: {
                    target: editUrl.replace("OWNER", '${"${*.owner}"}')
                                    .replace("ACTIVITY", '${"${*.activity}"}')
                                    .replace("TARGET", '${"${*.target}"}'),
                    linktext: "<spring:message code="listPermissions.editLink"/>"
                }
            },
            { key: "permissionDelete", valuebinding: "*.owner",
                components: {
                    target: deleteUrl.replace("OWNER", escape('${"${*.owner}"}'))
                                    .replace("PRINCIPALTYPE", escape('${"${*.principalType}"}'))
                                    .replace("PRINCIPALKEY", escape('${"${*.principalKey}"}'))
                                    .replace("ACTIVITY", escape('${"${*.activity}"}'))
                                    .replace("TARGET", escape('${"${*.target}"}'))
                                    .replace("PERMISSIONTYPE", escape('${"${*.permissionType}"}')),
                    linktext: "<spring:message code="listPermissions.deleteLink"/>"
                }
            }
        ],
        bodyRenderer: {
          type: "fluid.pager.selfRender",
          options: {
              selectors: {
                 root: "#${n}permissionsTable"
              },
              row: "row:"
            }
            
        },
        pagerBar: {type: "fluid.pager.pagerBar", options: {
          pageList: {type: "fluid.pager.renderedPageList",
            options: { 
              linkBody: "a"
            }
          }
        }}
    };

    $(document).ready(function(){
        var pager = up.fluid.pager("#${n}permissionAddingTabs", options);
    });
    
});
</script>