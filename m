Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AC2AC4D4
	for <lists+samba-technical@lfdr.de>; Sat,  7 Sep 2019 07:58:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=p+d2x8RDv2Hc3OQkHVfgjAoy7hacEXnfYL+slISXPrg=; b=jjEjz93Sm+X8sBALNsl8iDhSaf
	c3qViUnX4PtqLVG6o6n7BQ0LwTSPK6+TivYjYY6jDGeeYpT7rAhPN1Ga40Df9aDIRLWouKXZQYqSq
	AgbT/i47jIZITNpinYtDbbgOqfRpmc/U5r93lim1YaRDou4cn7zhMr3PJk8/rUCqSzQmlHVNjSu2m
	LljPh2HeuNmnrkkEHFFoZx8yNdFWdqRGgbYDSttXWH+KTuf8W3l8a5dy0uHMKaHjAFPEoQLaTyvyB
	1qLOEc7pdCaUfbybPLhY4XKacWFrRVgAUrETD6cD3JInnP2DVqw3RpHJO0g2Rrls+GrmoxkNrzXFr
	d5tsrb+w==;
Received: from localhost ([::1]:45092 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i6Tk1-0049g4-6U; Sat, 07 Sep 2019 05:58:33 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:39224) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i6Tjw-0049fx-O2
 for samba-technical@lists.samba.org; Sat, 07 Sep 2019 05:58:31 +0000
Received: by mail-oi1-x22e.google.com with SMTP id w144so6829336oia.6
 for <samba-technical@lists.samba.org>; Fri, 06 Sep 2019 22:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=p+d2x8RDv2Hc3OQkHVfgjAoy7hacEXnfYL+slISXPrg=;
 b=gg0gSFeaAJwmtQDXHWWySjEHRka/OGeMZ2dHMni5TERWYqidJNOQmgOizAV1Lr9fft
 8yUOwI6Wz7e8giwdbolNQ6KwZRrR7TCfvKMV4lRZ0uoyFZva/Izbo3ymezzsB5fbSJuv
 7oyTveYZwQqW4AX2hYvi6quTKZOMxdoFnM8D1vKkv+VtbyrjHlv9n5agd70mFV6X2wXN
 BzeEWnJC7ZUYpKEaL7QgbCB9jQEPFI9QgnTL6t969C2LHKUj94/WM2vkk3f0+uAjCjva
 U+rBjXer4OF1BLUL2FKfvcuwaxb3x620cfCXZi0luwa3TF8DDPDx6YoA6hX75jqW3o2+
 yelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=p+d2x8RDv2Hc3OQkHVfgjAoy7hacEXnfYL+slISXPrg=;
 b=liy9/vq2iaaTG0jd/DkkR7OosCW6H6qXUci2lFBgvQhR7wUMCETteorTdDondVeYxr
 Fcw5QYo8bVV0XpRC414+CsKDMb1y/FzjJMRoeYlnyAYb6rhvQqTYLp/MjY6FB6aiKoQt
 CQL9COE5e/7uM94R0HLYlnyVLD4Ai/yng22NZU7wA0suSnAAK/b50yb+PpUgAXHdg/Ja
 d6jec8vcg9uNzFIzzc1DptqdVbdMqVEWUlgyX9cloSFItQ8TKD1FXE0fLZBLOxpZKvwi
 /9axZvNDTo54fomUeEs/vh7rJpucXN3YwUH3ig+5IXs7dIk4MjOPt9L+hltwSeFKEmG+
 4n1g==
X-Gm-Message-State: APjAAAXktu5J3LyAS5cJeBUAS3fboBVa8SWNu8JBihuXsdfEBzLdFalX
 NTwyp0pif+MFKRgQFKbiALNe+9iNWHRvQF2j610=
X-Google-Smtp-Source: APXvYqwQY899Gh0GSVx5pUex3/l6YeMeRTD6fLCViEJLOm4Qzpwgu806D+noZfHeWYb6JV641idXO4uRDZsLuwRHmVw=
X-Received: by 2002:aca:dfd5:: with SMTP id w204mr8428680oig.62.1567835906424; 
 Fri, 06 Sep 2019 22:58:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:1d4b:0:0:0:0:0 with HTTP;
 Fri, 6 Sep 2019 22:58:25 -0700 (PDT)
In-Reply-To: <371f328678d7f01b7051d657499ec0f8b341b2f9.camel@samba.org>
References: <CGME20190906020151epcas1p487a64747d0a00c84bc683fe0d07207bd@epcas1p4.samsung.com>
 <006701d56457$0c77fc60$2567f520$@samsung.com>
 <371f328678d7f01b7051d657499ec0f8b341b2f9.camel@samba.org>
Date: Sat, 7 Sep 2019 14:58:25 +0900
Message-ID: <CAKYAXd80cwJ2XUOBoP25M94mB_P200Y7BnajsSZwWkMuuXO8Yg@mail.gmail.com>
Subject: Re: samba performance difference between old and the latest ?
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <linkinjeon@gmail.com>
Cc: Namjae Jeon <namjae.jeon@samsung.com>, sergey.senozhatsky@gmail.com,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

2019-09-07 12:20 GMT+09:00, Andrew Bartlett via samba-technical
<samba-technical@lists.samba.org>:
> On Fri, 2019-09-06 at 11:01 +0900, Namjae Jeon via samba-technical
> wrote:
>> Hello,
>>
>> I found something strange during measuring performance with samba
>> these days.
>> I checked the performance of samba 4.7.6 and 4.10.6.
>
>
>> samba 4.7.6 : 11.6MB/s
>> samba 4.10.6 : 9.5MB/s
>>
>
> Jumping back to the top of this thread to focus on what you could help
> us with.  If you built Samba for both of these tests, then perhaps you
> could do a git bisect between those two versions to work out where this
> degraded?
Yes, I agree to narrow it down.
>
> Of course, this assumes it was a single commit, but who knows, it just
> might be.
>
> Either way, if you were able to additionally test 4.7.latest,
> 4.8.latest, 4.9.latest, 4.11.0rc3 and master (so as to add to the
> dataset) it would be a massive help.
Hm, okay, I will make time.
>
> Thanks!
>
> Andrew Bartlett
>
> --
> Andrew Bartlett                       https://samba.org/~abartlet/
> Authentication Developer, Samba Team  https://samba.org
> Samba Developer, Catalyst IT
> https://catalyst.net.nz/services/samba
>
>
>
>
>

