Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 531323F62DF
	for <lists+samba-technical@lfdr.de>; Tue, 24 Aug 2021 18:42:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=aSziwwwdyIEOJ4mYpFaEyyynDBylrGdfxWjE78omM94=; b=zbRS5THBIhMLVs4jiisSqhSD0f
	NrigP1mWp4chuWtL//9YC/gnD1zSX2iIqZdSpqQGSNybo+hKGnGdRbmaQhXUJz+x5Ju8N5JveEbor
	dsoy+48Za5oOAruARv7zHyHSJsoPmDA5cvhKlh4RzRHgoy7cIUjkQN6vWkwiYuEEXtN0eMHUszumX
	Ya4DKvXQnL3SOC0UDw2vuuBBhVh4pa2xTwhT0mfD/PV0LCpiFWLNOWJDNEZH5lPWc6BmeMrkEJvOr
	E+ASLmxPzG+QPRYnuzl7YT6siWl0mE6wLHIzO0ypg35B1RjHLiYdTlTOQkcSzEwSGHMtcbfGruy8p
	lewnqBhA==;
Received: from ip6-localhost ([::1]:45354 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mIZUF-008lNY-Pf; Tue, 24 Aug 2021 16:41:19 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:36376) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mIZU9-008lNP-TL
 for samba-technical@lists.samba.org; Tue, 24 Aug 2021 16:41:17 +0000
Received: by mail-lf1-x12f.google.com with SMTP id r9so46874565lfn.3
 for <samba-technical@lists.samba.org>; Tue, 24 Aug 2021 09:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aSziwwwdyIEOJ4mYpFaEyyynDBylrGdfxWjE78omM94=;
 b=DCMmJs4FRG79pqa2rFUGIv1mI88LNPFRfH2H3rCOUVKwIzKqHGC+5U1glL5+Yp8/Cu
 WpqwYj/8GWmDxLMsEyOasYKwMr6QNRYxcOBKYMLJhRwXSnoQ6eRxmfYW3wv1No5d/JBe
 Uo8pM1XuZ6G33c06ZYp0iZUz5JwzZAMlMjB+ld+DkY4Kk9paDbwS7Pi7JRUgxCmMgqFg
 slGFdFrgvOXSv/o23LL3YYIe1Y0/yY//9PLZwr0c0PQ5b0yiQPuqEgZ7EwMo/FRC1iN0
 Tnd6yMAG/hqzagdMGxE4whdKhVAuZKjlXo1R5HQMJDpjOIYWUXux5Y8SZv8iBjpPQmCz
 DclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aSziwwwdyIEOJ4mYpFaEyyynDBylrGdfxWjE78omM94=;
 b=d/hKRPF8G0LyI0k4lyqhZVHPR/PzQW5i0Gk0F0OAQFJ4csSJ+QT0noqVaEPMLSegMb
 2zJxOFbWHk+/Cg7c308hD3eV7UToNp3AtyGioaT63XO3O14uAdqislVvaGVzECiSIPcB
 EItW4yqTz4/ljRMWjrbST34nTuwBn/irGzz+n5ZBfCsWMGFIR1hQbwzuU+Xcbt+HLWHG
 iYiEiK2HkusXkiTw1QORoWTkso5KOGOoliImoCRK5AAZFEJSmw2glOhtAOcbEd65HNLn
 WvCYnk8iDjPXxMzDYCwVujy6IdnkCslBhVKykZlCWp8NH17o4u6Ctchg0NHHYX6ztd9y
 zTKg==
X-Gm-Message-State: AOAM5309btRMqeeK+j1Qo7eOsqDOJsGDeVivuF/uoZe+fC2k2hDrY69q
 YaaaPOBz9Cg8LDLCBABm3eukFTyOqx0X4rZaE3c=
X-Google-Smtp-Source: ABdhPJx05vOHbejCKOArldt/GrSeSIg5FEQsOgVl5tYNq+RPz63GDpgaJzlNqDIHHaZ38bIfDvCTpAz7z3Edcq+N724=
X-Received: by 2002:ac2:4561:: with SMTP id k1mr5393956lfm.313.1629823272322; 
 Tue, 24 Aug 2021 09:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <YRXlwDBfQql36wJx@sol.localdomain>
 <CAN05THSm5fEcnLKxcsidKPRUC6PVLCkWMBZUW05KNm4uMJNHWw@mail.gmail.com>
 <YRbT7IbSCXo4Dl0u@sol.localdomain>
 <CAN05THScNOVh5biQnqM8YDOvNid4Dh=wZS=ObczzmSEpv1LpRw@mail.gmail.com>
 <YRrkhzOARiT6TqQA@gmail.com>
 <CAMj1kXH93HU5SNUDLpn+c0ryJUYWpRKVXeoPK8jPOSwiS3_79A@mail.gmail.com>
 <CAN05THS27h9QFpNuVVQmqz8k8_SKD8V8TbzZVYxco7S86i0zWA@mail.gmail.com>
 <627872ec0f8cc52a06f8f58598f96b72b5b9645a.camel@redhat.com>
In-Reply-To: <627872ec0f8cc52a06f8f58598f96b72b5b9645a.camel@redhat.com>
Date: Tue, 24 Aug 2021 11:41:01 -0500
Message-ID: <CAH2r5mtsgYXi2VxQZ5bDLdsAgmgjgJVqeXUxe5Sb1CiA_RyFQA@mail.gmail.com>
Subject: Re: Building cifs.ko without any support for insecure crypto?
To: Simo Sorce <simo@redhat.com>
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
Cc: linux-cifs <linux-cifs@vger.kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Eric Biggers <ebiggers@kernel.org>, Steve French <sfrench@samba.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Aug 23, 2021 at 5:05 AM Simo Sorce <simo@redhat.com> wrote:
<snip>
> Another way to handle this part is to calculate the hash in userspace
> and handle the kernel just the hashes. This would allow you to remove
> MD4 from the kernel. I guess it would break putting a password on the
> kernel command line, but is that really a thing to do? Kernels do not
> boot from cifs shares so you can always use userspace tools (or pass
> hexed hashes directly on the command line in a pinch).

We can boot from cifs (and given the security features of SMB3.1.1 it probably
makes more sense than some of the alternatives) albeit with some POSIX
restrictions unless booting from ksmbd with POSIX extensions enabled.
Paulo added the support for booting from cifs.ko in the 5.5 kernel.


> > I have patches for both DES removal and forking ARC4 prepared for linux-cifs.
> > MD4 will require more work since we use it via the crypto_alloc_hash()
> > api but we will do that too.
> >
> > What about MD5? Is it also scheduled for removal? if so we will need
> > to fork it too.
>
> MD5 is still used for a ton of stuff, however it may make sense to
> consider moving it in /lib and our of /lib/crypto as it is not usable
> in cryptographic settings anymore anyway.

Seems reasonable

-- 
Thanks,

Steve

