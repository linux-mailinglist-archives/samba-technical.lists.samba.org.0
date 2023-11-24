Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F947F8520
	for <lists+samba-technical@lfdr.de>; Fri, 24 Nov 2023 21:17:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=/BrquNfpqd8Cg2wpZBi0608NkZCpbr4xGXIOCvqdwvc=; b=M/6S4uDxG9sWplqIB4nDEYXlPS
	0KKYEuh2ASeFHBeQ4ISRu7SXWYfr0qpbgnwrcOS/2KwMOIwFrEmj9CAiQHL6njdZU5+5/moQ0Gzlr
	UYXPG1Gp3ywSlShNzX/Gl2cqGk3L18XYbivOkMUaA+8xvx/Ek4YnBo6nYCXYlLH8hj3RBaL7nIE3A
	e1MxBrdv5RNmrMncDtViaj2Awsh8te/ZsTHqTlpTUmCD09tz2sEnNwaqRT60mf25nuGZNHtW5ijRB
	5bx3z1aTTsE5Ur2unHwMb+Kvln8cUNIjruO8jIiR5Ocmk6jp2WsVhawOxI9jipfLMgjT2dbZvYlUN
	u6oXdJRw==;
Received: from ip6-localhost ([::1]:21576 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r6cbb-000VWL-Am; Fri, 24 Nov 2023 20:16:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18408) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r6cbW-000VWC-TZ
 for samba-technical@lists.samba.org; Fri, 24 Nov 2023 20:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=/BrquNfpqd8Cg2wpZBi0608NkZCpbr4xGXIOCvqdwvc=; b=CaVjOwf0A88zIOtOb9SUhueyKa
 Mh1xcvEhmmApmiEQxAMLziE4HEIisdpiwSODq3OLOjhcK+t8xyfPLt9BrP8qrZUwZaHGRCHTLyu09
 zFFOU2zljru3itCpLYKJMCgf0zyd2OtzglOBQgvwZMsjZ9gyr3qoiCZeYiHXrF6vhOyO3N7bfY3as
 DUU51pFhxqpaNKR5UwnTrmm7AzXAJBMX3tM9T0C0ZD6OgpbkmHnH4jOE0BzM1mIYdKRU3nhiTbFUt
 duRJ2HP8KwKi1ulspcHby3CAI7OEhfEIruYL6UVHEF9OJybs5WSAhBmiJphENzma05rySUkKbSJV8
 4YRbpSygoK3796xSnPXFOqD0KaYxE13Uh+TvYTt67EOzIZlP43h/q2J3BilmyB3bn+9tDdatqFWJN
 9ru9Xs+uICBAKNRSVaqwgyFMq4ES2+wsk0Tpd7Vso+MpTwg492852L+RhD4Pz+YEnp3ZvX+nJxB6Z
 HuvNSv924N9JqSOwU4oXubab;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r6cbU-000Psd-1w; Fri, 24 Nov 2023 20:16:44 +0000
Message-ID: <f387ca21-0e4a-43e9-92c9-4457dbfdcaf2@samba.org>
Date: Fri, 24 Nov 2023 21:16:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [SMB3UNIX] Add POSIX-FSA and POSIX-FSCC
Content-Language: en-US, de-DE
To: Steven French <Steven.French@microsoft.com>,
 David Mulder <dmulder@samba.org>
References: <b63ead3c-f0dd-4acb-ae01-14e887d1d03e@samba.org>
 <3bf22a9f-ed05-baa2-3698-5870ca9e957a@samba.org>
 <e05f7cb9-38ac-4281-aa5f-bf178714b47b@samba.org>
 <DM4PR21MB34411774AEAF75085F4EC5B3E4B8A@DM4PR21MB3441.namprd21.prod.outlook.com>
In-Reply-To: <DM4PR21MB34411774AEAF75085F4EC5B3E4B8A@DM4PR21MB3441.namprd21.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PGwWcIge85IcMfeFtfunygcV"
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
Cc: "Paulo Alcantara \(SUSE\)" <pc@manguebit.com>, metze <metze@samba.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 tom <tom@talpey.com>, Steve French <smfrench@gmail.com>,
 Volker Lendecke <vl@samba.org>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PGwWcIge85IcMfeFtfunygcV
