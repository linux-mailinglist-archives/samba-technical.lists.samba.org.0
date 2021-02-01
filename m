Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C617630A17C
	for <lists+samba-technical@lfdr.de>; Mon,  1 Feb 2021 06:37:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=6Oy2DSIsrQZj+IR/w83aW9G7j3uNsuYNWReRr3oxTgg=; b=jyj1z8TA5d1qPg3pXoZDjFaLb6
	r01u76gGTI/TEMI3y3eY5bb/e5Fxmp+K5z4ZyylUqWNhiQebA/NGQoGwF/2rDEM+qjKD4TJ5Jj5dn
	gvav+pXEpoLNiMkrBr1XOldlc/bYrulc8PmhPk2hXoOIVVKjHqKZIYptJCO0N8zKQ7vmWRycKUIf9
	dNiBhL+UMdBMbmmGMKqLOJ31aUmDJRp3HlPJCvXOqW1SxF4q16u1EgOZ9Z9ObiNPAbDyKJY6e9GyF
	h16Pii+NVT7xj6FW0ekHlR+AO3wbY2OoUvxQSg6+OYAyd4zuqeT3cSAVQWuRiRHW6mVt6dMaxvSPr
	32GKvq/A==;
Received: from ip6-localhost ([::1]:62200 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l6RtC-009vwx-Ea; Mon, 01 Feb 2021 05:36:42 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36]:46460) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l6Rt5-009vwq-3h
 for samba-technical@lists.samba.org; Mon, 01 Feb 2021 05:36:38 +0000
Received: by mail-vk1-xa36.google.com with SMTP id d6so3664175vkb.13
 for <samba-technical@lists.samba.org>; Sun, 31 Jan 2021 21:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pmIEBeCyWOVVLXITZygi4DTPeoWYpf0cWLWeiWybua8=;
 b=ibHDWilASWh1uX6Yf/YP/HYGdnc9HR586RLqENwjLmqT2ta+VPoD+bpznQ9paMPcDo
 X1x7FiLPzZfrRXLLhLCNEEUR3qu4msBP8O4e12NYIiEhlFXlAPwT27LmFymS2IV03lYT
 dF93nXfcOjPw290xuSOlF4JoKG56DgReuR54n2qy/WhNTxlU4enjzAwNcIiLE4HmrMtf
 xSp4HNuuma5LRrMKBrR9UZZ/etae3qyXcr3W60uc/kZJgTQbcQCMX0EaEB6V5P1Tb8UB
 qOOj45MM2+cWeAF8Ohg8ZPvCYVJ/sowU/hoEoeIE187u/2nn87MAcMqRwEp+Jqt9awon
 //OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pmIEBeCyWOVVLXITZygi4DTPeoWYpf0cWLWeiWybua8=;
 b=HyEjawvbUNSRHZTq5s/1Wz+tkJcIrTUEolVFuG+ygW0sR65TT0aV7kwSejhkKmPFGA
 I36op9zsMqKNOTzNUr/VdFxWheY05T/QZN15rNkpkPoZI8pnxqmE620ux4oABuYwM4lz
 iEQvkr+nf2W/9ZdX63l+v1FgKJQR7/fNZWXVpo93wBrQ9LLUxM+gjww+Cl7HsYLYajbk
 ILbaSpvKKy6cWsOjZ7ZJOqEaTqQFiDV2B9nYx0ocMNxAqWT8vkUfIcVuJU50BSVXMnSc
 lO7zL3Xr8TRX1YkI0ddLw0Ss97dPdQlMnDAViTggLah/TIxeFswgP3FX76hJVZrvNDzH
 2YbA==
X-Gm-Message-State: AOAM531MGzM4C8DPD6QalsQ9Agz8JtskBJ5wkcdan6Hkh5NTtrzA934V
 W4bRqPlW+4z/RanqoShYI500MOdOuUUVykU/qXo=
X-Google-Smtp-Source: ABdhPJy6eDuQZtZ7F4npsryzqTlBG6Lyc7n7KDtR2df6tLBOiDNxo845qsn9L63ZXffsKuIoijAKfyTCXFYmcvOY5Uk=
X-Received: by 2002:a1f:d403:: with SMTP id l3mr2928690vkg.4.1612157791904;
 Sun, 31 Jan 2021 21:36:31 -0800 (PST)
MIME-Version: 1.0
References: <CAHbM3qh3pAXzSzSRNjE77jL1tmsREuRu9BQOCaPnWBY9dVdNdg@mail.gmail.com>
 <20210129210511.GA50742@jeremy-acer> <1852905.PYKUYFuaPT@krikkit>
