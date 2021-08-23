Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7143F4894
	for <lists+samba-technical@lfdr.de>; Mon, 23 Aug 2021 12:22:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=ZVPIU8NNXPfKmqVprwC6Sa9EH/JMJh/SLnA+Ky4RwYA=; b=eChOPkv5hAoko+bI4+XEPeY3Xh
	8/Qi/39rypL12TD507KCfyZV+ndkjUBL63wP5QrpkZV5FUUXu2FG8MBembtoEcgoVmJ8doDQgTzRu
	vc6aTaPN1dKAt17oh0h9bZr0ZAeQ4t5TgnMwhU/mDHY839GtLRMMAi68LL2D4iXeDosIUTJBd3nmQ
	v8J5ExVNZKZJAnWtmgUcW0ZORa35n4+Fzjjz652+5Pms0bpJNwYbgdn8Td8DI2kLztEx4KYqURyCF
	WyKDl1D+k+NwjcvT1oNAbmMYnpTiYeULnmc9Jr2OfBY9mvCqwOTCkRO6A+Obp4/nmrBJKQZu15+ok
	uJAUoPCQ==;
Received: from ip6-localhost ([::1]:58238 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mI751-008Ux7-28; Mon, 23 Aug 2021 10:21:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45190) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1mI74u-008Uwy-V5
 for samba-technical@lists.samba.org; Mon, 23 Aug 2021 10:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629714073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZVPIU8NNXPfKmqVprwC6Sa9EH/JMJh/SLnA+Ky4RwYA=;
 b=eGX4pm9RVdt3KgPAsdrYA9TW37QeFYn3KjpzYI5a0Sc+/JTFE+pqmZw6vmGaj48RLy3Itj
 69H3SOsUh9opsEDcrpsg9nNRdKTsKCWSRIjYwqUCUdaXoJuQJ1swIN5Av/m3Da5X+8hjck
 ROFDkF99yI/a+1qHWBsbmWJBChD50TM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629714073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZVPIU8NNXPfKmqVprwC6Sa9EH/JMJh/SLnA+Ky4RwYA=;
 b=eGX4pm9RVdt3KgPAsdrYA9TW37QeFYn3KjpzYI5a0Sc+/JTFE+pqmZw6vmGaj48RLy3Itj
 69H3SOsUh9opsEDcrpsg9nNRdKTsKCWSRIjYwqUCUdaXoJuQJ1swIN5Av/m3Da5X+8hjck
 ROFDkF99yI/a+1qHWBsbmWJBChD50TM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-_ZfdxRKNNxKMt75GsO78-w-1; Mon, 23 Aug 2021 06:04:50 -0400
X-MC-Unique: _ZfdxRKNNxKMt75GsO78-w-1
Received: by mail-ej1-f69.google.com with SMTP id
 ja25-20020a1709079899b02905b2a2bf1a62so5467284ejc.4
 for <samba-technical@lists.samba.org>; Mon, 23 Aug 2021 03:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=ZVPIU8NNXPfKmqVprwC6Sa9EH/JMJh/SLnA+Ky4RwYA=;
 b=P8SsqcB10PjdHDvR8jj2IcZFRp3/VjWFyhry0oiTebi3svO+64I2yaBnFvkJP+PC9V
 CGLZ6dre5gI2aZOTBvxKEsv86cJ9YJMp1rDwwqu0DRv7Qgb4podNSx/nv7IaG3QUPTn4
 qOGcwhuznDVHZ7T8qkVwIK/CNJBv5tZlOEEpuJWHRFHRCL5+mYL3md4soUPK+1IilGCa
 SPqNEEpOXeUYqDOtanhSTlfo39iResRs84622giGbbOtq55ZKomxMpfbenbyI1Aj9DOn
 ANmYphTF5xAzS0fsVSH+zcRdDdv30UxV4heoy5Gn1Wtw2nlUw7E2TrUPOOMb7BA3ujIW
 SFYg==
