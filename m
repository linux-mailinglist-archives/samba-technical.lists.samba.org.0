Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2131815D7B4
	for <lists+samba-technical@lfdr.de>; Fri, 14 Feb 2020 13:53:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=/3Y4w/Q79xB8ju03R+kZh1hDe1AVIbdJ5+glSKIrlP8=; b=FHT8K/TRNpCUYbcIKFlKeUGJ0k
	VWEQETiqaRyRu/UhYxO6lt6puoYGXnGBVuu+aMzXhMDu/6/RqpO9HITWdTR2+H6843Ju7IKX4Z1nZ
	dAYsj7L0bKXzblwQV3fSjmTgIHUX3i6DYwST8NUdXcEVyAYj4rOOfdOmN/r3NORgPP3rgKSRbh86a
	It18YjavkkQ4/US+akRQDItb/m4bmSrOiSv3FSJWVuTazGDm15YPNsx9aJyZTHaJ+oaXND7kYkjez
	K66abdPBDraC603UEg0bSDSSV/zVSrqGLSeLqxKw+KtY0gJ1WwbogCHeAC3ivl0GdjnqdrSiTEgVJ
	IZ1GGkLQ==;
Received: from localhost ([::1]:21674 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j2aSA-009t5b-Jz; Fri, 14 Feb 2020 12:52:18 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:43566) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j2aS6-009t5U-2Q
 for samba-technical@lists.samba.org; Fri, 14 Feb 2020 12:52:16 +0000
Received: by mail-lj1-x233.google.com with SMTP id a13so10611244ljm.10
 for <samba-technical@lists.samba.org>; Fri, 14 Feb 2020 04:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=keepertech-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uFtFCYV2HdnQkb6v4m8acI/30PwfM3RkddyGEUM9liE=;
 b=JMhWJcy98IIiOD/yJ7E7FUSWv5okk18hcUrfmThzkKo2YKl11mjMdPrGEmi0SYqFR+
 SG79aNwQ1KHcobTPNBTNUJh9GAXfxoyv7+rJUkWQEz65teJADuBHGDJpQnjsOJVauusw
 Vl2Pk3pgyaalwjy6PBRecqbODyDhT6b2LjkHIwt2UFyDCvcYb1yczB9vex0ZnAdFePIA
 VQBFMkBT8GfGOaRayqBVf4jnq/v11YkWDOK6ZoziOM2FkrxW3zP1qdeObhWoyxUS8WLZ
 f++m0WGWp/YlBRW2lnJnLqb/ULS++QTN49wcqNF4bjhXc3+RihTDIXxMOlmIsuC8I248
 yLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uFtFCYV2HdnQkb6v4m8acI/30PwfM3RkddyGEUM9liE=;
 b=No/ZzfiojnJCtOwGJjlJ/CGKcumnTLS8ztkH+oITIdjECkmCYdjG+GWqyNV5XwGQl+
 SIYw+OQFOd/C5NGJqvwZVQV56t4G/kBj2MxX72LE2oH9T3neCqDDh56gIDCXWnIeDi35
 ZweaazrUqgd+8cRSWOPbqlDeJPXgAsJXyZdw1kc3i3M37wENVDBr/VIS4hy7lFyNPMo6
 FYMvjJ1txNvyG1IhFNf3vegcpg9Kx2trhr4QLotoLYBSUOM14SZkhDphAokqO/77yAl0
 6HVaiJ/dVFd/HBcZrJLrhvPVLf94Df0xMvvVizMLi9Cgz/wYJALvryfQ9VStjbGicR3y
 zIzg==
X-Gm-Message-State: APjAAAWJUoUn2jHfjG/Xe9Xh1TfBreU/i4NN/zwNEFhUrW/qkgbAcC7B
 XPa9+D8GZBhkRlJI/f5tH08Y7ZQn9Um4a8bNYyFFeZOT
X-Google-Smtp-Source: APXvYqyqljzD8Qh8CxIFDcWz3SCbczWuoTNv7Dk95Top1u/gtifk2Y6/yIrjUePyS5lewN3uoYd2rxGoWtdzHdqnMhk=
X-Received: by 2002:a2e:3e0d:: with SMTP id l13mr2123914lja.70.1581684731848; 
 Fri, 14 Feb 2020 04:52:11 -0800 (PST)
MIME-Version: 1.0
References: <CAGbviv+X9gYosw0QmeMSqBmbwkfc4WtBVQ9h3X0+meBEmXQ7PA@mail.gmail.com>
 <20200214205600.5d82b43f@martins.ozlabs.org>
In-Reply-To: <20200214205600.5d82b43f@martins.ozlabs.org>
Date: Fri, 14 Feb 2020 07:51:58 -0500
Message-ID: <CAGbviv+DK8h9Yqm4Qg59EzRSzdPcC+kk5FMqVyZAK6GKdTfCew@mail.gmail.com>
Subject: Re: ctdb failover problem
To: Martin Schwenke <martin@meltin.net>
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
From: Wyllys Ingersoll via samba-technical <samba-technical@lists.samba.org>
Reply-To: Wyllys Ingersoll <wyllys.ingersoll@keepertech.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Feb 14, 2020 at 4:56 AM Martin Schwenke <martin@meltin.net> wrote:

> On Thu, 13 Feb 2020 11:32:55 -0500, Wyllys Ingersoll via
> samba-technical <samba-technical@lists.samba.org> wrote:
>
> > Running 4.10.13 with ctdb and 2 nodes behind haproxy.
> >
> > The ctdb configuration does NOT use public addresses (since these are
> > managed by haproxy).
> >
> > Both nodes come up and join together successfully, and one of them is
> > joined to the AD domain. The problem is that if the node that is joined
> to
> > AD fails, the 2nd node doesn't rejoin the domain and so even though new
> > requests are routed to it (via haproxy), since it is not explicitly
> joined
> > to the domain, clients fail to authenticate and cannot access the shares
> or
> > services.
>
> Do you have the Samba "netbios name" parameter set to the same value on
> both nodes?
>


Shortly after posting my question, I found that this was indeed the
problem.  The netbios name was different on each host instead of being set
to a common, shared, name.

Fixed and now its all working.

Thanks!
