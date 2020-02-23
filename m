Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A443169814
	for <lists+samba-technical@lfdr.de>; Sun, 23 Feb 2020 15:30:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Esko3pH8K+bzc8hAeMoAmh1oNBbrSru2BGU+QRudu9c=; b=nLdRhTS0lVo3HbRt2IzIABBPaB
	S1GQM5/cjxU46WIroutdIjVZWY7f1nU4v88t1bQTbM1o4aecmxFpBeoC0o3pn0lYsBNMhmtHp8gEM
	GgrQ/mwB4/RtnDRzmEk1mKnwKGSi5Rlffda6q2f82QfMg6RiETFf/9rIiFT2SNTPenkX5FwyyyzLg
	xXFg+wBZVAM7kz7yjJvrKuFWv/YXJBCsIsDoThoNCursoiQFMqgid1bWKAVOVNzZaKPW8wautTien
	j+iFHfPtEKUJbs4tUWZSax9m3O6+Ra5asfsdP77+TN3NnENMM5n7q7kFw97vKZ+WN/TbJZkgZY545
	Z3mx3vzQ==;
Received: from localhost ([::1]:28412 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j5sH1-00BBZA-5W; Sun, 23 Feb 2020 14:30:23 +0000
Received: from [80.20.169.36] (port=50347 helo=mail.promoturviaggi.com) 
 by hr1.samba.org with smtp (Exim) id 1j5sGt-00BBZ3-FD
 for samba-technical@lists.samba.org; Sun, 23 Feb 2020 14:30:20 +0000
Received: (qmail 29375 invoked by uid 121); 23 Feb 2020 15:30:12 +0100
Received: from 172.16.1.1 (dario.lesca@solinos.it@172.16.1.1) by
 albatros.promoturviaggi.com (envelope-from <d.lesca@solinos.it>,
 uid 89) with qmail-scanner-2.08 
 (clamdscan: 0.98.6/25731. spamassassin: 3.3.1.  
 Clear:RC:0(172.16.1.1):SA:0(-102.5/5.0):. 
 Processed in 0.307636 secs); 23 Feb 2020 14:30:12 -0000
Received: from unknown (HELO dodo.home.solinos.it)
 (dario.lesca@solinos.it@172.16.1.1)
 by mail.promoturviaggi.com with SMTP; 23 Feb 2020 15:30:12 +0100
Message-ID: <88708706a3ddaf37a6ea43ecd86289c0ada99b69.camel@solinos.it>
Subject: Re: Samba 4.12 rc3: bind DNS say "named: client update denied"
To: samba-technical@lists.samba.org
Date: Sun, 23 Feb 2020 15:30:11 +0100
In-Reply-To: <5b43a40c-9d80-a6d1-cb63-046cef3bbf77@samba.org>
References: <a144cd2c0219399cea4473f6cf7e86b3dba5d6cf.camel@solinos.it>
 <5b43a40c-9d80-a6d1-cb63-046cef3bbf77@samba.org>
Organization: Solinos
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
From: Dario Lesca via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dario Lesca <d.lesca@solinos.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Il giorno dom, 23/02/2020 alle 12.29 +0000, Rowland penny via samba-
technical ha scritto:
> On 23/02/2020 10:31, Dario Lesca via samba-technical wrote:
> > Hi, I'm doing some tests samba DC 4.12.rc3  MIT Kerberos  + Bind
> > DNS +Dhcpd script  on Fedora 32 beta.
> I wouldn't suggest using this in production, MIT on an AD DC is still
> experimental.

Yes, I know.
In this case is a test environment for test fedora 32 (not yet
released) and samba 4.12 (not yet released)
... and sooner or later the world "Experimental" for samba+MIT Kerberos
it will be wipe away from someone.

> > But despite this, everything works well
> 
> First, there is no point in asking Fedora about this, the dhcp script
> is supplied by Samba (or to be more precise, by myself).

That's why I asked it here.
The script work great, and I take this opportunity to thank you.


> Secondly, it looks like your clients are trying to update their own
> records in AD, which they cannot, because they do not belong to them,
> so stop your clients trying to do this..

Thanks, this is the answer to my question: This error message is not a
DC problem.
I can disable on Windows client the own record update (I will find out
how) ... or ignore this error log (I know how to do it).

Two little question to better understand:
a) There is alto the way and it would make sense on Samba DC (or Bind?)
to allow the client to update their own records like (I image) their do
on MS-DC server?
b) This issue is there also on samba heimdal kerberos?

> Thirdly, this is the wrong place to ask, you should have asked on the
> samba mailing list.

Sorry, I thought that since samba 4.12 was not released yet, I had to
go here.
I must move the message to other list?

Many thanks for reply


-- 
Dario Lesca
(inviato dal mio Linux Fedora 31 Workstation)
