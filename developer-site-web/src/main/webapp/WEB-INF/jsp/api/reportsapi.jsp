<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sidebar" tagdir="/WEB-INF/tags/sidebars" %>
<!DOCTYPE html>

<html>

<head>
    <misc:contenttype/>
    <misc:title value="Reports API"/>
    <misc:css_v2/>
</head>

<body>

<div class="wrapper">

<misc:header_v2 selected_tab="developer"/>

<div id="page">
<section id="content">
<div class="row-fluid">

<div class="span9">

<div class="box">
    <h1>Reports API (BETA)</h1>
</div>

<div class="box">
    <h2><a name="introduction"></a>Introduction</h2>
    <p>The API lets you view customer accounts associated with your account, find available reports for those accounts and generate and download reports. This is a step-by-step guide on how to use the API.
    </p>

    <div class="information-box">BETA! This API is currently in BETA, which means that even though the code is in production and fully functional,
         changes might be made in the future that can break code relying on this specific version.</div>
</div>

<div class="box">
    <h2><a name="reference"></a>Reference</h2>

                        <pre class="code-box">Request prefix:
https://www.mybring.com/reports/api</pre>

    <table>
        <thead>
        <tr>
            <th>Header</th>
            <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>
                <code>X-MyBring-API-Uid: &lt;user@email.com&gt;</code>
            </td>
            <td><p>Specify your email address.</p>
                <ul>
                    <li>
                        <code>&lt;user@email.com&gt;</code> = the users email address.
                    </li>
                </ul>
            </td>
        </tr>
        <tr >
            <td>
                <code>X-MyBring-API-Key: &lt;api_key&gt;</code>
            </td>
            <td><p>Specify your API-key.</p>
                <ul>
                    <li><code>&lt;api_key&gt;</code> = a valid api-key
                                                     such as <code>a141879d-608e-4ee4-95bd-8a083e04b599</code>. Read <a href="/additionalresources/getting-api-keys.html?from=reports">Getting and using API-keys</a> for a full explanation.</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>
                <code>Accept-Language: &lt;lang_code&gt;,&lt;lang_code&gt;</code>
            </td>
            <td><p>Choose language for text-fields in the responses.</p>
                <ul>
                    <li><code>&lt;lang_code&gt;</code> = a language code such as <code>no</code> for norwegian and <code>en</code> for english.</li>
                </ul>
            </td>
        </tr>

        </tbody>
    </table>

    <table>
        <thead>
        <tr>
            <th>REST URI</th>
            <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><code>/generate.&lt;extension&gt;</code></td>
            <td>
                <p>Get a list of available customer accounts. Remember to set the correct headers
                   (<code>Accept, X-MyBring-API-Uid</code> and <code>X-MyBring-API-Key</code>)
                   before performing this call</p>
                <ul>
                    <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>
                </ul>
            </td>
        </tr>
        <tr >
            <td><code>/generate/&lt;customer_account_id&gt;.&lt;extension&gt;</code></td>
            <td> Get a list of all available reports for the customer with customer id given
                 by <code>&lt;customer_account_id&gt;</code>.
                <ul>
                    <li><code>&lt;customer_account_id&gt;</code> = one of the customer account ids
                                                                 returned by a call to <code>.../generate/</code>.</li>
                    <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>
                </ul>
            </td>
        </tr>
        <tr>
            <td><code>/generate/&lt;customer_account_id&gt;/&lt;report_type&gt;?&lt;parameter1&gt;&amp;&lt;parameter2&gt;.&lt;extension&gt;</code></td>
            <td><p>Order the specified report_type to be generated for the given customer account id.
                   This call will return the HTTP status code 202, and the response body will contain
                   a url for monitoring the status of the report generation.</p>
                <ul>
                    <li><code>&lt;customer_account_id&gt;</code> = one of the customer account ids
                                                                 returned by a call to <code>.../generate/</code>.</li>
                    <li><code>&lt;report_type&gt;</code> = one of the report types returned by a call
                                                         to <code>.../generate/&lt;customer_account_id&gt;/</code> (ie. <code>PARCELS-DELIVERED</code>)</li>
                    <li><code>&lt;parameters&gt;</code> = parameters specific for the given <code>report_type</code>. The available parameters can be found in the response from <code>.../generate/&lt;customer_account_id&gt;/</code></li>
                    <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>
                </ul></td>
        </tr>
        <tr >
            <td><code>/report/&lt;report_id&gt;/status.&lt;extension&gt;</code></td>
            <td><p>View the status of the report generation for the report specified by <code>report_id</code>.</p>
                <ul>
                    <li><code>&lt;report_id&gt;</code> = the id for the report you are waiting for.
                                                       This id is returned by the call to <code>.../generate/&lt;customer_account_id&gt;/&lt;report_type&gt;</code></li>
                    <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>

                </ul>
            </td>
        </tr>
        <tr>
            <td><code>/report/&lt;report_id&gt;.&lt;extension&gt;</code></td>
            <td>
                <p>Get the actual report with <code>report_id</code> in the file format given by <code>extension</code>.</p>
                <ul>
                    <li><code>&lt;report_id&gt;</code> = the id for the report, as given by the call to <code>.../report/&lt;report_id&gt;/status/</code></li>
                    <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>xls</code> (excel)</li>
                </ul>
            </td>
        </tr>
        </tbody>
    </table>

</div>

