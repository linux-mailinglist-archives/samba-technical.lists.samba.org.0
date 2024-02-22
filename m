Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8A885FC59
	for <lists+samba-technical@lfdr.de>; Thu, 22 Feb 2024 16:28:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=ZH2BiS1kq+1aArUWdDS19ptgvPQsOw/BvKlGTrsalAI=; b=5kCZJqBxES9KsnafbINUIHtFxf
	fr03UEmC9qw1wkrpnU1NUeAg1bp+/viN4r9uUIyMsuMDk5Ih4zwGpLCWeP5bBaU3TRGPf6Ofr7zdw
	Y8quTJ0AO1FPaktkD90TcN9W0AECfjdRgsWCSVycjAj4ITE4tB22Vt3QDaSVoR0k63YGT+0Gucyn6
	D1I9TxoilB+oFX/5Bi9jQxW+z5rNGeEN2weGk+WS9sBgizTY6EHrWYBAakGQiT2jgA4XpN7W+hKuP
	9I1RRUg/Mj0H4WvciZRMe4nzni+IeuYX/bSgyTQu89zQmxXJhjKuAJdvRAYrtkKtOCFAJueK7bZ8r
	cNGHL32A==;
Received: from ip6-localhost ([::1]:60680 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rdAzn-009Bbn-P7; Thu, 22 Feb 2024 15:28:23 +0000
Received: from plasma4.jpberlin.de ([80.241.57.33]:51445) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rdAzi-009Bbg-KB
 for samba-technical@lists.samba.org; Thu, 22 Feb 2024 15:28:20 +0000
Received: from spamfilter05.heinlein-hosting.de
 (spamfilter05.heinlein-hosting.de [80.241.56.123])
 by plasma.jpberlin.de (Postfix) with ESMTP id C20CFFFE6E;
 Thu, 22 Feb 2024 16:28:13 +0100 (CET)
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
 [80.241.56.123]) (amavisd-new, port 10030)
 with ESMTP id efYAssj7clzA; Thu, 22 Feb 2024 16:28:12 +0100 (CET)
Received: from [192.168.123.203] (p5b2400db.dip0.t-ipconnect.de [91.36.0.219])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id 63A0CFFBAE
 for <samba-technical@lists.samba.org>; Thu, 22 Feb 2024 16:28:12 +0100 (CET)
Message-ID: <cd52c1d7-b641-458c-9a43-d33f5ceb42a4@kania-online.de>
Date: Thu, 22 Feb 2024 16:28:11 +0100
MIME-Version: 1.0
Subject: Re: default value for "winbind separator"
Content-Language: de-DE, en-US
To: samba-technical@lists.samba.org
References: <c478c72b-d7ab-4d7f-bb38-94e309b1a42e@kania-online.de>
 <6857ffbf-2189-4215-4748-88a9eee434a5@samba.org>
In-Reply-To: <6857ffbf-2189-4215-4748-88a9eee434a5@samba.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms020502020005020500040607"
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

--------------ms020502020005020500040607
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Still the same in 4.20rc2


Am 07.02.24 um 20:17 schrieb David Mulder via samba-technical:
> 
> On 2/7/24 12:13 PM, Stefan Kania via samba-technical wrote:
>> Hello,
>>
>> up this point I never ever used or noticed the default setting of the 
>> "winbind separator" I only know that it was "+" in the early days of 
>> Samba. Now that I tried to get GPOs (for smb_conf) running on a DC the 
>> following was happend:
>>
>> I created the GPO, linked the gpo and then did a "samba-gpupdate 
>> --force" that changes my smb.conf in that way, that all possible 
>> options were written into my smb.conf. Including "winbind separator = \"
> I'll point out the fact that all possible options were written to the 
> smb.conf is a bug in the *s3* loadparm. The smb.conf group policy 
> extension is just calling `lp.dump(show_defaults=False, filename)`, 
> which should not dump every option.
> 



--------------ms020502020005020500040607
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
MQ8XDTI0MDIyMjE1MjgxMVowLwYJKoZIhvcNAQkEMSIEIHxW85F1kixTJ2Dff6X3yOGxwjcv
s/2MnVKrbv06gP2SMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQB
AjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcw
DQYIKoZIhvcNAwICASgwgYEGCSsGAQQBgjcQBDF0MHIwZjELMAkGA1UEBhMCREUxMzAxBgNV
BAoMKkRHTiBEZXV0c2NoZXMgR2VzdW5kaGVpdHNuZXR6IFNlcnZpY2UgR21iSDEiMCAGA1UE
AwwZZGduc2VydmljZSBDQSAyIFR5cGUgRTpQTgIIcVNPXEs+kdUwgYMGCyqGSIb3DQEJEAIL
MXSgcjBmMQswCQYDVQQGEwJERTEzMDEGA1UECgwqREdOIERldXRzY2hlcyBHZXN1bmRoZWl0
c25ldHogU2VydmljZSBHbWJIMSIwIAYDVQQDDBlkZ25zZXJ2aWNlIENBIDIgVHlwZSBFOlBO
AghxU09cSz6R1TANBgkqhkiG9w0BAQEFAASCAQCSJSrB+J4qrfFX/8nq4awqgKj+hcoaGmNy
apbbyGac0fvtzq1LAuMzJnZtSSAyVc0LudoguPsk7wfkqE4v3IUPz3GpN43sMf8FwyqGO0sj
K0Hn58nGPaiugNR4t8AR1oliXcszjUr5f95XtGJXdfpj2ZUa5+whGXjWjUaO0YB64TsnjcHP
NbAJMyFAfmM6X6WpoSe9JfE8JGsYyWMVP3/27Ffcch2GlUm49eURc3evpq5L8Jfahe2wKZMI
9oqlHvzippSPwfMRzDOWGcOGU6hfHfHZZhcje7QZtDGC8FAhc48s54GSd/Bpjuzrc990n0c5
nK8bau1jPzGupkU7qXCOAAAAAAAA
--------------ms020502020005020500040607--

