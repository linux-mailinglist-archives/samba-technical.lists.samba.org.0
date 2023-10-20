Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4327D0784
	for <lists+samba-technical@lfdr.de>; Fri, 20 Oct 2023 07:13:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=+J4NJo084Ufb+/SqW0Oc/7AY2nuMkPdjWnLMSK9hzAo=; b=DP1WYgnFChEbIcwmqENKpo2xiq
	3pcdbNoikXys/MFJ/LF0Hd4+FxuwWQd3EueS42bbpI7ZfXWNBHqoTDbh2jCqRE2jUZqIZlMzTc18a
	1CBbteLV1NFejJUNjX5uPNXvdPMa3yJ7UvqK5NS8lh30VW8uR9EjH4Slzg0MXW1dk6hlsdReMzDJd
	sPMTcQ5cwyvjEm7qaBTIeN9eziwe5Z15ruDjocXVCA9J0BVwC7OQy+K+4wzJH/pGSN1dp75jMVi9+
	mX7U6ZGnHh12K1qO41c5w8GNWdP80pCFicGsthzQrDgb1FFx4Pp1gbHhw8F1cEwNq0QnSYKENJ8Ce
	BsgXaHVQ==;
Received: from ip6-localhost ([::1]:36582 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qthpD-001Snl-4Y; Fri, 20 Oct 2023 05:13:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16792) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qthp9-001Snc-10
 for samba-technical@lists.samba.org; Fri, 20 Oct 2023 05:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=+J4NJo084Ufb+/SqW0Oc/7AY2nuMkPdjWnLMSK9hzAo=; b=Cu3B32IkH+FRPAIwkJdtAMDwat
 kj74q6PKZeiIh5KXZUH4ST7XGxG+ukXZnboccCN0En6tXlI3XoYgYVVtp/BqkEFyAQ8yl8egaRRwH
 kEGIWZdYASxeWeCWsdoGnG/mrXb0RHi0tmtHoKdbGJjH2CmcloWDBlQPZK5OvIFCRPsre+LD6EjGB
 1K0fbLq7+ZM6hMlQZAZamgdqw2TEJebQpgQCb6LQEdFSc/4/2a7lz0p3eNDGJgxIbWdqY12T1L90m
 6zmm++ms3kS+iT+PCfBK6A0Udj5bMXs/rOJBxxjpIoVhf36ocqBPf6J72e57leNZWn6Gi7UnhXWi0
 GpGu83Y8sEMg5f4eWV1itYbALM8zd64iTXFBrKnXpHp4tuf5ggmJ0oXa0SMoOzA4dWPcdoVo8o8+u
 CYegDPcYfTPe0YYX6TBHuXiSoOBChajL83OehirbVjwRTct/TfwflIJcMdJJJZA2CFPZj5yIoz577
 C23Fln+fV1OJcRicNSQnYFkc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qthp8-001cme-0N; Fri, 20 Oct 2023 05:13:26 +0000
Message-ID: <8d3b4a9c-a821-4c86-af1b-cc8f101b218f@samba.org>
Date: Fri, 20 Oct 2023 07:13:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Samba on top of cloud ?
Content-Language: en-US, de-DE
To: Jeremy Allison <jra@samba.org>, samba-technical@lists.samba.org
References: <ZTHE7GzYWbhSkfQU@jeremy-HP-Z840-Workstation>
In-Reply-To: <ZTHE7GzYWbhSkfQU@jeremy-HP-Z840-Workstation>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rPcNdihhDi4zhsS5h5eS2rpT"
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
--------------rPcNdihhDi4zhsS5h5eS2rpT
Content-Type: multipart/mixed; boundary="------------0P4LL5GmT4BYIfS89TGyRQSq";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Jeremy Allison <jra@samba.org>, samba-technical@lists.samba.org
Message-ID: <8d3b4a9c-a821-4c86-af1b-cc8f101b218f@samba.org>
Subject: Re: Samba on top of cloud ?
References: <ZTHE7GzYWbhSkfQU@jeremy-HP-Z840-Workstation>
In-Reply-To: <ZTHE7GzYWbhSkfQU@jeremy-HP-Z840-Workstation>

