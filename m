Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6223670E2CC
	for <lists+samba-technical@lfdr.de>; Tue, 23 May 2023 19:36:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=WgE8ji/h7CMcJNn0UAt7kbxemzWw21WFjqqu1Nqn77o=; b=itPBNVh/bonpx7JUljZ3RZ40XK
	VjZfv+fezXwUqoozsEGXC0tlnS4CTs5MFHUIrok8Pd9bydJVXs7O3lqmf8nQ3ftXMb8Oi4lDYWUOc
	hvWTewOEI+Ps0/WtjpWWoc3VkR93g1VP4n1VAvSJbTLAuLYdTxgK7qu9fYrKKntVukjfFIM2IqCpW
	bgBPlhBH/6qYPNzua0FtQOHBX27LbPxcXV3YYVDYD1LLgwFRZz3Pdx/sns8LR1XKlDM6VEvYJa527
	FQfb11qRhPfQuVBY6BT1FLT44H5H6iNau8s4H3Fo9c42LYzv+TF92Kr6Njj90siloxcGmfL+Ig4jL
	g+a5meQg==;
Received: from ip6-localhost ([::1]:20128 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q1Vuj-00BjiW-FE; Tue, 23 May 2023 17:35:13 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:56830) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q1Vud-00BjiN-AD
 for samba-technical@lists.samba.org; Tue, 23 May 2023 17:35:09 +0000
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-96fd3a658eeso449053466b.1
 for <samba-technical@lists.samba.org>; Tue, 23 May 2023 10:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1684863306; x=1687455306;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WgE8ji/h7CMcJNn0UAt7kbxemzWw21WFjqqu1Nqn77o=;
 b=Vw7AS+AaFz/dbCV0lwHrLUjLV6JjQuZhqzF9BMNaNNjX6Zcflxx+AjQe3+paqQJtxR
 U0AHB5n4d398LhALQubCoAudNTHGd4tDGZ+hWZwuf+vVHZt2kdApH85vUqGhasNFnydw
 U4kljGqf63frbBV5XP9K6nh7prfXd7VOJBaNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684863306; x=1687455306;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WgE8ji/h7CMcJNn0UAt7kbxemzWw21WFjqqu1Nqn77o=;
 b=UnMTMcU09Xj1ShHWU47s343yVCVmEEDiaB+X5pw8nb0SEl2M9YKKmcGI2s+40jZJna
 RtdGqmSeSKkhWnB3rDrNu/LE85UnenxCwZf9LGVMHDtV6FEtYZSdUv9BDcTPkJBVndCW
 T5AFktheT0Iwt9npX9rupz/toogVSWVNWxgJyRMEO9bPHQIsE1Dazz++B/W3kKGom8b3
 JkEBdvT3YJair6DhFrNvUb/S1CkJLnYpik+HMFlosg993tIe4MGfRoxWpPpIcm/FUFjA
 eJqjfw3rJWukUHSDyHXn3ryppLwpjIyDETJmsV69HtNDNdvKYH2qaeMpTOYPpZgBPCdh
 PWzg==
X-Gm-Message-State: AC+VfDxeUUenilGrEweERCgh34n26uKUY23CZEisWXeLgnDmqY6QRdXA
 7ORew7Nlx3fA/nB4W/pbLLqZCQ104pKDVZWcpQbk4qEA
X-Google-Smtp-Source: ACHHUZ4YpCD9vpziUUycjgjcfICu0m2xNVNXjkhrrqJ4T7qyDiK2TekHI7MH21V1prMwyJeIfLbHRw==
X-Received: by 2002:a17:907:6e22:b0:96f:baa4:cda7 with SMTP id
 sd34-20020a1709076e2200b0096fbaa4cda7mr10041006ejc.68.1684863306146; 
 Tue, 23 May 2023 10:35:06 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com.
 [209.85.218.46]) by smtp.gmail.com with ESMTPSA id
 y25-20020a170906471900b00965ddf2e221sm4701843ejq.93.2023.05.23.10.35.05
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 10:35:05 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-969f90d71d4so1162498766b.3
 for <samba-technical@lists.samba.org>; Tue, 23 May 2023 10:35:05 -0700 (PDT)
X-Received: by 2002:a17:907:9443:b0:94f:3b07:a708 with SMTP id
 dl3-20020a170907944300b0094f3b07a708mr15767293ejc.29.1684863304990; Tue, 23
 May 2023 10:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5msVBGuRbv2tEuZWLR6_pSNNaoeihx=CjvgZ7NxwCNqZvA@mail.gmail.com>
 <CAHk-=wjuNDG-nu6eAv1vwPuZp=6FtRpK_izmH7aBkc4Cic-uGQ@mail.gmail.com>
 <CAH2r5msZ_8q1b4FHKGZVm_gbiMWuYyaF=_Mz1-gsfJPS0ryRsg@mail.gmail.com>
In-Reply-To: <CAH2r5msZ_8q1b4FHKGZVm_gbiMWuYyaF=_Mz1-gsfJPS0ryRsg@mail.gmail.com>
Date: Tue, 23 May 2023 10:34:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjYTAK4PSK23bDm_urZ49Q=5m=ScYcmK27ZJNKSBPdbgA@mail.gmail.com>
Message-ID: <CAHk-=wjYTAK4PSK23bDm_urZ49Q=5m=ScYcmK27ZJNKSBPdbgA@mail.gmail.com>
Subject: Re: patches to move ksmbd and cifs under new subdirectory
To: Steve French <smfrench@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Linus Torvalds via samba-technical <samba-technical@lists.samba.org>
Reply-To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Namjae Jeon <linkinjeon@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, May 22, 2023 at 11:39=E2=80=AFPM Steve French <smfrench@gmail.com> =
wrote:
>
> My reason for adding CONFIG_SMB_CLIENT, enabling CONFIG_SMB_CLIENT
> when CONFIG_CIFS was enabled, I was trying to make the Makefile more clea=
r
> (without changing any behavior):

That sounds ok, but I think it should be done separately from the
move. Keep the move as a pure move/rename, not "new things".

Also, when you actually do this cleanup, I think you really should just do

  config SMB
        tristate

  config SMB_CLIENT
        tristate

to declare them, but *not* have that

        default y if CIFS=3Dy || SMB_SERVER=3Dy
        default m if CIFS=3Dm || SMB_SERVER=3Dm

kind of noise anywhere. Not for SMBFS, not for SMB_CLIENT.

Just do

        select SMBFS
        select SMB_CLIENT

in the current CIFS Kconfig entry. And then SMB_SERVER can likewise do

        select SMBFS

and I think it will all automatically do what those much more complex
"default" expressions currently do.

But again - I think this kind of "clean things up" should be entirely
separate from the pure code movement. Don't do new functionality when
moving things, just do the minimal required infrastructure changes to
make things work with the movement.

              Linus

