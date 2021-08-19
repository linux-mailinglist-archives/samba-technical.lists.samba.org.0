Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A373F1223
	for <lists+samba-technical@lfdr.de>; Thu, 19 Aug 2021 05:53:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=bKgCaUEic8Dg9c08X1G5eHnxJn89fD/khBgbO3YyqOk=; b=UWE0NudWVbANQOuoTRrNL2ejmB
	KHX11VeToJjR4fp3dJ6NQexVT19X1BFjGzjkxnDHf6qjYGq03f5XXUgKgByrhCH8d7E0V3+4+NJ09
	eN4RbejwdR25h7HyPE2rpRcCKcE/8tT2EuKLgO9tq5tXKV9epswudlZKChw2cZCxLUVgYO8dKAPkE
	kd6wYAApqheJnLh6rfhhF4rWR5yQS7g9YRd2E1j5BSgDW87n/zXBjbzrMEsrUEbyRp3Gf3vb5ugLt
	FHIaU/bW6+JUbjcZeOl3eO8YKPbXVizZ/xOC76ZyyGalpnmSyx7UvV2eKXRoEbGxFjd6v7xROc394
	F40C6ODw==;
Received: from ip6-localhost ([::1]:37308 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mGZ7P-007fOk-B5; Thu, 19 Aug 2021 03:53:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64228) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mGZ7H-007fOb-S9
 for samba-technical@lists.samba.org; Thu, 19 Aug 2021 03:53:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=bKgCaUEic8Dg9c08X1G5eHnxJn89fD/khBgbO3YyqOk=; b=vnSH7dr4uMF8ev4i9LVbl1uedS
 xHSpFKIri1k/7rL5kwAmKGsKLyEa1N0Qh1SvtKY0d04/3Cq4yqP4yYrqx6PAFn2nCLC7v14Y+1zTa
 wlRHGc61ABHp61HH3uP6YAnpcL1AF4GIjg8M/MKk7YCwZrfC7Wq3jtQwxCz+lSpnIJtmhMK7g9UAT
 lf25P9tLmNRn6C1XuSwxlTDVFPHST+MKTFfsMIB4L4CLF3zqSRqbQi1DHvOx2RPftfAGbH16mW3xH
 h/6/55RK892d7GiUQeFYr+LDwpdFhZZ5Ljz7sJ1RwrD/r2O8ZyK7Zs7vD0f/By1yZ8/FKo03NS6l1
 7bSV4NpanqSx95K/J8EJM85ohgMwifJrglhZeWwu+BObErwxxlvsBRvTu0/bbvnSV7Xr1Tg8n6pmt
 5S1b6NSw7wuZ9AlbO8dL5kAHLQt7SETVKmhkvjCbq0x2tcxNJ7QReJob8j0c+W69uU10yIvxPXXOt
 +DNbiPyr9ajg/8Wc4Q6FWXz9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mGZ7G-0020Gg-8A; Thu, 19 Aug 2021 03:53:19 +0000
Message-ID: <b8befda31438d4717ddd86e8c9e051264bf108b2.camel@samba.org>
Subject: Re: Building cifs.ko without any support for insecure crypto?
To: ronnie sahlberg <ronniesahlberg@gmail.com>, Ard Biesheuvel
 <ardb@kernel.org>