--------------0P4LL5GmT4BYIfS89TGyRQSq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvMjAvMjMgMDI6MDgsIEplcmVteSBBbGxpc29uIHdyb3RlOg0KPiBJIHNhdyBvbiBI
YWNrZXItbmV3cyB0aGlzOg0KPiANCj4gaHR0cHM6Ly9jdW5vLWN1bm9mcy5yZWFkdGhlZG9j
cy1ob3N0ZWQuY29tL2VuL3N0YWJsZS9nZXR0aW5nLXN0YXJ0ZWQtY29yZS1jb25jZXB0cy5o
dG1sDQoNCmZ3aXcsIHRoZXJlJ3MgYWxzbyBqdWljZWZzIHdoaWNoIGlzIGF0IGxlYXN0IE9w
ZW4gQ29yZSAobWlnaHQgYWxzbyBiZSANCmZ1bGx5IE9wZW4gU291cmNlLCBkb24ndCByZW1l
bWJlcik6DQoNCmh0dHBzOi8vanVpY2Vmcy5jb20vZW4vcHJvZHVjdC9jb21tdW5pdHktZWRp
dGlvbi8NCmh0dHBzOi8vZ2l0aHViLmNvbS9qdWljZWRhdGEvanVpY2Vmcw0KDQotc2xvdw0K
DQotLQ0KUmFscGggQm9laG1lLCBTYW1iYSBUZWFtICAgICAgICAgaHR0cHM6Ly9zYW1iYS5v
cmcvDQpTZXJOZXQgU2FtYmEgVGVhbSBMZWFkICAgICAgICBodHRwczovL3Nlcm5ldC5kZS9l
bi8NCldvcmxkd2lkZSBTYW1iYSBTdXBwb3J0LCBDb25zdWx0aW5nIGFuZCBEZXZlbG9wbWVu
dA0KU0FNQkErIFNhbWJhIHBhY2thZ2VzICAgICAgICAgICBodHRwczovL3NhbWJhLnBsdXMv
DQoNCg==

--------------0P4LL5GmT4BYIfS89TGyRQSq--

--------------rPcNdihhDi4zhsS5h5eS2rpT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmUyDHUFAwAAAAAACgkQqh6bcSY5nkbN
rQ//XETuzM+JFP5Dqv4Gm/4KwR3LoRr5KRpsXbtOivMsW587zTQgfCfFAgPPlxHfsBf/+0+BSvip
kfe/+DuBHZ9sslyO6B2hENLqnqx49tqi1RIuV92EHYt1WrpgatB+3viz8vASL9mCzA/6mzG/0Dza
uP8P1lQSfW0iDcyoo6jjGc5qu3RtcKIDtNe+hK5HYoJghIYEoH1+kW5ligbEF2xsB3x4P6JlH/G6
Ydo6wYhguX85f1sHWzEz6Zl3WOzWvMDhOUp+mgsxIfY8IH6odMzfx5N0Yn09PHxhdBoCPFFB+5lE
u9kbudN4RfciJH6RndTmPTuCqaL09UnU/W0/+2bGytJTBF+KllJX+US75HejqFcIMwbsO6BO1Zl5
GRqmClt5REZ2vI38AzvSxeNVY+etbBSFdoO9Hcpg4nmYJFp5FAID95UGbW0ZYEauZixTSEG9SFgt
cwSjdT5Avp4twDWHGdBcvhKoXgUlFpBpXLmg/WLLU/DdAXs0i1gStSUyHPZhXp+/ByDFJAAeW+Nm
uvGxVPPHURYu1socWZ+pYF/WsS1Gu2pcPRWzbzBZmTX1rv85ReVmt6qfm1s2Q2JW/WyuFcFRR2Pi
Aw9Yv9zUL6QAEqmWeUmJu3yn87Rh6omoxV9MzYXD2JC4mQcwjAmBX+KJ9kud2OVSrUbj2o+HCGpt
5vk=
=GIdt
-----END PGP SIGNATURE-----

--------------rPcNdihhDi4zhsS5h5eS2rpT--

