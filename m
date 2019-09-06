Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E065AC21B
	for <lists+samba-technical@lfdr.de>; Fri,  6 Sep 2019 23:41:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=VTJ6ywtXF0Kb16M8r2gdX3dF3j+El9LhnIg0gn6rXqg=; b=g7nBINJnwvZ2y89PInLK10q+1u
	MlfJqwjLuWqQfVHjy19TD/qEZMOXBAVM/FD1sBH4vVbcO9t9tP6UmlKYfPvb9UlPC7us5An6tZT4n
	nyGCYKk32vLxV9/0Sa24T9UHTroZJUW1dvktrEdeIJuNhRWOSly99zDBYJF19a2F9jyoIJa0PXJkU
	P24fjZjRadpK6X8RFeMQWw78uafKVimIVKe5BoIJSxvetMosVUZlO52TCFYkJoHqEUfUOAZiwmat2
	bGcsRYqMv8EmLt13fv6dklPL5fSGaOP8Vk2qlGQT5PTY+IUBOy9k3WS4LTwUkVMHRgyIyarJMgSjL
	JyHbWOeA==;
Received: from localhost ([::1]:37766 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i6Lxb-0047BT-B9; Fri, 06 Sep 2019 21:40:03 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:35492) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i6LxW-0047BM-Kd
 for samba-technical@lists.samba.org; Fri, 06 Sep 2019 21:40:00 +0000
Received: by mail-lj1-x22f.google.com with SMTP id q22so2735227ljj.2
 for <samba-technical@lists.samba.org>; Fri, 06 Sep 2019 14:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KiOnIaX2jGtuqWGD7hphQmkN0w/LR0zk9cdqHCj9QBw=;
 b=trOiSgifT/FXG6zrveE6FzUYMNnXbGL0bqIA1ohEXhKbs7NSfFO+nah6byp95metbq
 0rXEQMTZw7q2GXbwl7uHVGJ1hcO0GqNZ4MtMmd8U5N2iexcT/TWD3neJZ7YutzPy3a5D
 5W8aXa1LjkEXUQUBmAqqKzYlbzbYfI5CMk2sEFawtQRm2GcOVn7jBIoCycI/UEhn1ANz
 JBoh0Llzr1I3vZBU2kjFy83M2aak3rMEepOGphMmJiyL960B5CLgl9EkAEDaIJffD1fi
 uw+ZyGQNYr7Km/JlM/V/nllbAOw6LrRHBUZ+2DHof3PWu21Q0NYSo1Tga3Gi8atzsULp
 Fl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KiOnIaX2jGtuqWGD7hphQmkN0w/LR0zk9cdqHCj9QBw=;
 b=EsorusNzbfjkHdu3cXVyaBvx1mHKuSkm2wQTzv+XwB1DVljH/tjgXhllt+Txk0VTMJ
 NwN/JL15e/XJbjTyWBeoq4dRKadmKeh9I/KMw1ztIa/sdagZEkVR6TFctb48PVeWIUVn
 Vx8qDO75VrQpR/kpNjuRvTw3ZVkKDkQNSvCIj9+XR1qeY1B21b4GIramvLcM1qQAKwCC
 pn3pGg6zQ7soTeaGyaGPL6B/dOgApT0wNSM7KmIte6V3psl33Z5SFiyKgPtxJRjkKMNv
 DBwwlbUhY3N26bYIIvFhcYBU9TTK13chuNnGW1nAPN/lk79Eorwqqt+gWrO7iQAeexjQ
 wIFw==
X-Gm-Message-State: APjAAAVm1EY3YXrJmhZUt2eIXioDnw5Og35NH+1KJS/JQ05ywEjYJIP5
 lXJhkqdOfN4gNFKNs4U6aARUZFcBtRhVVyIA9QwvLRqj
X-Google-Smtp-Source: APXvYqz4GxYujI01/FL8T0WoPwM6ymMg37psz0DzaVFLG+Is1mRJ4+19kqr+INK+UvDdJMhcPxLJ9Ajeh1WkImeX0H4=
X-Received: by 2002:a2e:99c1:: with SMTP id l1mr1194200ljj.8.1567805997619;
 Fri, 06 Sep 2019 14:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAELK94eRurKj24RLm7Csd88ueJ5K+D8NhnZQ-j7Wt+dJhJLSVA@mail.gmail.com>
 <87lfv17nwo.fsf@suse.com>
In-Reply-To: <87lfv17nwo.fsf@suse.com>
Date: Fri, 6 Sep 2019 22:39:46 +0100
Message-ID: <CAELK94fiPPVEKuk3SP1dDeXkAm7xQRkjEU1FpHQ_duJONWPNMw@mail.gmail.com>
Subject: Re: Insights for the future of smbcmp
To: =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
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
From: P Mairo via samba-technical <samba-technical@lists.samba.org>
Reply-To: P Mairo <akoudanilo@gmail.com>
Cc: P Mairo via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Le ven. 6 sept. 2019 =C3=A0 10:51, Aur=C3=A9lien Aptel <aaptel@suse.com> a =
=C3=A9crit :

> Hi,
>
> "P Mairo via samba-technical" <samba-technical@lists.samba.org> writes:
> > Hello, I just added a new experimental feature to smbcmp GUI: the abili=
ty
> > to browse the summaries with a search bar, it's not merged yet but you
> can
> > try it on my branch[1].
> > I would also like to know which features interest you in order to
> implement
> > it.
>
> Good idea, but I think it is a bit confusing to use at the
> moment.
>
> - Hitting return doesn't do anything, I had to click on
>
  the magnifier to search which was not obvious.
>

I was hoping a bug of GTK3 because the widget used is officially supported
for windows, mac and gtk2, not a big deal though, I'll fix this, thanks for
the feedback.

- Once you hit the last result it doesn't loop back to the start.
>

Can you provide me the file(s) you used ? And the steps to reproduce the
bug because it just re-tested it and it works just fine

- If you select something and then search it won't search starting from
>   the selection.
>

I think this is questionable, but you are one of the users so I'll do it
accordingly

- Highlighting the matched part of the summary in the results would be nice=
.
>

Copythat


> Cheers,
> --
> Aur=C3=A9lien Aptel / SUSE Labs Samba Team
> GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
> SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg,=
 DE
> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=
=BCnchen)
>
