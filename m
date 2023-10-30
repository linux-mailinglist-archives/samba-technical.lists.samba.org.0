Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D09B67DC013
	for <lists+samba-technical@lfdr.de>; Mon, 30 Oct 2023 19:53:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=qj19nFQCurCDxnG7/WmwceqiOuKpOu4OeC16LTfw00M=; b=sggAyykLlGyKB/3P9t277q8AMP
	QbBBOC3QiZ4zqMHjjXpGMC2AeFhEKoHXW7uw8pBz19MJLrh/44DJ5Do6/qFb7/J150dqsO1pVt4Xj
	jVbPQVYIAx4b9Ne+EMfE86Onbruy1fGzhF5esIB/4QdxTvWxUubWMTE4/C94QBIe2tks/B1Cly9oP
	EjiIWadkQjibl0B8wB2ezS8Vw379SOiJ+o/eLGY9EVYv4m67wYdEMDjIlSVCYxLHHbj4oNgBvsYW5
	eLGyFKl8H0CIfP5keY6B8bmsVh6Gp6GjglCnmHpk9JwLtc8ZzR/SqPI+wWLo2Vkk4hOxsA3dadaGp
	AuuMNROA==;
Received: from ip6-localhost ([::1]:59768 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qxXOR-003c4k-80; Mon, 30 Oct 2023 18:53:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19794) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qxXOM-003c4b-NA
 for samba-technical@lists.samba.org; Mon, 30 Oct 2023 18:53:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=qj19nFQCurCDxnG7/WmwceqiOuKpOu4OeC16LTfw00M=; b=wJ05jqJLp802Yt9CKER8jl9CqV
 fTLrLVKFgzATVWAGcWr64f0xk7xP2B3467iP4ElX3JYs6rDyRCOCTlKy7aDU3TWz5s9y+ZKF84h9J
 e4/SuWJShDP7dYwVQN0ihnBMSJRDhTsIxqf8vyCrdr4UOzNSuxvfJH94R01RLsWK3q+TRBZGgT0ZH
 kHA8z1gOeFl796f+n+U3j7fV2X27w87lJlMvpG1xAyjGMgNo8qIsmRJvwQXCfObrec1aiWkWXbII6
 wnSZVUpkB6jzcySJmMsQ3KJbrY8k81tYqLsEkR4dG7dAk1yVGg3LoE4htCAzXOfgsteCetMKWpEAk
 GwGqqkUmqiFVm2D/gfnbVZ/akwzP/v+4+dOUPCcMKbnTgeDKuRGITszFHutzlwEOvjXsCR1lhGKRP
 YJKEPlNcht1hgSNWxPhODGjpf22zcNKB6Af/hRMDHMM17TMwhf221Za/t15yGelUvKVbuQUMUE1NJ
 v756DlbOPRPb407As/4aZh7S;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qxXOJ-003NAq-18; Mon, 30 Oct 2023 18:53:35 +0000
Message-ID: <64ddbbd2-9499-4f6d-ae64-19fccd924220@samba.org>
Date: Mon, 30 Oct 2023 19:53:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SMB3 POSIX] POSIX client creates a file, set the ARCHIVE bit or
 not
Content-Language: en-US, de-DE
To: Tom Talpey <tom@talpey.com>, Jeremy Allison <jra@samba.org>
References: <3b2fa1bd-2eae-482a-a9d9-543ebb921046@samba.org>
 <ZT/ZoUmdarteCey4@jeremy-HP-Z840-Workstation>
 <18abc825-a35d-441b-9476-32c6c368275f@samba.org>
 <ZT/tY0fVsAaaqpZE@jeremy-HP-Z840-Workstation>
 <a92a20ea-5e03-4f0c-9129-db4c62043dd1@samba.org>
 <2c4005f6-e5f0-43b1-bc96-0d497e547934@talpey.com>
In-Reply-To: <2c4005f6-e5f0-43b1-bc96-0d497e547934@talpey.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zxlQksJyCVAe5caAQlgy5XWO"
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
Cc: Volker Lendecke <vl@samba.org>, Stefan Metzmacher <metze@samba.org>,
 Steven French <Steven.French@microsoft.com>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zxlQksJyCVAe5caAQlgy5XWO
Content-Type: multipart/mixed; boundary="------------61ADmYzFlhm0O3GRFVKp7jM5";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Tom Talpey <tom@talpey.com>, Jeremy Allison <jra@samba.org>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 Volker Lendecke <vl@samba.org>, Stefan Metzmacher <metze@samba.org>,
 Steven French <Steven.French@microsoft.com>
Message-ID: <64ddbbd2-9499-4f6d-ae64-19fccd924220@samba.org>
Subject: Re: [SMB3 POSIX] POSIX client creates a file, set the ARCHIVE bit or
 not