In-Reply-To: <1852905.PYKUYFuaPT@krikkit>
Date: Mon, 1 Feb 2021 11:06:21 +0530
Message-ID: <CAHbM3qhcs6f6g2vWO8Oif7dpxPkhOO6z90FcQZc89xp9_fSXng@mail.gmail.com>
Subject: Re: winbind cache issue for NDR entries
To: Andreas Schneider <asn@samba.org>
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
From: Shilpa K via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shilpa K <shilpa.krishnareddy@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

  Hi Andreas,

Thanks for the response. If it helps, I used below sequence of events to
verify the fix

1. block trusted domain DC IP
2. kill winbindd
3. Try mapping share using trusted domain user credentials. At this point,
it appears like the domain sequence number became -1 and the NDR sequence
value for the trusted domain DC user was -1
4. unblock trusted domain DC IP
 5. Try mapping share using trusted domain user credentials and this
continuously fails for 30minutes because of below code:

        if (!is_domain_offline(domain)) {
                uint32_t entry_seqnum, dom_seqnum, last_check;
                uint64_t entry_timeout;

                if (!wcache_fetch_seqnum(domain->name, &dom_seqnum,
                                         &last_check)) {
                        goto fail;
                }
                entry_seqnum = IVAL(data.dptr, 0);
                if (entry_seqnum != dom_seqnum) {
                        DEBUG(10, ("Entry has wrong sequence number: %d\n",
                                   (int)entry_seqnum));
                        goto fail;
                }
                entry_timeout = BVAL(data.dptr, 4);
                if (time(NULL) > entry_timeout) {
                        DEBUG(10, ("Entry has timed out\n"));
                        goto fail;
                }
        }

The entry_seqnum and dom_seqnum were both -1 (DOM_SEQUENCE_NONE) and so the
data was returned from cache and the NDR call to child processes was not
made.

Thanks,
Shilpa

On Sun, Jan 31, 2021 at 1:18 AM Andreas Schneider <asn@samba.org> wrote:

> On Friday, 29 January 2021 22:05:11 CET Jeremy Allison via samba-technical
> wrote:
> > On Fri, Jan 29, 2021 at 07:39:40PM +0530, Shilpa K via samba-technical
> wrote:
> > >Hello,
> > >
> > >We had a customer report that the users were not able to login for about
> > >30minutes and the problem cleared itself in almost about 30minutes. They
> > >are using Samba as a member server in a domain which has 2 way trust
> with
> > >another domain (say ABC.COM). Upon investigation, we found that there
> was a
> > >problem with trusted domain DCs for a very short duration as per the
> event
> > >log on the DC of the primary domain. This problem seems to have been
> > >cleared away after a short duration. Around the same time, a user
> belonging
> > >to a trusted domain mapped Samba share and encountered a problem. At
> this
> > >time, looks like NDR cache entry for trusted domain group "Domain Users"
> > >was added in winbindd_cache.tdb to indicate that there was a lookup
> problem
> > >and the status NT_STATUS_TRUSTED_DOMAIN_FAILURE was stored as part of
> this
> > >entry. Once the issue with trusted domain DC was cleared and the domain
> was
> > >back online, when users tried to login, PAM_AUTH was successful for the
> > >users but getpwnam failed while looking up SID for "Domain Users". This
> > >failure was returned from the entry in the winbindd_cache.tdb as
> > >wcache_fetch_ndr() succeeded for this entry. Due to this, users
> belonging
> > >to the trusted domain were not able to login. Once the cache was
> expired,
> > >getpwnam succeeded for trusted domain users and the shares could be
> mapped.
> > >In order to resolve this issue, should we not refresh the sequence
> number
> > >when the domain goes online? Btw, we are using "winbind cache time =
> 1800".
> >
> > Yep, looks like we should add a call to force a refresh of the
> > sequence number in the cache here:
> >
> > source3/winbindd/winbindd_cm.c:set_domain_online()
> >
> >   538
> >   539         domain->online = True;
> >   540
> >
> > Add a force_refresh_domain_sequence_number(domain) call above.
> >
> > Here is a (raw, untested) patch that implements this.
> >
> > Any chance you can test this for me ?
> >
> > Jeremy.
>
> I wonder if this is the dc-connect issue with trusted domains.
>
> A fix for this we are currently using is:
>
> https://gitlab.com/samba-redhat/samba/-/commit/
> 87bdffab6eae644d468f0fdc4489667fc21ac3a6
>
> This is just a hack as the right fix would be to completely get rid of the
> dc-
> connect child. However the winbind parent needs the dc-connect just to
> refresh
> the secquence number.
>
> Isaac started to investigate this further and just had a draft for this
> which
> was never finished. We really need to fix this correctly.
>
> https://gitlab.com/samba-team/samba/-/merge_requests/1573
>
>
>
>         Andreas
>
>
>
