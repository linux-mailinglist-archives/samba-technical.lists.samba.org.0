Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 144D53EAF6C
	for <lists+samba-technical@lfdr.de>; Fri, 13 Aug 2021 06:47:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Xkxv6+rPgNFYK0bumQmdFxc99xFlqWZ0vPYKbCDn8/k=; b=NNTCUfR8AYxWE7/aJxYTCcK6WE
	IlEQ6nAAB9w1MZP9BMQt9LjY86RVLiDLAS9wE4yW85TRWqQrwkWyHd/ZatExjnsxrzr9wMJg+rPVX
	zbCr946s0D0rob3/JAgEhrh2Q09+ETYw+xNs8cRjbA9+nbSrtQu4qovNxpqvT8Im5juwslHFxdspT
	UQyvO05s/V1dwRJ6UWLnX7ZAoNi+Amis7mj8zBB+oweYriWITNBtu+MsUFS6pnqao0Nn7+MG2Ortw
	RFZ3XDgTtPSQwMc1AhRLN0SKw2AxhFjpnBYelVUp0D0/4+JaTPmm5sT2SdTBpE5p83XCknZTcoLYX
	HYzeAqfA==;
Received: from ip6-localhost ([::1]:63606 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mEP5e-005vVg-4N; Fri, 13 Aug 2021 04:46:42 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:46908) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mEP5X-005vVX-PU
 for samba-technical@lists.samba.org; Fri, 13 Aug 2021 04:46:38 +0000
Received: by mail-ed1-x52c.google.com with SMTP id r19so10147712eds.13
 for <samba-technical@lists.samba.org>; Thu, 12 Aug 2021 21:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xkxv6+rPgNFYK0bumQmdFxc99xFlqWZ0vPYKbCDn8/k=;
 b=Kzg19FPkyWXsZFoUcJlKFXqgNZCxjU5l0w2yvoZGadKGRsoud4alyqsDXsDAht79SA
 vp06uvlACdNppSbFEiUcpjoWf/r2o+KmvRaTSOL7sPC2x+S+qRj94p810QJnm47BMOpy
 gyKxuDFBmZplr0/Vg0tAkDD1y5Dbf5n26kDj2DSgPNruRc6lr21uaRm7lUCwQEGqlDls
 SY6cpxc7E/o1nBgrtWAOXpJwPmqi10gMOtG2TYJ/wG8y7shA9n6Tx5b4pow57AywBAlk
 S2El78ZwtrLideuIQK27S4LpDyUHa9Eulc4QvlJPKQuGYV7hc66a5fSu99nRseEcL3Mg
 ngcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xkxv6+rPgNFYK0bumQmdFxc99xFlqWZ0vPYKbCDn8/k=;
 b=DnLADhmb7lK7vdP6zUg8U/fw1g77BOneQ0seoSZzOrHlG/ksoxYRGaKjHDD/aanuP+
 D+6WLmlQXY0dfID6c7nveevEO17dB0CcIr95ClWyOBJPDmJ0DC1ttpLhhesR1wsiiBBJ
 alovURQuxMb5E2O4CkCR6jNHgHW+puK3IXVvTwfXx9ynVL4nRVdKHBEmetRL7OalKHzV
 eESd4SaQWZGrf4Fi77vMpy4BwIQj6ia3B1q4HINTa9hurMPP337GuEtMRYeE8iuBZwer
 XXO8Qyl9njnNUp6WNunwzBEAbW3e+QdQYfdIk7EvqUlhR5UCbcSaaXUvxiyfIkXJQSSF
 EX9g==
X-Gm-Message-State: AOAM5308G/9leEMZcHxQp6qamrdy5XzWJgFr0ylGxnQ0K3szxHDyVRNh
 lLzzXuzsjEmWRs7WNHgVKDVX42tOQrFsDPASJrQ=
X-Google-Smtp-Source: ABdhPJz2VhmAjqKpRRUfXVkPaiiPfiNQgQjDqJb79/5r4bZoazl7SM8EcjXa7XtLx9Xcj3mC6RA4Y//JTyRgJUvtKVQ=
X-Received: by 2002:a05:6402:b7a:: with SMTP id
 cb26mr634654edb.33.1628829993727; 
 Thu, 12 Aug 2021 21:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <YRXlwDBfQql36wJx@sol.localdomain>
In-Reply-To: <YRXlwDBfQql36wJx@sol.localdomain>
Date: Fri, 13 Aug 2021 14:46:21 +1000
Message-ID: <CAN05THSm5fEcnLKxcsidKPRUC6PVLCkWMBZUW05KNm4uMJNHWw@mail.gmail.com>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 linux-crypto@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Aug 13, 2021 at 1:34 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> Hi!
>
> We should be working to eliminate any uses of insecure crypto algorithms (e.g.
> DES, ARC4, MD4, MD5) from the kernel.  In particular, it should be possible to
> build a kernel for a modern system without including any such algorithms.
>
> Currently, CONFIG_CIFS is problematic because it selects all these algorithms
> (kconfig options: CONFIG_CRYPTO_LIB_DES, CONFIG_CRYPTO_LIB_ARC4,
> CONFIG_CRYPTO_MD4, CONFIG_CRYPTO_MD5).
>
> It looks like these algorithms might only be used by SMB2.0 and earlier, and the
> more modern SMB versions don't use them.  Is that the case?  It mostly looks
> like that, but there's one case I'm not sure about -- there's a call chain which
> appears to use ARC4 and HMAC-MD5 even with the most recent SMB version:
>
>     smb311_operations.sess_setup()
>       SMB2_sess_setup()
>         SMB2_sess_auth_rawntlmssp_authenticate()
>           build_ntlmssp_auth_blob()
>             setup_ntlmv2_rsp()

md4 and md5 are used with the NTLMSSP authentication for all dialects,
including the latest 3.1.1.
The only other authentication mechanism for SMB is krb5.

This means that if we build a kernel without md4/md5 then we can no
longer use NTLMSSP user/password
style authentication, only kerberos.
I guess that the use cases where a kernel without these algorithms are
present are ok with kerberos as the
only authentication mech.

Afaik arc4 is only used for signing in the smb1 case.

>
> Also, there's already an option CONFIG_CIFS_ALLOW_INSECURE_LEGACY=n which
> disables support for SMB2.0 and earlier.  However, it doesn't actually compile
> out the code but rather just prevents it from being used.  That means that the
> DES and ARC4 library interfaces are still depended on at link time, so they
> can't be omitted.  Have there been any considerations towards making
> CONFIG_CIFS_ALLOW_INSECURE_LEGACY=n compile out the code for SMB2.0 and earlier?

I think initially we just wanted to disable its use. If we want to
compile a kernel completely without arc4/md4/md5 I think we would need
to:

1, Change CONFIG_CIFS_ALLOW_INSECURE_LEGACY=n to compile out the code
as you suggests.
This should remove the dependency for arc4. I think this would be a
good thing to do.

2, Have a different CONFIG_... to compile out the use of NTLMSSP
authentication. This must be a different define
since md4/md5 are also used for non-legacy dialects.
And this should remove the dependency of md4/5.

For the latter, I guess we would need a global, i.e. not
cifs-specific, config option for this. I assume other users of
rc4/md4/md5
would also want this.
A new CONFIG_INSECURE_CRYPTO=n ?

Ronnie Sahlberg

>
> - Eric

