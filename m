Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5A4AC33C7
	for <lists+samba-technical@lfdr.de>; Sun, 25 May 2025 12:13:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=5a7ZSl/TJhu1pxGgraOtcAHPk9ih6BfOUtKxNksp3U4=; b=0LRBiiRX4aIUV+L2Xdv+Zsx1aJ
	01M00w4wLcrEHJ+MXMzPbFJopDIj/Ch1jO9r+GjwmNfLY8bzQtpqSKIOM9ix/IIyygS+aSeqQVf7u
	ajvvTZ2YurT3HuheLVJJhj+38IRzBKseyyeB11TzVKeo1PDTbRe0HjI37DCcAjK6U74+bwZx9GrrZ
	v7ZCUd6YnDr3+NIma03IixrmKN4dA/iqVGS/w6iRJ8VgGCUO8lTp/odcPjCpQ6Ut9HyiHAD8R4ySR
	/JvBUmZpY+uMfTIpIeHOkDQjht6mA1ZcYo6PT7eVmxOqeIFa6jaOdsgA21tIOmyY+rahuim+xoNme
	lD5BwYNw==;
Received: from ip6-localhost ([::1]:29062 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uJ8Lz-004BZi-Ei; Sun, 25 May 2025 10:13:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52164) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uJ8Lu-004BZb-Ta
 for samba-technical@lists.samba.org; Sun, 25 May 2025 10:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=5a7ZSl/TJhu1pxGgraOtcAHPk9ih6BfOUtKxNksp3U4=; b=0V9x6duRA0P9Sl1dLu94CqO6Ot
 rStmd6lB7sOasrNOg0G4kAf51vLqB50Y3FW9mk7PzvmEC8aS+CmOZ8drtSs5RlOsfJFsVLgNucnRC
 35j/ekwqICsxiuGOjUxL1rX24z4g25TRAeSiYRGTKFrLFwk2xNcpDS33ZGmqiBwplMSUuRBFAs2Fa
 PsYzGJBp1zsoVLo2s2KRiaFXWbxAXSd56+jD8dOI1VrKiO6+s9qe4hCv+h1D96hdnogRqpN/rkw4p
 W329ho6mZGK9RslnVMkus8a4uLJ+Ftl8YptTVCbjDi/gs6Q/8xZTsdbQpThlX+Yjohqg6uSaKzvAl
 LICLKks1bJoIzVkGtolj33UEoFZ+RY1AIV+cDErYRe+qUTIuYILY27Uw83kmcl1orLI1eOb9QXqck
 DRy/1r8QuYAMY6FGFK9eKaJvoAEbNdwZmQ0pJfm3I1RINMO74ECbyfiA9swZQYcPWBQk/yP8kyvNf
 Wasz6BQCPLWYMe5akwbfVgu7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uJ8Lt-007AvA-2B; Sun, 25 May 2025 10:13:09 +0000
Message-ID: <debafa1b-90f2-4dec-a4ab-09adcd461583@samba.org>
Date: Sun, 25 May 2025 12:13:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ksmbd and special characters in file names
To: Steve French <smfrench@gmail.com>, Philipp Kerling <pkerling@casix.org>
References: <d0df2b2556fac975c764c0c7c914c6e3c42f16a1.camel@rx2.rx-server.de>
 <CAH2r5mubXak1pe9N96wph5HtggFMAMpYm+5KtqYOz7e1cNGWhg@mail.gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <CAH2r5mubXak1pe9N96wph5HtggFMAMpYm+5KtqYOz7e1cNGWhg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Gw4TmQqOL1O33JSSr7rK9K0x"
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: linux-cifs@vger.kernel.org,
 samba-technical <samba-technical@lists.samba.org>,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Gw4TmQqOL1O33JSSr7rK9K0x
Content-Type: multipart/mixed; boundary="------------40pBXXaygslm2JpWTjgDYlEP";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Steve French <smfrench@gmail.com>, Philipp Kerling <pkerling@casix.org>
Cc: linux-cifs@vger.kernel.org,
 samba-technical <samba-technical@lists.samba.org>,
 Namjae Jeon <linkinjeon@kernel.org>
