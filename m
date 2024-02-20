Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB9585C070
	for <lists+samba-technical@lfdr.de>; Tue, 20 Feb 2024 16:57:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=LhkeKCs8CkZq9TB4z2+J9I84H657Pib1Ys5MbNrRWdQ=; b=mMmv6mOlUSnHg31DavbLIeJvmY
	ZovgD7AY8MD7kOXlDTQ3j23cGOkJcklaleRwE0ZjPp+cPdgMbmYGHRVRFZV+qI9b72h1CwBTonR7/
	lZ4MSWTuqdoXtNt/qa28gXaP5F/djiifUu31/O6Eq/4fOYgTxMOvoGMoSTqj3tsZnqTPfOfksde8N
	+ueDv7jnaGlOSj4UCyOK0T2UNAtCpecaJSNfhwuIv9NOz/PfcjeNEPrk8DRgFDhIKM8jFulkFHR3Q
	Jir19ke1OCrqO8j0/uvieZMHWYBtQsSpJOZMvCd5eh4P7zCtSY+IEo4Rk5hYMX02zg+vlyuet7Bgy
	thqTdRHw==;
Received: from ip6-localhost ([::1]:48272 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rcSUn-00909P-0D; Tue, 20 Feb 2024 15:57:25 +0000
Received: from plasma4.jpberlin.de ([80.241.57.33]:54525) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rcSUi-00909I-29
 for samba-technical@lists.samba.org; Tue, 20 Feb 2024 15:57:22 +0000
Received: from spamfilter02.heinlein-hosting.de
 (spamfilter02.heinlein-hosting.de [80.241.56.116])
 by plasma.jpberlin.de (Postfix) with ESMTP id 979FAFEC6A;
 Tue, 20 Feb 2024 16:57:13 +0100 (CET)
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de
 [80.241.56.116]) (amavisd-new, port 10030)
 with ESMTP id ldbXU7YjYFOs; Tue, 20 Feb 2024 16:57:09 +0100 (CET)
Received: from [192.168.123.203] (p5b2400db.dip0.t-ipconnect.de [91.36.0.219])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id F4203FEB2F
 for <samba-technical@lists.samba.org>; Tue, 20 Feb 2024 16:57:08 +0100 (CET)
Message-ID: <dd0574da-8fd6-4218-9876-b07be2f97fd4@kania-online.de>
Date: Tue, 20 Feb 2024 16:57:08 +0100
MIME-Version: 1.0
Subject: Re: setting up authentication policies in 4.20rc2
Content-Language: de-DE, en-US
To: samba-technical@lists.samba.org
References: <e8210ddc-4506-4255-bcbe-f24ff86b2f0a@kania-online.de>
 <d7e23578-1526-4835-9438-306da6a95ac1@samba.org>
 <f16c0d4d-0040-4179-ad24-e40a98d5f0ac@kania-online.de>
 <41970043-2f0a-44a5-b1eb-249f3ed7a219@samba.org>
In-Reply-To: <41970043-2f0a-44a5-b1eb-249f3ed7a219@samba.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms030506000405040606090407"
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

