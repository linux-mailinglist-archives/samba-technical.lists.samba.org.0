Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA154DE18D
	for <lists+samba-technical@lfdr.de>; Fri, 18 Mar 2022 20:01:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=eiPO5N1sINDntcnUOrVWIjUofyYHOSb8IjF9WaGpKfU=; b=54Y+B0dD5GLSwBVtqwrpDc7phi
	U0Ki3AJbiQseQaLlEHAIySACE8z+eRYqXvpDIm+ziSWJJbaT94WXqpii2V6qmpZ5gOGG1QRFINizh
	UQTqVtbH26ldtGxqPhY+bEi95/TsUWXw7jIHT/fY9NQ6qzs0UqqeLikuseDZNHqQoAI4NS1ImjRld
	YywWGCLpn0swy4n7oeNNiDc4qw3mNVMLlnUmPaw8chYs1DV8P8LbP4yJO30jbVo3ee1e+f3ME003e
	XjEdtepjkqSYttp71gmOifNt9hlYzRkUL6zGPiqQvz7Un4dGWVcwFQczOYk3/VO5p14ye0JtbZFUS
	btpHRQqg==;
Received: from ip6-localhost ([::1]:59730 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nVHqF-003UUN-4L; Fri, 18 Mar 2022 19:00:51 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:39859) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nVHq8-003UUE-VY
 for samba-technical@lists.samba.org; Fri, 18 Mar 2022 19:00:47 +0000
Received: by mail-il1-x133.google.com with SMTP id q6so6447693ilv.6
 for <samba-technical@lists.samba.org>; Fri, 18 Mar 2022 12:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fO2uRoPRNC27DtW5/B1i+mXYDiFzvBtMn6HcAYaaHI0=;
 b=dG7n50l3kC8j2CmyETKdDOm7J3KkNQJLda44A+2HtavVzdMGdFECWjM4eZD8wVHgWG
 D1kygfxROySo4LwbmP++3bHq5pUgKOa0vBPYnJqa1TuB0ZnmiZB5LwayGT/ce8Im7H7v
 5aTWX6DX5zOLOmGGCol3tSHPvls9EdPVc4rFBT3LtbxvvGa+LilJOR3E+OK0FAFMbrtr
 Ixp2II1o9rRY7EWfYAX4Jb04wDJvbsNQtm6RYOkF3Pni+dCfnGyToCTFG1y2RrARK/DQ
 wjMRQCA7kZBqWcQMwfDrgZ1MXzUPfd5dQ9SW4Q6RORqbHnho/iXVvt0mu4Aa0gLEJVnE
 /NDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fO2uRoPRNC27DtW5/B1i+mXYDiFzvBtMn6HcAYaaHI0=;
 b=A0CuWiHjGBiwSTk3gMHgC9QAGJUu2bdgE9ow4qcCci6K9tE/SaXWUZjRJRVyezXUy9
 t+eMZ84ULvgW+9WvgaORGpQ5QIA3PCfDS5w6aABYajUoEIENvmGWmR4yAYvNQ24dMpfr
 roI3/lzhKqcCPP2srqO/FLw1LMVHFejYiRv0Kv/BENtxwlAoJSE1WylpGcu5bOH+TW5u
 H0iw9HZWTYYAGtlF0hBRQtVfwiGlaHpzr0CkoXU0VH90b47LEbwX9fqWgnoYbj17Scsu
 xxojqYqKORCUwcLGjZKrn9FxfMi88zpd5/I4cGLj+TqH5SflhptfFXyq/dZax874muzV
 +qwQ==
X-Gm-Message-State: AOAM5315PlU+s8DEYo0nIGaZucAvUTrFmZ14M/V+KBB2a9XBhUuYDHqN
 ggbEzZAJPUgj2tjgL+KMwg54CJnASJ4vzCzhre3Z2KfIV7o=
X-Google-Smtp-Source: ABdhPJz3U175+2p6RSHbWEB4QrV86SdRCTmQBlFOAc0xrR0bHzm3Tma2FwhpSo7v1q/gr3e8I+m3nJjtbWafWFxZINg=
X-Received: by 2002:a05:6e02:1a4f:b0:2c6:6499:9d1b with SMTP id
 u15-20020a056e021a4f00b002c664999d1bmr5029121ilv.119.1647630042791; Fri, 18
 Mar 2022 12:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <e0c3b5921e018a5b74448f40a26af4015193824c.camel@samba.org>
 <CAH9M6r+uJ8VPTdHy_=094QXOqQaf63DpfN9H0k0kUaKfUk5ajA@mail.gmail.com>
 <0d1584239bc53567cb2165074b63338d6570f4d6.camel@samba.org>
In-Reply-To: <0d1584239bc53567cb2165074b63338d6570f4d6.camel@samba.org>
Date: Fri, 18 Mar 2022 21:00:31 +0200
Message-ID: <CAH9M6rL7Xc9BnymYt5vgiacwG4jOStNBmumvgOt0dDMGwSwVVg@mail.gmail.com>
Subject: Re: We need to rework FIPS mode in Samba
To: Andrew Bartlett <abartlet@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Aleksandar Kostadinov via samba-technical
 <samba-technical@lists.samba.org>
Reply-To: Aleksandar Kostadinov <akostadinov@gmail.com>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

It is good for samba to have some switch for enabling only secure
algorithms. But I don't think it has to be implemented by the FIPS mode.
Some newer secure ciphers can yet be unaccepted in a FIPS standard. FIPS
doesn't mean highest security. It just means the FIPS standard.

On Fri, Mar 18, 2022 at 8:36 PM Andrew Bartlett <abartlet@samba.org> wrote:

> Correct, Samba can't be FIPS compliant, but we can avoid using known
> poor cryptography not for certification purposes, but for sensible
> 'secure by default' or at least 'can be configured to be sensibly
> secure' design principles.
>
> Just as you wouldn't offer SSLv3 even when the host is not FIPS-140
> certified.
>
> Samba's CI system runs on a Ubuntu 20.04 base for the majority of the
> tests (as mentioned, we run a tiny number of tests in a Fedora 35
> environment to test "FIPS mode"), but most importantly the final
> autobuild is under the Ubuntu 20.04 platform, so we should ensure that
> our tests are run there when possible.
>
> I'm quite disappointed at the "FIPS mode" in GnuTLS is optional in this
> way - also denying any application or administrator the opportunity to
> opt out of weak ciphers on a per-app basis - but that is life.
>
> Andrew Bartlett
>
> On Fri, 2022-03-18 at 12:07 +0200, Aleksandar Kostadinov via samba-
> technical wrote:
> > How can samba be FIPS compliant on a non-FIPS compliant operating system?
> > Might be easier to just run the tests in a FIPS compliant environment.
>
> --
> Andrew Bartlett (he/him)        https://samba.org/~abartlet/
> Samba Team Member (since 2001)  https://samba.org
> Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba
>
>