References: <3b2fa1bd-2eae-482a-a9d9-543ebb921046@samba.org>
 <ZT/ZoUmdarteCey4@jeremy-HP-Z840-Workstation>
 <18abc825-a35d-441b-9476-32c6c368275f@samba.org>
 <ZT/tY0fVsAaaqpZE@jeremy-HP-Z840-Workstation>
 <a92a20ea-5e03-4f0c-9129-db4c62043dd1@samba.org>
 <2c4005f6-e5f0-43b1-bc96-0d497e547934@talpey.com>
In-Reply-To: <2c4005f6-e5f0-43b1-bc96-0d497e547934@talpey.com>

--------------61ADmYzFlhm0O3GRFVKp7jM5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvMzAvMjMgMTk6MjUsIFRvbSBUYWxwZXkgd3JvdGU6DQo+IE9uIDEwLzMwLzIwMjMg
MjoxMyBQTSwgUmFscGggQm9laG1lIHdyb3RlOg0KPj4gT24gMTAvMzAvMjMgMTg6NTIsIEpl
cmVteSBBbGxpc29uIHdyb3RlOg0KPj4+IFllcCwgc291bmRzIGdvb2QgdG8gbWUgIQ0KPj4N
Cj4+IG9rLiBOb3RpY2VkIHdlIG5lZWQgdGhlIHR3ZWFrIGF0IGEgc2xpZ2h0bHkgZGlmZmVy
ZW50IHBsYWNlLCBidXQgDQo+PiBhbnl3YXksIHdvcmtpbmcgb24gaXQgd2hpbGUgYXQgaXQu
DQo+Pg0KPiANCj4gSXMgdGhpcyByZWFsbHkgd29ydGggaXQ/IEl0IHNlZW1zIG9kZCB0byBz
ZXQgYSBXaW5kb3dzLW9ubHkgYXR0cmlidXRlDQo+IGZyb20gYSBQb3NpeCBzeXN0ZW0sIGp1
c3QgYmVjYXVzZSBpdCdzIHRoZXJlLiBJIGd1ZXNzIGl0J3MgbW9zdGx5DQo+IGhhcm1sZXNz
IHRob3VnaC4NCg0KdG8gbWUgdGhlIHF1ZXN0aW9uIGlzOiBkbyB3ZSB3YW50IHRvIHNwZWNp
YWwgY2FzZSB0aGlzIGluIHRoZSBzcGVjPyBJIA0Kd291bGQgcmF0aGVyIGp1c3QgaGF2ZSB0
aGUgc2VydmVyIHNldCB0aGUgQVJDSElWRSBiaXQgZm9yIFBPU0lYIGNsaWVudHMgDQphY2Nv
cmRpbmcgdG8gTVMtRlNBLg0KDQpPdG9oLCBpbiB0aGUgY2FzZSBvZiBTYW1iYSwgc3Rvcmlu
ZyB0aGUgRE9TIGF0dHJzIGluIGFuIHhhdHRyIGluIHRoZSANCmZpbGVzeXN0ZW0gaXMgYW4g
ZXh0cmEgSU8gc3lzY2FsbC4NCg0KLXNsb3cNCg0K

--------------61ADmYzFlhm0O3GRFVKp7jM5--

--------------zxlQksJyCVAe5caAQlgy5XWO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmU/+64FAwAAAAAACgkQqh6bcSY5nkaP
2A//WJ6aLmitdA2fOu/UNmTIUUUAVxk1V8x9NawSafcRGlR6ZoSirlOfCVmk3hnXiISlhs3nQHwp
OH72H2rrS8cnqWOGuCCUfrkkIheBGnxEw3eMtACzwiaJj876vl0LFbrrnZ1TWegVCJHWPIedr8KL
aMTKF0IYBmKrlMFxC+TdTQxzG9wWSxHu+SEP20lMY9XyGHQSNG/WS6fdPWYSekUx+AaXE6+bdflW
DeeP6cb4T6RrhmCYmn8z2RVh04VLho7niLUSs+vze0Tyh79vgEk8K43lmsQBYYfF/pEAdZwGhn8L
UX7wbMjeymX6LFGYoW/nzcPqT99jKM+rin4yYLGtLZR6rafse8qSjZHxY/tSWKMcHotd4E0SB6g9
pBiqGmBWhrYAu5MwMeNXWqSsg8KcyqlLUxyXFopMTkPY3c7Z++U7KiobZH8IDCNvowR/f+83WOuk
w5BM3xEE4cxFkN5NBIwY5Z/EegRWf0CJTZC27HX7pRXvhktx9xB+nh2lRT+AGEDQTQsL3pADYhy0
dq5QObTGe29qUGD4hmS+8m2whtwhnx6lalSfnm0HlwUoOjfdJeLdEeKCuRxXkHRBwTd+nJuxrdvi
VpY+/QE7+VCgP40SYLOfYcW+jfOsCB3CFnDb/HzvFJiZVDaKZfVDfGeP58CqOppjtySSzwPNn4xu
jEY=
=h5Gu
-----END PGP SIGNATURE-----

--------------zxlQksJyCVAe5caAQlgy5XWO--