--------------ms030506000405040606090407
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Am 20.02.24 um 00:53 schrieb Jo Sutton via samba-technical:
> On 20/02/24 5:28 am, Stefan Kania via samba-technical wrote:
>>
>>
>> Am 19.02.24 um 02:48 schrieb Jo Sutton via samba-technical:
>>> On 18/02/24 6:11 am, Stefan Kania via samba-technical wrote:
>>>> Hi to all,
>>>>
>>>> I just tried to setup authentication policies and authentication 
>>>> silos in 4.20rc2.
>>>> Following these steps:
>>>> 1. create a policy
>>>> samba-tool domain auth policy create --enforce --name winclient-pol
>>>>
>>>> 2. create a silo
>>>> samba-tool domain auth silo create --enforce --name=winclient-silo
>>>>
>>>> 3. adding a at least one user and one host to the silo
>>>> samba-tool domain auth silo member grant --name=winclient-silo 
>>>> --member=winclient\$
>>>> samba-tool domain auth silo member grant --name=winclient-silo 
>>>> --member=padmin
>>>>
>>>> BTW: In 4.19 it was "silo member add"
>>>>
>>>> 4. Set single policy for all principals in this silo. with 4.19 that 
>>>> was possible and that's by the way also possible with a windows DC. 
>>>> That's on a windows DC called "Use a single policy for all 
>>>> principals that belog to this authentication silo"
>>>>
>>>> In 4.20 the option --policy is missing, you have only the option to 
>>>> add:
>>>> --user-authentication-policy=
>>>> --service-authentication-policy=
>>>> --computer-authentication-policy=
>>>> So it would be nice if the option --policy will be back
>>>>
>>>
>>> We removed this option in commit 
>>> c22400fd8ef961e472ce2803cf4a2ec58b778795. I don’t remember our exact 
>>> reasoning, but we must have thought that it didn’t make much sense 
>>> for a user and a computer to share the same authentication policy.
>>
>>
>> In this picture us see the screenshot from (soory it's a german DC) 
>> that you cann select either all policies or select one.
>>
>> https://ibb.co/kGB3XhR
>>
>> I think, with Samba we should have the same possibility.
>>
>>>
>>>> The next step after creating the silo and the policy and adding the 
>>>> clients and users to the silo would be adding:
>>>>   --service-allowed-to-authenticate-from=SDDL
>>>> and/or
>>>> -service-allowed-to-authenticate-to=SDDL
>>>>
>>>> But were can I get the SDDL for the user and the client?
>>>>
>>>
>>> Can you explain what you’d like to accomplish in this scenario? If 
>>> you want to make sure the user ‘padmin’ authenticates from the 
>>> computer ‘winclient$’, you can use 
>>> ‘--user-allowed-to-authenticate-from-device-silo=winclient-silo’, and 
>>> make sure the user and the computer both belong to the silo. Or if 
>>> you want to let only users in the silo authenticate to the computer 
>>> ‘winclient$’, you can use 
>>> ‘--computer-allowed-to-authenticate-to-by-silo=winclient-silo’.
>>>
>>
>>
>>
>> I wan't to disallow the user padmin to login at the computer with the 
>> name winclient. So all users who are member of the silo winclient-silo 
>> should not be able to login to the computer winclient.
>> So for example I create a policy login-to-DCs, than add the group 
>> "domain users" to the silo and the DCs. In a windows-Domain now I can 
>> configure to allow all userers are equal to a list of users or not equal.
>> As you can see in the next picture, I can choose either if the user is 
>> equal to the list to allow the access, or the user is not equal to the 
>> list to allowed to access.
>>
>> https://ibb.co/SxgRzZW
>>
>> I'm missing the part of selecting "member of the list" or "not member 
>> of the list"
>>
>>
>>
>>
>>
>> Stefan
> 
> First, I think you’ll want to do:
> 
> samba-tool user auth silo assign winclient\$ --silo=winclient-silo
> samba-tool user auth silo assign padmin --silo=winclient-silo
> 
> to assign the silo to the user and the client.
> 
> I don’t think you want ‘--service-allowed-to…’. Those options apply to 
> Managed Service Accounts, which you don’t appear to be dealing with.
> 
> I think this might be the command you want? —
> 
> samba-tool domain auth policy modify --name=winclient-pol 
> --user-allowed-to-authenticate-from='O:SYG:SYD:(XA;OICI;CR;;;WD;(Not_Member_of SID(S-1-2-3)))'
> 
> where winclient’s SID is substituted for ‘S-1-2-3’.
> 
> That should prevent any users in the silo from authenticating, unless 
> they use FAST from a computer other than ‘winclient’.
> 
> Is that what you’re looking for?
> 
> Cheers,
> Jo (she/her)
> 
> 
looks good on the first view but:

I started from the beginning:
samba-tool domain auth policy create --enforce --name winclient-pol
samba-tool domain auth silo create --enforce --name=winclient-silo
samba-tool user auth silo assign winclient\$ --silo=winclient-silo
samba-tool user auth silo assign winclient11\$ --silo=winclient-silo
samba-tool domain auth silo member grant --name=winclient-silo 
--member=winclient\$
samba-tool domain auth silo member grant --name=winclient-silo 
--member=padmin
samba-tool domain auth policy modify --name=winclient-pol 
--user-allowed-to-authenticate-from='O:SYG:SYD:(XA;OICI;CR;;;WD;(Not_Member_of 
SID(S-1-5-21-2545884418-1286714830-2149023192-512)))'

But still the same, it dosn't matter if the user is member of the group 
'domain admins' or not, he can login.
listing the policy is showing:
--------------
root@addc420:~# samba-tool domain auth policy view --name winclient-pol
{
   "cn": "winclient-pol",
   "distinguishedName": "CN=winclient-pol,CN=AuthN Policies,CN=AuthN 
Policy Configuration,CN=Services,CN=Configuration,DC=example,DC=net",
   "dn": "CN=winclient-pol,CN=AuthN Policies,CN=AuthN Policy 
Configuration,CN=Services,CN=Configuration,DC=example,DC=net",
   "instanceType": 4,
   "msDS-AuthNPolicyEnforced": true,
   "msDS-StrongNTLMPolicy": 0,
   "msDS-UserAllowedToAuthenticateFrom": 
"O:SYG:SYD:(XA;OICI;CR;;;WD;(Not_Member_of 
SID(S-1-5-21-2545884418-1286714830-2149023192-512)))",
   "name": "winclient-pol",
   "objectCategory": 
"CN=ms-DS-AuthN-Policy,CN=Schema,CN=Configuration,DC=example,DC=net",
   "objectClass": [
     "top",
     "msDS-AuthNPolicy"
   ],
   "objectGUID": "fab89c1a-fa93-4014-ba0e-172e26f08d80"
--------------
And the silo:

