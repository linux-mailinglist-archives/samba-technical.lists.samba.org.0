Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC5B3F120D
	for <lists+samba-technical@lfdr.de>; Thu, 19 Aug 2021 05:44:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=d12pwuUbm/RFmc96eu8najm3FLYOZNltUOsofPOq5R4=; b=cJyk5u77MtnOq2uPZemGYoS/VI
	1avVZeJTHBZY2Io246/5XpwWKom7G+PSJixWLOMoPZDpefCDmC7I8fKRYOWV7mWu766ibCxLbcXLg
	d37UPQekBBSfQjJ/llJYoIEPlzSgPme1mKC6DNgYKRPCtqQIRBiB6yFYr1antt3/DYyEX2c3kpSbm
	MdtHCIcN8vaq2U/AQYGoviiP0yov39Zf2NEpdlPDO2gdJGnv7W0lkhHkJNRR17PP9MtKfDsxzcAjS
	8Bm3xzl+QCLmoNL+gAFAGaf4l4D7LXUoJgdsmA1d+GTJ80aWjE1dAbYtOSLvgLVj55UBDkHJm7YeX
	1kb26KVg==;
Received: from ip6-localhost ([::1]:35954 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mGYxs-007eVt-LL; Thu, 19 Aug 2021 03:43:36 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:39617) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mGYxm-007eVk-7r
 for samba-technical@lists.samba.org; Thu, 19 Aug 2021 03:43:32 +0000
Received: by mail-ej1-x629.google.com with SMTP id gr13so9715538ejb.6
 for <samba-technical@lists.samba.org>; Wed, 18 Aug 2021 20:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d12pwuUbm/RFmc96eu8najm3FLYOZNltUOsofPOq5R4=;
 b=vSCFa8woIkAP0IATpazmtdGukkQw9Oc9zhC18WVLua4zI8p2AY723aDvVk0xSWMRt3
 FDi837O1BpYAyoyT0lJrg+ze66da4BuTYWkEF0ZLdRpRgoDkOizVoJpVUQZ9EnIDNmjs
 bdV9ChQ2Af2mOuWS/y5WO6i56SK4TN5q1gp+5iT/T9oQ1byCrYlBTK61K2Ya9XtvlkRF
 Xo3XnKFDYYvnGKeBhaz2dIZLEiLOE/FLTMNjgMf6meloRGG1MMNkO0jj2z5ze332XlJv
 ZrVUyFukIAPSaePe8HA8HX0YCCViXpn/ToDlzH4+sAFv6Q1HA6IZpYEP5DTzs1cOswdr
 HPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d12pwuUbm/RFmc96eu8najm3FLYOZNltUOsofPOq5R4=;
 b=Y1KHtr0kVYJMgTje+GTMtLoMBZDfcvY4kpKhZPNsJ4Q24z3hfyEoL9YpKR/NOl/x1i
 NZFk52FfBikwHITa/GnUDBqKvHJw16PICeMXRAOnQR1gtdvYSU2gG7k3pBFRBJJZ2AcU
 gIZvQTRAEvyIeKCLVaL6OBRSKYXeJ7MM6irLn5zEOkh7Fe14afRbURW5rg0BaGb/14IP
 7FsVuq9nck05lVGYGwYSaGpAwqPVVkWZlwYFesoXPvvoSCvel0Uw0yMtntwQ1Ah56/pB
 Ys+cVQATlOmNaNYk0mx/cdhcG9VgceGVO0NDVaiu0T2+EBY2saOmP28VUm5fJ4vhP3/K
 9OUA==
X-Gm-Message-State: AOAM5305LBtl2Sa7zLk7CeCMxWGJbAjTbR2rp/GXILZ0T6Pl0I23nFQL
 yYYh1R0FlZPpf+kPCRWXRh9bqCD2eIDA+O7Y2Go=
X-Google-Smtp-Source: ABdhPJwe+pJhk8ZQMcmZZTLQMzQbps4atQEtMwQKR9sB0MCHPfdkwT2RUI9k9ssedPUrZ1AXMZC6WY0FJxFs9kf5GEk=
X-Received: by 2002:a17:906:27c2:: with SMTP id
 k2mr13380021ejc.83.1629344608998; 
 Wed, 18 Aug 2021 20:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <YRXlwDBfQql36wJx@sol.localdomain>
 <CAN05THSm5fEcnLKxcsidKPRUC6PVLCkWMBZUW05KNm4uMJNHWw@mail.gmail.com>
 <YRbT7IbSCXo4Dl0u@sol.localdomain>
 <CAN05THScNOVh5biQnqM8YDOvNid4Dh=wZS=ObczzmSEpv1LpRw@mail.gmail.com>
 <YRrkhzOARiT6TqQA@gmail.com>
 <CAMj1kXH93HU5SNUDLpn+c0ryJUYWpRKVXeoPK8jPOSwiS3_79A@mail.gmail.com>
