Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 576EA102D48
	for <lists+samba-technical@lfdr.de>; Tue, 19 Nov 2019 21:11:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=3BtJ1zMcxUx0iMXSHeLZyfUZRzjGXtWWynrn03LdZKk=; b=HWcxQdXWy1EL8WyKKt5EVigSPC
	HGvptftQktXbWRIP+Iy/ypJn5bGyCbFZBa5uBWOxzYFsdBWQkoAcpT0FTqIklDDi9KCxZOgm/Pqej
	9KBtNFx4sPmY1WapfcRjBY1dLx82W3eWfiulwWGzhySdnissTt3gdBFSxKWWRmNDR/ulBeGdfcpyl
	ASytX5W+vuCI7tS0F3hVOkXZ3afqBOrPJFGnepjI35RkoGDjaT8U0p3TE7G1VveNi8f1Y0LK9rZ4n
	YA3I8hj9SKHLAUnTSyv98poxMcUv7viWj1JND2Bcd27ozrebZZo+bzZpGmOyVd1kX4jvckXgEouV8
	KBl4RTLg==;
Received: from localhost ([::1]:23338 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iX9pk-001euz-8W; Tue, 19 Nov 2019 20:10:44 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:39584) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iX9pf-001eum-VQ
 for samba-technical@lists.samba.org; Tue, 19 Nov 2019 20:10:42 +0000