Message-ID: <debafa1b-90f2-4dec-a4ab-09adcd461583@samba.org>
Subject: Re: ksmbd and special characters in file names
References: <d0df2b2556fac975c764c0c7c914c6e3c42f16a1.camel@rx2.rx-server.de>
 <CAH2r5mubXak1pe9N96wph5HtggFMAMpYm+5KtqYOz7e1cNGWhg@mail.gmail.com>
In-Reply-To: <CAH2r5mubXak1pe9N96wph5HtggFMAMpYm+5KtqYOz7e1cNGWhg@mail.gmail.com>

--------------40pBXXaygslm2JpWTjgDYlEP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNS8yNS8yNSA0OjM5IEFNLCBTdGV2ZSBGcmVuY2ggdmlhIHNhbWJhLXRlY2huaWNhbCB3
cm90ZToNCj4gSW50ZXJlc3RpbmdseSB0cnlpbmcgdGhpcyB0byBTYW1iYSBJIGRvbid0IGhh
dmUgYW55IHByb2JsZW0gY3JlYXRpbmcNCj4gdGhlIGZpbGVzIHdpdGggdGhlIHJlc2VydmVk
IGNoYXJhY3RlcnMgb24gc21iMy4xLjEgbW91bnQgYnV0IFNhbWJhDQo+IHNlcnZlciByZXR1
cm5zIHRoZSBpbmNvcnJlY3QgZmlsZW5hbWUgaW4gdGhlIEZpbmQgKHF1ZXJ5IGRpcikNCj4g
cmVzcG9uc2UuIEl0IG1hbmdsZXMgdGhlIG5hbWVzIChlLmcuIHRvIEE3VjU1OH5ZKSBldmVu
IHdpdGggcG9zaXgNCj4gbW91bnRzIHdoaWNoIGxvb2tzIGluY29ycmVjdA0KDQpJJ3ZlIGZp
bGVkIGEgYnVnDQoNCmh0dHBzOi8vYnVnemlsbGEuc2FtYmEub3JnL3Nob3dfYnVnLmNnaT9p
ZD0xNTg2Mg0KDQphbmQgYXR0YWNoZWQgYSBXSVAgZml4LiBDYW4geW91IHRlc3QgaXQ/IEl0
J3Mgb24gdG9wIG9mIG1hc3Rlci4NCg0KLXNsb3cNCg==

--------------40pBXXaygslm2JpWTjgDYlEP--

--------------Gw4TmQqOL1O33JSSr7rK9K0x
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmgy7TQFAwAAAAAACgkQqh6bcSY5nkaL
gQ//RHfVHJiNCUTm0NpfnFPX2EuQ0g/wBRhgDJb9B5scTbaeXk9ZKU0DzFFQT+Z/X4fIl564G7x7
Opn8Y4uGLC3EGGCFh67LtOLLG3fxifWh0yuW22Blzx928I3KFBypbI//kn6ThYhu061EqhWBeoyI
qJSmDIq2H7iJDahjr8ZRIpfG2+WNeB2K6gf2+GhK6cjbMbImzdv2Y8lNBCdSvdPhRN+JW4oeYtJi
+W2vXaoN9+wadWsG2c/XpExuGT226pgMIORwy7vsFFdZOZzC/Rn0l5yVR/pIoftRTaAcUj0G2BzI
mK67SjGf5g2H/3fg1C801BcdSwGKAUp0OkUeKLgtC0wxFxqAf7hbM9oA1DMLu3svNJWLB4SAQDwg
TkU3DJzjkP7RvpSR7rup9FVXxCYQWiVPjTkRBRO6N1LBxVECY4c9B0YyCer9ZBYx3MJjiJDErXxh
dAIuUZzl53e9WbnVcvHdBPVGwVypARXHy7WZ7UywYvMX0FqUGMPZtdGZotOGG0L2X3JJ8MvgZxno
vpzd/JzgqFQd1vmoJKFI+TeecTThJYeA2RUpw5QupGRT+WUfpnx6xE7xA0GvNLJADxdEf3v/7UJ6
AbIB/0kMtd4YcT1mcVK8ewvda4UGQ7tmyY99Di2ZKwOiE1lBqewN+8sssHXXUgpmlKFVeiKiutUA
OUg=
=+Ht3
-----END PGP SIGNATURE-----

--------------Gw4TmQqOL1O33JSSr7rK9K0x--

