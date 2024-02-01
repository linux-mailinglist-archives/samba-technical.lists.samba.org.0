Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7907D84601E
	for <lists+samba-technical@lfdr.de>; Thu,  1 Feb 2024 19:40:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=+/UCn+YdR1yc5sU8jNC/7zreG+9EhOjDlvxVOvQwqNI=; b=boLJ62LK57z/BMyZWQ2AwvnJQh
	HKPcBZMDoWxlKEhHB+iOoQxI7B5YtTRddUTx9MW+tnUHXU2UDDHCjB83Z1W956JjUVVkkc4BfEywJ
	daqRTHdcpv9fp22Gdc8sNDRIwJLKbvZHDFgqd6lGQusDTlnwHd5D3kYuZfmyn9hWqDLP82vTzWoYC
	nmgwhWd0/B9gNeFLiAB7xPguboT1KPtMJTJ5H9v77TgSXvc4qGhf3mEsK90N4Vzi1vddpIElKNQ6D
	AvYZOqh6j5o8DqmlfbbXiCFgXKptdpBzgm8V/bEEm7sEnQyChNjx5O9UjLsBnCDXd9JYbvDwJP/Ne
	2BXpdvcw==;
Received: from ip6-localhost ([::1]:62612 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rVbzG-007ITk-08; Thu, 01 Feb 2024 18:40:34 +0000
Received: from plasma4.jpberlin.de ([80.241.57.33]:43587) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVbz9-007ITc-5Y
 for samba-technical@lists.samba.org; Thu, 01 Feb 2024 18:40:31 +0000
Received: from spamfilter02.heinlein-hosting.de
 (spamfilter02.heinlein-hosting.de [80.241.56.116])
 by plasma.jpberlin.de (Postfix) with ESMTP id 8BD9CFEEFD;
 Thu,  1 Feb 2024 19:22:43 +0100 (CET)
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de
 [80.241.56.116]) (amavisd-new, port 10030)
 with ESMTP id 3CuCcfacJAUk; Thu,  1 Feb 2024 19:22:42 +0100 (CET)
Received: from [192.168.123.203] (p5b2400db.dip0.t-ipconnect.de [91.36.0.219])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id E2A07FEA08
 for <samba-technical@lists.samba.org>; Thu,  1 Feb 2024 19:22:41 +0100 (CET)
Message-ID: <14cf1029-2378-489d-bf9b-844ed9d67081@kania-online.de>
Date: Thu, 1 Feb 2024 19:22:38 +0100
MIME-Version: 1.0
To: samba-technical@lists.samba.org
Content-Language: de-DE, en-US
Subject: Question for time based group membership in FL 2016
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms020101040302030202010506"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Stefan Kania via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Kania <stefan@kania-online.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a cryptographically signed message in MIME format.

--------------ms020101040302030202010506
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi to all,

I already posted the question in the samba-mailinlist but I think it's 
more a question for developers :-)

I have a question about FL 2016 and if samba supports it. If yes, how 
can I use it without powershell.

In FL 2016 there is the possibility to put a user into a group and the 
membership is time based. So I could put the user Foo into the group 
'domain admins' for 30 minutes and after 30 minutes the system will 
remove user foo from the group.

But to activated this feature you have to give a powershell command:
----------------
Enable-ADOptionalFeature "Privileged Access Management Feature" -Scope 
ForestOrConfigurationSet -Target example.net"
-----------------

This feature once enabled can't be disabled anymore

Then I could add a user to a group:
---------------
Add-ADGroupMember -Identity "Domain Admins" -Members "Foo" 
-MemberTimeToLive (New-TimeSpan -Minutes 30)
---------------

After 30 minutes Foo will be removed automatically.

But if this feature is supported by samba 4.19 or 4.20 with FL 2016 
activated, how could I set this?

I try it with powershell for Linux, but the powershell for Linux is not 
supporting AD-commands.


Stefan


