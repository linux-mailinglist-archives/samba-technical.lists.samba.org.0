Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF2C7867DA
	for <lists+samba-technical@lfdr.de>; Thu, 24 Aug 2023 08:52:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=GIffYgZMu2leErS9okeZByia2hW4PNyy2WQJrmADjIY=; b=S2Nm6I5ZqKYs+1Fa0LAEdRk9YB
	DGif6ccK4y8YeDBRrmXBmnHZACpSjX0X4pUhpGIlhRxAfj2YfHgNAQN9svCmZ8d/c+n177u/GFuxb
	JP54Ct0gsry7Kilg8JcZblLQB/ZYjPtHkN3q615Yili3WMg3Uqdf24lA3GT05ThT88PMP5awS8M51
	J4XPEcw9E6PtXmjS0RfY7F0n+l0pEy3VOqOhDVpk51af6O4C6M2W/lm9tDtJEgr20S7nRBlS2StPn
	FsHGfBhrOazvIzNWkjjqMNdh3OAqlU4cSHYsbj0JXmeThLy2yh75VMNInkyCd/ADptvU0HTsBbHAk
	3Ns9YktA==;
Received: from ip6-localhost ([::1]:33746 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qZ4CG-00EDlk-70; Thu, 24 Aug 2023 06:52:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57782) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qZ4C2-00EDla-HP
 for samba-technical@lists.samba.org; Thu, 24 Aug 2023 06:51:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=04+0++++N1pTG8gt3MIt/nGSHX6cFQ4eGjOrE4OOVP0=; b=3/ugEVBML6VrOdMiR52I8TKsd5
 qwqqrwYdDvRy+nMGX3NCgBbRC3Vh0SX76KoXnuy/Yl8IfFWkawPk4i0TXY7JHMZsCx+AhY4YckQ7p
 CmGiOW2uxmEG4bPwquaGD7iHGTl9/32M0k7cgb8SdHA7Bog5bHCj6yOOW1ElTYUsU7QydCswDNWRE
 Z4I95Hxu0ljYi5DxuM5ApYNbinzZXC6lEm/6L9sbtQd5BG2UUPbY8pa+MwtGAR72FSNO2cl1ix+Co
 yLAGfdMtJQnqVVsKjVq4kwIQmIv5B68fDie8q+thIVuirz5KmRegKvoU2BFLH8D7ObA7/vxjUnyn5
 Rn6dLmf9j+beOR+GV5S74KJPJwP0rpumpU6kGuEt+KjLo5EBaXS5qqbXK8ExP0iIKkaWGe72b1ych
 ntsu4cAeexab3+Z+8qsJsmKZGZ7V9Eva62gy3DcNg1ldEXGUT5EqUBnu4+FN9ZF/AnfF7WWH4cFLo
 Z6rBA8RNxbDuoFGVOdgoORLx;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qZ4By-009jVf-0n; Thu, 24 Aug 2023 06:51:44 +0000
Message-ID: <cf543da39afc8785f1ad3ccef17097868548c039.camel@samba.org>
Subject: Re: Does the Samba AD functionality support setting up a Samba
 server as a DC in a subdomain to an existing forest?
To: Richard Sharpe <realrichardsharpe@gmail.com>, samba-technical
 <samba-technical@lists.samba.org>
Date: Thu, 24 Aug 2023 18:51:39 +1200
In-Reply-To: <CACyXjPycDO5qNT=ibbS=4Wqvua+tDVtn3dhQ-dw1gJaktMOj6w@mail.gmail.com>
References: <CACyXjPycDO5qNT=ibbS=4Wqvua+tDVtn3dhQ-dw1gJaktMOj6w@mail.gmail.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2023-08-23 at 22:28 -0700, Richard Sharpe via samba-technical
wrote:
> Hi folks,
>=20
> I want to set up one (or two) Samba DCs in, say test.qa as dc1 and
> dc2. There seems to be clear documentation on how to do this.
>=20
> Then I want to set up another Samba DC in subdom.test.qa as dc1.subdom.te=
st.qa.
>=20
> Is this supported by Samba 4.19 and how would I go about doing it?
>=20

Not as a subdomain in an existing forest. =C2=A0Only as a distinct forest.=
=C2=A0

I started the work but never finished it.

Sorry,

Andrew
--=20
Andrew Bartlett (he/him) https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Developer, Catalyst IT https://catalyst.net.nz/services/samba

