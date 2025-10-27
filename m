Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AFCC0FC19
	for <lists+samba-technical@lfdr.de>; Mon, 27 Oct 2025 18:49:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=3302LF96y8uLodaxnzuiC744NXmHsYtqhVj55ZesNec=; b=VOZ8un6FSc1lFNSmNEbgL4nmBX
	1RqlbMQW345EKr9a5RgbibeWeKt90RsqHAJx0xRNSN22DmZGMc57UQhGYm8NsUfErSoWVKnX0xJIk
	anaIyKJij8YWwktgOdjseGzVorualRQLJ4IQcPHmE0ecAhV37++9+ys7gun8pv2dN6lU64uHS2e8j
	UZCYO3ooD48Zhj82hZGOiV+YXxM/Pv4VmKF8PvIXkabzBbSk7p+7Mx80TO0oTggvbYFergwbdKjG3
	vREccKgwx0QK2cNUGgADAHtS4gl4rzM1q9ECm5zorVKfIxxTEGNAy0ZaDzrSruAWrHNerjB4Q/FoS
	ZaxP7PRw==;
Received: from ip6-localhost ([::1]:39876 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vDRKe-008uwE-Kl; Mon, 27 Oct 2025 17:48:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49660) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vDRKZ-008uw7-ID
 for samba-technical@lists.samba.org; Mon, 27 Oct 2025 17:48:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=3302LF96y8uLodaxnzuiC744NXmHsYtqhVj55ZesNec=; b=PukWBZVRQ94iZ5gBIAjJl0tX8A
 gSeYsC0dVuHBo7JkEQFg0OUsv+kMhGRyaz7DZgEfWlZRLm3YW0n5tk4vAFVS/0Z18DnkpoZRm6lSo
 1v2rquGNmk3KE4qm5GPhF/iFUXq5cete5rYAiPhe4+00ITFmPAu4AKQg9AyL51NIUDJrVRIh2IFaO
 ZN9cNqrV36viw7QoOVrYt6qJbm5txuIHTbFsfrslH7GjS3dsU1RCbw72ALr6oCP2VpIXDOSVHO7eI
 YbY4Or4hOVLojNhViWUtbWguccBVG3EtfF0V5XSoyu1OGUS8uM5wvMDSzgR4t4le/zWI59/o+ULLv
 iHKRF0H/yZSrzwsxs0Uqj+E0pMV4QcoLbo7ILPYePzV+kfm+NTx1kn9C6ezPYnQJ3BUdlYKSVXD24
 zraBDlpt45333rlg4h88b439zyxLLg/map7eq5XFLaxBsMYsCGSwAwc1FNkVsVDRClrxHip9YxoFv
 bO7/Dtu5GoBwna2pWM8In+3F;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vDRKY-00BILf-2f for samba-technical@lists.samba.org;
 Mon, 27 Oct 2025 17:48:30 +0000
Message-ID: <77b153b3-94f1-4100-a51d-b32d05faae48@samba.org>
Date: Mon, 27 Oct 2025 18:48:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: samba-technical <samba-technical@lists.samba.org>
Subject: =?UTF-8?Q?Invitation=3A_Samba_Developer_Online_Gathering_=E2=80=93_?=
 =?UTF-8?Q?Tuesday=2C_November_4th?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XfH1uht2rujrYyNlhNk2ZQvN"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XfH1uht2rujrYyNlhNk2ZQvN
Content-Type: multipart/mixed; boundary="------------aW7MsfPNRXwvwOmqURSoQCcg";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: samba-technical <samba-technical@lists.samba.org>
Message-ID: <77b153b3-94f1-4100-a51d-b32d05faae48@samba.org>
Subject: =?UTF-8?Q?Invitation=3A_Samba_Developer_Online_Gathering_=E2=80=93_?=
 =?UTF-8?Q?Tuesday=2C_November_4th?=

