Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB95B14F7
	for <lists+samba-technical@lfdr.de>; Thu, 12 Sep 2019 21:56:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=+2auTFoqkzIfOdpnzhlL31EW37aCerVoUzc7XLc2h4w=; b=PiBPtEnDAu95lQq2lkjoouUJMr
	eUvVsZLZl0LKyFybzuKngjngJ35EbeZIQ2gczJdRrFX/XgIayDlJ5Mt7QSkY/5DsnHigmtytH89xo
	fEz57j+74zFWSRUwtrp1NmsGB7fHgZidcF8+wFt4Bbna2Km2XNMcFEiLQDLwr87IbKwSBziCnRVmw
	/wu44DWESvrZWYmozTVCdQfGDMujNeCML7vVeGlFqUtJidsbfcuUJiye7mS4h46hztdMqicCTYY8q
	QfBl3/OmNDgWhHJsRDp3nKW9s1QEF7Z/I1RttCD7zFh8j2oBtPb2RFrEaMPsX+JRoEKtvIPWtKVcQ
	QwB14zGw==;
Received: from localhost ([::1]:26078 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i8VBb-0054Xk-LE; Thu, 12 Sep 2019 19:55:23 +0000
Received: from dervish.wsisiz.edu.pl ([2001:1a68:a::54]:12590) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i8VBQ-0054Xc-Tn
 for samba-technical@lists.samba.org; Thu, 12 Sep 2019 19:55:15 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by dervish.wsisiz.edu.pl (Postfix) with ESMTP id 3C1E6C54143;
 Thu, 12 Sep 2019 21:38:15 +0200 (CEST)
Authentication-Results: dervish.wsisiz.edu.pl (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=wit.edu.pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wit.edu.pl; h=
 content-type:content-type:mime-version:user-agent:date:date
 :message-id:organization:subject:subject:from:from:received
 :received; s=amavisd; t=1568317094; bh=+2auTFoqkzIfOdpnzhlL31EW3
 7aCerVoUzc7XLc2h4w=; b=U9zm0QEMKKG9qeo8peT+6FQemvAfavTjsBlFvnTlD
 0rZOFo5nT3L6jrvFrGtq4S7Klx2WlUTVbpEeV31keOWW5l0qA5ECzndfHl37DXef
 K3k+R7L5pvb+QBe626tY/pmL0XBtmRSZhmZS7qwihXdX82xLIm6aw0DtPgFe7JR3
 po=
Received: from dervish.wsisiz.edu.pl ([127.0.0.1])
 by localhost (dervish.wsisiz.edu.pl [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id AHVe11LmQvwG; Thu, 12 Sep 2019 21:38:14 +0200 (CEST)
Received: from [10.1.0.101] (wiktorow-vpn.wsisiz.edu.pl [213.135.49.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by dervish.wsisiz.edu.pl (Postfix) with ESMTPSA id 22DEDC54140;
 Thu, 12 Sep 2019 21:38:14 +0200 (CEST)
Subject: Migrating Samba NT4 Domain to Samba AD
To: samba-technical <samba-technical@lists.samba.org>
Organization: =?UTF-8?Q?Wy=c5=bcsza_Szko=c5=82a_Informatyki_Stosowanej_i_Zar?=
 =?UTF-8?B?esSFZHphbmlh?=
Message-ID: <e064bd2a-a1cf-3190-27ed-3cbfff82fa52@wit.edu.pl>
Date: Thu, 12 Sep 2019 21:37:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms040807070809090301070909"
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
From: =?utf-8?q?Bart=C5=82omiej_Solarz-Nies=C5=82uchowski_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Bart=c5=82omiej_Solarz-Nies=c5=82uchowski?=
 <Bartlomiej.Solarz-Niesluchowski@wit.edu.pl>
Cc: =?UTF-8?B?xYF1a2FzeiBUcsSFYmnFhHNraQ==?= <lukasz@wsisiz.edu.pl>,
 Marzena Osuch <marz@wsisiz.edu.pl>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a cryptographically signed message in MIME format.

--------------ms040807070809090301070909
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: pl

Dear List,

I need to migrate my Samba NT4 domain (5000+ users, 600+ workstation,=20
50+ printers) urgently.


Backend for samba is on an replicated openldap environment is mixed=20
(both linux and windows) i use password aging on windows AND linux and=20
use ldap with samba.schema and posix.schema.

Please help me to find manuals for those migration.

I found:

https://wiki.samba.org/index.php/Migrating_a_Samba_NT4_Domain_to_Samba_AD=
_(Classic_Upgrade)

and

https://wiki.samba.org/index.php/Samba4/LDAP_Backend


Problems which i have not found good links:

how to replicate ldap (one ldap server for network in my size is not=20
enought)?

how to use both samba.schema (windows user data) and posix.schema (unix=20
user data) + password aging in both environments?

how configure and use bind9 as dns backend for samba AD?

how backup (daily) contents of the samba data (e.g. slapcat)?


Migration will be try to done at this sunday so i am in hurry......


Please help me with those migration if you have links for good howtos.


Best Regards



--=20
Bart=C5=82omiej Solarz-Nies=C5=82uchowski, Administrator WSISiZ
e-mail:Bartlomiej.Solarz-Niesluchowski@wit.edu.pl
tel. 223486547, fax 223486501
JID:solarz@jabber.wit.edu.pl
01-447 Warszawa, ul. Newelska 6, pok=C3=B3j 421, pon.-pt. 8-16
Motto - Jak sobie po=C5=9Bcielisz tak sie wy=C5=9Bpisz



--------------ms040807070809090301070909
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: Kryptograficzna sygnatura S/MIME

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
EBwwggUAMIID6KADAgECAhADS+4XH7fhBjcv1HJCQL0qMA0GCSqGSIb3DQEBCwUAMGUxCzAJ
BgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2Vy
dC5jb20xJDAiBgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBDQTAeFw0xNDExMTgx
MjAwMDBaFw0yNDExMTgxMjAwMDBaMGkxCzAJBgNVBAYTAk5MMRYwFAYDVQQIEw1Ob29yZC1I
b2xsYW5kMRIwEAYDVQQHEwlBbXN0ZXJkYW0xDzANBgNVBAoTBlRFUkVOQTEdMBsGA1UEAxMU
VEVSRU5BIFBlcnNvbmFsIENBIDMwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDG
pbsfVYL0pTRyFHJlm1/V6qBo2JuCiU9TYpx7jM4O2tQyDq8bjMum69vg6wM0lMGHflMgqB75
GxeKfQFmEldoXi2cLishqFUvU2cJeM3SaRsLk2BsuCgTzh9NsYgmrUX60KHOq7eYKVZxbPFW
JF2nMOBuMXNu2qBXTGSLeLXHnNvG3r7TLzGg1oA5teAxQE6Eo8ySSeIXbP7wZB76urwlh51P
IbrJZjkDjdQVELh7OlTP1WO6T/Hf6BsEfeFcpoa1e+MW/lw0VetTPPHQ15HYKYP2WYohHxzD
iC+QUwE7UZVBlp9cXIpwHuDzSibc5RG3z0n/j2SQCx0Dk5FMAUErAgMBAAGjggGmMIIBojAS
BgNVHRMBAf8ECDAGAQH/AgEAMA4GA1UdDwEB/wQEAwIBhjB5BggrBgEFBQcBAQRtMGswJAYI
KwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBDBggrBgEFBQcwAoY3aHR0cDov
L2NhY2VydHMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJlZElEUm9vdENBLmNydDCBgQYD
VR0fBHoweDA6oDigNoY0aHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJl
ZElEUm9vdENBLmNybDA6oDigNoY0aHR0cDovL2NybDQuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0
QXNzdXJlZElEUm9vdENBLmNybDA9BgNVHSAENjA0MDIGBFUdIAAwKjAoBggrBgEFBQcCARYc
aHR0cHM6Ly93d3cuZGlnaWNlcnQuY29tL0NQUzAdBgNVHQ4EFgQU8CHpSXdzn4WuGDvoUnAU
Bu1C7sowHwYDVR0jBBgwFoAUReuir/SSy4IxLVGLp6chnfNtyA8wDQYJKoZIhvcNAQELBQAD
ggEBADrCGyv+Y967YbS5R6j8fAWxJiAiUZvIPfn1xVgesF6jspwCQY8xGn/MG04d+Jh97I8I
/Xfx29JEEFq2rQmw4PxiO9RiDZ7xoDxNd4rrRDR7jrtOKQP8J+o+ah0vSOP62hnD/zPS7NRM
tIyVS2G277KAL5fIR62ngr984fmJghDv0bsjGAmeu3EP0xhUsDJT61IoAGoKBnxBPAeg3WXs
dSm4Gn7btyvakeyFtYebr2KmOBSa28PRqGSDur56aZhJoM2eMzc6prmvGwwtAzRsc5t2OsKR
uHWV6O3anP2K27jGZR2bi1VX1NQUvIbpVNTuwjm+XcZtsa/AAJF9KGkEseAwggWDMIIEa6AD
AgECAhAEyvafARQvv19kIoJFofltMA0GCSqGSIb3DQEBCwUAMGkxCzAJBgNVBAYTAk5MMRYw
FAYDVQQIEw1Ob29yZC1Ib2xsYW5kMRIwEAYDVQQHEwlBbXN0ZXJkYW0xDzANBgNVBAoTBlRF
UkVOQTEdMBsGA1UEAxMUVEVSRU5BIFBlcnNvbmFsIENBIDMwHhcNMTcxMDEzMDAwMDAwWhcN
MjAxMDEzMTIwMDAwWjCBrjELMAkGA1UEBhMCUEwxETAPBgNVBAcTCFdhcnN6YXdhMT4wPAYD
VQQKDDVXecW8c3phIFN6a2/FgmEgSW5mb3JtYXR5a2kgU3Rvc293YW5laiBpIFphcnrEhWR6
YW5pYTEgMB4GA1UECxMXTGFib3JhdG9yaWEgS29tcHV0ZXJvd2UxKjAoBgNVBAMMIUJhcnTF
gm9taWVqIFNvbGFyei1OaWVzxYJ1Y2hvd3NraTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
AQoCggEBALiWW7BfYSXlZo2FSb85ds05Vt0rsHPT/qfwByJR5MjSsI2TwGVjEPvcMuZRz4v6
HwWaJmyiLuCws2wp1E7Y0ADWi72OWqzOdkH59/LHOZQfTJQjgjZqfJ0FDkPoTWVWhIrZWjXa
LFAkAByHGtt2E9QRnmD0Ea1ZJsu3ZxHB1uAesc6IIarWFVtc63CR1rgR3oNqkH1KUkQyjIg8
fhid6SLKZHzDLWrm5tqmdNfemcAKNn/XTNkKmcvthdE6dD7EW1THqUSEQYr5QUvy9HEFGGw1
/oWHrF4r83saMIpbhUj6JB3FdrJ8wcw/CvFl8Qpy6Iog22+rzfSEaaAtsv52q0cCAwEAAaOC
Ad8wggHbMB8GA1UdIwQYMBaAFPAh6Ul3c5+Frhg76FJwFAbtQu7KMB0GA1UdDgQWBBTJxOzH
ncHCZtbk0x9EaoP2+RQLqzAMBgNVHRMBAf8EAjAAMDUGA1UdEQQuMCyBKmJhcnRsb21pZWou
c29sYXJ6LW5pZXNsdWNob3dza2lAd2l0LmVkdS5wbDAOBgNVHQ8BAf8EBAMCBSAwEwYDVR0l
BAwwCgYIKwYBBQUHAwQwQwYDVR0gBDwwOjA4BgpghkgBhv1sBAECMCowKAYIKwYBBQUHAgEW
HGh0dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9DUFMwdQYDVR0fBG4wbDA0oDKgMIYuaHR0cDov
L2NybDMuZGlnaWNlcnQuY29tL1RFUkVOQVBlcnNvbmFsQ0EzLmNybDA0oDKgMIYuaHR0cDov
L2NybDQuZGlnaWNlcnQuY29tL1RFUkVOQVBlcnNvbmFsQ0EzLmNybDBzBggrBgEFBQcBAQRn
MGUwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTA9BggrBgEFBQcwAoYx
aHR0cDovL2NhY2VydHMuZGlnaWNlcnQuY29tL1RFUkVOQVBlcnNvbmFsQ0EzLmNydDANBgkq
hkiG9w0BAQsFAAOCAQEAN4p6A1T3R4LntRN5HQB5Aeku8en4AeZp3fDdih+bXk8EgXkBSEU+
xdmi14lOtSZfe9pc6h/ziL90jVWtAB2mLDb2Ic1axTa506tVU+we0QQzvItaiOSqmbGuqmga
PcXMK/1zcaoL2GGjdJfVkqYqA+vandWLG0/Bt4EZADGlAmmVINESR+FKnVbo0QOG0+SDVUDv
JdK5mvHJPKs+M/skF4GeYRDdnq9HlzUt5X3mHKu7afevGCrK0x28M1Btn815t4XIIloGTONM
Q7SRf4fjaz5bvjaQCUvY4QtLiruPMusQ3ZlmmO/VVw+Ef3BHGiJ8EqUe3EOgboa3meSn8eR8
JTCCBY0wggR1oAMCAQICEAq3FIM45EimhrwxMMQ3av8wDQYJKoZIhvcNAQELBQAwaTELMAkG
A1UEBhMCTkwxFjAUBgNVBAgTDU5vb3JkLUhvbGxhbmQxEjAQBgNVBAcTCUFtc3RlcmRhbTEP
MA0GA1UEChMGVEVSRU5BMR0wGwYDVQQDExRURVJFTkEgUGVyc29uYWwgQ0EgMzAeFw0xNzEw
MTMwMDAwMDBaFw0yMDEwMTMxMjAwMDBaMIGuMQswCQYDVQQGEwJQTDERMA8GA1UEBxMIV2Fy
c3phd2ExPjA8BgNVBAoMNVd5xbxzemEgU3prb8WCYSBJbmZvcm1hdHlraSBTdG9zb3dhbmVq
IGkgWmFyesSFZHphbmlhMSAwHgYDVQQLExdMYWJvcmF0b3JpYSBLb21wdXRlcm93ZTEqMCgG
A1UEAwwhQmFydMWCb21pZWogU29sYXJ6LU5pZXPFgnVjaG93c2tpMIIBIjANBgkqhkiG9w0B
AQEFAAOCAQ8AMIIBCgKCAQEAr/JMZuZW4UCUz0W+fi2yhJe5kwVSkUqqFA8VUSBpv7ysvIQn
wspIHPP5y6t4B5zkX5//vYHVbRDaPmKXpq3b1OHt0nuICdLL41oQnQzFSptLSFsTbnwNdXL7
pEveysfaQk57rqyyZ8NjK3F4+SIjCDL7d1SFIT60w45P0PknkNbjS1CXIPnkPF6l7Nyxa1Du
aufM6cRdU7b03ZJEU4X9cfPgNZYt5trG9qvPNjlABFy+hPgcvVxMqthIMteyIYrP5lwq/HxI
4ETjNAEHWDI5AkUb2VoOki2MCJlCd6sKBloYjMMrwA/F34eC+MLldNA7joVy2XuQTqgW+DT1
ScP7BQIDAQABo4IB6TCCAeUwHwYDVR0jBBgwFoAU8CHpSXdzn4WuGDvoUnAUBu1C7sowHQYD
VR0OBBYEFFSzvjkDqiij9LbL6CcTJGgaZGakMAwGA1UdEwEB/wQCMAAwNQYDVR0RBC4wLIEq
QmFydGxvbWllai5Tb2xhcnotTmllc2x1Y2hvd3NraUB3aXQuZWR1LnBsMA4GA1UdDwEB/wQE
AwIGwDAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwQwYDVR0gBDwwOjA4BgpghkgB
hv1sBAECMCowKAYIKwYBBQUHAgEWHGh0dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9DUFMwdQYD
VR0fBG4wbDA0oDKgMIYuaHR0cDovL2NybDMuZGlnaWNlcnQuY29tL1RFUkVOQVBlcnNvbmFs
Q0EzLmNybDA0oDKgMIYuaHR0cDovL2NybDQuZGlnaWNlcnQuY29tL1RFUkVOQVBlcnNvbmFs
Q0EzLmNybDBzBggrBgEFBQcBAQRnMGUwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2lj
ZXJ0LmNvbTA9BggrBgEFBQcwAoYxaHR0cDovL2NhY2VydHMuZGlnaWNlcnQuY29tL1RFUkVO
QVBlcnNvbmFsQ0EzLmNydDANBgkqhkiG9w0BAQsFAAOCAQEAiF1VhnYC6eeR1f0LU2dnspiV
iY/CJzT2/uXV7pFszd1ohr7z7qHjQLHy9Iodei56RFw+Ewx23doEYZLeJ4+ajQjhv10VudNb
/plHSuqetDXa1N4ycEuUYzXwb470dAvIp9PiVdY7L6/ywccU+JN3rgIwm8MUDH3JWAGCtbCb
Ejqi5xiUR2ilmh1bIKiT3nDqgXBTO0xZC9aU86scP85RdC05vuhsvAMrgd3hRXuuCjG3+UaS
6b7dWpuKymRAPotcNo/T106FisnmMubPzyOKikblMrVtSoO+FFlv2te9FI6jneQeVrQTBpbA
9XFQHIo17vdMTP2CCHVyCSK8YUdDXzGCA6MwggOfAgEBMH0waTELMAkGA1UEBhMCTkwxFjAU
BgNVBAgTDU5vb3JkLUhvbGxhbmQxEjAQBgNVBAcTCUFtc3RlcmRhbTEPMA0GA1UEChMGVEVS
RU5BMR0wGwYDVQQDExRURVJFTkEgUGVyc29uYWwgQ0EgMwIQCrcUgzjkSKaGvDEwxDdq/zAN
BglghkgBZQMEAgEFAKCCAfcwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMTkwOTEyMTkzODE0WjAvBgkqhkiG9w0BCQQxIgQgWTJafsnvLjUuHiOi8AVCZPrm
SzQJkC65K5lircFtvD8wbAYJKoZIhvcNAQkPMV8wXTALBglghkgBZQMEASowCwYJYIZIAWUD
BAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMC
BzANBggqhkiG9w0DAgIBKDCBjAYJKwYBBAGCNxAEMX8wfTBpMQswCQYDVQQGEwJOTDEWMBQG
A1UECBMNTm9vcmQtSG9sbGFuZDESMBAGA1UEBxMJQW1zdGVyZGFtMQ8wDQYDVQQKEwZURVJF
TkExHTAbBgNVBAMTFFRFUkVOQSBQZXJzb25hbCBDQSAzAhAEyvafARQvv19kIoJFofltMIGO
BgsqhkiG9w0BCRACCzF/oH0waTELMAkGA1UEBhMCTkwxFjAUBgNVBAgTDU5vb3JkLUhvbGxh
bmQxEjAQBgNVBAcTCUFtc3RlcmRhbTEPMA0GA1UEChMGVEVSRU5BMR0wGwYDVQQDExRURVJF
TkEgUGVyc29uYWwgQ0EgMwIQBMr2nwEUL79fZCKCRaH5bTANBgkqhkiG9w0BAQEFAASCAQCr
cjrA8P1cFWJwP+By4HMrpaJASawdRuQG2X6lQCaYZsnaam0fLmpJtPOR9d3C3fyOH9tnndv1
MtKiwEII1CikhFyl/wXzyeYNCp2kNiipl3sk8gB3a84XebtHC1HW1oeG2/DIR62tk+WAYTcK
fhXP6E3VR46H8pnFQSocjAP8JSLukDzgmijMzudVlc6YUBMyF2rw+meQqEurD/oy/jvveNip
z9MPL5f9qHNabn89oMiy5f39WkjdhG8YUNOKU6hfH5N1jHmmNPisz01GkftDNgtk2veOwsgE
sosTnzPFI6GyFi2bOY6K2EOuCfyW+Q/Md+O2Drc+54gx2P0R6VWrAAAAAAAA
--------------ms040807070809090301070909--