--------------ms020101040302030202010506
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: Kryptografische S/MIME-Signatur

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
CdEwggSUMIIDfKADAgECAghxU09cSz6R1TANBgkqhkiG9w0BAQsFADBmMQswCQYDVQQGEwJE
RTEzMDEGA1UECgwqREdOIERldXRzY2hlcyBHZXN1bmRoZWl0c25ldHogU2VydmljZSBHbWJI
MSIwIAYDVQQDDBlkZ25zZXJ2aWNlIENBIDIgVHlwZSBFOlBOMB4XDTIzMDkyNTE4MDgzNVoX
DTI0MDkyNDE4MDgzNVowbjELMAkGA1UEBhMCREUxITAfBgNVBAUTGDQwMDAwMDAwNjUxMWNm
MDEzNmYxMWEwNDEVMBMGA1UEAwwMU3RlZmFuIEthbmlhMSUwIwYJKoZIhvcNAQkBFhZzdGVm
YW5Aa2FuaWEtb25saW5lLmRlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1ULY
84oACo6tokvBGHFH3ZqqbpFN09v3A+iqQRRy3N4PfYPPPn2Br4Xun5HhTDbXnppqxxzRh8xw
tV6TZhuRfa2rOaNfloKJCUgvBcTc+AGCSED0GR/HG8KDqUarhczOSpVagbTeFMfr2rmVj9Mr
B6KXoQnXcspUKZhllAOmluGJgZ96jaKclZb54/0Z7HOqUtLOCyBQjhB4WHPHCmMfmoBWWnll
NCh5ArWxAq2oy3qh3vD41YcFCWfwsbhWu6H7i+DctxX1d2s4Yb8AGcVotY5QM4Ihfs83Axez
nrfnM0DcyJxEyAYEy/NCcNVbnKiBxEc6bOHcOBfNBCk0gfxU8wIDAQABo4IBPDCCATgwHQYD
VR0OBBYEFJ24mZ9+WXalRwYFaJEOZPfMjOiyMAwGA1UdEwEB/wQCMAAwHwYDVR0jBBgwFoAU
6caT0dUPBmRy6mqWProQ8lRUsnkwVgYDVR0gBE8wTTBLBgwrBgEEAfsrAgEDAggwOzA5Bggr
BgEFBQcCARYtaHR0cDovL3NlYzUuZGduc2VydmljZS5kZS9wb2xpY2llcy9pbmRleC5odG1s
MD4GA1UdHwQ3MDUwM6AxoC+GLWh0dHA6Ly9zZWM1LmRnbnNlcnZpY2UuZGUvY3JsL2NybDIt
dHlwZS1lLmNybDAOBgNVHQ8BAf8EBAMCBLAwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUF
BwMEMCEGA1UdEQQaMBiBFnN0ZWZhbkBrYW5pYS1vbmxpbmUuZGUwDQYJKoZIhvcNAQELBQAD
ggEBADibCeP+7VM75NQfZByrA0oDOPQy1kwPtnBUqX4SZuCTIiM27NZDgYry1KJS+QuKbNmd
3OirBVqls4rYFTk24qH+5CIstJKrxY+TMHnGk9KpsVVDplw+EyE79khhcAMrbS03WsRZiBd/
Uk7W5cvfkrTlCIjLzhwvDBqea4+bRTbi8T63LtNHhOgaj7g3+J1xM/wVgVlobSXoXk69+8ZL
1RG3on3r+1EmJpvCPJsL0BfUTia547lW4ectUBOrQ9eEri2eb+MW1QyileHPXv6OS465uN/b
2kqY39wo95YEWmWRRZDsiKAqkuY/Qfx7FsodvAQo8kzCsyruNaZB5q6eqZIwggU1MIIEHaAD
AgECAghVHErXZq0l9jANBgkqhkiG9w0BAQsFADBhMQswCQYDVQQGEwJERTEzMDEGA1UECgwq
REdOIERldXRzY2hlcyBHZXN1bmRoZWl0c25ldHogU2VydmljZSBHbWJIMR0wGwYDVQQDDBRk
Z25zZXJ2aWNlIFJvb3QgNzpQTjAeFw0xNjEwMjYwOTIyNDFaFw0yNDEwMjYwOTIyNDFaMGYx
CzAJBgNVBAYTAkRFMTMwMQYDVQQKDCpER04gRGV1dHNjaGVzIEdlc3VuZGhlaXRzbmV0eiBT
ZXJ2aWNlIEdtYkgxIjAgBgNVBAMMGWRnbnNlcnZpY2UgQ0EgMiBUeXBlIEU6UE4wggEiMA0G
CSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDcpfKUP3THo0fSl2bOa6PNbRcDYZaE4ZV3vLGr
e/U445OsRahORPeP/9L4nycTK6fUawpDTqOaDxtXYxjoJNC9LnKRxVB/UkBf0h25vN0L1iV4
KhCaY8TimV0z2yUSlb2NuZ4gdBU69qJkasqYj+AP8OcQOo0idj9Nr1eloHD32i0JDPkhBj8V
f6c6b7mNyn8yfZYvZlzzV2iQ/cvo6iFLx2wgG7mCkOZ8BAHGDFw6T0UIA0Bk60YhRMRxI7GX
jMxBQA2Y/XXoP4dvQDDtMNmK0r5DUXof87w2brXctuQ2b4xNwFIErVoAQu8ftnXTm9iOtaOs
WyLMZX6v5szaQBqBAgMBAAGjggHqMIIB5jASBgNVHRMBAf8ECDAGAQH/AgEAMB8GA1UdIwQY
MBaAFAEMFht0ctM8FO4md7dJFFPY+4sbMFsGCCsGAQUFBwEBBE8wTTBLBggrBgEFBQcwAYY/
aHR0cDovL3JvY3NwLWRnbi5kZ25zZXJ2aWNlLmRlOjgwODAvZWpiY2EvcHVibGljd2ViL3N0
YXR1cy9vY3NwMGoGA1UdIARjMGEwXwYMKwYBBAH7KwIBBAIBME8wTQYIKwYBBQUHAgEWQWh0
dHA6Ly93d3cuZGduc2VydmljZS5kZS90cnVzdGNlbnRlci9wdWJsaWMvZGduc2VydmljZS9p
bmRleC5odG1sMIGZBgNVHR8EgZEwgY4wgYuggYiggYWGgYJsZGFwOi8vbGRhcC5kZ25zZXJ2
aWNlLmRlOjM4OS9DTj1DUkwtMSxPPURHTiUyMFNlcnZpY2UlMjBHbWJILEM9REU/Y2VydGlm
aWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNzPWNSTERpc3RyaWJ1dGlvblBv
aW50MB0GA1UdDgQWBBTpxpPR1Q8GZHLqapY+uhDyVFSyeTAOBgNVHQ8BAf8EBAMCAQYwGwYJ
KwYBBAHAbQMFBA4wDAYKKwYBBAHAbQMFATANBgkqhkiG9w0BAQsFAAOCAQEAq7w5+kXJ+/xT
at0jiTX4GDX5HUeQohqAuLGfotHcqQqqjF8G6UUI0q4i0tnhHtldhZrNBOErgThGsToNZ1Y2
Gn0FRrcrUU9LnhSMwd1XJ0Je6ERSdEh4vXf8YxJQGZJPCPJcrblhue0mmwO9nbhKewGglht5
VWSHTS8vq5Da3zbxFG6lIdE62V4KqcMAiyY2BfL8guCPscTWl5txJrjb4ENo9nRqdzsXNEG3
yyzgmyv6znQ4pGgTe5E6qXx5bO6XCDoUK4Kz1S82PzR6hvcxKZo7kKK2ut2B3buwU8xqfw73
EMH8imv4LW/Sx59wKElKjijjHdNrFG/wMRobDYzMyTGCA4IwggN+AgEBMHIwZjELMAkGA1UE
BhMCREUxMzAxBgNVBAoMKkRHTiBEZXV0c2NoZXMgR2VzdW5kaGVpdHNuZXR6IFNlcnZpY2Ug
R21iSDEiMCAGA1UEAwwZZGduc2VydmljZSBDQSAyIFR5cGUgRTpQTgIIcVNPXEs+kdUwDQYJ
YIZIAWUDBAIBBQCgggHhMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkF
MQ8XDTI0MDIwMTE4MjIzOFowLwYJKoZIhvcNAQkEMSIEIB1ZHHbfdEGAm5qD0NvVcgNTUql7
aU84TPKXydwRnxf9MGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQB
AjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcw
DQYIKoZIhvcNAwICASgwgYEGCSsGAQQBgjcQBDF0MHIwZjELMAkGA1UEBhMCREUxMzAxBgNV
BAoMKkRHTiBEZXV0c2NoZXMgR2VzdW5kaGVpdHNuZXR6IFNlcnZpY2UgR21iSDEiMCAGA1UE
AwwZZGduc2VydmljZSBDQSAyIFR5cGUgRTpQTgIIcVNPXEs+kdUwgYMGCyqGSIb3DQEJEAIL
MXSgcjBmMQswCQYDVQQGEwJERTEzMDEGA1UECgwqREdOIERldXRzY2hlcyBHZXN1bmRoZWl0
c25ldHogU2VydmljZSBHbWJIMSIwIAYDVQQDDBlkZ25zZXJ2aWNlIENBIDIgVHlwZSBFOlBO
AghxU09cSz6R1TANBgkqhkiG9w0BAQEFAASCAQDKTmUVQ8RJYJnBLuL8tEMb6A5oLaI9japv
bsRVCdn0dlj6zIU6GPAt94NY/wqDsctKLa7VTk6JzTyaCOSxvsjtJPi9f39tLWgyMVsz5TwU
ZL3ZVZSHrZ55D36ai2YozZxe8XOrJBeJIhwo0iGWDVtClBK2S5MYYePqTlSVTKJzrkYhB7UL
HpwHvJcC2cJWtTiBmavgb/0MvrY/1CwyAzDGKn/Kmp094Ca/oEh8WwZhcwLzcYMOvtesh58F
h8fnk0HySI0tXeGUG2ui24MWIfvw9UcgaSPVF1nAhlBxZQ4VeQ3N0RBOXbpfTrxrEee6R7wg
sJzj5hSUIDtN6mi+sXueAAAAAAAA
--------------ms020101040302030202010506--

