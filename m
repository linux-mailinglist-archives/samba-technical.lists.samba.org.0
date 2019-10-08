Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F50BCF5B3
	for <lists+samba-technical@lfdr.de>; Tue,  8 Oct 2019 11:11:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=QuzDM32yW0od9y+ac8Gw0SzmHRPlpttRnLi10/oxADc=; b=SlM7BpfpVK/6AWpEXF/twc6Vkw
	HxOaeo+91lEboceGbg5dbif7X0zNHFV9s8ZsQXhoV3lXC4VBG8WUUrjHp/TV15hm5G3FpVOBGmFSK
	Z6lbi7X+YFiRMttJp/X18dqqCcVBjed2ClHAUEAHcxHZMKJgfaV35/qLJZbWz24aMaIZr8rUWAm7I
	8v9+i0cDjE/wbtvlFmzVR8u7jy+CdRitSq7ItmEt1nXze3COC21Bq9o+AWpYS502WoQeT4WPI5Zm7
	izWa+KoxAPuEv+/INzyfOW+WU/q9ftULvBO4TRk00LpGoTi50itlmIYtiOqA/NqFNSNJGmq1EzRc+
	4SgatEFg==;
Received: from localhost ([::1]:40544 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iHlW1-0022yA-PN; Tue, 08 Oct 2019 09:10:45 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:39408) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHlVx-0022y3-8z
 for samba-technical@lists.samba.org; Tue, 08 Oct 2019 09:10:43 +0000
Received: by mail-io1-xd2f.google.com with SMTP id a1so34929393ioc.6
 for <samba-technical@lists.samba.org>; Tue, 08 Oct 2019 02:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QuzDM32yW0od9y+ac8Gw0SzmHRPlpttRnLi10/oxADc=;
 b=hEJAcAZBLAp8415KnzzcxI/bpLJiojNQq8vluLx9HNyzk1A2OGy8F21Gur5I0177Sh
 VzuIPzfeAxx96ETwNCUhhwLHTPtmLu57HjCZR+CLTWDtevXi2gYDU3mwzeQm+hlN8q1p
 HE1XXJUIfiIX+IBWWzNpM1u9vJTVTqC+vWyVJxYxT6pAoJv+0rCwfSwqWQc9P3aJA0j8
 eKyrNmklKZA8Q4t1ccYHNx5J1C1vKZRxXEWFgEVLsJJSh+L2c2erewbbQ9N8ZYqK2kH4
 YE8anJD4Msdn9J9BBs64yqEFOsV3kWwj3ecFlnWKs8rVZq+gfR1y39EoNlufTV9WqQrC
 Kibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QuzDM32yW0od9y+ac8Gw0SzmHRPlpttRnLi10/oxADc=;
 b=mqMh5/r1XO6Yji+A5Bb67qtd5iTQ5+Ycg/QdtTiOkk1PlmWjVgUq2+EqlMm2V3PHmr
 Y1u6oOU7k6HA1RIcHiek8ls3J8gTNNYirXDisuuGT8tvI961gPs1DMzL3X6O2kIoRE7H
 Bir4mlAiKyf6TZ6zBnivvhei8bgZckSndD1/epW+9YNJIupq7hEtYnis2lh/Tc4yYciT
 c5jXDAsdr57zMHNH4/jypkVB3EW4jp68JN/iUPgKbVK/m5hCMxgs91irBM3Q65vJydN/
 nM+ViBPbCKFBsRcouNq4OGb9Ta9zyk0CB31kP4aV2bwWL+bZjfXZnoT5kpZJvWo509km
 69+A==
X-Gm-Message-State: APjAAAUb2yiY4B5T7sqrdplAy/2dhZHiomFh9YcWzP3ylT2rx8aMjS8K
 uRPQwERFa7fT76lUSSzRi2MdpuaWBV8mU5sN8NU=
X-Google-Smtp-Source: APXvYqzYqd0i1AIEodFlePaLKmYLKYMqZcJXh+BLgNyzhK15zoggWQENxlxxaSo6sOXnmBkTm0mG4gArr7X/6EizgA8=
X-Received: by 2002:a92:2903:: with SMTP id l3mr2137056ilg.109.1570525839394; 
 Tue, 08 Oct 2019 02:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <5849953.E8HlOTvGIY@magrathea>
In-Reply-To: <5849953.E8HlOTvGIY@magrathea>
Date: Tue, 8 Oct 2019 19:10:29 +1000
Message-ID: <CAN05THRPeQg_aCZeaUmh-3xaC8UKHQiqaVFA01vZuqUSLN=p9A@mail.gmail.com>
Subject: Re: Samba and legacy Windows support
To: Andreas Schneider <asn@samba.org>
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Oct 8, 2019 at 7:00 PM Andreas Schneider via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Samba with version 4.11 currently still support a lot of systems which are
> already out of support. We still get bugs to either fix support for Windows
> NT4 or OS/2. Also we know that Windows Server 2003 with Active Directory is
> still deployed.
>
> In order to remove support for those platforms which are very long EOL, we
> should try to make announcements when we plan to remove support.
>
> ## Steps planned
>
> With Samba 4.12 we plan to disable SMB1 by default and then remove support for
> it in Samba 4.13 or 4.14. This means end of 2020 or beginning of 2021.
>
> If we remove support for SMB1, we could also remove support for NTLMv1 and
> Kerberos support for DES, 3DES and maybe RC4. Already on Fedora 31 use of
> these encryption types is blocked by the default system-wide policy and is not
> available through MIT Kerberos. DES support is fully removed from MIT Kerberos
> 1.17.
>
> NTMLv2 is still widely used and it uses RC4. This means we can't remove
> support for it till there is a valid replacement for the pure file server
> case.
>
> ## Questions
>
> * Can we remove NTLMv1 and LM keys for Samba 4.12 (remove `libcli/auth/
> smbdes.c`)?
> * Can we remove DES and 3DES Kerberos support for Samba 4.12?
> * When can we remove RC4 support with Kerberos?

My opinion:
First two questions: Yes.
Third question: at the same time.

There is always going to be older versions of samba available to those
few that need obsolete features.
Eventhough no one ships a default distro with telnet installed or
activated any more, the twelve people in the world that need
telnetd can download/install/use it just fine.

>
>
>
>         Andreas
>
>
> --
> Andreas Schneider                      asn@samba.org
> Samba Team                             www.samba.org
> GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
>
>
>

