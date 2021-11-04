Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 926DC4458CB
	for <lists+samba-technical@lfdr.de>; Thu,  4 Nov 2021 18:39:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=QTP4GidayVFDdfkHIwnElv67kRgLvsfpTD2p8R81WVE=; b=d3A5gmkTyiegUM28Tp+yI32k1d
	K485FyUePxbg4cJy3jADiKrX47dQHYrsWqBsbKISfiWnPWxgpe6ceXlNaO3noFjadhfd+JGuYrikG
	izpYgdL1Ien6X5gT8CMnEQfseUdA0cka6J5r/FdFqnkH7UsE8tax7WQnIfYfIJM5nbaBAaXlLpLtj
	TIwUXyc0C85hsRv80hsl8MxuIUwoSd/2G6U16QdqjOh1EWndG0O2BkeYtjz8+1mAT6HBdM93ogckH
	RWgZO/k2WutjE0n9zlunEBEoTlAxitZ95MqvwBO31ZS6EQxxpq+9PDBgkqN8rplw12PcwEQNL4XnP
	LnBYkGHA==;
Received: from ip6-localhost ([::1]:23584 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mighu-007gY3-D2; Thu, 04 Nov 2021 17:39:22 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:37823) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mighl-007gXs-IH
 for samba-technical@lists.samba.org; Thu, 04 Nov 2021 17:39:17 +0000
Received: by mail-ed1-x52a.google.com with SMTP id f8so24336764edy.4
 for <samba-technical@lists.samba.org>; Thu, 04 Nov 2021 10:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/LVjseCax8GaG/fuOFzDDQZfOz5KmYsLR2oEtJxwZzo=;
 b=M6Mh+2pYUKiHnr8ZaFrJo3hTk4Jrm4ALb/Egysp/g5la627iqBcyWTUscvRzobT42L
 uH1uKVU/RzuvMVRVpi0TOoLB4Z0MzFkITdCh8R1sEYkDi0zZGW+CCLXNvvOfECwB3HOL
 FuFv2Bwbkp7kGxwwhUOgx5MbiPUmCDZHgfUPVpg4Y00XyF+20Vdp/mLBe9+S9rlc3zqY
 MV7dZEOFta40klz/1eldaW+uK+2oiGd8cdgphapBxmKZrM0zOtZ5yqua9DySBdNCzJue
 74kTjO64SyVv+xmtRFJAdEjd/vN18NE0O1l0M2zpmSa6iHVh7Vu60Svl5eDXPMpUb6Ur
 pg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/LVjseCax8GaG/fuOFzDDQZfOz5KmYsLR2oEtJxwZzo=;
 b=V3eH7FKfKOZxdOQb9hPQMNhXcVXiO53idjF5P2g42la1MmTr0zXQ3i82BSKkHJc9mf
 S7cWD7aVuxMz7HEa2zG0mQ4p+HiXqwUU7Fcq6jmeL3KVHbsKqsM2UfPnu3mVivZHwyAt
 Lz55b0DFsqfTr5SB6tTMaAgImzZdk/VgxBkwZyeyQk018XhWHzD+9eD10u2wKa8wYcZX
 /CusZ4vGwiXsKgxfDujLFjMRXg9xq7QcTz4ymQZFCfscwLaf88+TpCq61p3zgFNDZ60Q
 2jv1vDjw/HHa1oFVv3A9A6omyQVTWTp6SBL+9hFYGriqMiU9ikyZG8RlMoGaj3AnT3TL
 QZAg==
X-Gm-Message-State: AOAM5316I0BIOI/XKZ0HwErJuPU9eJ1uLAvhJteVCR/lYRSdhEkL/gey
 D8OZgZ35WsHriDVhikQwSbI0jq3UbYs3mfNDcJywPGRSqQs=
X-Google-Smtp-Source: ABdhPJzOr2lS5Io0jegtaC9BI6nVeD6g6i1JKpx1J/dHK5hv7k9aL6RVhFX2aQOgTWHN73TwxNSCCfueUwCmdz3m6AU=
X-Received: by 2002:a17:906:c186:: with SMTP id
 g6mr63530110ejz.259.1636047552654; 
 Thu, 04 Nov 2021 10:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <CO1PR19MB5109D90918F5592C8891A0D3D48D9@CO1PR19MB5109.namprd19.prod.outlook.com>
 <6a03d46f09f838450185552da856c4673dc5e9b3.camel@samba.org>
 <CO1PR19MB51099709E2B9AB18701C1800D48D9@CO1PR19MB5109.namprd19.prod.outlook.com>
In-Reply-To: <CO1PR19MB51099709E2B9AB18701C1800D48D9@CO1PR19MB5109.namprd19.prod.outlook.com>
Date: Thu, 4 Nov 2021 13:39:01 -0400
Message-ID: <CAB5c7xp28HinVF0Z2TFvMa5O0r7q0S6fbNBWjwN-OxTj6DvzoQ@mail.gmail.com>
Subject: Re: Multiple idmap servers for failover
To: Michael Starling <mlstarling31@hotmail.com>
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Nov 4, 2021 at 1:36 PM Michael Starling via samba-technical <
samba-technical@lists.samba.org> wrote:

>
>
> ________________________________
> From: samba-technical <samba-technical-bounces@lists.samba.org> on behalf
> of Rowland Penny via samba-technical <samba-technical@lists.samba.org>
> Sent: Thursday, November 4, 2021 1:26 PM
> To: samba-technical@lists.samba.org <samba-technical@lists.samba.org>
> Subject: Re: Multiple idmap servers for failover
>
> On Thu, 2021-11-04 at 17:18 +0000, Michael Starling via samba-technical
> wrote:
> > Hello.
> >
> > I would like to specify multiple OpenLDAP server backends for the
> > ldap_url option. Is this possible as I don't see any examples showing
> > the format?
> >
>
> That could be because they rely on SMBv1 and Samba is trying to remove
> it.
>
> Can I ask why you are not considering upgrading to Samba AD, it is
> extremely easy to have multiple DC's
>
> Rowland
>
> Hi Rowland.
>
> This is a legacy installation and they aren't interested in upgrading.
>
> So this is not possible?
>
>
IIRC, this particular idmap backend uses source3/lib/smbldap and so in
typical cases ldap_url gets passed more-or-less directly to
ldap_initialize() from libldap (with same formatting conventions).
