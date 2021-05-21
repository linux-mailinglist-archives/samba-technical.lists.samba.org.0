Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AB138C32A
	for <lists+samba-technical@lfdr.de>; Fri, 21 May 2021 11:32:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=N/mvg/iTIqY3w1hyV27cLuddS9BoxPl6SbbwSoM78gY=; b=2mlk49QISYjqfopNT5RXDb/LhJ
	YB4d+E4VLX1SAaZuzZhsK1x9DLrlXF9QSm95MiBQD7rJ3yttEdxiMnBU9MFdsmfeC1VTebaSyAvza
	wBtvGY07YdU7oEJiwLvf74KAwIVZMwexbmUsbGjav6b3fjVQfMEQVOYzotFqZviXNwjcE1lxUaGIp
	KzHxRz0MWfI7MU7dXlWmLC018+8UW/KFY/P3BRLJdkPgGMjefp6hzV9Bjk12ac68et9mYAhn8aG7i
	JKGGlP1VuOboqgYg0imz2pStGqw8xHo/yPseJOuJYu+j+DuXjEld2UcWpMXEqBP0R94mm7UUSatNs
	wmivvA0A==;
Received: from ip6-localhost ([::1]:35418 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lk1VP-002bv3-6O; Fri, 21 May 2021 09:31:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40408) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lk1VJ-002buu-Lx
 for samba-technical@lists.samba.org; Fri, 21 May 2021 09:31:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=N/mvg/iTIqY3w1hyV27cLuddS9BoxPl6SbbwSoM78gY=; b=y09nRgGP5Vn14o75gYwg1GX1vH
 Ax+2dlVNDsGpSI7r1rU8VhhsSn5YavRPZjYPzmLduCGBZkMF9ZPUR+eSGRYj7Om/uUrVMUd7x/FtM
 aZ5G6lQ6i2uxx3YRLc2Pz/cAAT3aKO2F62hS12qrIXTXEcrn/IZ17D4oNMzygkvhJuTtSAoimnkxE
 e08CJdwjC2MxtKvepcHuSfIjFqGMpqOZ57QmmgRmsbSeGQyvtBCP1bTLbJ3OR8VkuU3H6aWrRM38z
 2CdPsMUtEhOeAH8Q6NN/XoXNvCW7Ib7JR/2ZwqlXaFPTKDADIHeI1FeVPKlARTSzK8NYM3e0UGhaj
 ccD5CabHrMIkK9c/QZwDZfqOtGXUkjq8enJM1pcbAhL5JQB7QSHJUgFb5XI5nUyhHrT1CkemeIp5x
 uQ2OXa2YjdKbGLWH2wuoU7OxdsejrGkFopi7BQWkBj95KKkH2Sid8QxipoFHY2tkoMfXVJa9wvWlH
 9AexD4jj+5dGljktDde9KMr9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lk1VI-0007Ob-Gk; Fri, 21 May 2021 09:31:37 +0000
Message-ID: <fd178861288df9613902ecec24e52f6a2786cea9.camel@samba.org>
Subject: Re: Problem with AD membership in an AD with more the 100.000 group
 (possible regression in 4.12?)
To: "Dr." =?ISO-8859-1?Q?Hansj=F6rg?= Maurer <hansjoerg.maurer@itsd.de>, 
 samba-technical@lists.samba.org
Date: Fri, 21 May 2021 21:31:30 +1200
In-Reply-To: <56d3287c51dc769806d8a4966b54e2a6e672d8b0.camel@samba.org>
References: <d7b0ec24-3c59-1d74-9e93-616eebe6eb44@itsd.de>
 <5d5b4c230813b6bd6b3001fe14bfd3a9d8ca2b53.camel@samba.org>
 <9d2ed0c9-9e13-2848-29cb-aaf6354e33aa@itsd.de>
 <c4713dc0b0d746c834ec66c1ec793572c725b2d2.camel@samba.org>
 <2da32b9f-8ba0-c1ab-1748-831eeb727f0f@itsd.de>
 <1911c4eeee7df0fcf1f13d612da214094a9198c0.camel@samba.org>
 <b6fb9ef1-3cbf-e970-eb2e-9e6e395c65ae@itsd.de>
 <b83d52e7a5b846fd429811616f3b3c21d2f55480.camel@samba.org>
 <56d3287c51dc769806d8a4966b54e2a6e672d8b0.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Thu, 2021-05-20 at 23:29 +1200, Andrew Bartlett wrote:
> On Thu, 2021-05-20 at 19:46 +1200, Andrew Bartlett via samba-
> technical
> wrote:
> > On Thu, 2021-05-20 at 08:36 +0200, Dr. Hansjörg Maurer wrote:
> > > Am 19.05.21 um 11:55 schrieb Andrew Bartlett:
> > > > On Wed, 2021-05-19 at 07:56 +0200, Dr. Hansjörg Maurer wrote:
> > > > > > OK, so this case it doesn't happen, which is the one I
> > > > > > patched.
> > > > > the gdb run took place with the unpatched version
> > > > > 
> > > > Thanks, can you try with the patched one?  I'm thinking we must
> > > > be
> > > > hitting a different case now, if you still have issues, as the
> > > > lines
> > > > you show are gone with this patch (I hope).
> > > Hi Andrew
> > > 
> > > here is the gdb bt output from the patched version
> > > 
> > > I patched the sources an rebuild the RPM with the spec file.
> > > I would expect, this would apply the changes to the winbind.idl
> > > file?
> > 
> > Thanks, yes this seems to have been applied.  I've looked at this
> > some
> > more and I see where we leak the tokens.
> > 
> > I'll see what we can do, I think for a conformant array (what I've
> > changed this to) we can be more efficient. 
> > 
> > Andrew Bartlett
> > 
> 
> Try the attached patch.  I think I've finally fixed the issue.
> 
> See https://gitlab.com/samba-team/samba/-/merge_requests/1972

Just be aware that this isn't a working patch (see the failed
pipeline).

I'm not sure if I'll be able to get this approach to work, sadly.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