--------------aW7MsfPNRXwvwOmqURSoQCcg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgYWxsLA0KDQpTYXZlIHRoZSBkYXRlIGZvciB0aGUgbmV4dCBTYW1iYSBEZXZlbG9wZXIg
T25saW5lIEdhdGhlcmluZzoNCg0KRGF0ZTogVHVlc2RheSwgTm92ZW1iZXIgNHRoDQpUaW1l
OiA2OjAwIEFNIFVUQw0KTGluazogaHR0cHM6Ly9iYmItbmV3LnNmY29uc2VydmFuY3kub3Jn
L3Jvb21zL3g0cy13bjctbHR3LWwzYi9qb2luDQoNCkluIHRoZSBuYW1lIG9mIHRoZSBTYW1i
YSBUZWFtLCBJ4oCZZCBsaWtlIHRvIGludml0ZSBldmVyeW9uZSBhY3RpdmVseSANCndvcmtp
bmcgb24gb3IgY29udHJpYnV0aW5nIHRvIFNhbWJhIHRvIGpvaW4gdGhpcyBmaXJzdCBTYW1i
YSBEZXZlbG9wZXIgDQpPbmxpbmUgR2F0aGVyaW5nLg0KDQpUaGUgZ29hbCBpcyB0byBjcmVh
dGUgYW4gaW5mb3JtYWwgc3BhY2Ugd2hlcmUgZGV2ZWxvcGVycyBjYW4gZGlzY3VzcyANCmN1
cnJlbnQgZGV2ZWxvcG1lbnQgdG9waWNzLCBvbmdvaW5nIHdvcmssIGFuZCBmdXR1cmUgcGxh
bnMg4oCUIG11Y2ggbGlrZSANCm91ciBoYWxsd2F5IGNoYXRzIGF0IFNhbWJhWFAsIGJ1dCBp
biBhbiBvbmxpbmUgZm9ybWF0Lg0KDQpJZiB5b3UgaGF2ZSB0b3BpY3MgeW914oCZZCBsaWtl
IHRvIGRpc2N1c3Mgb3Igc2hvcnQgdXBkYXRlcyB5b3XigJlkIGxpa2UgdG8gDQpzaGFyZSwg
cGxlYXNlIHNlbmQgdGhlbSB0byBtZSBkaXJlY3RseSBpbiBhZHZhbmNlIHNvIHdlIGNhbiBw
cmVwYXJlIGEgDQpyb3VnaCBhZ2VuZGEuDQoNCkEgZmV3IGRldGFpbHM6DQoNCkR1cmF0aW9u
OiB1cCB0byAyIGhvdXJzDQpSZWNvcmRpbmc6IHRoZSBtZWV0aW5nIHdpbGwgbm90IGJlIHJl
Y29yZGVkDQpGb3JtYXQ6IG9wZW4gZGlzY3Vzc2lvbiDigJQgdGVjaG5pY2FsIGFuZCBpbmZv
cm1hbA0KDQpXZeKAmXJlIGxvb2tpbmcgZm9yd2FyZCB0byBzZWVpbmcgbWFueSBvZiB5b3Ug
dGhlcmUgYW5kIGhhdmluZyBhIA0KcHJvZHVjdGl2ZSBhbmQgZnJpZW5kbHkgZXhjaGFuZ2Uh
DQoNClNlZSB5b3UgbmV4dCBUdWVzZGF5LA0KUmFscGgNCg==

--------------aW7MsfPNRXwvwOmqURSoQCcg--

--------------XfH1uht2rujrYyNlhNk2ZQvN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmj/sG4FAwAAAAAACgkQqh6bcSY5nkb8
nhAAnElaP65V/5lw4hD6ATbLmdC042hhdSSiJbaIHXUkFLD2XonL4teFtUnIz5K2bSRKPCKv3oNS
ZXQ/GlGM7z7xhSD7L+5lxrNQk8tc1IuKuz2JTmP3+TPiIn1x4b4lAdXvOnzP0vZAEHP9yjFMu3Vx
yk2jmfoqN2W2Daa22bFAejIVciFftBjdhnOj3EEpFet20iGxmeB8CfSRZ0t5gpArnxtM7rhSnv9d
ZPyfexb65mJwOeR6lGuAMpWe0IB3lUpQGzNrGT2pI/aqVkxaR6iKYBCvEd6FUO1subcBmn9/wuA7
/XwwLPQFZ0+Zmif2B8A1H0tcidLnRMpjRka+vMX4OKy0BDAaQnsv+Fw9brXueRXI430WuKwsNPBD
VH3MdEccKri98gyb0mIPGvwgIVyZ1CWQFW8z/8Me44igcLilrxTzC9ViOsU8U+RCy/DK4n96fADw
+JIvcp9VVXN+gynbHuxBpP2HChivg7gyWx6iYeSkOHf+UOoBdv+Qndct4VgW/NAaj7nnf1y6hziJ
OWu1jS/XmBude+fMO1DMkXvpBH1oPAZMswXVbHwOfc7+7WzQi1lGARJfGfeeM8ONbpK613S4GiyY
HpXBf03pX3u1nbr8cxeb9QE55zt//yFpayN5u5+zWQ4nT/AhF5q9XQFP1ch85ELm3vdEd4LAIJ6z
z/w=
=/gl2
-----END PGP SIGNATURE-----

--------------XfH1uht2rujrYyNlhNk2ZQvN--

