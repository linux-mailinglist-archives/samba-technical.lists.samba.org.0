Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C5E86157
	for <lists+samba-technical@lfdr.de>; Thu,  8 Aug 2019 14:07:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=PtksGbNCgchX+4CiomEGjE9XiqhZFpI2+4x6wFOpU4E=; b=ATANZgOIk+t+gujgnYU6kDdk1a
	7qX5FbsPUOMFSmE+o93U8et+JhguUByCNgAP3rm5lbu0TQxzn9U5QL+Ae7A2xTrMgdBjL9neC/LED
	/vWZW9c1GDuAFgphrBS5iK6H9Z1iGsyatAMYK1RCKE7RmGWAOjLBLFUcPk69w+gvcrMVu8Fwn+WEU
	nDa48ONbOGIOMcpct5d8BOm4Q3ZXZFmbEO6BOTq403kD2+Q3ZaCPxnD6ftsQWyNg5a44K/vjBFrTg
	kcbFQjqyK5pysl/r/eS/G9FoQKZDtaAvAe/kMFRivnBdYKjlnWvEyYvRehTKuLDfG319Gaok3wmgJ
	UELPDgVg==;
Received: from localhost ([::1]:19252 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hvhBe-0058eF-5u; Thu, 08 Aug 2019 12:06:30 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32]:33662) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hvhBZ-0058e8-5Z
 for samba-technical@lists.samba.org; Thu, 08 Aug 2019 12:06:27 +0000
Received: by mail-vs1-xe32.google.com with SMTP id m8so62946164vsj.0
 for <samba-technical@lists.samba.org>; Thu, 08 Aug 2019 05:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PtksGbNCgchX+4CiomEGjE9XiqhZFpI2+4x6wFOpU4E=;
 b=EenD9ZjyyUOrDDJwFnJArheZktIEXmUwPf2KeqnLz2rXkWRt08Jwn4tKugyGE2knJU
 ZEtynUxDVaRx159XXScM5+Awm5rKuzIGy0N1FD5oLs5OOxWca98liYpHWLV3rOXGo1ec
 hdIPtNaSWVzH3HKl+bJ40sdyukQQGLt9hnX3ekuy3ySA2UauV7UBPZFMUCt1dtfE37Vp
 3eCWWf0UvPzTQr+J9vR1B93YzkR3AkrC33HvI6TC2fq7aIPOmZQd4tptMvYdUfFupb4N
 Tpe+dd0iAZDKNXOQc8RT5b7VzhlxYlr/eTZuR8Ao5waH7BznzsT8zOcXRhkHTcTgFOHM
 jSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PtksGbNCgchX+4CiomEGjE9XiqhZFpI2+4x6wFOpU4E=;
 b=DmJZadpDBNa+MUajMQZ6xMwD8HiVClomEIE3UszDfJ/EYND7I0DFoFVrnOQa46JKVi
 TJ6TM2ZaD/WS4EyAGX6xxBGsyKebp9eqhMBGUsJwtf4L4KznZ9tKrWZX6pEZaMm4w007
 JY/u1RxgJ7wzLI3dTTWI1t2ZhcvX06Rrkncky/CQNn4duojzLL7kMXTsVugbCea+xqNv
 OFYjEWZCtkp2vi1VJ1vt/f1wgC4rb272w/z7hBKXb+6uLLeh8ZSxYnt7k+FsdtaMPzwK
 R5xUri8BBEe0PaXAshr9QlP8jxRhtXi5ldr+g6ujupJYOy0gHImMGoaQM8rPoivEd9xi
 YafA==
X-Gm-Message-State: APjAAAUqMxFBrdIrVKTDn7fQylnwhFUWmb99PXlvhYIHpyYrJABuhi2P
 JrbBTgkn1w9gp1YTwrCuet5FtvfGZKVzMlb6dbw=
