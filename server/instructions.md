Get started with node-sample
-----------------------------------

Welcome to Node JS Web Starter application that uses the IBM DataCache REST interface!

This sample application demonstrates how to write a Node JS application using IBM DataCache REST interface and deploy it on BlueMix.

1. [Install the cf command-line tool](https://www.ng.bluemix.net/docs/BuildingWeb.jsp#install-cf).
2. [Download the starter application package](https://ace.ng.bluemix.net:443/rest/../rest/apps/c81917bd-aae5-4857-821d-49d08e31ad55/starter-download)
3. Extract the package and cd to it.
4. Connect to BlueMix:

		cf api http://api.ng.bluemix.net
		cf target -o kw@twilio.com -s dev

5. Log into BlueMix:

		cf login kw@twilio.com
		
6. Deploy your app:

		cf push node-sample

7. Access your app: [http://node-sample.ng.bluemix.net](http://node-sample.ng.bluemix.net)
