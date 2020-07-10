Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E08921BD0B
	for <lists+samba-technical@lfdr.de>; Fri, 10 Jul 2020 20:32:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=1Xf3MTds9GYeQACB/erF7w/PD3Ijw555jJ9XkXWUZPw=; b=ZR/tiIYLji8wzWCrQpGqGnv5L9
	F5H18UGUfu9n8ZT0ScdiwjFSOzYdHwIwqauSaBXeO+SYySL4O89+Kl/UOhIgZ4iCC8OpYha/sMXQT
	HuVw7S40cQPfiVALtc2uGN0eYICwyJgmhHSwvHMmRjs/qguMw7LMn8VE/7DCm0o8Kegt2Ycla4ngc
	vd3zgYeBjJs6nqdcMcOza+SNMmkSVMZcehhizT/v0OCUgqCjhVn5JuyYsU182AgHLyM+WlZXYoFIX
	JmENMN3tYmbrm80xxZB8WDcpz3HvpMRYaxU7ZAQRXJBpgFlXu6g/LljPmSw9H1rhWiiCBL9h8ZcH5
	v/PSuIeg==;
Received: from localhost ([::1]:47094 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jtxoL-006hgH-G8; Fri, 10 Jul 2020 18:31:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48734) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jtxoE-006hgA-G3
 for samba-technical@lists.samba.org; Fri, 10 Jul 2020 18:31:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=1Xf3MTds9GYeQACB/erF7w/PD3Ijw555jJ9XkXWUZPw=; b=XUmX42hxjfkGD1er+dEfGR5Fy1
 HIvcfSgibkdOrdTyuvkYFSTeoorURdVVdOhi3wrGVIgukDlTjZ5uk4kuWx7q5mylG7PwXa8UX0qUt
 sEtip5wEfUxipTHWpH5uyWKLUZDI9pLQ1g7V9xOzFVFVzFI245/IJ+tL/esDFTDGQ0abMrNuqtzF1
 rAUbQrs9PFPXKyCeyu3OqmQ9Jz/F9ADVMAcI+EXz5fzuehiJOdHqGWz1NykuPtfolPHwskplquJ6E
 cuYNaJXCbHMjs16mNka8vwXAYj3CSjQD7Rx+X/ubOe8A5bwbGCTxgdQP5P5GMuGIzrzkms4OXJ6rE
 oHI3P3vHcpwIVCDfaJ9LSiZHioIZfcUlKSdgqTqrU2FhOAiROM6WcV/rkb34p0/UA+4Z1stjgd8oy
 HsiYL6Jm5moGXT4okUaFRz/YVRqny2Uben8fUBkDuK6hMrrx1QJ4oTOPD/R8LlYLV8FMbcX5TOlG0
 pffK1pDHwNLeBICvXiN6lDS9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jtxoD-0006A8-2m; Fri, 10 Jul 2020 18:31:41 +0000
To: Ralph Boehme <slow@samba.org>, samba-technical@lists.samba.org
References: <20200710110737.GA1585556@sernet.de>
 <b4ea37e5-398d-c8d2-15e2-1a27f7655598@samba.org>
 <20200710114452.GB1572444@sernet.de>
Subject: Re: PATCH: make disabling of vfs_snapper consistent with our
 configure/build system
Message-ID: <54f90e98-9d7a-337e-defb-27fb756130fd@samba.org>
Date: Fri, 10 Jul 2020 20:31:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200710114452.GB1572444@sernet.de>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="17u3Owe5WKU978LOPqfAUEXZadAuDOOHG"
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--17u3Owe5WKU978LOPqfAUEXZadAuDOOHG
Content-Type: multipart/mixed; boundary="LfriSlvLsVPWpZjp2etl9I0JZTHSsAMA3";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Ralph Boehme <slow@samba.org>, samba-technical@lists.samba.org
Message-ID: <54f90e98-9d7a-337e-defb-27fb756130fd@samba.org>
Subject: Re: PATCH: make disabling of vfs_snapper consistent with our
 configure/build system
References: <20200710110737.GA1585556@sernet.de>
 <b4ea37e5-398d-c8d2-15e2-1a27f7655598@samba.org>
 <20200710114452.GB1572444@sernet.de>
In-Reply-To: <20200710114452.GB1572444@sernet.de>

--LfriSlvLsVPWpZjp2etl9I0JZTHSsAMA3
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Bj=F6rn,

> On 2020-07-10 at 13:22 +0200 Ralph Boehme via samba-technical sent off:=

>> Am 7/10/20 um 1:07 PM schrieb Bj=F6rn JACKE via samba-technical:
>>> can someone pleae review and push eventually?
>>
>> How does this relate to the discussion in
>>
>> https://lists.samba.org/archive/samba-technical/2020-May/135241.html
>>
>> that resulted in commit 7ae03a19b3ca895ba5f97a6bd4f9539d8daa6e0a ?
>=20
> configure --help says (among lots og other things):
>=20
>   --with-shared-modules=3DSHARED_MODULES
>             Comma-separated list of names of modules to build shared. M=
ay include !module to disable 'module'. Can be '!FORCED' to disable all n=
on-required
>             shared only modules. Can be '!DEFAULT' to disable all modul=
es defaulting to a shared build. Can be 'ALL' to build all default static=
 modules
>             shared. The most specific one wins, while the order is igno=
red and --with-static-modules is evaluated before --with-shared-modules
>=20
>=20
> That information was obviously missed in that discussion above.

I don't see why your change would be needed, I actually think it makes
the situation worse, as --disable-snapper is no longer available
and configure would just fail if dbus-1 is not available.

metze


--LfriSlvLsVPWpZjp2etl9I0JZTHSsAMA3--

--17u3Owe5WKU978LOPqfAUEXZadAuDOOHG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl8ItAgACgkQDbX1YShp
vVbQZQ/8CpCUvfyyN0tZngl21PDDZBamAv8uZPd6jlGM7wQBjuYvnIUw5a3kmmtE
z94CCFAJt3pixBvsWU1bXaZS5ECDyF8dnm+YQZXX64x9ECgs2W7sW/YjZkjG22dL
IC/dtHiVnVeoFkl78aEEcNso5l6S9CyB/9ctro6/NS6YG4lqLGuaTfAXu+d8KvcI
3M9t62Wh2v81yP7wy3efT7PhydJ1XKhIP60EkIJURKjkSRxEzvcrgWHfse5s8PMb
ybGdNzcftS9G4zmSnWiPjxmttjoq4JCdGzyqFJP1hyEpmQ71CdT7UOQuiZIiJ9Qw
5dopMRhbcf1QFIC5uiRCNl7HB+XmLwD3o8kqLJCkP5I5RNkTZvxOYB3ql4IIR/B5
3oUOQ/cl+I4r84Kn9dd+14FpW7IlFY8MK55fVUhCrkbc86RAO29IVFmtnQhK3Hyn
x0d8eynw2FdBdKBFbGTxD939B8FTVtQJsg7hsFB205vr972fDWzxJeV4fJoOZ5uv
DF/0jtejXPJgY49yqBhIJymTugCBuufgZ740AgQNRcnM0ZlsFTTgbQNRFujsuk1Q
vQZsUStJwJ9iNFXJqGJEBjC5ZtHBZnGkmi4HBOY/emqZtbWIlUXDplxk2oL1HE/+
dlgNswoNTf5V5c0bT2Y8qAeOXkDieoiFNRHBGVgMR+yt56bURLA=
=QeZ+
-----END PGP SIGNATURE-----

--17u3Owe5WKU978LOPqfAUEXZadAuDOOHG--

