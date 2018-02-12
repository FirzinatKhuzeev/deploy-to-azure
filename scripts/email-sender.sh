#!/bin/bash

echo "Start sending email"

emailFrom="no-reply@azure.com"
emailTo=$1
apiKey=$2
userName=$3
password=$4
vmName=$(hostname)
osType=$(uname)
ipAddress=$(curl ipinfo.io/ip)
subject="VM Information"
content="<html><p>Computer name: "$vmName"</p><p>Operating system: "$osType"</p><p>Public IP address: "$ipAddress"</p><p>User Name: "$userName"</p><p>Password: "$password"</p></html>"

#send post request to sendgrid api
curl --request POST \
     --globoff \
     --url https://api.sendgrid.com/v3/mail/send \
     --header 'Authorization: Bearer '$apiKey \
     --header 'Content-Type: application/json' \
     --data \
		@<(cat <<EOF
{
	"personalizations": [{
			"to": [{
					"email": "$emailTo"
				}
			]
		}
	],
	"from": {
		"email": "$emailFrom"
	},
	"subject": "$subject",
	"content": [{
			"type": "text/html",
			"value": "$content"
		}
	]
}
EOF
)

echo "Email $emailTo sent successfully"