Date: Thu, 19 Aug 2021 15:53:11 +1200
In-Reply-To: <CAN05THS27h9QFpNuVVQmqz8k8_SKD8V8TbzZVYxco7S86i0zWA@mail.gmail.com>
References: <YRXlwDBfQql36wJx@sol.localdomain>
 <CAN05THSm5fEcnLKxcsidKPRUC6PVLCkWMBZUW05KNm4uMJNHWw@mail.gmail.com>
 <YRbT7IbSCXo4Dl0u@sol.localdomain>
 <CAN05THScNOVh5biQnqM8YDOvNid4Dh=wZS=ObczzmSEpv1LpRw@mail.gmail.com>
 <YRrkhzOARiT6TqQA@gmail.com>
 <CAMj1kXH93HU5SNUDLpn+c0ryJUYWpRKVXeoPK8jPOSwiS3_79A@mail.gmail.com>
 <CAN05THS27h9QFpNuVVQmqz8k8_SKD8V8TbzZVYxco7S86i0zWA@mail.gmail.com>
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
Cc: Eric Biggers <ebiggers@kernel.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 Steve French <sfrench@samba.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2021-08-19 at 13:43 +1000, ronnie sahlberg via samba-technical
wrote:
> On Wed, Aug 18, 2021 at 9:44 PM Ard Biesheuvel <ardb@kernel.org>
> wrote:
> > On Tue, 17 Aug 2021 at 00:19, Eric Biggers <ebiggers@kernel.org>
> > wrote:
> > > On Sun, Aug 15, 2021 at 08:38:23PM +1000, ronnie sahlberg wrote:
> > > > What are the plans here? To just offer the possibility to
> > > > disable all
> > > > these old crypto and hashes on a local kernel compile?
> > > > Or is the plan to just outright remove it from the kernel
> > > > sources?
> > > > 
> > > > If the first, I think that could possible be done for cifs. I
> > > > think a
> > > > lot of the security minded larger enterprises already may be
> > > > disabling
> > > > both SMB1 and also NTLM on serverside, so they would be fine.
> > > > 
> > > > For the latter, I think it would be a no-go since aside from
> > > > krb5
> > > > there are just no other viable authentication mechs for smb.
> > > 
> > > Removing the code would be best, but allowing it to be compiled
> > > out would be the
> > > next best thing.
> > > 
> > > > TL;DR
> > > > If NTLMSSP authentication is disabled, there are no other
> > > > options to
> > > > map a share than using KRB5
> > > > and setting up the krb5 infrastructure. And thus smaller sites
> > > > will
> > > > not be able to use CIFS :-(
> > > > So while I think it is feasible to add support to cifs.ko to
> > > > conditionally disable features depending in a kernel compile
> > > > (no SMB1
> > > > if des/rc4 is missing, no NTLM if rc4/md4/md5 is missing)  I
> > > > don't
> > > > think it is feasible to disable these by default.
> > > > I will work on making it possible to build cifs.ko with limied
> > > > functionality when these algorithms are disabled though.
> > > 
> > > FWIW, the way this came up is that the Compatibility Test Suite
> > > for Android 11
> > > verifies that CONFIG_CRYPTO_MD4 isn't set.  The reason that test
> > > got added is
> > > because for a short time, CONFIG_CRYPTO_MD4 had accidentally been
> > > enabled in the
> > > recommended kernel config for Android.  Since "obviously" no one
> > > would be using
> > > a completely broken crypto algorithm from 31 years ago, when
> > > fixing that bug we
> > > decided to go a bit further and just forbid it from the kernel
> > > config.
> > > 
> > > I guess we'll have to remove that test for now (assuming that
> > > CONFIG_CIFS is to
> > > be allowed at all on an Android device, and that the people who
> > > want to use it
> > > don't want to use kerberos which is probably the case).
> > > 
> > > It is beyond ridiculous that this is even an issue though, given
> > > that MD4 has
> > > been severely compromised for over 25 years.
> > > 
> > > One thing which we should seriously consider doing is removing
> > > md4 from the
> > > crypto API and moving it into fs/cifs/.  It isn't a valid crypto
> > > algorithm, so
> > > anyone who wants to use it should have to maintain it themselves.
> > > 
> > 
> > +1 to moving the md4 code into fs/cifs, so that the CIFS
> > maintainers
> > can own it and phase it out on their own schedule, and prevent its
> > inadvertent use in other places.
> 
> Ok, let me summarize the status and what I think we will need to do
> in cifs.
> 
> DES
> ---
> Removal of DES is not controversial since this only affects SMB1.
> SMB2 has been around since 2006 and it is starting to become viable
> to at least
> disable the SMB1 protocol by default today.
> There are still servers that only support SMB1 but they are becoming
> rare.
> I think also Microsoft Windows default to disable (but not remove)
> SMB1 by default
> on some configurations today.
> 
> I am proposing that we remove the hard dependency to DES and instead
> make it a soft dependency to "do not build SMB1 if DES is missing".

NTLMSSP is also used over SMB1 (and presumably in cifs.ko), allowing
NTLMv2.  This means you would only need DES with 'bare' NTLM, which
means you are talking to a very, very old server, eg NT4 or Win9X, or
are running old crypto for giggles. 

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


