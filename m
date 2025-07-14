Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C30B03678
	for <lists+samba-technical@lfdr.de>; Mon, 14 Jul 2025 08:02:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=AqpX7lN/Shu69jCJQIRcNfuz3xVwedws5uKQ2Zo9uqA=; b=V2XnQiFYTm0TDCCgmt1oANzPvy
	UOTVDHcLlelJcrBx06ezpkXX/r2UpZUY3UGm4nDLhXQbJQ7uHNs0wl0j5WZD75x1S5PfmOLINfG9x
	BVDKSXuEoeD/r1Lrzei1a09w9D9yxA6uJXJY5JH6wW/VUpYrenRPPZIZCOERM72nnkU9tomc2Nwr9
	+Y/2mbn3r+fAyJyWrTfNJFiSKLtwVGwNEzI1cXR5DRnuwuXf4BNljU6xMkNZlHdF0b1NuGhfqhrQ5
	SPu6ohalrot896PDZLPLdz07hHqwRDiDt3Bv9JQEQ/Ye/nT9GR4YeVlGFdhc+btp9M2DEzYGhy4P0
	wEKPaujA==;
Received: from ip6-localhost ([::1]:59602 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ubCG5-00B6hs-81; Mon, 14 Jul 2025 06:01:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20720) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ubCG0-00B6hl-TU
 for samba-technical@lists.samba.org; Mon, 14 Jul 2025 06:01:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=AqpX7lN/Shu69jCJQIRcNfuz3xVwedws5uKQ2Zo9uqA=; b=Q/+8+H2zluNbRGYD0YVB9CkVDZ
 pSM1vxvLjz9KAnVK1r783975PyAKxDlUxzXxBkxm611FqmxpCgJS9qRPehAt/hV/FuSR1ydI1XPJq
 ftM0P2A05MTIHxRQcsw00dd1PFtxHRNAqg1dh3JaStW800SWhk7rEJ1OonlgyKoyKN7N36e20pyEl
 fDZr0M+MGKFmKa8YAnz9Q5Quqcyvb8m+ISY7PBXEM5nQfc2psBV4+XEDU9AhVw9NaEHQANVbPZ1oQ
 Ox5hf/tmWWyf30MEQ3Ow8hvc9m2D3Dr7GqD7XoJLlkVMwJKBG4W2+RwQG/BJJcZwCS2KyI8YHpmFn
 R6ZRUorwOP7dozYiAgOKfAsU+6U2KHO7Mq/IcX8af335Vxw0LacKIM8n9rn3ofMK2UTM0uGOx+n2g
 bw+kdq+Vq2tQapIuaeoNBvSkK0d6t6PpJfbnudRAmBPVmymPi0vxAl3HOCD3ZiUSzB2VO/MCXl+0m
 FCw4WvdsMh6fv5MHWaNrnao4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ubCFy-00FGSt-2F; Mon, 14 Jul 2025 06:01:42 +0000
Message-ID: <42e549c1-0f92-4b95-b62b-3e0efab9aa10@samba.org>
Date: Mon, 14 Jul 2025 08:01:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Samba support for creating special files (via reparse points)
To: Jeremy Allison <jra@samba.org>, Steve French <smfrench@gmail.com>,
 vl@samba.org
References: <CAH2r5muQGDkaHL78JOcgsfjL_=A64Xm9CrCBSKgOMABOjcg44w@mail.gmail.com>
 <CAH2r5msdLbvGMARXJ=V9wt0pvXJOrc=zh3eUfeF9AXEeshtByg@mail.gmail.com>
 <aHRo9VfMDIfK5MR6@jeremy-HP-Z840-Workstation>
Content-Language: en-US, de-DE
In-Reply-To: <aHRo9VfMDIfK5MR6@jeremy-HP-Z840-Workstation>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0qp0LvcipNDGpKGzY0hDN7v0"
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
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Paulo Alcantara <pc@manguebit.org>, CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0qp0LvcipNDGpKGzY0hDN7v0
Content-Type: multipart/mixed; boundary="------------4Vk7oR8trxPVmUfrc0Oa0UR0";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Jeremy Allison <jra@samba.org>, Steve French <smfrench@gmail.com>,
 vl@samba.org
Cc: samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Paulo Alcantara <pc@manguebit.org>, CIFS <linux-cifs@vger.kernel.org>
Message-ID: <42e549c1-0f92-4b95-b62b-3e0efab9aa10@samba.org>
Subject: Re: Samba support for creating special files (via reparse points)
References: <CAH2r5muQGDkaHL78JOcgsfjL_=A64Xm9CrCBSKgOMABOjcg44w@mail.gmail.com>
 <CAH2r5msdLbvGMARXJ=V9wt0pvXJOrc=zh3eUfeF9AXEeshtByg@mail.gmail.com>
 <aHRo9VfMDIfK5MR6@jeremy-HP-Z840-Workstation>