X-Gm-Message-State: AOAM5325eLZFAbmCs6oSk+w/j5Wq9mz8QUR75H/gEZz72xagTlPaT8Qp
 nGI4jzRNAyQqdG1CmnL6DwX8BcFs2H51k3zV06RaB+6nIX7tejfsFzcgUxwXHY9AHI8EUSbDVh7
 cPKY06eN0TwJ+bRHO7F37WqMUi0sD
X-Received: by 2002:a17:906:4c8c:: with SMTP id
 q12mr35162576eju.254.1629713089574; 
 Mon, 23 Aug 2021 03:04:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjsjnh/ETL6kdkurIpoZaLbR0ZcQV40DD8wO23Rb00gR9ggtaPgNcFoyLUzI9wHB9MGNSs+g==
X-Received: by 2002:a17:906:4c8c:: with SMTP id
 q12mr35162558eju.254.1629713089418; 
 Mon, 23 Aug 2021 03:04:49 -0700 (PDT)
Received: from m8.users.ipa.redhat.com ([93.56.160.10])
 by smtp.gmail.com with ESMTPSA id gw24sm7109080ejb.66.2021.08.23.03.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 03:04:49 -0700 (PDT)
Message-ID: <627872ec0f8cc52a06f8f58598f96b72b5b9645a.camel@redhat.com>
Subject: Re: Building cifs.ko without any support for insecure crypto?
To: ronnie sahlberg <ronniesahlberg@gmail.com>, Ard Biesheuvel
 <ardb@kernel.org>