X-Google-Smtp-Source: APXvYqyrmq/r6JRaMhPkw0DZHrzP1/4MWqh7SXCGMUozcFYa65OTqSgEIgdlNZwrHTDcmv9GSmOl7XWPt/vj1ra9Ntg=
X-Received: by 2002:a67:fd91:: with SMTP id k17mr8967018vsq.121.1565265982404; 
 Thu, 08 Aug 2019 05:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <1564547155.4261.48.camel@samba.org>
 <CAOCN9ryBOTTTB8UR2fNX7ZMDM0hJHKT7-Ys8v-VDv4BCgp+uug@mail.gmail.com>
 <CAOCN9rz0wCkZZvzsjsXKcm4+Jv0nQWicmuk6PeYwUNGinMyq3Q@mail.gmail.com>
 <3136808.qJGijLCe70@magrathea.fritz.box> <1565240829.4444.5.camel@samba.org>
In-Reply-To: <1565240829.4444.5.camel@samba.org>
Date: Thu, 8 Aug 2019 08:06:10 -0400
Message-ID: <CAOCN9ryeuJw0PuArfBd6BPfQ1kwwm8o8fuLmZa=dMnhsJoAtuA@mail.gmail.com>
Subject: Re: Require GnuTLS 3.4.7 for Samba 4.12 in March 2020?
To: Andrew Bartlett <abartlet@samba.org>
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
From: Nico Kadel-Garcia via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Kadel-Garcia <nkadel@gmail.com>
Cc: Andreas Schneider <asn@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Aug 8, 2019 at 1:07 AM Andrew Bartlett <abartlet@samba.org> wrote:
>
> On Thu, 2019-08-01 at 08:58 +0200, Andreas Schneider wrote:
> > On Wednesday, July 31, 2019 7:37:10 AM CEST Nico Kadel-Garcia via samba-
> > technical wrote:
> > > I only repackage that, I didn't write it, Credit where it's due, and
> > >
> > > quoting from the README.md there:
> > > > > This is based on sergiomb2's work at
> > > > >
> > > > >  https://github.com/sergiomb2/SambaAD
> > >
> > > So Sergio gets credit. But I'm already using it for RHEL 7/CenbtOS 7.
> > > I've done some very limited testing with RHEL 8, but am waiting for
> > > CentOS 8 to finally be released to really test  that.
> > >
> > > > > [1] Sadly we couldn't totally remove the Samba AES code, as SMB 2.24
> > > > > requires AES-CMAC-128, but the impact would be far more constrained.
> > >
> > > Fair enough. I'd say accept the requirement of a compatibility library
> > > for older operating systems, and I'm glad Sergio did most of the work.
> >
> > Is there a copr repo with the compat-gnutls34 available somewhere?
> >
>
> Do you mean this:
>
> https://copr.fedorainfracloud.org/coprs/sergiomb/SambaAD/package/compat
> -gnutls34/
>
> Andreas,
>
> Can you take charge of getting this into to the CentOS7 image used for
> CI so we can proceed with this?
>
> Thanks,
>
> Andrew Bartlett

That's the one I use. I refactored those for my samba4repo.

https://github.com/nkadel/compat-gnutls34-3.x-srpm

You'll also need the compat-nettle32 package, which is a dependency
for compat-gnutls34.

https://github.com/nkadel/compat-nettle32-3.x-srpm

I'm not sure what you're using for CI. I really have gotten
comfortable with the "samba4repo" setup I use, where all the libraries
are in their own git repos and I use git submodules, and I use "mock"
to provide a full end-to-end build of all the packages in a local
repo. That is the setup I've mentioned before, at:

https://github.com/nkadel/samba4repo

I'm afraid that whether mock on a particular operating system handles
a local file:/// repository has been a bit of a crapshoot, to make
this work on some build hosts I've had to activate a web service to
enable http:// access to the local repo. My setup includes building
some nginx.conf.d/ files for providing just that, as well.

