Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3349349D3FF
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jan 2022 22:03:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=MtzMzsoPZnuTdbo+NLwsqrlUak2pdHzAXoEn4KbAa7E=; b=ELWPbVbeUaWQJeGOpFylvU92Rt
	cD2iLnDyJ2NhzVtG/Zpg3kE8bsunfKH5lpNvzS9kQpedKSlCfLD3BRlU5tL6eLrpfJ/fjG1Yc8hHW
	HyVprHitdwh6wKqOFqbMm3umft04N4vzPZfNE1ILhwfq+smIgvhaB5y+oYd8DlZrOSNRha4GmDLl9
	W3qrgmGimy2C77VxGsJ106Z/iwSHfsRVfHv44VAV21xbNqU1NF2jYy2a1S/5Ivd19p97J2GXE9dSn
	3k1Cljlwa5aKmOoTSs8VUDgEk34Ozo89t3mugNgbXwaYK92fV8aN3zj+sbEA1R9xHXVAIePZW7/jI
	sAw5RPrw==;
Received: from ip6-localhost ([::1]:34374 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nCpQs-001Gih-U9; Wed, 26 Jan 2022 21:02:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48394) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nCpQo-001GiY-1K
 for samba-technical@lists.samba.org; Wed, 26 Jan 2022 21:02:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=MtzMzsoPZnuTdbo+NLwsqrlUak2pdHzAXoEn4KbAa7E=; b=YktfEx5mwJu2ZS82PUhMAIghyD
 pjt/NjCI2FG/Rj6jIEa1pNBRviwgTqkuaTIGvr0em6AEMGKGIi7a27UhqJ5AuclOTd0EEGuEIHVZ+
 5u4sWem8Nf70FynKjERc0vFvuE58DgWlf3si5JPpq+Rz3cTPV42+uvm3VbDi5E6PtxLEv1vPHfi4v
 hW2QqG6OwsraIoAqHFa4LjynyTjfjNz7TAZZIPrOwFlAIHBCk2sVtqQHzMqT9/n4xpegNb14Sj177
 Uy8OTky5KIZmSznGFyT/g15m9z4zvwnnDtlDrRa7UkEvc/XULUMoo2hki/94iuj+cAnmA5n7u/Uvw
 n5ZXTIlLw+zePUSeQAzqrJk9TzWF+B46OTlaCMqgGaItAzd3CR1KsO53d9wmC9ue48nh8AjrAvfik
 RlbNREZtkaiK8PbIBCa2odXqzAgve9YpeTuhPJchOPZgz9eAGDyZFR2+9aHsTTWOp20QLcBtcLWwE
 GDbxO0MN1cMRe5AWkjXcwhdS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nCpQl-000m73-Sa; Wed, 26 Jan 2022 21:02:16 +0000
Message-ID: <8f0f97f8215476ac33da03f875854e01e681c2e6.camel@samba.org>
Subject: Re: Samba build error: module 'time' has no attribute 'clock'
To: Steve French <smfrench@gmail.com>
Date: Thu, 27 Jan 2022 10:02:11 +1300
In-Reply-To: <CAH2r5mvF6W1V2803C7fRX4OdwkbWNkfsjrV3YNr5nt3XaGbWzg@mail.gmail.com>
References: <CAH2r5mvVanfR+7ipZfUfOg+3i_3+C8aYT=z2i6+C8RU8SA08fA@mail.gmail.com>
 <bab38b9741214fdd5b11040caaa0480b58305aaf.camel@samba.org>
 <CAH2r5mvg80Tr=jQE8H89LA3aPH-G022EAj13S6pn0b4Z_dP=pA@mail.gmail.com>
 <CAH2r5mvF6W1V2803C7fRX4OdwkbWNkfsjrV3YNr5nt3XaGbWzg@mail.gmail.com>
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

https://docs.python.org/3.7/library/time.html#time.clock

Deprecated since version 3.3, will be removed in version 3.8: The
behaviour of this function depends on the platform: use
perf_counter() or process_time() instead, depending on your
requirements, to have a well defined behaviour.

Python hasn't learnt the lesson from their previous removals (which
thankfully were caught pre-release) it seems. 

See https://bugs.python.org/issue37330 for another example.

Andrew Bartlett

On Wed, 2022-01-26 at 14:06 -0600, Steve French wrote:
> And same error with default "./configure"
> 
> On Wed, Jan 26, 2022 at 2:05 PM Steve French <smfrench@gmail.com>
> wrote:
> > I cloned jra's tree to fresh tree (master-smb2 branch) and get this
> > error on build:
> > 
> > Checking for python version >= 2.6.0
> >            : 3.9.7
> > python-config
> >            : /usr/bin/python3-config
> > Asking python-config for pyembed '--cflags --libs --ldflags' flags
> >            : yes
> > Testing pyembed configuration
> >            : Could not build a python embedded interpreter
> > Testing pyembed configuration
> >            : Could not build a python embedded interpreter
> > The configuration failed
> > (complete log in /home/smfrench/jra/samba/bin/config.log)
> > PYTHONHASHSEED=1 WAF_MAKE=1  ./buildtools/bin/waf build
> > The project was not configured: run "waf configure" first!
> > 
> > (Running waf configure directly gets a similar error)
> > 
> > Checking for python version >= 2.6.0
> >            : 3.9.7
> > python-config
> >            : /usr/bin/python3-config
> > Asking python-config for pyembed '--cflags --libs --ldflags' flags
> >            : yes
> > Testing pyembed configuration
> >            : Could not build a python embedded interpreter
> > Testing pyembed configuration
> >            : Could not build a python embedded interpreter
> > The configuration failed
> > (complete log in /home/smfrench/jra/samba/bin/config.log)
> > 
> > The command being run was:
> > ./configure --without-pam --without-ldap --without-winbind
> > --without-ads --without-ad-dc
> > 
> > On Wed, Jan 26, 2022 at 11:57 AM Andrew Bartlett <
> > abartlet@samba.org> wrote:
> > > On Wed, 2022-01-26 at 11:40 -0600, Steve French via samba-
> > > technical
> > > wrote:
> > > > Not having much luck building Jeremy's master-smb2 branch (
> > > > 
> > > > https://git.samba.org/?p=jra/samba/.git;a=shortlog;h=refs/heads/master-smb2)
> > > > 
> > > > on Ubuntu
> > > > 
> > > > 
> > > > 
> > > > Anyone recognize this Samba build error and how to fix it?
> > > 
> > > Try with a very clean tree, if you haven't built Samba for a very
> > > long
> > > time.
> > > 
> > > We had a Samba python file called time.py that could therefore
> > > jump in
> > > front of the system time, but I never saw it cause build
> > > errors.  We
> > > renamed it a long while back, but an old .pyc file could be the
> > > issue.
> > > 
> > > Andrew Bartlett
> > > 
> > > --
> > > Andrew Bartlett (he/him)       https://samba.org/~abartlet/
> > > Samba Team Member (since 2001) https://samba.org
> > > Samba Team Lead, Catalyst IT   
> > > https://catalyst.net.nz/services/samba
> > > 
> > > Samba Development and Support, Catalyst IT - Expert Open Source
> > > Solutions
> > > 
> > 
> > --
> > Thanks,
> > 
> > Steve
> 
> 
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions






