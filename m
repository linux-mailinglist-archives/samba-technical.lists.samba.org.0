Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C56017F7EF3
	for <lists+samba-technical@lfdr.de>; Fri, 24 Nov 2023 19:37:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=OW9JtVD6BTtkQ4CTwRtvSxTayySgY6icsP62xDO++DM=; b=WsLdOdQnrLDCATOquKr6kfRLKe
	v7WklW3KglFLNTvtMgwnHhGKEfv7UhUWBBxkbxeG2j+UuFh/SpALxU/PqxHJSRBtzFiOE9rf0f6SB
	xqpnBSy03X+ThRzDgbm4DaiP0mBCdPeYGVrHpkYAUDNCpw8NivUfMfWyFxSqv2PSbdxqcSP6KWucE
	3MQ68dUVsDNrbDH5jlYiSMFnhG6mwNm/IUA0RUXoRRgOOki/FdZ+AC7CpoxrU90AFhUim0g0gxEo9
	PDAN7a4RdE+AnWLWX2HxGu8TcfljyAjS0Q/K2IbQIHSoAxSOVxtYRI/2tsg8DiVDBaBK2tWaeruU5
	eDH7Giqg==;
Received: from ip6-localhost ([::1]:40630 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r6b2h-000V8k-Ap; Fri, 24 Nov 2023 18:36:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53808) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r6b2b-000V8b-Vi
 for samba-technical@lists.samba.org; Fri, 24 Nov 2023 18:36:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=OW9JtVD6BTtkQ4CTwRtvSxTayySgY6icsP62xDO++DM=; b=TuPA6RuBiFETAqixwj02VCmqaa
 J1SV9ZxwPOwhGS7ukQ5uazPrGdt+woTfBHGvWfq6J67iILOUmOxq4kA7g8LkfarzJJncCTeI3LtCF
 PIHeQF+ch8U8IIUFuIEUvRSzZpWmg3+mdxK6LCkui5IPHmuEGB/AHj0tSbG/ClWfS8VwGi+4yYyBK
 ZvgE2J61xntFsxw+qObbwWvS2X7x1Wjx19u7sloOaoaGdJ/q2neRFoZv76y+eQNBM4ZIIN9llxocM
 9a2DpcQ/6AtX6An/QiDE9Bnux7oZW9DQerqNOjflKa7jX+tKZIsaT0MuLGE5gO8A51q5+blj/yorq
 jP2OBSe6ycbHZEo1eUXlUPJWPgLROsFLJJXIMhr2lxtWugLjZ7hwtvzkdyajHdmzI3/d5upe+uefN
 S5gMrJ4z6eR0rG1xDSUiyVB1DshMZR1TgajjOeZ6a8YxKXwBBzbenWeBlqTbtp7Vupiol+dXnnROM
 xY8vCbnRU5fbWFfC+uMRKlE7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r6b2Z-000PSz-0t; Fri, 24 Nov 2023 18:36:35 +0000
Message-ID: <e05f7cb9-38ac-4281-aa5f-bf178714b47b@samba.org>
Date: Fri, 24 Nov 2023 19:36:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SMB3UNIX] Add POSIX-FSA and POSIX-FSCC
Content-Language: en-US, de-DE
To: David Mulder <dmulder@samba.org>
References: <b63ead3c-f0dd-4acb-ae01-14e887d1d03e@samba.org>
 <3bf22a9f-ed05-baa2-3698-5870ca9e957a@samba.org>
In-Reply-To: <3bf22a9f-ed05-baa2-3698-5870ca9e957a@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WZo4XVwORKKIWaQ7oRztEUJr"
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
Cc: Paulo Alcantara <pc@manguebit.com>, Stefan Metzmacher <metze@samba.org>,
 Steven French <Steven.French@microsoft.com>, samba-technical@lists.samba.org,
 Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>,
 Volker Lendecke <vl@samba.org>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WZo4XVwORKKIWaQ7oRztEUJr
Content-Type: multipart/mixed; boundary="------------Lu98PndvUlE2aUrYh7pBID4s";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: David Mulder <dmulder@samba.org>
Cc: samba-technical@lists.samba.org, Paulo Alcantara <pc@manguebit.com>,
 Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>,
 Steven French <Steven.French@microsoft.com>, Jeremy Allison <jra@samba.org>,
 Volker Lendecke <vl@samba.org>, Stefan Metzmacher <metze@samba.org>
Message-ID: <e05f7cb9-38ac-4281-aa5f-bf178714b47b@samba.org>
Subject: Re: [SMB3UNIX] Add POSIX-FSA and POSIX-FSCC
References: <b63ead3c-f0dd-4acb-ae01-14e887d1d03e@samba.org>
 <3bf22a9f-ed05-baa2-3698-5870ca9e957a@samba.org>
In-Reply-To: <3bf22a9f-ed05-baa2-3698-5870ca9e957a@samba.org>

