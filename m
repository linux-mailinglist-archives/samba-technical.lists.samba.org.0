Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DCC24A6DB
	for <lists+samba-technical@lfdr.de>; Wed, 19 Aug 2020 21:24:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=LVo04lfz8CjUB4AVFJsapVU8JpFI1sjxAYeR7/FwdjI=; b=sCACitnZ+rA9DslTvzQIhN6+gB
	X7HJww5aQOS29XBqsR0PbK+MsM6FwArn3VtdilaHi3MQ/W8kWtC7mYjM2n6pMKmE2Bo4gHaodw4dW
	gectISQ0a5MS7VxhRARxcqCbjJpUPDMStFA9t6ChUOvwwLJSDEabjPN9r+35kvkTV7B9B1WHizGc8
	pN55NmE5an6arnNX7RGddVS2xIjuOGMIMX856tE6UqaHo4jTlNAIeusxSericsm5JXYS52vOH60pw
	TyhyOcIQl5S053sVr5T8tKfK3Pqn2pyuj8XFART3an5rAnhsp9TM3+vtr37EgmjVyw3PrL06wvn33
	UKAN6YHQ==;
Received: from localhost ([::1]:37018 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k8ThI-00EJcg-DS; Wed, 19 Aug 2020 19:24:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28562) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8ThA-00EJcZ-91
 for samba-technical@lists.samba.org; Wed, 19 Aug 2020 19:24:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=LVo04lfz8CjUB4AVFJsapVU8JpFI1sjxAYeR7/FwdjI=; b=wZHrhoSV84PtGqdAf8uAAYKGyx
 SI6I4frmqh5tCTITPa4nDEbw5cKnFQrqH+FI0oYqb71nEPyk0krY5Ok986aU5HeNTeDt2Ny/1ezWC
 DXDOCvzGjRtdeU4je/6TSPF3xeazV/U8gWAiXdlrw6LWHrE1iCvQziYHWcXVrvVZg4RELDkL5a9ja
 m8b0MJL3mo/O5ikGoBmS3EloWrD5cAxzACTO4srGVvbDMfD/PBlxO6eAb8qGLpZBlJLY22My1SsFi
 jDVbCmTp4MY177N7ch9/3xl+Ni+VK6y3pjYQ42K4aYTIsoObiQgkkJgXSLYbnlO72tKu+tJ4Ij+YI
 cQU7frig45E99qIi+Yxy4NHZQGr22yNdiFvL5XHuF2WfADbdl+QWEVX/LXiWLnFTg2Voiy40X00Mj
 XEJ2t6ndLHusMvVJ26tJZcqJ/1s3sXEeM2K6XFN91yK9LjWICuREc45BOrEQ8OHFAJnA/Mxny8WJi
 MAsoVNE4ejIZIZ5THek51+rj;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8Th9-0004JF-Eq; Wed, 19 Aug 2020 19:24:23 +0000
To: =?UTF-8?Q?Pavel_B=c5=99ezina?= <pbrezina@redhat.com>,
 Jeremy Allison <jra@samba.org>
References: <6c7d3f9b-240b-c022-2672-7dd493922050@redhat.com>
 <20200818163118.GA8897@jeremy-acer>
 <84f904bf-0a67-4595-2ab0-de4fa021a7a5@redhat.com>
Subject: Re: tevent: fd events do not work correctly for UDP socket?
Message-ID: <ab30a78a-c442-d5a4-614c-3be0c32e680c@samba.org>
Date: Wed, 19 Aug 2020 21:24:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <84f904bf-0a67-4595-2ab0-de4fa021a7a5@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="ACIUXPHeK0h6hhxjXOBWVmqhSHAvpPAnK"
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ACIUXPHeK0h6hhxjXOBWVmqhSHAvpPAnK
Content-Type: multipart/mixed; boundary="YuAHDaSS3aya1VCb5ZIEUPYM9hTcrP22s";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: =?UTF-8?Q?Pavel_B=c5=99ezina?= <pbrezina@redhat.com>,
 Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Message-ID: <ab30a78a-c442-d5a4-614c-3be0c32e680c@samba.org>
Subject: Re: tevent: fd events do not work correctly for UDP socket?
References: <6c7d3f9b-240b-c022-2672-7dd493922050@redhat.com>
 <20200818163118.GA8897@jeremy-acer>
 <84f904bf-0a67-4595-2ab0-de4fa021a7a5@redhat.com>