Content-Type: multipart/mixed; boundary="------------aiJHk20mytwfVlFAgiRBBbjz";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Steven French <Steven.French@microsoft.com>,
 David Mulder <dmulder@samba.org>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "Paulo Alcantara (SUSE)" <pc@manguebit.com>, tom <tom@talpey.com>,
 Steve French <smfrench@gmail.com>, Jeremy Allison <jra@samba.org>,
 Volker Lendecke <vl@samba.org>, metze <metze@samba.org>
Message-ID: <f387ca21-0e4a-43e9-92c9-4457dbfdcaf2@samba.org>
Subject: Re: [EXTERNAL] Re: [SMB3UNIX] Add POSIX-FSA and POSIX-FSCC
References: <b63ead3c-f0dd-4acb-ae01-14e887d1d03e@samba.org>
 <3bf22a9f-ed05-baa2-3698-5870ca9e957a@samba.org>
 <e05f7cb9-38ac-4281-aa5f-bf178714b47b@samba.org>
 <DM4PR21MB34411774AEAF75085F4EC5B3E4B8A@DM4PR21MB3441.namprd21.prod.outlook.com>
In-Reply-To: <DM4PR21MB34411774AEAF75085F4EC5B3E4B8A@DM4PR21MB3441.namprd21.prod.outlook.com>

--------------aiJHk20mytwfVlFAgiRBBbjz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU3RldmUsDQoNCk9uIDExLzI0LzIzIDIwOjUyLCBTdGV2ZW4gRnJlbmNoIHdyb3RlOg0K
PiBTZWVtcyByZWFzb25hYmxlIHRvIHNwbGl0IGl0IGluIDMgYXMgZGVzY3JpYmVkLCBhbHRo
b3VnaCB0aGUgb3ZlcnZpZXcNCj4gKHBlcmhhcHMgaW4gUE9TSVgtRlNBKSB3b3VsZCBiZSBo
ZWxwZnVsIGZvciB0aGVtIHRvIHNlZSBmaXJzdC4NCnNvcnJ5LCBJIGRvbid0IHF1aXRlIGdl
dCB3aGF0IHlvdSdyZSBzdWdnZXN0aW5nIGhlcmUuIENhbiB5b3UgcGxlYXNlIA0KZWxhYm9y
YXRlPyBUaGFua3MhDQoNCi1zbG93DQo=

--------------aiJHk20mytwfVlFAgiRBBbjz--

--------------PGwWcIge85IcMfeFtfunygcV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmVhBKsFAwAAAAAACgkQqh6bcSY5nkYI
XA/+NtTG+8ytfStGCEYwYvnloE+h5ZEE7TuDlt1RF2xTnwGV++TceNaKkEM4n94g8CmOYXc1fZz0
8Ep5+eMPdyDOtFvgm9UAjgcenk4ruyHSpRwFzD5SuHE477lqAAqxUcnEUQgidSgT4GOb8FTrwUfr
BrMVU330RP0tuwR1hs00Syw6kf0kMwkFh89C/EK0eAnuLrQWkp8rgOplolnQgEdSNFFk3LTZ6Kp2
8hY8h9wbh4lEJGg0u6mO+rT4ZKGwGj6r9lMRuB+FTHsBJF6ibAnJ9Vzmtz2nCKqnj60GTpsjfIBe
hwERreJnK/If+UOp7bZsok0Og90U1VfQFooWffE6kdfmZ1Z3Lwr8BR1hen2YR/9kB9bdsbEWYqAw
52xWH07QfzeSvFs2SIUnTVyA7WEsMRzxGF23C2dqK9IFkBVDvQt8e5eSZZsakyA9gRIF88toECNi
A113fSfThZoipvsNng4N1KJQWq0uVe1K2ClCPmHIoR3qBxxNqqxsFv2nES+jd2fdoc1kcp/Qji9E
yT6HkjOsc1QhYXHIzed+sGDj3AgcR33hbCM0m3X0ngwsIJCwFtdymlX8ELt1xAfb5/7BCXP2cryL
d5ZeMUlj01S+53GUp7/D5aCLmaeuwRlhKNgwmNByMaMKrTXPjim5mLX3vXoEpt3eLq1W5bhmZKB3
T78=
=8Tw5
-----END PGP SIGNATURE-----

--------------PGwWcIge85IcMfeFtfunygcV--