Date: Mon, 23 Aug 2021 06:04:48 -0400
In-Reply-To: <CAN05THS27h9QFpNuVVQmqz8k8_SKD8V8TbzZVYxco7S86i0zWA@mail.gmail.com>
References: <YRXlwDBfQql36wJx@sol.localdomain>
 <CAN05THSm5fEcnLKxcsidKPRUC6PVLCkWMBZUW05KNm4uMJNHWw@mail.gmail.com>
 <YRbT7IbSCXo4Dl0u@sol.localdomain>
 <CAN05THScNOVh5biQnqM8YDOvNid4Dh=wZS=ObczzmSEpv1LpRw@mail.gmail.com>
 <YRrkhzOARiT6TqQA@gmail.com>
 <CAMj1kXH93HU5SNUDLpn+c0ryJUYWpRKVXeoPK8jPOSwiS3_79A@mail.gmail.com>
 <CAN05THS27h9QFpNuVVQmqz8k8_SKD8V8TbzZVYxco7S86i0zWA@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=simo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Warn: TLS-SNI hr1.samba.org
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
From: Simo Sorce via samba-technical <samba-technical@lists.samba.org>
Reply-To: Simo Sorce <simo@redhat.com>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 Steve French <sfrench@samba.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2021-08-19 at 13:43 +1000, ronnie sahlberg wrote:
> On Wed, Aug 18, 2021 at 9:44 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > 
> > On Tue, 17 Aug 2021 at 00:19, Eric Biggers <ebiggers@kernel.org> wrote:
> > > 
> > > On Sun, Aug 15, 2021 at 08:38:23PM +1000, ronnie sahlberg wrote:
> > > > 
> > > > What are the plans here? To just offer the possibility to disable all
> > > > these old crypto and hashes on a local kernel compile?
> > > > Or is the plan to just outright remove it from the kernel sources?
> > > > 
> > > > If the first, I think that could possible be done for cifs. I think a
> > > > lot of the security minded larger enterprises already may be disabling
> > > > both SMB1 and also NTLM on serverside, so they would be fine.
> > > > 
> > > > For the latter, I think it would be a no-go since aside from krb5
> > > > there are just no other viable authentication mechs for smb.
> > > 
> > > Removing the code would be best, but allowing it to be compiled out would be the
> > > next best thing.
> > > 
> > > > TL;DR
> > > > If NTLMSSP authentication is disabled, there are no other options to
> > > > map a share than using KRB5
> > > > and setting up the krb5 infrastructure. And thus smaller sites will
> > > > not be able to use CIFS :-(
> > > > So while I think it is feasible to add support to cifs.ko to
> > > > conditionally disable features depending in a kernel compile (no SMB1
> > > > if des/rc4 is missing, no NTLM if rc4/md4/md5 is missing)  I don't
> > > > think it is feasible to disable these by default.
> > > > I will work on making it possible to build cifs.ko with limied
> > > > functionality when these algorithms are disabled though.
> > > 
> > > FWIW, the way this came up is that the Compatibility Test Suite for Android 11
> > > verifies that CONFIG_CRYPTO_MD4 isn't set.  The reason that test got added is
> > > because for a short time, CONFIG_CRYPTO_MD4 had accidentally been enabled in the
> > > recommended kernel config for Android.  Since "obviously" no one would be using
> > > a completely broken crypto algorithm from 31 years ago, when fixing that bug we
> > > decided to go a bit further and just forbid it from the kernel config.
> > > 
> > > I guess we'll have to remove that test for now (assuming that CONFIG_CIFS is to
> > > be allowed at all on an Android device, and that the people who want to use it
> > > don't want to use kerberos which is probably the case).
> > > 
> > > It is beyond ridiculous that this is even an issue though, given that MD4 has
> > > been severely compromised for over 25 years.
> > > 
> > > One thing which we should seriously consider doing is removing md4 from the
> > > crypto API and moving it into fs/cifs/.  It isn't a valid crypto algorithm, so
> > > anyone who wants to use it should have to maintain it themselves.
> > > 
> > 
> > +1 to moving the md4 code into fs/cifs, so that the CIFS maintainers
> > can own it and phase it out on their own schedule, and prevent its
> > inadvertent use in other places.
> 
> Ok, let me summarize the status and what I think we will need to do in cifs.
> 
> DES
> ---
> Removal of DES is not controversial since this only affects SMB1.
> SMB2 has been around since 2006 and it is starting to become viable to at least
> disable the SMB1 protocol by default today.
> There are still servers that only support SMB1 but they are becoming rare.
> I think also Microsoft Windows default to disable (but not remove)
> SMB1 by default
> on some configurations today.
> 
> I am proposing that we remove the hard dependency to DES and instead
> make it a soft dependency to "do not build SMB1 if DES is missing".
> 
> MD4/MD5/ARC4
> ----------------------
> These are all used together in NTLMSSP authentication today, including
> in the very latest
> versions of the protocol. This is the only authentication mechanism
> available in cifs
> aside from the "extended" kerberos 5 protocol that ActiveDirectory implements.
> As such the vast majority of clients rely on this when accessing SMB servers.
> 
> ARC4 is technically possible to remove since it is only used in the
> final stage for KEY_EXCHANGE
> when negotiating the session key. It could be removed but it would
> make NTLMSSP weaker.
> But if we have to move other crypto into fs/cifs anyway we can just as
> well copy ARC4 into fs/cifs.
> 
> MD4 is used to create a hash, which is then one of the inputs into
> MD5-HMAC for the core part of the
> NTLMSSP authentication so we would need private versions of at least
> md4 to be copied to fs/cifs as well.
> 
> I am proposing that we fork both ARC4 and MD4 and host private
> versions of these in fs/cifs.

Another way to handle this part is to calculate the hash in userspace
and handle the kernel just the hashes. This would allow you to remove
MD4 from the kernel. I guess it would break putting a password on the
kernel command line, but is that really a thing to do? Kernels do not
boot from cifs shares so you can always use userspace tools (or pass
hexed hashes directly on the command line in a pinch).

> I have patches for both DES removal and forking ARC4 prepared for linux-cifs.
> MD4 will require more work since we use it via the crypto_alloc_hash()
> api but we will do that too.
> 
> What about MD5? Is it also scheduled for removal? if so we will need
> to fork it too.

MD5 is still used for a ton of stuff, however it may make sense to
consider moving it in /lib and our of /lib/crypto as it is not usable
in cryptographic settings anymore anyway.

HTH,
Simo.

> -- ronnie
> 

-- 
Simo Sorce
RHEL Crypto Team
Red Hat, Inc





