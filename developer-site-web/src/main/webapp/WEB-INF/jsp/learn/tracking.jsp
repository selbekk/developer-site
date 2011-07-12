<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<misc:head />

<body>
    <div class="wrapper">
        <misc:header />
        <div class="main content">
        
            <div class="group">
               <misc:learnlauncher cssClass="menutab menutab-selected"/>
               <misc:downloadlauncher cssClass="menutab" />
               <misc:talklauncher cssClass="menutab" />
            </div>
 
            <div class="menubox group">
                <ul class="menulist span-2">
                    <li><a class="menubutton selected" href="tracking.html">TRACKING API</a></li>
                </ul>
                <ul class="menulist span-2">
                    <li><a class="selected menubutton" href="#">API REFERENCE</a></li>
                </ul>
            </div>

            <div class="main-content group">
				<div class="article">
					<h1>Tracking - Information for developers</h1>
					<h2>Tracking Link</h2>
                    <p>
                        Links to tracking can be the same as the URL of a normal tracking request. 
                        E.g.: http://sporing.bring.no/sporing.html?q=...
                    </p>

                    <p>The parameter "q" is the query string (reference, shipment or package number).</p>
                    <br/>
                    <p>
                        If the query string is a sender's reference, then it's recommended to filter on the sender's id ("aktørnummer"), if available. 
                        Then the results will be unique for that sender. This is done with the parameter aktornummer, e.g. &aktornummer=123.
                    </p>
                    <br/>
                    <p>
                        For results without the top menu, add the following request parameter: &layout=standalone
                        E.g.: http://sporing.bring.no/sporing.html?q=...&layout=standalone
                    </p>
                    <br/>
                    <p>
                        The latter is suited for e.g. popup windows. Please note that the width of the popup window should be equal to or greater than 1024 pixels.
                    </p>
                    
                    <h2>Tracking API</h2>
                    <p>This information is only relevant for system developers.</p>
                    <h3>XML</h3>
					<form action="http://sporing.bring.no/sporing.xml" method="GET">
                   		<p>Reference/Shipment/Package Number: 
						<input type="text" name="q"/> 
						<input type="submit" value="Show XML"/></p>						
					</form>
					<p><a href="http://sporing.bring.no/sporing.xsd">XML Schema definisjon</a></p>
                    <h3>JSON</h3>
					<p>The JSON data format is well suited for showing data directly in the web browser. 
						For more JSON examples, check out 
						<a href="http://fraktguide.bring.no/fraktguide/forDevelopersEnglish.do">
							JSON in Bring Fraktguide</a>.
					</p>
                    <h3>JSON</h3>
					<form action="http://sporing.bring.no/sporing.json" method="GET">
						<p>Reference/Shipment/Package Number: 
						<input type="text" name="q"/> 
						<input type="submit" value="Show JSON"/></p>
					</form>
					<form action="http://sporing.bring.no/sporing.json" method="GET">
						<input type="hidden" name="callback" value="myCallback"/>
						<p>Reference/Shipment/Package Number: 
						<input type="text" name="q"/>
						<input type="submit" value="Show JSONP"/></p>
					</form>
					<h3>Information</h3>
					<p>The Track &amp; Trace API is in <strong>BETA</strong> status. 
						It may be changed without notice. Please note the 
						<a href="http://fraktguide.bring.no/fraktguide/vilkaar.do">
							user agreement at Bring Fraktguide
						</a> (in Norwegian).
					</p>
					<p>For an example you may look at the solution for 
						<a href="http://sporing.bring.no/multikolli.html">
							tracing several packages simultaneously
						</a>. 
						This page makes use of the JSON interface (with jQuery).
					</p>
					<p>Refer to <a href="http://fraktguide.bring.no">Bring Fraktguide</a> 
						for an API from Bring that allows you to calculate prices, time estimations, 
						product information and environmental information (and more). 
						You can get finished rendered HTML, XML API (RESTful), 
						JSON or use our Web Service.
					</p>
					<p><a href="http://twitter.com/bringapi">Follow the development team at twitter</a>.
						 Developers may use <a href="http://getsatisfaction.com/bring">our community at Get
						Satisfaction for <b>technical</b> feedback regarding the API</a>. 
						Please give us a hint if you making use of the API.
					</p>
					
				</div>
				<div class="talk-content">
					<div class="title">RELATED COMMENTS</div>
                	<ul class="avatar-list group">
				            <li class="group">
				                <img class="avatar" src="img/face.png" />
								<div class="avatar-list-text">
				                    How do I integrate the shipping guide in
									my Neverland giftshop?
				                </div>
				            </li>
				            <li class="group">
                                <img class="avatar" src="img/face.png" />
                                <div class="avatar-list-text">
                                    How do I integrate the shipping guide in
                                    my Neverland giftshop?
                                </div>
                            </li>
                            <li class="group">
                                <img class="avatar" src="img/face.png" />
                                <div class="avatar-list-text">
                                    How do I integrate the shipping guide in
                                    my Neverland giftshop?
                                </div>
                            </li>
							<li class="group">
								<div class="avatar-list-text avatar-list-footer">+View all 6 answers</div>
				            </li>
						</ul>
				</div>
            </div>
        </div>

    </div>
    <misc:footer />
</body>

</html>