--------------
root@addc420:~# samba-tool domain auth silo view --name winclient-silo
{
   "cn": "winclient-silo",
   "distinguishedName": "CN=winclient-silo,CN=AuthN Silos,CN=AuthN 
Policy Configuration,CN=Services,CN=Configuration,DC=example,DC=net",
   "dn": "CN=winclient-silo,CN=AuthN Silos,CN=AuthN Policy 
Configuration,CN=Services,CN=Configuration,DC=example,DC=net",
   "instanceType": 4,
   "msDS-AuthNPolicySiloEnforced": true,
   "msDS-AuthNPolicySiloMembers": [
     "CN=WINCLIENT,OU=stka,DC=example,DC=net",
     "CN=p admin,OU=stka,DC=example,DC=net"
   ],
   "msDS-ComputerAuthNPolicy": "CN=winclient-pol,CN=AuthN 
Policies,CN=AuthN Policy 
Configuration,CN=Services,CN=Configuration,DC=example,DC=net",
   "msDS-UserAuthNPolicy": "CN=winclient-pol,CN=AuthN Policies,CN=AuthN 
Policy Configuration,CN=Services,CN=Configuration,DC=example,DC=net",
   "name": "winclient-silo",
   "objectCategory": 
"CN=ms-DS-AuthN-Policy-Silo,CN=Schema,CN=Configuration,DC=example,DC=net",
   "objectClass": [
     "top",
     "msDS-AuthNPolicySilo"
   ],
   "objectGUID": "8e272b33-fa8a-4e76-8972-990a16624d87"

--------------

Looking with ldbsearch at the two objects "winclient and "padmin" is 
showing:
----------------
ldbsearch --url=/var/lib/samba/private/sam.ldb "cn=p admin"
...
msDS-AssignedAuthNPolicySilo: CN=winclient-silo,CN=AuthN Silos,CN=AuthN 
Policy
   Configuration,CN=Services,CN=Configuration,DC=example,DC=net
whenChanged: 20240220152158.0Z
uSNChanged: 4406
msDS-AuthNPolicySiloMembersBL: CN=winclient-silo,CN=AuthN Silos,CN=AuthN 
Polic
  y Configuration,CN=Services,CN=Configuration,DC=example,DC=net
...


----------------
ldbsearch --url=/var/lib/samba/private/sam.ldb "cn=winclient"
...
msDS-AssignedAuthNPolicySilo: CN=winclient-silo,CN=AuthN Silos,CN=AuthN 
Policy
   Configuration,CN=Services,CN=Configuration,DC=example,DC=net
whenChanged: 20240220152138.0Z
uSNChanged: 4405
msDS-AuthNPolicySiloMembersBL: CN=winclient-silo,CN=AuthN Silos,CN=AuthN 
Polic
  y Configuration,CN=Services,CN=Configuration,DC=example,DC=net
distinguishedName: CN=WINCLIENT,OU=stka,DC=example,DC=net
...

So no change :-(

I again tried to set up the same with Windows and it works. The only 
diffrence (using the same names) is that the condition is different to 
the one samba is showing
condition in Windows
------------
msDS-UserAllowedToAuthenticateFrom: 
O:SYG:SYD:(XA;OICI;CR;;;WD;(@USER.example://ext/AuthenticationSilo != 
"winclient-silo"))
------------


Stefan

--------------ms030506000405040606090407
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
MQ8XDTI0MDIyMDE1NTcwOFowLwYJKoZIhvcNAQkEMSIEICEelm6MnB3Dre4D0Y0Oxa9yL2lq
OAqJgjsFFecWwD65MGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQB
AjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcw
DQYIKoZIhvcNAwICASgwgYEGCSsGAQQBgjcQBDF0MHIwZjELMAkGA1UEBhMCREUxMzAxBgNV
BAoMKkRHTiBEZXV0c2NoZXMgR2VzdW5kaGVpdHNuZXR6IFNlcnZpY2UgR21iSDEiMCAGA1UE
AwwZZGduc2VydmljZSBDQSAyIFR5cGUgRTpQTgIIcVNPXEs+kdUwgYMGCyqGSIb3DQEJEAIL
MXSgcjBmMQswCQYDVQQGEwJERTEzMDEGA1UECgwqREdOIERldXRzY2hlcyBHZXN1bmRoZWl0
c25ldHogU2VydmljZSBHbWJIMSIwIAYDVQQDDBlkZ25zZXJ2aWNlIENBIDIgVHlwZSBFOlBO
AghxU09cSz6R1TANBgkqhkiG9w0BAQEFAASCAQBNNQYuimvpIkES5JXw6+y7BtO6r6kZpnkQ
Zqx4g54oJzTyzaq//Gbgohj2I2j8a8ulOkaR00uema8hutdKZbQ351yivlhpYbAKACl7q9st
syb3qlQeTLOlWSy4IjsEUzebAAHs7PvhoyilCDtcd3pz5jrL9ApGxVk9ZxPz2B/xQWVOjQqU
Gv0HDOB8rWPJHSg6dBXSrVNMpRXP2psPRNIR4P3ZyTCgatbkpb1EfRex0E7jKS8wG4SUErrv
peKGrMCu8O/4UQJ1MVM1wC/Kbfa/cC4a/xw1qPvJxXjUCrMOxhy0lrTqDTB6wNoRa7ib3m7h
+7m3XrGr64Ut7x9KIERiAAAAAAAA
--------------ms030506000405040606090407--

