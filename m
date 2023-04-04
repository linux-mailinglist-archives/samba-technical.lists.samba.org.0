Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D546F6D6570
	for <lists+samba-technical@lfdr.de>; Tue,  4 Apr 2023 16:33:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=MnhDQgwW+SpDgVsGSCV4iOfS4uS0F7zy/ftmY/V7t14=; b=HvC8LC0gmBgzemBO7G++kFYh8y
	oASTPAv0YQXrevTf6DQvfimCEkDRM8ocCjS2w+wcByiJUz9BD71MbGt/Wp7D9lMi9V23AIDQ2Wjvz
	RmvowcTk8cE1SMzjLmNsYkPqf+9l13tVkDtpxo5tdzIau6sFpKPQqzj0wqpGNqiqAawGRVsNTmCeH
	HTxPRZAtX+gYWO1KrqGfx4+GiZkv3sUBfs+yZlNFsBOYUtt7goSCT0el8VSqExpRUOsU43lXKzxz/
	Mvxk2WIEkMEGPWyJPaGZ+C5Fdi4uYiSUricA1yh62mBNjW4eYxF0xrextWoiUsRn+LEFG++Qv55yA
	Sqssm3AQ==;
Received: from ip6-localhost ([::1]:61566 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pjhiT-00991o-Mw; Tue, 04 Apr 2023 14:32:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54114) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pjhiN-00991f-ST
 for samba-technical@lists.samba.org; Tue, 04 Apr 2023 14:32:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=MnhDQgwW+SpDgVsGSCV4iOfS4uS0F7zy/ftmY/V7t14=; b=zc20sOdHyiwr2cHkIx6QFkXSQs
 0+uqzeKk/sCr8TnxGlzjq1aT36Lb9225QGuKAWjyyfwkXsLDQXpUwXx6FRY/bjpBqOfS4YIwp1D/v
 iKtQqy86SzE+H2Wu4vdV+20MyJFJvFg8ajvhMqS1w6OysVDzR0RZhhqJu/waImE6aG78ANuIexYEh
 vjgcnrzk7bw08kYBuwSTMUL549sn9KHCYL3kHWFbarG1aPShnr4LmpD3Inxtu6ZFHGWuaoBmiZJQh
 1jXCfRUqMr8JNWx1puwodFibUH2AfOX11gwNwru7aQvXpswROJAIBcSEcNRjvl70kRLyOlXwy6CXK
 4yWMrd2UUTpXtaN3Po6zZEb5YmLROStdILsXFdyfO4iFthIBr3Q99A0KKzf+hBPB6vjk4VzsgFM6g
 rfdE0SgMSXcarcthNFPDBHsjsIhO4iBn5hLo56DNxcsjWEYg2CnLgsUoJNBtGDaWgJ32xDocKwXXx
 Q4f/nvmdnXDPBmlgIoQ7sYLf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pjhiN-0079v5-75; Tue, 04 Apr 2023 14:32:51 +0000
Message-ID: <cf4b6035-9a59-9054-2be5-2b256505929c@samba.org>
Date: Tue, 4 Apr 2023 16:32:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: File corruption issues related to an allegedly closed bug report
Content-Language: en-US
To: software-infos@zkrd.de, samba-technical@lists.samba.org
References: <841f8a01-5e28-8321-2f59-90f8f6a13c07@zkrd.de>
In-Reply-To: <841f8a01-5e28-8321-2f59-90f8f6a13c07@zkrd.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MbopFEMxaqaluR81nrN44S0c"
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
--------------MbopFEMxaqaluR81nrN44S0c
Content-Type: multipart/mixed; boundary="------------kFN8NlcVbShMpV5qFXXCAglS";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: software-infos@zkrd.de, samba-technical@lists.samba.org
Message-ID: <cf4b6035-9a59-9054-2be5-2b256505929c@samba.org>
Subject: Re: File corruption issues related to an allegedly closed bug report
References: <841f8a01-5e28-8321-2f59-90f8f6a13c07@zkrd.de>
In-Reply-To: <841f8a01-5e28-8321-2f59-90f8f6a13c07@zkrd.de>

