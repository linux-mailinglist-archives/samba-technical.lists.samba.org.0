Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E492D6ACF07
	for <lists+samba-technical@lfdr.de>; Mon,  6 Mar 2023 21:19:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=n8QOD5x5HUhGtE2Lw016TUqtMR1XOzOtwYL/KGlE++Y=; b=cmc2n1OCuFh6l0sQOAR7VEoiM1
	bZIJeWG/inLYwCFExhHZK14RSnLPBgk58FvwnBod8/CJqIkE3DLEosOJBnUfledhkrLAdFjmk2AOi
	YSs44AnAm2+cOWUNo/bKpgjZXCeZ6PtIO1dVTVBWuxyUugAlDJoip/ZenA1IXB8IOUh5reDkhxpMN
	ELHClDu2AWssjtmzQD1dxML3LJpWvLBQtNOmiOcSlqYjVvhq40QB/d6umyND6FNByF4zuAIU3ncqM
	DPlwV75w1GSQ7g8gEIK58SYoG0hcamuTQt/WDZBwIt1DDQsUzXTkp/qr1iE+dHbSr7u4gYPoapuAh
	paRXTOsw==;
Received: from ip6-localhost ([::1]:23140 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pZHIL-00HYSw-5O; Mon, 06 Mar 2023 20:18:53 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:40523) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pZHIF-00HYSn-PU
 for samba-technical@lists.samba.org; Mon, 06 Mar 2023 20:18:50 +0000
Received: by mail-ed1-x52b.google.com with SMTP id i34so43759803eda.7
 for <samba-technical@lists.samba.org>; Mon, 06 Mar 2023 12:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678133927;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NWr6CV1hAvAs44R8jrv9QskmaSUknF56QqRiZzAW1A4=;
 b=Imsh0MbjesQ9asaVoU5o5eS6fxvrqSd5OrqfFwHRyvLPaV61MmatP63f3YU392Qiho
 VNw6W00IrHDIY4Q6ADMZ0awlhx2S5t10Aqwx4Z7+SgW0Ps3QCEMVhLsIkBTI7nvNSNfd
 BD9Gu5555ym1w5go/ORnzYtuzuiCEqiaYhU6Ho8+304WxBqGifoqzVyaqFb3OEeRQzZr
 QGEesExsojRmPvCvIEizl34VE40OUmdsw/9gltYuf5bZ+w29tg6GNRaNZm8xebJAOo+I
 OAY6GcgWEWX+HwnBExzMst1zml7KqOeIuOjtCQUCFKb+xogBRBP6B2EDWMN/4NI19Ref
 yFtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678133927;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NWr6CV1hAvAs44R8jrv9QskmaSUknF56QqRiZzAW1A4=;
 b=AK7IqNaIVT28FL1yUilSbNhdiv+kVW/wOcEAeVsdt9Gf5bBLDFvoGFb1AJOQKLHlcb
 IKprrmMS4aTGdA9PDJzSiqA/oo5BlkOKNSNbajgeUZimwuc/z5t4rALxvx1jPdcECq0d
 1x++AdMv3x0FPWJUUE+R0vvzVVcisMEBQp34PLW9ddVxRmLmye+W/61FD4ZBx5qIiZhG
 MHcWk8MLtl0JHKD9iGb7V4nzUOfidv+OXHlXWpWGRR0SLDQBYnL/3rlkEG+7lJoXwH7F
 /1lR/yphuutSZOL8zypFOT+wskfIswSM56Xj+pVjNP+9pNMAnQgu8gJPv6WOH7eWmlX4
 i3iA==
X-Gm-Message-State: AO0yUKUIctDkfm7PVPUwu1gSlwq3Gj/fkTYK9Xhp7Ib0FKQntubXuoVk
 afriOfuuHqD8FvMeiDHxV1CgFLbQcI7gmPX0ND8=
X-Google-Smtp-Source: AK7set9OkT75oh4E0SeqTgtZfugVTwE6nk0yxkynq44FNL7loGG8BDWbwY01gvfN7+EwSTe019dp9FLRkglIXiq3gbs=
X-Received: by 2002:a05:6402:12c7:b0:4af:6e95:85e9 with SMTP id
 k7-20020a05640212c700b004af6e9585e9mr8385401edx.4.1678133926693; Mon, 06 Mar
 2023 12:18:46 -0800 (PST)