In-Reply-To: <aHRo9VfMDIfK5MR6@jeremy-HP-Z840-Workstation>
Autocrypt-Gossip: addr=jra@samba.org; keydata=
 xsDiBDxEcLsRBADMQzpWoVuu4oiq23q5AfZDbakENMP/8ZU+AnzqzGr70lIEJb2jfcudViUT
 97+RmXptlnDmE4/ILOf6w0udMlQ9Jpm+iqxbr35D/6qvFgrgE+PnNAPlKSlI2fyGuLhpv1QP
 forHV13gB3B6S/ZWHpf/owKnJMwu8ozQpjnMnqOiVwCg8QnSX2AFCMd3HLQsqVaMdlO+jBEE
 AKrMu2Pavmyc/eoNfrjgeRoNRkwHCINWO5u93o92dngWK/hN1QOOCQfAzqZ1JwS5Q+E2gGug
 4OVaZI1vZGsAzb06TSnS4fmrOfwHqltSDsCHhwd+pyWkIvi96Swx00e1NEwNExEBo5NrGunf
 fONGlfRc+WhMLIk0u2e2V14R+ebDA/42T+cQZtUR6EdBReHVpmckQXXcE8cIqsu6UpZCsdEP
 N6YjxQKgTKWQWoxE2k4lYl9KsDK1BaF6rLNz/yt2RAVb1qZVaOqpITZWwzykzH60dMaX/G1S
 GWuN28by9ghI2LIsxcXHiDhG2CZxyfogBDDXoTPXlVMdk55IwAJny8Wj4s0eSmVyZW15IEFs
 bGlzb24gPGpyYUBzYW1iYS5vcmc+wlcEExECABcFAjxEcLsFCwcKAwQDFQMCAxYCAQIXgAAK
 CRCl3XhJ1sA2rDHZAKDwxfxpGuCOAuDHaN3ULDrIzKw9DQCdHb3Sq5WKfeqeaY2ZKXT3AmXl
 Fq7OwE0EPERwvhAEAIY1K5TICtxmFOeoRMW39jtF8DNSXl/se6HBe3Wy5Cz43lMZ6NvjDATa
 1w3JlkmjUyIDP29ApqmMu78Tv4UUxAh1PhyTttX1/aorTlIdVYFjey/yW4mSDXUBhPvMpq52
 TncLRmK9HC6mIxJqS0vi6W9IqGOqDRZph3GzVzJN7WvLAAMGA/sGAyg2rVsBzs77WH0jPO+A
 QZDj+Hf/RFHOwmcyG7/XgmV6LOcQP4HfQHH3DGYihu5cZj3BeWKPDJnjOjB2qmr+FTjYEsjw
 LDBNG7rjRye412rUbNwmEtcD2/dw4xNyu5h2u+1++KVBPf4SqG/a10gDqGJXDHA1Os5MmnQl
 3CTq9sJGBBgRAgAGBQI8RHC+AAoJEKXdeEnWwDasbeIAoL6+EsZKAYrZ2w22A6V67tRNGOIe
 AJ0cV9+pk/vqEgbv8ipKU4iniZclhg==

--------------4Vk7oR8trxPVmUfrc0Oa0UR0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNy8xNC8yNSA0OjE4IEFNLCBKZXJlbXkgQWxsaXNvbiB3cm90ZToNCj4gSXQncyBhbiBv
dmVyc2lnaHQgSSdtIGFmcmFpZC4NCg0KaG0uLi4gaXQgc2VlbXMgcmVwYXJzZSBwb2ludHMg
c3VwcG9ydCBpcyBtYW5kYXRvcnkgZm9yIFNNQjMgUE9TSVggc28gSSANCndvbmRlciB3aGF0
IHRoaXMgYWRkaXRpb25hbCBjaGVja3MgYnV5cyB1cy4NCg0KV2hpbGUgSSBhZ3JlZSB0aGF0
IGdlbmVyYWxseSB3ZSBzaG91bGQgbGlrZWx5IHNldCB0aGlzLCBmb3IgU01CMyBQT1NJWCAN
CnRoZSBjbGllbnQgc2hvdWxkIHByb2JhYmx5IG5vdCBjaGVjayB0aGlzIGFuZCB3ZSBzaG91
bGQga2VlcCBpdCBvdXQgb2YgDQp0aGUgc3BlYy4NCg0KVGhvdWdodHM/DQo=

--------------4Vk7oR8trxPVmUfrc0Oa0UR0--

--------------0qp0LvcipNDGpKGzY0hDN7v0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmh0nUUFAwAAAAAACgkQqh6bcSY5nkZL
9Q/9FCx+iZfnDpv4adAZUhhcQLWQf7jzJgALlNXDNQDjDprKNLIs8GCeAn1GbQYN3f/nvw5zryYp
T85betNYc9Sbq3F5hzFycZD1tj+vRo0VPLBxrjlqVnWl4zjj7XCeYQSd6D4FRaxlYKGE9EKW6vsQ
FoQGwO1pVOiwZLAQvrTn7c7n0G+aaQPJLjgwkuPoXqCcIBZM0JmG7N1SM9OI7UHSFaKHsjLcfvKq
ggFkzN8or3XlQ+1+mYffdwb1qfYQm3WCvT3QV09sdBmMhqvnf4uUvL5rvuJDUC6zENXWNWfBfVta
LbQgj0VUJzYmLZ9+RAu34PbJ8iUZJPY1Jferh565iRtLZBDSRDhLstQ955mwA/dRCGdliTVdFaVN
o1XJdHAw9+29TWpCe16wzV+yBaSAJ7T1kz/PWwxZiUCyuEZdIYSz082nNS6AwK3N+Pou/m+tJRlT
bjGgTTRkYv/zlZnEthvX6q2qZDnfwCOnBm4L+e6URSGBzcFJrV0wbnIX/KDgRHvQ3xYre3Hf1DE0
8NFdblEiQl90+aLZp5n/uYYFvc6WRGbZfY6RNaCiY0mD2tjeB+Xrnkc3uB3S8tyL8yXN+lv1y7af
ye1dOu7TGQMPKabFZf1PBbJ6sgUk5c1+rk1iIA+h/1Amd5wz4OvGXTSrRZW8cCvMrto9wLaywqXT
OWA=
=WI+0
-----END PGP SIGNATURE-----

--------------0qp0LvcipNDGpKGzY0hDN7v0--