--------------kFN8NlcVbShMpV5qFXXCAglS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC80LzIzIDE1OjA4LCBaS1JEIElULVNlcnZpY2VzIHZpYSBzYW1iYS10ZWNobmljYWwg
d3JvdGU6DQo+IFdlIHdvdWxkIGxpa2UgdG8gYXNrIGZvciBhY2Nlc3MgdG8gdGhlIGJ1Z3Ry
YWNrZXIgaW4gb3JkZXIgdG8gcmVwb3J0IG91ciANCj4gaXNzdWUgYW5kIHNoYXJlIGRldGFp
bHMgd2hpY2ggaG9wZWZ1bGx5IGNvdWxkIGxlYWQgdG8gYSBzb2x1dGlvbi4NCj4gDQo+IEVN
YWlsIGZvciByZWdpc3RyYXRpb246IHNvZnR3YXJlLWluZm9zQHprcmQuZGUNCg0KSSd2ZSBq
dXN0IHNlbmQgeW91IGFuIGVtYWlsIHdpdGggYW4gYnVnemlsbGEgYWNjb3VudCBpbnZpdGUu
DQoNCi1zbG93DQoNCi0tIA0KUmFscGggQm9laG1lLCBTYW1iYSBUZWFtICAgICAgICAgICAg
ICAgICBodHRwczovL3NhbWJhLm9yZy8NClNlck5ldCBTYW1iYSBUZWFtIExlYWQgICAgICBo
dHRwczovL3Nlcm5ldC5kZS9lbi90ZWFtLXNhbWJhDQpTQU1CQSsgcGFja2FnZXMgICAgICAg
ICAgICAgICAgICAgICAgICAgaHR0cHM6Ly9zYW1iYS5wbHVzLw0KDQo=

--------------kFN8NlcVbShMpV5qFXXCAglS--

--------------MbopFEMxaqaluR81nrN44S0c
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmQsNRIFAwAAAAAACgkQqh6bcSY5nkam
pA//e3OPq9a7a4yKSozfCTXX+8PiFLBHWzTBGT7lAetGdvLw68ebU0dSNq4CtbCMh/U5D1/5Oghr
b6/TatU3nzK3l/E25+gCQxK13eIbpiTV13qd4uDI6OYTA1eDkP3CuJ2gkfEUjisXaEc8S1vM5lQ7
Qrd3524sxew9uTW7QSNH5YxsUbiM2o6XeHyfCUIxkSN+VOjJnYGzYtKXFbOLqbSuKgQPbsPnHvkx
b8PeQAGWgaZG0XMHIGOnyw3i26PrT7ZJZvaBbAGVxiyml71JdHCVDISAxgzmm11EgZJLyPCb9/LY
POygIJD/KetHnTjtJB69FnpL19C6jA3UsoljVjHe7lsAG78Dn9SV8NzGFzfjxv8zx6FYhwKzSydJ
kR4hRIqjONEMbSKZ00j1IZpo4+SkTzP+gr+UYox9C7esEhDC4gfHqu3EcHpRYQNlHygZw0oX8Toj
qLKd0XYpNYQmvm6CyvZ9/bG/d/1oOoFbZnGVwJglQ/ZfDGSlKLOiM14fVVqhCDtuWwGH50Ke0zMT
+DLQqxmYiAQ6LMw1CaSmTMuMTglQkJ32Xc9vKq8FFhRL9m73rytWsQ3IFV2QkZYS0ZFU+V6bHtW0
SRvvLXNEEKDvKe6K73VXqjhVUTtnVZ5OyoweAsaNZ8g1f8ETXmUEgQqn7ojHTQuY2POUZwji7Zls
gcA=
=dSmD
-----END PGP SIGNATURE-----

--------------MbopFEMxaqaluR81nrN44S0c--