<div class="box">
    <h2><a name="HTU"></a>How to Use</h2>
    <p>The Reports API is a logged-in service and you need to get an API-key and authenticate before being able to use the API.
       Read more about <a href="/additionalresources/getting-api-keys.html?from=reports">how to get an API-key</a>, and how to use it for authentication. </p>
    <div>
        <p>The two first steps in the process is only necessary to find the correct IDs for the customer account and report.
           You can save these IDs, and perform the generation-step without verifying the IDs. The response may get added information,
           so implementation should ignore new elements added to the response.</p>
    </div>
    <div>
        <ol>
            <li><h4>GET CUSTOMER ACCOUNTS</h4>

            <div>The first step is to get a list of available customer accounts.
                <div><h5>REQUEST</h5>
                    <pre class="code-box">https://www.mybring.com/reports/api/generate.json</pre></div>
                <div><h5>EXAMPLE RESPONSE</h5></div>

                <div><pre class="prettyprint">{"customers":[
    {
        "id":"PARCELS_NORWAY-00012341234",
        "name":"TEST CUSTOMER",
        "fullName":"TEST CUSTOMER (00012341234)",
        "reports":"https://www.mybring.com/reports/api/generate/PARCELS_NORWAY-00012341234/"
    }

]}</pre></div></div>

            <li><h4>GET LIST OF AVAILABLE REPORTS</h4>
            <div><div>Each customer has a set of reports available.</div>
                <div><h5>REQUEST</h5>
                    <pre class="code-box"> https://www.mybring.com/reports/api/generate/PARCELS_NORWAY-00012341234.json</pre></div>
                <div><h5>EXAMPLE RESPONSE</h5></div>

                <div><pre class="prettyprint">{"reports":[
    {
        "id":"PARCELS-DELIVERED",
        "name":"Delivered to recipient",
        "description":"Overview of parcels which are delivered to the recipient.",
        "url":"http://www.mybring.com/reports/api/generate/PARCELS_NORWAY-00012341324/PARCELS-DELIVERED/",
        "parameters":[
            {
                "name":"fromDate",
                "type":"date",
                "description":"Startdate of the report. Format: DD.MM.YYYY"
            },
            {
                "name":"toDate",
                "type":"date",
                "description":"Enddate of the report. Format: DD.MM.YYYY"
            }
        ]
    }

]}</pre></div></div></li>

            <li><h4>GENERATE REPORT</h4>

            <div><div>To generate a report do a GET to the supplied URL, and include the parameters described in the response.

                      These parameters are considered to be static, so it should not be necessary to do the two first steps for every report generation.
                      The GET-call will return 202, telling the caller the that the request for a report is put on the queue.
                      The url to query to get the status for the request if provided as an HTTP header and also in the response.
                </div>
                <div><h5>REQUEST</h5>

                    <pre class="code-box">https://www.mybring.com/reports/api/generate/PARCELS_NORWAY-00012341234.json?DELIVEREDfromDate=01.07.2011&amp;toDate=01.07.2011</pre></div>
                <div><h5>EXAMPLE RESPONSE</h5></div>
                <div><pre class="prettyprint">{
    "statusMessage":"The report is now beeing processed. Please use the statusUrl to check when the report is ready. Reloading this page will generate a new report.",
    "statusUrl":"https://www.mybring.com/reports/api/report/db285042-6e8d-4563-94ca-eb1100706a73/status/",
}</pre></div></div>

            <li><h4>CHECK STATUS OF REPORT</h4>

            <div>Since the generation of reports may take several minutes, we supply a status address to check the status of the report generation.
                      The status page will display NOT_DONE, until the report is ready to be downloaded. When the report is ready, URLs to download the report will be in the response.

                <div><h5>REQUEST</h5>
                    <pre class="code-box"> https://www.mybring.com/reports/api/report/db285042-6e8d-4563-94ca-eb1100706a73/status.json</pre>
                </div>


                <div><h5>REPORT NOT FINISHED RESPONSE</h5></div>
                <div><pre class="prettyprint">{
"status":"NOT_DONE"
}</pre></div>

                <div><h5>REPORT AVAILABLE RESPONSE</h5></div>

                <div><pre class="prettyprint">{
"status":"DONE",
"xmlUrl":"https://www.mybring.com/reports/api/report/db285042-6e8d-4563-94ca-eb1100706a73.xml",
"xlsUrl":"https://www.mybring.com/reports/api/report/db285042-6e8d-4563-94ca-eb1100706a73.xls"

}</pre></div></div>

            <div>
                <h5>REPORT FAILED RESPONSE</h5>
                <div><pre class="prettyprint">{
"status":"FAILED"
}</pre></div></div></li>


            <li><h4>DOWNLOAD REPORT</h4>

            <div>The reports are available in XML or Excel format. Please use the link with .xml or .xls extension to download the report.


                <div><h5>XML-REQUEST</h5>
                    <pre class="code-box">https://www.mybring.com/reports/api/report/db285042-6e8d-4563-94ca-eb1100706a73.xml</pre>
                </div>

                <div><h5>EXCEL-REQUEST</h5>
                </div>
                <div><pre class="code-box"> https://www.mybring.com/reports/api/report/db285042-6e8d-4563-94ca-eb1100706a73.xls</pre>
                </div>
            </div>
            </li>
        </ol>
    </div>
</div>

</div>

<div class="span3" id="additional-resources">
    <div id="sidebar">
        <sidebar:reports-sidebar/>
    </div>
</div>

</div>
</section>
</div>
</div>

<misc:footer_v2/>
<misc:jqueryblob_v2/>


</body>
</html>