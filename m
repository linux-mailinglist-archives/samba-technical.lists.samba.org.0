Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1542A69E62
	for <lists+samba-technical@lfdr.de>; Mon, 15 Jul 2019 23:39:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=bFTjKA69lfnDwZLDw50hvY0jVdbPEoMjaAsEfxRQNRI=; b=zJRVkepAQPcSFMUQ6ihJeVJ4bU
	U7kqynsU6A4xJy3lYoj+uopTvlOECcgjzVi/e4AKwYo1CMJpF9aTGOwRj6/GCMvehLsc9cJG9C4X2
	vPiM8UKquHOr4msN3jG+KBSUEQ8wAsByhCbmUWxCUt5e2cfiPvd7uHLK6ds0CqJh4cp3FNEOhv0+6
	JJJGvUbV/ktTgf/eR3/RtjepOWnTrIds1gMW0Y9pI7EBKI4oh5ppYWQ9yCAbXraMvXvnNbWuJ0yJq
	mlQphgbchJQfkJ04/S5/aThxm5Ky+diMNBU2d43cnTErAzNB+/Go/08nB0GGJdjGx5/zlJYvUccbh
	hY3MH5Fg==;
Received: from localhost ([::1]:43034 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hn8gK-0003lR-0B; Mon, 15 Jul 2019 21:38:48 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:35618) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hn8gE-0003lK-PC
 for samba-technical@lists.samba.org; Mon, 15 Jul 2019 21:38:46 +0000
Received: by mail-lj1-x241.google.com with SMTP id x25so17808502ljh.2
 for <samba-technical@lists.samba.org>; Mon, 15 Jul 2019 14:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=bFTjKA69lfnDwZLDw50hvY0jVdbPEoMjaAsEfxRQNRI=;
 b=ZEQsGYTqqdzdqZonCahRJLa4Ob+EO+q61Y3ek/yqDsB5FP7cb/a4bn+uZHVfBZxVcS
 MinaoYLsX0jwQgSFjatKbhQkVNjxIEsoxKP3vvdQlb+J36GEqZrVXUWp/5JvLAYq4lht
 Ag8R5EemZG8djRkqxYpq/Q+tqmrE8B5aDZg5+CR+k5tvY06e1F64zBdrmUM9n6Bnb4vx
 XdUxiAOpLPpqe3KYvEOPRXrouVZV2kUw8HZFuouGE3siCIH4h6hJ4daekMwu/jAUT4GS
 STB0Bt2LQyRAdxHogeGA0fTs62+SargwVy16uYHkWEw+Erdnyprf1RGnwpbJiBxcvbvN
 NlYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=bFTjKA69lfnDwZLDw50hvY0jVdbPEoMjaAsEfxRQNRI=;
 b=nfHXLR+ngNkRIvqiGfPQKQxxM+72tpXXhQ0bW3oKM/lKF4MyvEuq11TATakOPjRFkH
 MEtEAtqb57VkxpR0+q30YjJzY27TCnmCJEHGvGJwb4rYjsWjnNeaitKxjcu41GF/rrdT
 wXadHeYS+KfxB3upMu1pUpH5QTnHMFGLPiLVA8OL3XFmGqRDE9ijH0OX3dxhlEDrGNr2
 pWqCKI0iyDEMGRhEHh2wXGs7AgE2Wz9j8WZ6shg2ZiY/fwQSVbhsMr0MgwVzQVOl/jQQ
 1YdXfo9MjLPr8VL+83u6zRbJwrZS6rlvO6qf+x6iFuaNkbQjsFD3pxaQ8+2vrJZ4s+ea
 NPDQ==
X-Gm-Message-State: APjAAAWgK0/nzvetDML6JJwfAfoQUig8Qhq7WLGbK+38qgfnX08oT7pH
 qnyWmnmPE0vH5f/+LUApuOs0ykUHQU7jXLQXd6q0VJ+h
X-Google-Smtp-Source: APXvYqwcvMyNpvlM4i0m1gM9A6uopijze1bIDwujRLgLYDodvwQNSFCD1BIfu2Y/x6mZYT7vq0itlJjXFwSQKiREN5Q=
X-Received: by 2002:a2e:9c9a:: with SMTP id x26mr11445571lji.47.1563226710447; 
 Mon, 15 Jul 2019 14:38:30 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 15 Jul 2019 22:38:18 +0100
Message-ID: <CAHAPYVC2dN5H=CzeL09mjWneg7CRDQ+vR3nhtEmK2asSKd_P2A@mail.gmail.com>
Subject: Re: [Announce] Samba 4.11.0rc1 Available for Download
To: samba-technical@lists.samba.org
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
From: Harry Duncan via samba-technical <samba-technical@lists.samba.org>
Reply-To: Harry Duncan <usr.src.linux@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue Jul  9 10:20:44 UTC 2019, Karolin Seeger wrote:
> Release Announcements
> =====================
>
> This is the first release candidate of Samba 4.11.  This is *not*
> intended for production environments and is designed for testing
> purposes only.  Please report any defects via the Samba bug reporting
> system at https://bugzilla.samba.org/.
>
> Samba 4.11 will be the next version of the Samba suite.

<snip>

> Default schema updated to 2012_R2
> ---------------------------------
>
> Default AD schema changed from 2008_R2 to 2012_R2.  2012_R2 functional level
> is not yet available.  Older schemas can be used by provisioning with the
> '--base-schema' argument.  Existing installations can be updated with the
> samba-tool command "domain schemaupgrade".
>
> Samba's replication code has also been improved to handle replication
> with the 2012 schema (the core of this replication fix has also been
> backported to 4.9.11 and will be in a 4.10.x release).

I would like to dedicate some resources to testing this, would I be
right in saying that because only the schema is supported and not the
functional level, that I should be able to put a windows 2012 R2
server as a domain controller with the schema master FSMO role, that I
can add Samba 4.11.0rc1 to that domain and have it function with its
reduced subset for rudimentary functions that are already supported?

If so, are there any FSMO roles that Samba can hold, like domain
naming, or must all the roles be mastered by a windows host?

Any particular features you would like us to test in tandem with the
funciionality that we will be testing for our future use when this is
production released?

Thanks,

Harry.

