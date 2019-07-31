Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 189E87B913
	for <lists+samba-technical@lfdr.de>; Wed, 31 Jul 2019 07:34:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=2RCeO+PmWrrOzAbJ9/38KXADVn/CmYStSjD8gsVdWwM=; b=3f8Nmt26EZ5ebtzm8RgVmvC+Rl
	w1yy9FM8JfICnU3gBHepMDhWr5w7PYsWsjCeF6io9FeNhJDivGe9ZV1wJtTDGLuj38XnRWLtHf2MT
	tSUX+xcvHX5UXyWvx/x6RsywqLqHnQIYk/jfuLTJAh9jRR6KTshLfpVMz3SUu2e5FAmzg7S8Bkcp6
	Kl+ifOCFGobp9r+2ZjUcf9wAPUvkRPR+PPOp+5++nvm2YMkMFKdL/3ww7j0Ns5jxFoARshB1DVFz5
	jHAp3WrV2OPGAZS368UYeQXmmxvhQ2dl+/4fHxm170AUpSyDXwqN7pvZoZ186BUFQaKauJDVpRTCm
	Ja+SLaag==;
Received: from localhost ([::1]:62668 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hshEv-0017w5-Eu; Wed, 31 Jul 2019 05:33:29 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29]:36663) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hshEr-0017vy-Ao
 for samba-technical@lists.samba.org; Wed, 31 Jul 2019 05:33:28 +0000
Received: by mail-vs1-xe29.google.com with SMTP id y16so45302807vsc.3
 for <samba-technical@lists.samba.org>; Tue, 30 Jul 2019 22:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2RCeO+PmWrrOzAbJ9/38KXADVn/CmYStSjD8gsVdWwM=;
 b=Clbb2ZpLCM4jKxXhvOCTXJQuyMRS0ln7vVs/HCzA53BYPQRY29nTMVPQKNmt2WfRiw
 XyinCdQ6GLmwKX9GdANv+0y//2NoJa0owI7X0bcCa7O6mT+HbXXmAordiGhqG1N46+04
 TOEGqMeXs6Y8FgAPsXPXKL3OtM6AST/XyRdXoYMkJtg0LlCi40ly1bDpXj5jS6kilm6O
 KLcnG2Yr4Ywd7Xb3FCkWuNILmVYr2TEfOrp41dM/5U4zsKFXftolCyPGlzrqtdkHXCWE
 IVJkCdg9y8f6aJgXINcxipBU3qmcQHoCgaiFx1QLi6JDoF4bnZthsKTFiZR3LVPqge+v
 4jNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2RCeO+PmWrrOzAbJ9/38KXADVn/CmYStSjD8gsVdWwM=;
 b=uOBsNPlDGoI03MCGUJ7v7lpjCo3Pp5ms5gbACGJNKA9kalH7iK4Qs5aLixVPgFCUBU
 yKuN8twpK/JT7jlOlFtzFyooTOLMTYImp17zZ8bdzp5iR77/agHS5IJWQEY+W/BAFbHX
 aXh57PqEUat6hoZflAacNmXmteglcvhDtoTyHAFtI5bgPBxgCQK1a+ChxAf81cH3sRZB
 /JPmH579//daU3VSPl6J6mG5pSSMhUoLuZ9rrbXXUCQM5OS5ksUu1cOzlymSffMKYnsm
 71syfC4Xkp49WKvuRLkv5qP5cmXGdKZ5AIxWNhGKZ5RC7GinVXalv3IZOzw+6X98iKKp
 6Wkg==
X-Gm-Message-State: APjAAAWjrkIfxH8ly+livtozBQT7Nvnjm+HtultCSfq+YtYMvwjYNofo
 TRnQVXLrNkbluZhzUAGYtDziaK2815ImqFDkS5G9zw==
X-Google-Smtp-Source: APXvYqy/UM+1H1qe0vdaEUlz7IQ/StNepjhoF0V6rWRSQMtJzse29uYTrhFnY56jlUXOXFQ0sAvFYEgv0jkn4bon9bk=
X-Received: by 2002:a67:f618:: with SMTP id k24mr77066849vso.66.1564551201404; 
 Tue, 30 Jul 2019 22:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <1564547155.4261.48.camel@samba.org>
In-Reply-To: <1564547155.4261.48.camel@samba.org>
Date: Wed, 31 Jul 2019 01:33:09 -0400
Message-ID: <CAOCN9ryBOTTTB8UR2fNX7ZMDM0hJHKT7-Ys8v-VDv4BCgp+uug@mail.gmail.com>
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

On Wed, Jul 31, 2019 at 12:27 AM Andrew Bartlett via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> I'm reviewing "Use GnuTLS AES ciphers if supported by the installed
> GnuTLS version" for Andreas.
>
> https://gitlab.com/samba-team/samba/merge_requests/669
>
> The one thing I really don't like is the #ifdef on HAVE_GNUTLS_AEAD.  I
> would prefer we just chose to rely on GnuTLS. [1]
>
> Duplicated code is bad, duplicated crypto code is particularly bad and
> I would really like to remove our existing duplicates rather than add
> more.
>
> Not only are we short on maintainece resources, we would also need to
> restructure our testuite to force a non-GnuTLS build to ensure we
> actually test this at all.
>
> In doing so I know many folks really like running current Samba (both
> as an AD DC and fileserver) on older enterprise distributions.
>
> In this case, RHEL 8, Ubuntu 16.04 and current debian stable
> all have GnuTLS versions later than 3.4.7.
>
> So, what do folks think?  This would be for Samba 4.12 to be released
> in March 2020.
>
> To see how much can be removed, I'm exploring the idea in this WIP MR:
> https://gitlab.com/samba-team/samba/merge_requests/676
>
> Note, for CentOS 7 and earlier it may be possible to use
> https://github.com/nkadel/compat-gnutls34-3.x-srpm
>
> Andrew Bartlett
>
> [1] Sadly we couldn't totally remove the Samba AES code, as SMB 2.24
> requires AES-CMAC-128, but the impact would be far more constrained.
>
> --
> Andrew Bartlett
> https://samba.org/~abartlet/
> Authentication Developer, Samba Team         https://samba.org
> Samba Development and Support, Catalyst IT
> https://catalyst.net.nz/services/samba
>
>
>
>
>