Received: from [IPv6:2404:130:0:1000:295f:724:d9bc:f644] (unknown
 [IPv6:2404:130:0:1000:295f:724:d9bc:f644])
 (Authenticated sender: gary@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id D159F80F20
 for <samba-technical@lists.samba.org>; Wed, 20 Nov 2019 09:10:13 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1574194213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp:autocrypt:autocrypt;
 bh=3BtJ1zMcxUx0iMXSHeLZyfUZRzjGXtWWynrn03LdZKk=;
 b=gKaa48SXc8+U8g8GJUIzu+bSUol/ibholmEKqMmAUhp8N/hxneOFdOrYrklNYxCfrSRjEF
 qpcB0Jh8lnhAxma0LuK5bQm4ioClux+7ysE0kjyynENJnhgWholtatb4Lfn4E3y2+fRQNw
 IWdsbcd0suV5Dc7w/FSSN/F/OVYSRUZDEIL/c38dwVyfWnDkPeaWybVyTH+WTEwJcFI81T
 WpED8wAqfjWJj3+zezap8mETK2xSMz0lDTK3CjpJrSmf/so2XxHW0AVYuWIYMLNdNBdPL5
 P2cWzkpsjPBsJt4h7HoxwH3b6dfd2ASwg/D8OTZzcJsygHcgAJGyRylonixqSA==
Subject: Re: feedback on ldap improvement in samba 4.11
To: samba-technical@lists.samba.org
References: <4ac9eeeb-211b-ca35-d234-6648c612ce3d@tranquil.it>
 <9dc8dc485f6bdf08823c5a86043c459c51ffd173.camel@samba.org>
Openpgp: preference=signencrypt
Message-ID: <230ee6a4-d875-d749-cb60-80eb8ecd25d0@catalyst.net.nz>
Date: Wed, 20 Nov 2019 09:10:07 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <9dc8dc485f6bdf08823c5a86043c459c51ffd173.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="sHueZC9JrH1nGLEBZqyFWShqAtjsP8GkC"
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
From: Gary Lockyer via samba-technical <samba-technical@lists.samba.org>
Reply-To: Gary Lockyer <gary@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--sHueZC9JrH1nGLEBZqyFWShqAtjsP8GkC
Content-Type: multipart/mixed; boundary="mqD2NQFqUpxAEXUug9R8anPDrRku0TKnY";
 protected-headers="v1"
From: Gary Lockyer <gary@catalyst.net.nz>
To: samba-technical@lists.samba.org
Message-ID: <230ee6a4-d875-d749-cb60-80eb8ecd25d0@catalyst.net.nz>
Subject: Re: feedback on ldap improvement in samba 4.11
References: <4ac9eeeb-211b-ca35-d234-6648c612ce3d@tranquil.it>
 <9dc8dc485f6bdf08823c5a86043c459c51ffd173.camel@samba.org>
In-Reply-To: <9dc8dc485f6bdf08823c5a86043c459c51ffd173.camel@samba.org>

--mqD2NQFqUpxAEXUug9R8anPDrRku0TKnY
Content-Type: text/plain; charset=utf-8
Content-Language: en-NZ
Content-Transfer-Encoding: quoted-printable

Yeah still a little reluctant about having processes ignoring SIGKILL,
but given that we use the control pipes to shut down it should probably
be ok.  It's just going to require a bit of thought to make sure things
can be shut down.

Ng=C4=81 mihi
Gary
On 20/11/19 08:53, Andrew Bartlett via samba-technical wrote:
> On Wed, 2019-11-13 at 11:24 +0100, Denis Cardon via samba-technical
> wrote:
>> Hi everyone,
>>
>> I just wanted to say how impressed I was with the improvement in
>> memory=20
>> handling in ldap server in samba 4.11 that were announced in the
>> changelog.
>>
>> I was doing some debug on OOMKiller issues on a Samba-AD 4.9 with a=20
>> large database in production. There are some buggy softwares that
>> make=20
>> queries for all users (the most peculiar one I have seen is a print=20
>> driver...) and Samba 4.9 properly handles the query but allocate
>> around=20
>> 2GiB RAM for the query while the client downloads the result. With a=20
>> handfull of such queries piling up it can quickly run the server out
>> of=20
>> memory.
>>
>> On the other hand with Samba-4.11 memory is allocated in a much more=20
>> frugal way and it can handle hundred of such buggy queries without=20
>> crashing (it may be slow but it does not crash). So kudos the
>> Catalyst=20
>> dev team for that great piece of work!
>=20
> Thank you so much!  This work started long, long ago when Simo (at the
> time controversially) made ldb async, so it was really nice to be able
> to finish the job and see the end result finally show in something so
> valuable.=20
>=20
> When we did it, we were not sure that it would help outside our
> synthetic benchmarks, so to hear the difference it makes in the real
> world is wonderful!
>=20
>> About the prefork model, the master ldap process is properly
>> restarting=20
>> the child process after a SIGTERM but it is not restarting after a=20
>> SIGKILL. Is it normal?
>=20
> I get Gary's view about a manual kill -9 respawing perhaps being
> unwanted, but I agree, a re-spawn system that doesn't cope with the OOM=

> killer is less than ideal, I would have expected such a process to be
> restarted (perhaps after a bit longer wait).=20
>=20
> Andrew Bartlett
>=20


--mqD2NQFqUpxAEXUug9R8anPDrRku0TKnY--

--sHueZC9JrH1nGLEBZqyFWShqAtjsP8GkC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEDO84T/PRptSsMEixei/9ZKIyR1MFAl3UTCQACgkQei/9ZKIy
R1OXMwf8C3w5TCCSOpX0eD3gCwV02OuCBcsXbnNgz7wkpHNeWIKYc+9frNf6ONPI
xv8dFFCn8tP1SRxO1jIY+Ww3WuLCCU4q1V6qFAv3zd322LrMM7Wuet7YdxyFswuL
qOJZbR1d+HUYRaeznEKRdqDfdUZTqc/XmG8qDUuexo5/Hg7cZ8ijymlf6kmLsa9d
vBzDlMw/zcM3ljO6SZo4QRx4mKlxqmTBWcLJUY6VnZxaUMwzAzB/wFzk4JGvAn1o
+qyNMYXbfLKToYflLvBdCXt+CcmG7S1k3Dm8BV+B6o8OG1oX1VZTdVliyv3jhQ0p
s7Ma0czpVB6reh+7MAx0ILCP8YlMpA==
=xBwg
-----END PGP SIGNATURE-----

--sHueZC9JrH1nGLEBZqyFWShqAtjsP8GkC--

