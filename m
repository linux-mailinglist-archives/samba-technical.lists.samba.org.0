Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DB53EE645
	for <lists+samba-technical@lfdr.de>; Tue, 17 Aug 2021 07:36:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=xMx4L3ZqKvyM/sUVzdUhG7z2kbsFz4JzK0zscdfG/yc=; b=CSMKqz20HkIRjoVlDPzjno6MZs
	vN4OvuBnTqAENZatwhGsRvtU1iC7xOchDxq3a0OTomXcKvsypzVtg8fJcqTULP928PlCmCS/82dv9
	CiTG1Dxl7ISPlDtuJQ7jj+koKx4d++NfqGDScfVa5fzbrmlA8WHFPG4oEWuFZg7tAWOne+pu4gME4
	+TSp3dR/qDDCZi6niL5q4jQjq1BMt2RgcSBQ2xh6yZJvho/vk/SsFA+0iDIIHo+qTaRfe87Jf6BKl
	vDMuTbo2Jf+yAbPAIa3m89ufrsj+YgxaEXPMGwboBcNTmpNHcufAuVK+/kZ5pEmdd0otPBaS86Ejg
	aD6Uk1LQ==;
Received: from ip6-localhost ([::1]:56562 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mFrlB-006lus-15; Tue, 17 Aug 2021 05:35:37 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:33513) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mFrl1-006luj-LG
 for samba-technical@lists.samba.org; Tue, 17 Aug 2021 05:35:32 +0000
Received: by mail-lj1-x22e.google.com with SMTP id n7so31131198ljq.0
 for <samba-technical@lists.samba.org>; Mon, 16 Aug 2021 22:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xMx4L3ZqKvyM/sUVzdUhG7z2kbsFz4JzK0zscdfG/yc=;
 b=fe+upWR2CLTDb/P0Pu8xbGg+16aUXxw1+lGzc24pyfaq92M1RjLmlKBKngGaN52ApT
 oZKHcsaIPQEOQQNmEhqlf5qxsaLYIj/rWaXzWlrvrEZgrnbKZ9TOIFA6rMzb+5C7EB+D
 3RWmtYqoXMb6hXAI4FqplhDyP2guykqM+youTslGcrpeU3Pmx2I2mS8zP9mwgYx5Vr0s
 tASRZHJouLcHKmelTm6eq9S5Xcwy26/CyxBJgt53uWaMw7LNdJSyl1Pfcswn86RmRZuz
 CkorvqLamETpXqjDHOL+IEHHIwwVRpc5+GzFe+4xaZbYen9yNJKqB9wZ4ENgTuArJim7
 y2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xMx4L3ZqKvyM/sUVzdUhG7z2kbsFz4JzK0zscdfG/yc=;
 b=LPptH4ofUM/Y0kTJfF31BkdRo9FmkpcH+7f9ufReUQv5oo4yw/mDxZX7Up/2xZx4+G
 +xiNQHUUhh8+zcqlRf9AL/aCrnUxuVDRrkUfyUSutWi4tUmIYOFKW3NQT5oNDfCHviUi
 buATgDMRVSHlWdmk24rkl6eKlY7HQXqZwh53YWMt88xd+i9SGIGOu2ZTxnCZ3TpC2ZnH
 Tc1w+0mxdNF0ZBuWQ7gLVBluiM3uj7LhYjVsvwK4sZg/tOFWEV2sOAWaeqF7XzgiQuir
 rqHhqSaqEBAmz+5aNNCTYkZ+CDixdyXx1Y/p/DYP697WCJRa0mWmaqNScGh8/RQdMmde
 z2cA==
X-Gm-Message-State: AOAM530XiMBMCokDAN7XZl/i5yU9t/gG8bY1grmin/o4A0RhIlmZ6tOn
 66xdXSyj0ngcsWipHmP73oa+eep91Qgp5pmsIWs=
X-Google-Smtp-Source: ABdhPJy9S5KyBzQaHsrg8x2wma8k+pfLLqDvFQstdeHV+hyqsz2ZK5xUoyjmFKqrGF0SJqwKq68snGMiQwojD4AEnfI=
X-Received: by 2002:a2e:8e39:: with SMTP id r25mr1562316ljk.272.1629178526122; 
 Mon, 16 Aug 2021 22:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <YRXlwDBfQql36wJx@sol.localdomain>
 <CAN05THSm5fEcnLKxcsidKPRUC6PVLCkWMBZUW05KNm4uMJNHWw@mail.gmail.com>
 <YRbT7IbSCXo4Dl0u@sol.localdomain>
 <CAN05THScNOVh5biQnqM8YDOvNid4Dh=wZS=ObczzmSEpv1LpRw@mail.gmail.com>
 <YRrkhzOARiT6TqQA@gmail.com>
