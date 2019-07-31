Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0979A7B917
	for <lists+samba-technical@lfdr.de>; Wed, 31 Jul 2019 07:37:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=KVdz6cYWDY3G7KHXoLz5b19UOgTNDIEMvePIoHwIqqo=; b=WCkDq7KlAP2v9M5RdD6cpCb0Gv
	GcYVSsNfpbSZgSc5I+fKqaQ0mr1G5TSQ/3hKhsuQhO2bwNXUSSd9u+ioyJp+BYHZJc7V8XjzBVH7d
	mubOj0q/aFypba/Mm1DkcoeqwOCoUoa1p2vew+z+ARqXzWTiLdV3uJsn1y/rf9wMZoGkMpTCi+xCf
	KxA5A3U46Fm3GIGGWX5CVgzxxtawVbYUaFQkvYg7XQiB/YfG9uao/N+vdKeZfMbJarGDoSzF8AQDN
	/K8qE17l+l40A85nA59aRLxRj6dtaZ9qkQHPyZ3AMTbbrZ4OpRX3XOdqYWwLLF1Vd3O+KO+Qse7tw
	HJW9QfsA==;
Received: from localhost ([::1]:63440 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hshIm-00182V-Pb; Wed, 31 Jul 2019 05:37:28 +0000
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42]:45639) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hshIh-00182O-Q3
 for samba-technical@lists.samba.org; Wed, 31 Jul 2019 05:37:26 +0000
Received: by mail-vs1-xe42.google.com with SMTP id h28so45325862vsl.12
 for <samba-technical@lists.samba.org>; Tue, 30 Jul 2019 22:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KVdz6cYWDY3G7KHXoLz5b19UOgTNDIEMvePIoHwIqqo=;
 b=ShVC6CASGO+RKexPI3NpjuV2yA/XBvVJ0njBFuXgHgR44RzONi6E8gGLLu9rmedLV2
 JYsKMhO4S+cH6+NlCLo/q+RkBVN5gh8fdNWCFu4NU6uv1phE1ktBOKQSCuQntYmfckDT
 2f9Abkg3OjQID5iYQQwd9G7pBV1r+LL6OIquwq/TDmA0yfhK8pQIojg0hWO0+p1ctyI0
 G2GI8ozwwLzS0OmM/ue1Jec2mr2sIR3gV1DwaziiUAXPqNowWD78Vjh2+yUwtzIWoBqQ
 29UGsUFsYGZvdLKovvRMWgcTmo13usMMC69jVQOPUM2ABd63Hetuyi0S0c5oQ+HL/e2/
 /gRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KVdz6cYWDY3G7KHXoLz5b19UOgTNDIEMvePIoHwIqqo=;
 b=QQMmc4/IpUA2HVejAehrR+xrSnuh6CE6wTI2SBII2ZucsnBMPZT2P67jqS+6DXgVZ0
 bvP0CIGfDycCdWP/rO4zIAQVBeh+h8crWqgqADVcLB3bQRsVa38S32YzRecjIzilVvAx
 +s8DTEtVki4WAu7cTjG61GM2U9TwNlT2evtCjEKayaBrRfdeR0MwtUYmAwqFCeYfuxEN
 Dj8PGfbfLKP00HvnAr3W6X94WVTyudYSEQPq0SqpAvhIJIKH0TBa2hMrhFCYRbijYtKW
 cCtZd0nyR2yuktrNksJrHBFwDjq2AX0TL03xYOQ++IF7CaEflbHyz7egRGq35rmHzMWZ
 MXRA==
X-Gm-Message-State: APjAAAW3jbAW/d+DArEatdAjLvWkRxpkDnKOYgtPQa6Od9IMmysZfO8q
 6l2worujTBH53ZTGiv9LGT+uaQZMsFf55H+hrDyhkt+t
X-Google-Smtp-Source: APXvYqy1OjqhZMPSfy200B2Ege+QEoO5oVYz/fUomQGjoKk0DH8JikcwIBZw6gJfa5kLJ8Mm0s+ZwVNWV0Eia3iejpE=
X-Received: by 2002:a67:e90c:: with SMTP id c12mr31070629vso.97.1564551442041; 
 Tue, 30 Jul 2019 22:37:22 -0700 (PDT)
MIME-Version: 1.0
References: <1564547155.4261.48.camel@samba.org>
 <CAOCN9ryBOTTTB8UR2fNX7ZMDM0hJHKT7-Ys8v-VDv4BCgp+uug@mail.gmail.com>
In-Reply-To: <CAOCN9ryBOTTTB8UR2fNX7ZMDM0hJHKT7-Ys8v-VDv4BCgp+uug@mail.gmail.com>
Date: Wed, 31 Jul 2019 01:37:10 -0400
Message-ID: <CAOCN9rz0wCkZZvzsjsXKcm4+Jv0nQWicmuk6PeYwUNGinMyq3Q@mail.gmail.com>
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
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jul 31, 2019 at 1:33 AM Nico Kadel-Garcia <nkadel@gmail.com> wrote:
>
> On Wed, Jul 31, 2019 at 12:27 AM Andrew Bartlett via samba-technical
> <samba-technical@lists.samba.org> wrote:
> >
> > I'm reviewing "Use GnuTLS AES ciphers if supported by the installed
> > GnuTLS version" for Andreas.
> >
> > https://gitlab.com/samba-team/samba/merge_requests/669
> >
> > The one thing I really don't like is the #ifdef on HAVE_GNUTLS_AEAD.  I
> > would prefer we just chose to rely on GnuTLS. [1]
> >
> > Duplicated code is bad, duplicated crypto code is particularly bad and
> > I would really like to remove our existing duplicates rather than add
> > more.
> >
> > Not only are we short on maintainece resources, we would also need to
> > restructure our testuite to force a non-GnuTLS build to ensure we
> > actually test this at all.
> >
> > In doing so I know many folks really like running current Samba (both
> > as an AD DC and fileserver) on older enterprise distributions.
> >
> > In this case, RHEL 8, Ubuntu 16.04 and current debian stable
> > all have GnuTLS versions later than 3.4.7.
> >
> > So, what do folks think?  This would be for Samba 4.12 to be released
> > in March 2020.
> >
> > To see how much can be removed, I'm exploring the idea in this WIP MR:
> > https://gitlab.com/samba-team/samba/merge_requests/676
> >
> > Note, for CentOS 7 and earlier it may be possible to use
> > https://github.com/nkadel/compat-gnutls34-3.x-srpm
> >
> > Andrew Bartlett

I only repackage that, I didn't write it, Credit where it's due, and
quoting from the README.md there:

>>This is based on sergiomb2's work at
>>
>>  https://github.com/sergiomb2/SambaAD

So Sergio gets credit. But I'm already using it for RHEL 7/CenbtOS 7.
I've done some very limited testing with RHEL 8, but am waiting for
CentOS 8 to finally be released to really test  that.

> > [1] Sadly we couldn't totally remove the Samba AES code, as SMB 2.24
> > requires AES-CMAC-128, but the impact would be far more constrained.

Fair enough. I'd say accept the requirement of a compatibility library
for older operating systems, and I'm glad Sergio did most of the work.

Nico Kadel-Garcia