--------------Lu98PndvUlE2aUrYh7pBID4s
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMjAvMjMgMTU6NDMsIERhdmlkIE11bGRlciB2aWEgc2FtYmEtdGVjaG5pY2FsIHdy
b3RlOg0KPiBHcmVhdCB3b3JrIFJhbHBoISBUaGFua3MgZm9yIHdvcmtpbmcgb24gdGhlc2Uu
IEknbSBmaW5lIHdpdGggbW92aW5nIGl0IA0KPiB0byBzYW1iYSBnaXRsYWIuDQoNCmNvb2ws
IHRoYW5rcyEgV2UgY2FuIGxhdGVyIGFsc28gcHVibGlzaCBlbHNld2hlcmUgaWYgZGVzaXJl
ZC4NCg0KSSd2ZSBub3cgcHV0IG91dCB0aGUgZG9jdW1lbnQgc3BsaXQgYXMgYW4gTVIgb24g
Z2l0bGFiOg0KDQpodHRwczovL2dpdGxhYi5jb20vc2FtYmEtdGVhbS9zbWIzLXBvc2l4LXNw
ZWMvLS9tZXJnZV9yZXF1ZXN0cy8xDQoNCk1SIG51bWJlciAxLCBob3cgbmVhdCEgOikNCg0K
SSdtIHB1dHRpbmcgdGhpcyBub3cgb3V0IGZvciBicm9hZGVyIGRpc2N1c3Npb24uIElzIGV2
ZXJ5b25lIGhhcHB5IHdpdGggDQp0aGUgaWRlYSBkZXNjcmliZWQgaW4gdGhlIE1SPw0KDQot
LS04PC0tLQ0KQXMgZGlzY3Vzc2VkIGluIHByaXZhdGUsIEkgY2FtZSB0byByZWFsaXplIHRo
YXQgd2UgcmVhbGx5IG5lZWQgdGhyZWUgDQpkb2N1bWVudHMgdG8gcHJvcGVybHkgZG9jdW1l
bnQgc2VydmVyIGJlaGF2aW91ci4gSSdtIHByb3Bvc2luZyB3ZSBjcmVhdGUgDQphIHNldCBv
ZiBuaWNlbHkgbmFtZWQgZG9jdW1lbnRzLCBmb2xsb3dpbmcgTWljcm9zb2Z0J3Mgbm9tZW5j
bGF0dXJlOiANClBPU0lYLVNNQjIsIFBPU0lYLUZTQSBhbmQgUE9TSVgtRlNDQy4NCkluIHRo
aXMgcGF0Y2hzZXJpZXMgSSBhZGQgUE9TSVgtRlNDQywgbW92aW5nIHRoZSBmaWxlc3lzdGVt
IHN0cnVjdHVyZSANCmRlZmluaXRpb25zIHRoYXQgd2VyZSBwcmV2aW91c2x5IGluIFBPU0lY
LVNNQjIsIGFuZCBhZGQgYSBib2lsZXJwbGF0ZSANClBPU0lYLUZTQSBkb2N1bWVudC4NCkkg
YWxyZWFkeSBoYXZlIGV4dGVuc2l2ZSBhZGRpdGlvbnMgb24gdG9wIG9mIHRoaXMgZm9yIFBP
U0lYLVNNQjIsIGFkZGluZyANCmNsaWVudCBhbmQgc2VydmVyIGJlaGF2aW91ciwgYW5kIFBP
U0lYLUZTQSwgZG9jdW1lbnRpbmcgZmlsZXN5dGVtIA0KYmVoYXZpb3VyIGNoYW5nZXMgbmVl
ZCBmb3Igb3BlbiBwcm9jZXNzaW5nLCBkZWxldGUtb24tY2xvc2UgYW5kIA0KYnl0ZS1yYW5n
ZSBsb2Nrcy4gTW9yZSBpcyBjb21pbmcuLi4NCi0tLTg8LS0tDQoNCkZ3aXcsIHRoZSBXSVAg
YnJhbmNoIG9uIHRvcCBpczoNCg0KaHR0cHM6Ly9naXRsYWIuY29tL3NhbWJhLXRlYW0vc21i
My1wb3NpeC1zcGVjLy0vY29tbWl0cy9zbG93LXdpcA0KDQpUaGFua3MhDQotc2xvdw0K

--------------Lu98PndvUlE2aUrYh7pBID4s--

--------------WZo4XVwORKKIWaQ7oRztEUJr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmVg7TIFAwAAAAAACgkQqh6bcSY5nkaO
4A/9HE5LafpRYijvomlc6yjueUb471j6Lem1W6lWgrqe4FREsNVJF2e5jjtcF0OCizFZ8YVhXZY3
tIYocd/cy1Cjxe976RD96xxAAex9twiaJ3rnS9NmhgjKE9uwWDX9/ntmsYTWQwOYtD8bmVBY+W9+
wCA+NskU+BcKgrkXdKYJoBEIYWD1FUuVedjXrmRUFIlxuQxpur86OAkXrMPN7ppXTSorGZq6LA4G
a+Y4S474cEj3LIAIgWvr12RvhWHD8mcx9mF+s6GkMPCMVnUEhggZ9KUdSMPysqC+T51zjnqA/RVL
mkTM5dQ4UhplKGg1n0j64rH0DabvlmizVv4cYbKkuVfPTqBsTJtJzHEspBRlMEaz1uEAVp8/BC3t
LLvIHq3aVpXAWFgRLrgNg1vRaPg86cMGv90fe3lArgIrftcwqhNFGm9btWCeBqg0rYh5nZFZPoYS
zR+eLb4J2wrbGbFZXom21D1cCWhqYk6oopNgmPcGSZkDg6xnLEdTt3Pf5uGsWclxACzd7YpJWlDl
7JOIwfOCV1So9fZ+HcChLCnDGr/DGzxggYCOSOZXso7L06SAUZ0qXwX0sccqYE61+XiipO+ig/wN
Ewy9MxWf76KYHmsge0b6uBeCf0tjZGPIBDGfTTNZLylz9n4rQY+/I5GbzxkJVyn9fm72hs//kxlD
taI=
=g+vB
-----END PGP SIGNATURE-----

--------------WZo4XVwORKKIWaQ7oRztEUJr--

