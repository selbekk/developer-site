<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="requestUrl" required="true" type="java.lang.String" rtexprvalue="true" %>

<c:out value="${requestUrl}" />


<div class="codetabs">
    <h3><a href="#xml">XML</a></h3>
    <div data-tab="xml" class="tab api-call">
        <p>Request:
            <a target="_blank" class="request" href="http://fraktguide.bring.no/fraktguide/products/all.xml?weightInGrams=1500&amp;from=7600&amp;to=1407" data-internal="/proxy/shipping-guide/products/all.xml?weightInGrams=1500&amp;from=7600&amp;to=1407">
                /all.xml?weightInGrams=1500&amp;from=7600&amp;to=1407
            </a>
        </p>
        <pre class="xml response delay-snippet"></pre>
    </div>

    <h3><a href="#json">JSON</a></h3>
    <div data-tab="json" class="tab api-call">
        Request:
        <a target="_blank" class="request" href="http://fraktguide.bring.no/fraktguide/products/all.json?weightInGrams=1500&amp;from=7600&amp;to=1407" data-internal="/proxy/shipping-guide/products/all.json?weightInGrams=1500&amp;from=7600&amp;to=1407">
            /all.json?weightInGrams=1500&amp;from=7600&amp;to=1407
        </a>
        <pre class="json response delay-snippet"></pre>
        <p>By adding the <code>callback</code> parameter the response will be wrapped in the
            specified JSONP callback function.</p>
    </div>

    <h3><a href="#java">Java</a></h3>
    <div data-tab="java" class="tab">
        <pre class="java">// Initialize library
String clientId = "www.mywebshop.com";
BringService bringService = new BringService(clientId);

// Prepare query
Package packet = new Package();
packet.withWeightInGrams("1500");
Shipment shipment = new Shipment();
shipment.withFromPostalCode("7600");
shipment.withToPostalCode("1407");
shipment.addPackage(packet);

// Fetch price information from Bring
ShippingGuideResult shippingGuideResult = bringService.queryShippingGuide(shipment, QueryType.ALL);
String price = shippingGuideResult.getProduct(ProductType.SERVICEPAKKE).getPrice().getPackagePriceWithoutAdditionalServices().getAmountWithoutVAT();
String workingDays = shippingGuideResult.getProduct(ProductType.SERVICEPAKKE).getExpectedDelivery().getWorkingDays();
String descriptionText = shippingGuideResult.getProduct(ProductType.SERVICEPAKKE).getGuiInformation().getDescriptionText();

// Print out
System.out.println("Price: " + price + " NOK");
System.out.println("Working days: " + workingDays);
System.out.println("Display name: " + descriptionText);</pre>
        <p>Expected result:</p>
        <pre>Price: 81.00 NOK
Working days: 2
Display name: RIMI Vinterbro. Åpningstider Man - Fre: 1000-2100, Lør: 0900-1800</pre>
    </div>
</div>