In-Reply-To: <CAMj1kXH93HU5SNUDLpn+c0ryJUYWpRKVXeoPK8jPOSwiS3_79A@mail.gmail.com>
Date: Thu, 19 Aug 2021 13:43:17 +1000
Message-ID: <CAN05THS27h9QFpNuVVQmqz8k8_SKD8V8TbzZVYxco7S86i0zWA@mail.gmail.com>
Subject: Re: Building cifs.ko without any support for insecure crypto?
To: Ard Biesheuvel <ardb@kernel.org>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 Steve French <sfrench@samba.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Aug 18, 2021 at 9:44 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Tue, 17 Aug 2021 at 00:19, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > On Sun, Aug 15, 2021 at 08:38:23PM +1000, ronnie sahlberg wrote:
> > >
> > > What are the plans here? To just offer the possibility to disable all
> > > these old crypto and hashes on a local kernel compile?
> > > Or is the plan to just outright remove it from the kernel sources?
> > >
> > > If the first, I think that could possible be done for cifs. I think a
> > > lot of the security minded larger enterprises already may be disabling
> > > both SMB1 and also NTLM on serverside, so they would be fine.
> > >
> > > For the latter, I think it would be a no-go since aside from krb5
> > > there are just no other viable authentication mechs for smb.
> >
> > Removing the code would be best, but allowing it to be compiled out would be the
> > next best thing.
> >
> > > TL;DR
> > > If NTLMSSP authentication is disabled, there are no other options to
> > > map a share than using KRB5
> > > and setting up the krb5 infrastructure. And thus smaller sites will
> > > not be able to use CIFS :-(
> > > So while I think it is feasible to add support to cifs.ko to
> > > conditionally disable features depending in a kernel compile (no SMB1
> > > if des/rc4 is missing, no NTLM if rc4/md4/md5 is missing)  I don't
> > > think it is feasible to disable these by default.
> > > I will work on making it possible to build cifs.ko with limied
> > > functionality when these algorithms are disabled though.
> >
> > FWIW, the way this came up is that the Compatibility Test Suite for Android 11
> > verifies that CONFIG_CRYPTO_MD4 isn't set.  The reason that test got added is
> > because for a short time, CONFIG_CRYPTO_MD4 had accidentally been enabled in the
> > recommended kernel config for Android.  Since "obviously" no one would be using
> > a completely broken crypto algorithm from 31 years ago, when fixing that bug we
> > decided to go a bit further and just forbid it from the kernel config.
> >
> > I guess we'll have to remove that test for now (assuming that CONFIG_CIFS is to
> > be allowed at all on an Android device, and that the people who want to use it
> > don't want to use kerberos which is probably the case).
> >
> > It is beyond ridiculous that this is even an issue though, given that MD4 has
> > been severely compromised for over 25 years.
> >
> > One thing which we should seriously consider doing is removing md4 from the
> > crypto API and moving it into fs/cifs/.  It isn't a valid crypto algorithm, so
> > anyone who wants to use it should have to maintain it themselves.
> >
>
> +1 to moving the md4 code into fs/cifs, so that the CIFS maintainers
> can own it and phase it out on their own schedule, and prevent its
> inadvertent use in other places.

Ok, let me summarize the status and what I think we will need to do in cifs.

DES
---
Removal of DES is not controversial since this only affects SMB1.
SMB2 has been around since 2006 and it is starting to become viable to at least
disable the SMB1 protocol by default today.
There are still servers that only support SMB1 but they are becoming rare.
I think also Microsoft Windows default to disable (but not remove)
SMB1 by default
on some configurations today.

I am proposing that we remove the hard dependency to DES and instead
make it a soft dependency to "do not build SMB1 if DES is missing".

MD4/MD5/ARC4
----------------------
These are all used together in NTLMSSP authentication today, including
in the very latest
versions of the protocol. This is the only authentication mechanism
available in cifs
aside from the "extended" kerberos 5 protocol that ActiveDirectory implements.
As such the vast majority of clients rely on this when accessing SMB servers.

ARC4 is technically possible to remove since it is only used in the
final stage for KEY_EXCHANGE
when negotiating the session key. It could be removed but it would
make NTLMSSP weaker.
But if we have to move other crypto into fs/cifs anyway we can just as
well copy ARC4 into fs/cifs.

MD4 is used to create a hash, which is then one of the inputs into
MD5-HMAC for the core part of the
NTLMSSP authentication so we would need private versions of at least
md4 to be copied to fs/cifs as well.

I am proposing that we fork both ARC4 and MD4 and host private
versions of these in fs/cifs.


I have patches for both DES removal and forking ARC4 prepared for linux-cifs.
MD4 will require more work since we use it via the crypto_alloc_hash()
api but we will do that too.

What about MD5? Is it also scheduled for removal? if so we will need
to fork it too.


-- ronnie

