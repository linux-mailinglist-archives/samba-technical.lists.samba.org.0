Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AD052D1341
	for <lists+samba-technical@lfdr.de>; Wed,  9 Oct 2019 17:53:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=uzkFryiPEZY9D6iORp+GK49fsJ86d2xPtkn+uuBaKys=; b=D4Bet2zIzQ95x86B5S05qle1tM
	1+uTaowrLDkBNXWlL9yJkTv9p63ueLMelPW/tE22toN5HUJMk5l6DFYytgF7yeRiThUNwx1TUDzRA
	myJM1k5TiECYuTNH9mNWOo0KQ12mFoC1VhAlte6RmDgNe2XIAQyyWN/OGhq0m0W9HK4J5eYcP/6u3
	xC9UuXqTNedQ4b983GHN1B5WQKZCyjahaJgelzLLkYp9ByljJaP1rLyeuqJOAzUS4rB3LvQLn7Krq
	VcE2fgg+IOLJHI6op0LYsytbdMnCzctM5P3M7v3M6wCxIb/JmatCam0KwJEJ6ix3FaY5uUaa//q4z
	yWEmcbmQ==;
Received: from localhost ([::1]:28894 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iIEFf-002QFs-Km; Wed, 09 Oct 2019 15:51:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58040) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iIEFb-002QFT-SI
 for samba-technical@lists.samba.org; Wed, 09 Oct 2019 15:51:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=uzkFryiPEZY9D6iORp+GK49fsJ86d2xPtkn+uuBaKys=; b=2L4mG+ZkQialTD88Hx2xKEEJlK
 YWGYGZW9052uHxtR2iOKtu4gNM6dcWzH2Ci8/nTPU2PePda7oNchuHImva501C7b+qNH01wbBQeoP
 b75iy11ykYkAqheTrg42rlJtgGOJGkt5adV13bT+iE8ezts+k4s1/pmJVOrJqBvqPnTRhSTKgCN0p
 unlNgr3QcctdlZU0yoqa0AVW9cny1pMVJ9QdoqNMRZGc9kfID42n+Dan5XxEx9ie5b3+hybD8uod3
 lt4fygC5aDo8tZQwKi+1j7kIS6buOs1PewjHbaly8lrnhG6Aw/W0vlU+BFUF6Eu9BtkJKdHzrtnMc
 eUoGPtoOqx83hroQhlkVDnJBozJKhQBIoPHQc04tRQP9HWImEbrK0Vulgv1K1im40Zf2UFn5twUKF
 Ee9QS8Uqhr7MNmlTGeQO5kuxoYRoO3XmWfhVbIKafvXoBmRMIIisaV5URbyx9YXpemL+9Pa0hHzG9
 1Sim36SUEuOeyWy8CNhRyTv7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iIEFa-0000tl-IC; Wed, 09 Oct 2019 15:51:42 +0000
Date: Wed, 9 Oct 2019 08:51:40 -0700
To: Rowland penny <rpenny@samba.org>
Subject: Re: Samba and legacy Windows support
Message-ID: <20191009155140.GA144847@jra4>
References: <5849953.E8HlOTvGIY@magrathea> <20191008182451.GA1583@jra4>
 <288345e4-890f-bf07-7f3d-e170f1266d46@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <288345e4-890f-bf07-7f3d-e170f1266d46@samba.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Oct 09, 2019 at 10:25:19AM +0100, Rowland penny via samba-technical wrote:
> On 08/10/2019 19:24, Jeremy Allison via samba-technical wrote:
> > On Tue, Oct 08, 2019 at 10:59:41AM +0200, Andreas Schneider via samba-technical wrote:
> > > Samba with version 4.11 currently still support a lot of systems which are
> > > already out of support. We still get bugs to either fix support for Windows
> > > NT4 or OS/2. Also we know that Windows Server 2003 with Active Directory is
> > > still deployed.
> > > 
> > > In order to remove support for those platforms which are very long EOL, we
> > > should try to make announcements when we plan to remove support.
> > > 
> > > ## Steps planned
> > > 
> > > With Samba 4.12 we plan to disable SMB1 by default and then remove support for
> > > it in Samba 4.13 or 4.14. This means end of 2020 or beginning of 2021.
> > I think aiming for this by the end of 2020 is possible. There is
> > a lot of work to do first though.
> > 
> > Announcing this is what we're going for is a good first step to
> > allow people to prepare to move off SMB1-dependent systems.
> > 
> > Jeremy.
> > 
> You do realise that we are discussing this on an open mailing list and by

Yes, I am aware of that :-).

> doing this, we could be seen to have already announced that we will totally
> drop SMBv1 from version 4.13 or 4.14.

"Announced" is different from discussing on samba-technical.

"Announced" to me means something on news.samba.org and also
in the release notes of the next release.

That makes it official, whereas decisions here aren't.