MIME-Version: 1.0
References: <CAPw4iV5LFvdoici7f5opBUA5bz86QG2cX9muzQ8GDsMU3RcW3Q@mail.gmail.com>
 <YyqQ9HtsTM2lmkQF@jeremy-acer> <Yys3/WVPd/gjBbEi@jeremy-acer>
 <CAPw4iV4AH7e4odCQ=xjzG-bAcr=5mGVPFA8qf18WBz8wun_SLQ@mail.gmail.com>
 <Yy4uev/AGxGDAJB4@jeremy-acer>
 <CAPw4iV4xM0FEvPhbY-7S-uSdF9StW1ZeSniA1qoxzdNh9MdNDA@mail.gmail.com>
 <Yy4xsp3cNIp083La@jeremy-acer>
 <CAPw4iV7imoXjC6RdUttRkr5DkXbbMwFyynomQtR3R0uJRJzqXw@mail.gmail.com>
 <YzHX1mIyc2dQLdhz@jeremy-acer>
 <CAPw4iV6i7gHmVtWZhDTm726g82osDUQkdv0bgt8+2n7o-703FA@mail.gmail.com>
 <YzNNlYhhff/Xt2bJ@jeremy-acer>
In-Reply-To: <YzNNlYhhff/Xt2bJ@jeremy-acer>
Date: Mon, 6 Mar 2023 15:17:55 -0500
Message-ID: <CAPw4iV5zpkHbr1oi6E5kyG2VOU142OcWWf4XDZ738h7SJq=cnw@mail.gmail.com>
Subject: Re: IPv6 and commit d882add695bbd5ea03961c08ac2c0380fbf2947b
To: Jeremy Allison <jra@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: "Nathaniel W. Turner via samba-technical"
 <samba-technical@lists.samba.org>
Reply-To: "Nathaniel W. Turner" <nathanielwyliet@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Wow, where did the time go?!
Bug: https://bugzilla.samba.org/show_bug.cgi?id=3D15325

On Tue, Sep 27, 2022 at 3:23=E2=80=AFPM Jeremy Allison <jra@samba.org> wrot=
e:

> On Mon, Sep 26, 2022 at 08:53:13PM -0400, Nathaniel W. Turner wrote:
> >   On Mon, Sep 26, 2022 at 12:48 PM Jeremy Allison <[1]jra@samba.org>
> wrote:
> >
> >     On Sat, Sep 24, 2022 at 10:17:07PM -0400, Nathaniel W. Turner wrote=
:
> >     >   On Fri, Sep 23, 2022 at 6:22 PM Jeremy Allison <[1][2]
> jra@samba.org>
> >     wrote:
> >     >
> >     >     This code:
> >     >
> >     >              * We're only returning up to 2 addresses per
> >     >              * DC name, so just allocate size numdcs x 2.
> >     >              */
> >     >
> >     >             dclist =3D talloc_zero_array(mem_ctx,
> >     >                                        struct ip_service_name,
> >     >                                        numdcs * 2);
> >     >             if (!dclist) {
> >     >                     TALLOC_FREE(dcs);
> >     >
> >     >     needs an integer wrap tests for numdcs * 2 before
> >     >     passing it to an allocation function. Something
> >     >     like:
> >     >
> >     >             if (numdcs + numdcs < numdcs) {
> >     >                     TALLOC_FREE(dcs);
> >     >                     return NT_STATUS_INVALID_PARAMETER;
> >     >             }
> >     >
> >     >   Oh, good point. Updated.
> >     >   Does the overall approach seem like an OK compromise for now?
> >     >   Changing process_dc_dns() to do parallel pings does seem like a
> >     natural
> >     >   next step, but is also much larger in scope. I might be able to
> work
> >     on
> >     >   that at some point, but my time (and risk tolerance) is pretty
> >     limited at
> >     >   the moment.
> >
> >     Err. Can you resend the gitlab URLs. I forgot to save them (sorry).
> >
> >   Sure, the proposed change is at
> >   [3]https://gitlab.com/nathanielwyliet/samba/-/merge_requests/1 and I
> can
> >   file a bug and open a real merge request
> >   at [4]https://gitlab.com/samba-team/samba/-/merge_requests if this
> seems
> >   like a reasonable path forward.
>
> This looks a good fix to me. Can you log a bug and create a gliblab
> MR for me to review ?
>
> Thanks,
>
> Jeremy.
>
