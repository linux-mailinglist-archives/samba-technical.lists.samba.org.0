Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 815D08ACCA7
	for <lists+samba-technical@lfdr.de>; Mon, 22 Apr 2024 14:15:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=qS2qxcNgK0tlnhX4oH+28xIN804tF+rKpuB18NJugC8=; b=U0lAI7E3xKHSXzDbdqjGD0ZQH7
	trp+/JeYCo1I594wj5bx2eybUI+OURGtgv6+9PUkti6tu/O5Yr8gtcjcSnBxsGniTpuao4w89Mo06
	dkypqsWid+Hhbtw+ozP4z9tCxC5zOwbvFdDVoHBfJPn4Y688E2ApNpUha0Mg6PVYjcGoXfSo6QKp2
	lp4OWlonBs+6RoyGbu8Ih64Qtgl/qjW4ptGxnL3dCYoFh9zJGQ+sCKzeu1W4NpjJp9Mpek+LNTAK9
	5geFNU8KhhpC5OfsL8tAb9KWngMYSu71DXVr4mrkH2YUaQlZRXwEFRckfN7WDpXN9upHBfjgy2BgK
	xpSqu6fw==;
Received: from ip6-localhost ([::1]:30070 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rysa7-005MrG-PC; Mon, 22 Apr 2024 12:15:35 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:50520) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rysa1-005Mr9-T7
 for samba-technical@lists.samba.org; Mon, 22 Apr 2024 12:15:32 +0000
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-60275a82611so71752a12.1
 for <samba-technical@lists.samba.org>; Mon, 22 Apr 2024 05:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713788126; x=1714392926; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ql4YG5kdZgpRHUzBInNObLyakSLrmPv6lHpCP9vSyUs=;
 b=D5r0jjdag4DDFIfM8WYQ5H29eAHNzuVwZ6edmdPELpM4XfQWDPbaNF72gvU4rTfP7q
 fAQ1VxfsDT59lbyYcLoCVPKNYFfoJvg08P/I72fK7aBUBTFeSkto7MqfwgIz3NteThtm
 Ut5XbOJkCclCtSiUANTN2c0w1ECvzUb3nfGBP8Iw5pgl7kH45/eGIVNnslh3PKSZTai9
 5JnRMcHQzds6MwlxGcHLARwdHUJDfUbzuHGE4dhIEoGrqHbVczdb/qqfV+pTWkzd9Puj
 a/izv2vrGhVw7SzTrcuANk6+jC28mh56cIKm44252Qtt+6bjusAV6fLapgaaP+Uuw9+P
 RcpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713788126; x=1714392926;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ql4YG5kdZgpRHUzBInNObLyakSLrmPv6lHpCP9vSyUs=;
 b=wwS87lLfEkBAlz5JkXXNv0UcMoBMFU3VTaJ12Xly6pPAq2S2ChviDJFpMLQ3lmOmUm
 0ifss0QtUGkEtGAy4NQNyWg6UsP4qesbmrFzRbgFaYy53XI8agqCXzFIZ0WCwsWrP4hn
 bHLgqNin76wl6V+HHATswiP5XRPrXYmLl08J/qaPkO2yIQ2CGeVRVnIm8+WLbLrVMynl
 CeEOfBIXDnqsgya55Kq2rzfNdJiFVQgc9RWgpddQdYgkXWXGYBlFfv3GXqNkhnRV7nzG
 ZYW5wQkjZLh4V6JEKrowH0cpbRoJXnXYWwthqPmNGqytRg0Mm9p/j/uMuqbxOMtCDDj4
 Filg==
X-Gm-Message-State: AOJu0YyHUBzzKm3PveSObj3eJmb/6oHeg4VRNNhca9Ty2jIFOkQ9rLlJ
 +dZgQSZR+TvGVeaM3rNJ9dYaSUYYMeiMBPO8Wl2j7Py98MZsM+vpHFFBffDCzEkPMmx1onEndLM
 SzmpcmWDl8nPYvc2Cqnx6y8NBvEBESQ==
X-Google-Smtp-Source: AGHT+IEk58OVT45GySuXplmmGk0KjxgUeso86+cuAepnF3LUYGZEdmZb5Xpds0CSWKIsmNrxz3M4NgiBmEcbbort+Bk=
X-Received: by 2002:a17:90b:3015:b0:2a0:3a16:7489 with SMTP id
 hg21-20020a17090b301500b002a03a167489mr7001554pjb.44.1713788126332; Mon, 22
 Apr 2024 05:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAO9H7P_oqwoJoC_8mWNZVYZ-pxrYt9TrEt3t0LJsEvS32EorEg@mail.gmail.com>
 <4249c3b6-3b4e-4bd3-95e5-864158e5797f@samba.org>
 <CAO9H7P8Cttbg6v-Cn+rRR5cKc06K1pid9oQqsjPnHL49iCE=ig@mail.gmail.com>
 <17264f9a-2d6f-4bf4-a0e7-f28372a6f82a@samba.org>
In-Reply-To: <17264f9a-2d6f-4bf4-a0e7-f28372a6f82a@samba.org>
Date: Mon, 22 Apr 2024 14:15:14 +0200
Message-ID: <CAO9H7P8jocp0J_8oFqnYCmheS0o83x6B7koFBMQa_Y2vwdETtw@mail.gmail.com>
Subject: Re: Proposal for changes in become root
To: Ralph Boehme <slow@samba.org>
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
From: Xavi Hernandez via samba-technical <samba-technical@lists.samba.org>
Reply-To: Xavi Hernandez <xhernandez@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Apr 22, 2024 at 1:51=E2=80=AFPM Ralph Boehme <slow@samba.org> wrote=
:

> On 4/22/24 12:46, Xavi Hernandez wrote:
> > I've just started to take a look, but if I understand it correctly, the
> > user credentials will be set just before doing the system call.
>
> exactly.
>
> > I've not
> > seen any reference to become_root() (I may have missed something,
> > though),
>
> that part is not implemented yet, so far there's only the root
> impersonation object in the struct samba_impersonation. This still needs
> to be fleshed out in samba_impersonation_create().
>
> Iirc we'd then have a new function like samba_root_impersonation() then
> checks imp->is_become_root and either returns imp or imp->become_root.
>
> In places were we currently call become_root(), we'd then call root_imp
> =3D samba_root_impersonation() and pass root_imp to the function we want
> to execute as root.
>
> Note that we'll likely also have to bite the bullet and properly handle
> capabilities instead of using [set|drop]_effective_capability(). To do
> this we somehow need to track the current and modified set of
> capabilities in the impersonation objects.
>
> > but I guess it needs to integrate with that and, in this case,
> > it won't issue any syscalls to change the current process owner, right =
?
> >
> > That approach could be very useful for what I really wanted to do. If I
> > see it correctly, the credentials switch happens in vfs_default, so
> > modules are free to implement the credentials as they want.
>
> yes.
>
> In the end you would cache your own impersonation tokens in a cache
> associated with the main impersonation object cache id
> (samba_impersonation_cache_id()), using a talloc destructor on an object
> that is a talloc child of the impersonation object and removes the VFS
> module token from the VFS module cache.
>
> Makes sense?
>

Yes. It makes a lot of sense. I still need to understand the details
better, but let me know if I can help with something.

Regards,

Xavi