In-Reply-To: <YRrkhzOARiT6TqQA@gmail.com>
Date: Tue, 17 Aug 2021 00:35:15 -0500
Message-ID: <CAH2r5muA9NtJcgW1VwN_-fmg9t0GpJ40+UzKdHEsJ8B6g23D6A@mail.gmail.com>
Subject: Re: Building cifs.ko without any support for insecure crypto?
To: Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Clearly NTLM (NTLMv1) should be disabled by default, despite the fact
that some old appliances use it - but it already is disabled by
default (and disabling its dependencies by default are fine too as
long as it doesn't break NTLMSSP with current dialects)

Rearranging the code similar to what Ronnie's patches do so we can
configure without SMB1 - and don't enable SMB1 and any algorithms
needed by SMB1 is fine, but SMB1 is still surprisingly broadly
deployed.   But ... we may want to consider building the default with
the name "smb3.ko" (with SMB1 disabled), since mount can now do "mount
-t smb3 ..." to make it more clear that what you are mounting is safe
- but I worry less about this since a user has to make an explicit
choice on mount "vers=1.0" to mount with SMB1 ("CIFS" dialect) - the
defaults give you SMB2.1 or later (usually will negotiate SMB3.1.1).
SMB2 and SMB1 have to be explicitly requested on mount to work so the
risk is low in using them.

But, the question about removing things needed by NTLMSSP/NTLMv2 is
harder as probably the majority of machines would default to this
(huge number of Macs, iPhones, iPads, Windows systems, Samba Linux,
smb tools etc) - these are hundreds of millions of machines that can
support Kerberos but are usually setup to negotiate NTLMSSP/NTLMv2.
If we want to move forward with disabling things needed by NTLMSSP for
current systems (SMB3, SMB3.1.1 etc) then we STRONGLY need to
implement a "peer to peer" authentication choice ASAP on Linux.
Currently Windows systems will use PKU2U (see e.g.
https://datatracker.ietf.org/doc/draft-zhu-pku2u/) and Macs have a
peer to peer Kerberos that they support IIRC.

Defaulting to Kerberos would be fine ... if ... we also had a peer to
peer mechanism (e.g. PKU2U) implemented to add to the defaults that
are negotiated in SPNEGO by the Linux client.

On Mon, Aug 16, 2021 at 5:20 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Sun, Aug 15, 2021 at 08:38:23PM +1000, ronnie sahlberg wrote:
> >
> > What are the plans here? To just offer the possibility to disable all
> > these old crypto and hashes on a local kernel compile?
> > Or is the plan to just outright remove it from the kernel sources?
> >
> > If the first, I think that could possible be done for cifs. I think a
> > lot of the security minded larger enterprises already may be disabling
> > both SMB1 and also NTLM on serverside, so they would be fine.
> >
> > For the latter, I think it would be a no-go since aside from krb5
> > there are just no other viable authentication mechs for smb.
>
> Removing the code would be best, but allowing it to be compiled out would be the
> next best thing.
>
> > TL;DR
> > If NTLMSSP authentication is disabled, there are no other options to
> > map a share than using KRB5
> > and setting up the krb5 infrastructure. And thus smaller sites will
> > not be able to use CIFS :-(
> > So while I think it is feasible to add support to cifs.ko to
> > conditionally disable features depending in a kernel compile (no SMB1
> > if des/rc4 is missing, no NTLM if rc4/md4/md5 is missing)  I don't
> > think it is feasible to disable these by default.
> > I will work on making it possible to build cifs.ko with limied
> > functionality when these algorithms are disabled though.
>
> FWIW, the way this came up is that the Compatibility Test Suite for Android 11
> verifies that CONFIG_CRYPTO_MD4 isn't set.  The reason that test got added is
> because for a short time, CONFIG_CRYPTO_MD4 had accidentally been enabled in the
> recommended kernel config for Android.  Since "obviously" no one would be using
> a completely broken crypto algorithm from 31 years ago, when fixing that bug we
> decided to go a bit further and just forbid it from the kernel config.
>
> I guess we'll have to remove that test for now (assuming that CONFIG_CIFS is to
> be allowed at all on an Android device, and that the people who want to use it
> don't want to use kerberos which is probably the case).
>
> It is beyond ridiculous that this is even an issue though, given that MD4 has
> been severely compromised for over 25 years.
>
> One thing which we should seriously consider doing is removing md4 from the
> crypto API and moving it into fs/cifs/.  It isn't a valid crypto algorithm, so
> anyone who wants to use it should have to maintain it themselves.
>
> - Eric



-- 
Thanks,

Steve

