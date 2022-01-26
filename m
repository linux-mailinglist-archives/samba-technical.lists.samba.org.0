Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D18349D48D
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jan 2022 22:33:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=bRZMRwxUNNHzwx75RnKh8DS1Ns0o9XlTkRnmtH3sXpc=; b=4Ynno0XZcFkEXKMeK56KRITxvS
	3JnPDdyokq00Po2OjA8K2iOK27JdO0goFsx0/T34VtkJB8wYgPOlzB66wgsG+h9Gp1xeOVBb/+M9h
	JgBPdk/sxXSlmFbo33Gsltna0i+EOneabXHTnlBdlS0nPRW/Zeo4BJzFxlnU9Ya1d4HFWSDQNOjhn
	2Xjb0De6DzhboWQ51FISFdqUZKYaPLxRJjCdvrbIUH/hojpUS3f4dgcKWL+33bMBcEHs2Vi5ZwFvb
	oIwQGqbdpvFBBg9/Bd8zzHfYtqeuPbplslvwd0sMI2SzERvjJK+IbNWG5X8gMStN/64QTbCL2Fdp6
	Yq2nmYFQ==;
Received: from ip6-localhost ([::1]:35044 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nCpuO-001H8Z-FL; Wed, 26 Jan 2022 21:32:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48396) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nCpuJ-001H8Q-Nr
 for samba-technical@lists.samba.org; Wed, 26 Jan 2022 21:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=bRZMRwxUNNHzwx75RnKh8DS1Ns0o9XlTkRnmtH3sXpc=; b=qw1CxFRpuCfVIdRVpTIfWU3MXM
 WPyV7fbBxoYzOZMtWcy9vtMdJCb8Qi3g3by8Zd4M36zkxbDqbL0rIGe4263R04cCAocLoFaRFHJFY
 ZcLRvBE1m1Uo7rqZPaykXsUxF5T6IzOEZLvS+MVdfTCLSHn1eqSkX0QoRdv8TTtWa22jq+RdoLUCk
 aZ3FeNnEVjK7PDOi0wC1QbjjFqar+SFmkmiMn8MguELPQ7Rsd1FjMPnvwk1sjFn3QEdG4R7F9DfEK
 L1fBfCMvI4JXSGBuXqSyvAB+VQEvydtGZow1HDXHe0yBMAHZF4UBL6K55YWbYsHkvaMy1C1KK0f2l
 Zc5/vV/YG/P9//tR4+2cI7r9Ew8Nk10HWNb2otpxbVd98M2Mrz/TJh+l3xb/8kOvdxe/qXlnlFnAC
 RVGUIz4gbIq7rAcPpzLkzncxdiIis/IrsFDDRdFmvsCsM6edb39/H7u4xlXymm1Adxu7ni39XT0aH
 y+JgxbwI10RM2t22Ek+4jMLZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nCpuH-000mJU-Q0; Wed, 26 Jan 2022 21:32:46 +0000
Message-ID: <2d7307c933e0e57c7eff00736840da34422e8556.camel@samba.org>
Subject: Re: Samba build error: module 'time' has no attribute 'clock'
To: Steve French <smfrench@gmail.com>
Date: Thu, 27 Jan 2022 10:32:42 +1300
In-Reply-To: <8f0f97f8215476ac33da03f875854e01e681c2e6.camel@samba.org>
References: <CAH2r5mvVanfR+7ipZfUfOg+3i_3+C8aYT=z2i6+C8RU8SA08fA@mail.gmail.com>
 <bab38b9741214fdd5b11040caaa0480b58305aaf.camel@samba.org>
 <CAH2r5mvg80Tr=jQE8H89LA3aPH-G022EAj13S6pn0b4Z_dP=pA@mail.gmail.com>
 <CAH2r5mvF6W1V2803C7fRX4OdwkbWNkfsjrV3YNr5nt3XaGbWzg@mail.gmail.com>
 <8f0f97f8215476ac33da03f875854e01e681c2e6.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is fixed by 

commit dc27ff44de578b0b429a24b0e42e243d8bf481a8
Author: Lukas Slebodnik <lslebodn@fedoraproject.org>
Date:   Wed Jun 12 12:27:04 2019 +0200

    wafsamba: Use native waf timer
    
      __main__:1: DeprecationWarning: time.clock has been deprecated in
Python 3.3
      and will be removed from Python 3.8: use time.perf_counter
      or time.process_time instead
    
    BUG: https://bugzilla.samba.org/show_bug.cgi?id=13998
    
    Signed-off-by: Lukas Slebodnik <lslebodn@fedoraproject.org>
    Reviewed-by: Andreas Schneider <asn@samba.org>
    Reviewed-by: Alexander Bokovoy <ab@samba.org>


I think you are cloning an old tree.

Andrew Bartlett

On Thu, 2022-01-27 at 10:02 +1300, Andrew Bartlett via samba-technical
wrote:
> https://docs.python.org/3.7/library/time.html#time.clock
> 
> Deprecated since version 3.3, will be removed in version 3.8: The
> behaviour of this function depends on the platform: use
> perf_counter() or process_time() instead, depending on your
> requirements, to have a well defined behaviour.
> 
> Python hasn't learnt the lesson from their previous removals (which
> thankfully were caught pre-release) it seems. 
> 
> See https://bugs.python.org/issue37330 for another example.
> 
> Andrew Bartlett
> 
> On Wed, 2022-01-26 at 14:06 -0600, Steve French wrote:
> > And same error with default "./configure"
> > 
> > On Wed, Jan 26, 2022 at 2:05 PM Steve French <smfrench@gmail.com>
> > wrote:
> > > I cloned jra's tree to fresh tree (master-smb2 branch) and get
> > > this
> > > error on build:
> > > 
> > > Checking for python version >= 2.6.0
> > >            : 3.9.7
> > > python-config
> > >            : /usr/bin/python3-config
> > > Asking python-config for pyembed '--cflags --libs --ldflags'
> > > flags
> > >            : yes
> > > Testing pyembed configuration
> > >            : Could not build a python embedded interpreter
> > > Testing pyembed configuration
> > >            : Could not build a python embedded interpreter
> > > The configuration failed
> > > (complete log in /home/smfrench/jra/samba/bin/config.log)
> > > PYTHONHASHSEED=1 WAF_MAKE=1  ./buildtools/bin/waf build
> > > The project was not configured: run "waf configure" first!
> > > 
> > > (Running waf configure directly gets a similar error)
> > > 
> > > Checking for python version >= 2.6.0
> > >            : 3.9.7
> > > python-config
> > >            : /usr/bin/python3-config
> > > Asking python-config for pyembed '--cflags --libs --ldflags'
> > > flags
> > >            : yes
> > > Testing pyembed configuration
> > >            : Could not build a python embedded interpreter
> > > Testing pyembed configuration
> > >            : Could not build a python embedded interpreter
> > > The configuration failed
> > > (complete log in /home/smfrench/jra/samba/bin/config.log)
> > > 
> > > The command being run was:
> > > ./configure --without-pam --without-ldap --without-winbind
> > > --without-ads --without-ad-dc
> > > 
> > > On Wed, Jan 26, 2022 at 11:57 AM Andrew Bartlett <
> > > abartlet@samba.org> wrote:
> > > > On Wed, 2022-01-26 at 11:40 -0600, Steve French via samba-
> > > > technical
> > > > wrote:
> > > > > Not having much luck building Jeremy's master-smb2 branch (
> > > > > 
> > > > > https://git.samba.org/?p=jra/samba/.git;a=shortlog;h=refs/heads/master-smb2)
> > > > > 
> > > > > on Ubuntu
> > > > > 
> > > > > 
> > > > > 
> > > > > Anyone recognize this Samba build error and how to fix it?
> > > > 
> > > > Try with a very clean tree, if you haven't built Samba for a
> > > > very
> > > > long
> > > > time.
> > > > 
> > > > We had a Samba python file called time.py that could therefore
> > > > jump in
> > > > front of the system time, but I never saw it cause build
> > > > errors.  We
> > > > renamed it a long while back, but an old .pyc file could be the
> > > > issue.
> > > > 
> > > > Andrew Bartlett
> > > > 
> > > > --
> > > > Andrew Bartlett (he/him)       https://samba.org/~abartlet/
> > > > Samba Team Member (since 2001) https://samba.org
> > > > Samba Team Lead, Catalyst IT   
> > > > https://catalyst.net.nz/services/samba
> > > > 
> > > > Samba Development and Support, Catalyst IT - Expert Open Source
> > > > Solutions
> > > > 
> > > 
> > > --
> > > Thanks,
> > > 
> > > Steve
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions






