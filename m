Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C76B8204C01
	for <lists+samba-technical@lfdr.de>; Tue, 23 Jun 2020 10:13:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3lG5fIREZy0qShra/NlqBHIzfJbsaWMmsGh8bZVQRrU=; b=eJCIuAPPrdHclSgwMcKamST7sO
	VzZB5IbgtNY1Qskkt+MjxRFNv6ulRmDPfrqJ4wjqGgkIUTQWRQsvfJ9pnb1I4t6qgWZGxm7/A2A9D
	Hr45D/jxvW4eEiFUB0Lge5l+ykSNDL8geCREUx+hFLkqDWf/3nelYKYcj0DAJ/vJjneoy1q9rhVYk
	+tdXejEOITRwV+ZscSdVRDLVJsfyeK9zdFMmmphs1cxT/2khznBS1iknEM4IARNxPANFjKO95b5dQ
	Ywg503A2ozqlQ3firovMi2yeY/6Jcsb150V3dGv2X4v9cN2nv4m9xqCSITyQaCLGDlMbW3X0wXLMS
	OrxnowZQ==;
Received: from localhost ([::1]:45242 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jne2x-001xxa-Bk; Tue, 23 Jun 2020 08:12:47 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:40512) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jne2r-001xxT-9F
 for samba-technical@lists.samba.org; Tue, 23 Jun 2020 08:12:43 +0000
Received: by mail-lj1-x235.google.com with SMTP id n23so22345039ljh.7
 for <samba-technical@lists.samba.org>; Tue, 23 Jun 2020 01:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3lG5fIREZy0qShra/NlqBHIzfJbsaWMmsGh8bZVQRrU=;
 b=fl2cyJz+9LmEW5f+3LIqrYNVLDbKmvZKA9taEX8x3IgRq/CFv/N8RWevxjZjLKkEy4
 ElGshEI6aWYCx5IGzsnlsHTQ16il/zVEfPafTM12yv2s9Wk2oRLaJy/XMy5FJJeoOfWi
 6r/xEq+MTS1RW1PCWc2cy0x8K65A6455xph+a1Lw/t1l+n5MG8O8B6j95bn+2mZgecz2
 Fqbp/bTpdJE87OhDUaQ0FZhEkQTR16V7Flr7fsVwx3pzQdGn4SUQ2Mbo82jCYMNxkBxc
 N9CWo69HBYPFV3aYD7AWPEKW2B2PQdKlNSU5fTi6xcbkct40y2sLzOS0BCAWSWw29OWx
 6NGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3lG5fIREZy0qShra/NlqBHIzfJbsaWMmsGh8bZVQRrU=;
 b=k6nvWNNrrYNesrXJvXiETaQFPhyKHpExgXM8cXu3dRZTET4fxV5hU35zP4louKJgnq
 8rQj9SnB/UWXPTv2CtEVflKLwAjzpegPehulmpInj9SH8KayTtMmAZEXhzYaBuHgXo4V
 OnLN5yzhGQQirklb3H6k07S9MNfHzcq4YWoo5LNt5GGUam4T8yx25PZrezZvcC+tJc89
 A54GVfZEmY7RmpeckqwfGwhKZUlspUnD+LXgzV6CdhirO/as1/ELAmkVkYYeDWGS/iY0
 RyaO3J7nAuj1YFZLmfoRx0yTolOBGgbHpdjSSi0b21Cla/w1rsIdp7OLJVFNJGOwSHGJ
 L/qA==
X-Gm-Message-State: AOAM531SlabH6WmG0LzKjWhMuNfphVoXSgzoLUN3a4gXhp5VzY0Avr1n
 cXSefni8j1g3gwWwM+xg52JTTIQdrDp+a74wvxPp6n7lTHM=
X-Google-Smtp-Source: ABdhPJykLMFzSm4SdAsiQpqvyH9R1E8UnhXeik6qO7Irn544bxkjUW+GyqfENYghwPSC7e4GxYNXB+0BDaRsBqTKtD0=
X-Received: by 2002:a2e:9855:: with SMTP id e21mr10244925ljj.214.1592899960181; 
 Tue, 23 Jun 2020 01:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAC-fF8TH5sf6ekjfG5QqnEwG41fopV1bWOMxBH_UnodfjDo_qA@mail.gmail.com>
 <20200619181956.GF10191@jeremy-acer>
 <CAC-fF8SYbXaz33yJ_QaZzeYh2uBt3iKxHzbQNtMPm5qqwvAciQ@mail.gmail.com>
 <CAC-fF8Stst7BnrEKVQLP7og-HLp=T+NNoiSpUmRD3mwxXtK67Q@mail.gmail.com>
 <20f59230-59fa-9946-3b4f-937cd1bf619a@sernet.de>
 <CAC-fF8SPmfGbokEzBjZW9zBqbDYeTUg8YN8i_cWY-UN3th1QPA@mail.gmail.com>
 <a2cbe7499956d3d2318326c935954b3636ad8d8a.camel@samba.org>
 <CAC-fF8RQztBgiFTCS6AxVWLsjV3UWyWNUK2Cz7qKpE6hWCy7uQ@mail.gmail.com>
 <e444558549bb3dede91b551e1c13c3bbdae74847.camel@samba.org>
In-Reply-To: <e444558549bb3dede91b551e1c13c3bbdae74847.camel@samba.org>
Date: Tue, 23 Jun 2020 10:12:29 +0200
Message-ID: <CAC-fF8TfDWmVS8iy4Br0oH1KOWessZEGg18QGRmwcO7Chjg11A@mail.gmail.com>
Subject: Re: gitlab: testing of ldap-ssl-ads option
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jun 23, 2020 at 3:37 AM Andrew Bartlett <abartlet@samba.org> wrote:
>
> On Mon, 2020-06-22 at 23:02 +0200, Isaac Boukris wrote:
> > On Mon, Jun 22, 2020 at 9:32 PM Andrew Bartlett <abartlet@samba.org>
> > wrote:
> > >
> > > Likewise, ldap ssl ads should explain more which operations it
> > > applies
> > > to (additionally note it doesn't apply to tldap and so idmap_ad as
> > > TLS
> > > isn't implemented there yet).
> >
> > Yeah, I'm still unclear how it relates to and differs from "ldap
> > ssl".
>
> "ldap ssl" is about if we should use TLS to protect the LDAP connection
> between Samba's pdb_ldap passdb module and the (typically) OpenLDAP
> server.
>
> Sometimes this is over ldapi:// and doesn't matter, but often this will
> be a remote (eg organisational central) LDAP server.  Even with local
> servers this matters when chasing a referral from the local slave to
> the master server to write a password change.
>
> As the AD domain member case is quite different, even if using similar
> code, a new option was added.

Thanks for the context, still unclear why "ldap ssl ads" depends on
"ldap ssl", and requires it to be set to "start-tls" instead of, say
ldaps.