In-Reply-To: <84f904bf-0a67-4595-2ab0-de4fa021a7a5@redhat.com>

--YuAHDaSS3aya1VCb5ZIEUPYM9hTcrP22s
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Pavel,

>> Do strace ./client to see why this is:
>>
>> The key is here:
>>
>> write(1, "File descriptor is readable!\n", 29File descriptor is readab=
le!
>> ) =3D 29
>> read(4, 0x7fffeee02750, 254)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =3D -1 ECONNREFUSED (Connection refused)
>>
>> Your connect call succeeds, as it's setting up the local
>> binding to the remote address, but as it hasn't sent any
>> data yet the client hasn't noticed there's no one listening.
>>
>> Once you do the:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *msg =3D "I AM CONNECTED\n";=

>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write(fd, msg, strlen(msg));
>>
>> call then the kernel tries to send the data, notices
>> there's nothing listening and so the read fd becomes
>> ready via EPOLL - it needs to return the error
>> ECONNREFUSED (we select for EPOLLIN|EPOLLERR|EPOLLHUP).
>>
>> So when you call the read() in the tevent handler,
>> that's when you'd pick up the errno =3D ECONNREFUSED
>> error.
>=20
> I see. If I understand it correctly epoll returns EPOLLERR and the code=
 hits this [1] line?
>=20
>> I don't think this is tevent specific behavior.
>=20
> If the above is true then tevent should provide way for the handler to =
check for errors or don't call a read handler on an error so read does no=
t get called.
>=20
> My use case is that I'm trying to implement a CLDAP ping over UDP in SS=
SD and when a Domain Controller is unreachable the read handler is fired,=
 then ldap tries to receive
> a reply and blocks until network timeout is reached which is undesirabl=
e.
>=20
> [1] https://github.com/samba-team/samba/blob/master/lib/tevent/tevent_e=
poll.c#L707

You need to mark the socket non-blocking in order to avoid any blocking.

I have some patches to add TEVENT_FD_ERROR, but they are not upstream as =
there wasn't a strict need for.
In the beginning select was the main backend of tevent, there was no POLL=
ERR,POLLHUP.
So errors are reported with TEVENT_FD_READ, as a read/recv is typically r=
equired to get the error.

metze


--YuAHDaSS3aya1VCb5ZIEUPYM9hTcrP22s--

--ACIUXPHeK0h6hhxjXOBWVmqhSHAvpPAnK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl89fGMACgkQDbX1YShp
vVZGUg//ZhNz2C2PdkgcqJt+fdv4hNlF99EfrHIMBi4XpscYGOXssRRfBudarlTP
4WOJs3IUOgnyrfy4IldhIrsajrVsYDtlE3xw73oOJRxZkfI7jAc0430DsySjVPMZ
vdflUBtbVlhyUJcJzxz5crlSTAAZ+Z+EwjdgawvlnMqTZPUpHGXJmLGZmZ9BmNny
MskTr0OngpIeQFzY12gyegX1JGyz7thOaZDMN2vJsD3FlWO2IHwcrCc0K9qcIt4H
reWmY1vzaWs7kIbmLAdLL9zSPxL5Kd1FS1wN7gN8SOVhZWr8rIEJb2BvpQA/RIMe
PybqaNXNARXDKDfbrA/l4v5gJHZsT5tp/sZzEyRJK/FDSeoKmwCkmb8iVS4Gborc
qUHPJlUMITt/5Ksmv0erEsd2VT0jGcdLjB4WJWGDsuAi5LGIrAqJW/IPODwdxrS7
Odr7g9IDkj1UeeVKsPh923l+82WEja3E4ffbxvA40G+NiV4ldFnQ1SirqJyUtlvC
xXFlXsBos0KeCjw2ibhDMb8xzS3bTfW00FyYx9BvUeXG2LkK1OKVeB1mmyA0W4We
fJPNF7SFHj97tootbqd88HDiyLhfZSVYPhOzkerER0FZHjXMEM/yLkHYEMCdRbRv
l29bMxhtbD9/WYnK25kjJBPKw86rg11xiNR+LwvIwClZjBP3xTA=
=nyRJ
-----END PGP SIGNATURE-----

--ACIUXPHeK0h6hhxjXOBWVmqhSHAvpPAnK--

