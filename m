Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5958B083D
	for <lists+samba-technical@lfdr.de>; Wed, 24 Apr 2024 13:23:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=PHiI4/zBUnoCXR+ca61WVG78RucovTpz+DsfHCC5LoQ=; b=hBH9MwO0K8NfDBcQs4NyiluE2U
	C7L2HYlc6bO2uVv4GW3yuZEw/BKaJXywMW3nZxiNjkBECJUbpgwbWOBU7CQ0NLl8f2INzeDos61Hg
	7KWKOSHaYux/dLCv5A1qQeMnsX0jU2xugYr80BjhEG+Z2SMyFJjTrF8YE2erxMzFz/cbXO+98sXe0
	bU3/9Wv1bzHe2LZ3oeEk1BstRTz9u7wKqHyr+/FHBlQ2hR7vSOVXZENM7sU8lU0i5RJbC9AM6uj+b
	qRnJM9jiusb2i8TUoi3DtET1TfcJdT7OI5dDiwb0xvaXHGjVNmemT2gWUCNqZQ4HKp757zmH1jPse
	BO86FPAw==;
Received: from ip6-localhost ([::1]:54304 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rzahp-005XfX-Jq; Wed, 24 Apr 2024 11:22:29 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:58843) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rzahj-005XfQ-E6
 for samba-technical@lists.samba.org; Wed, 24 Apr 2024 11:22:26 +0000
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-5d4d15ec7c5so5304544a12.1
 for <samba-technical@lists.samba.org>; Wed, 24 Apr 2024 04:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713957741; x=1714562541; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KGw1bgsiJtHdHJ8FXfYkOXStjDOIlCkEdoI/wT8TtD0=;
 b=c6jkovZQ3ZYf23nslbQsy2uiYbviU8eqQxupAbEWyGRJy1szvbrZz+/Dh5UIWj3BOm
 eMjPud0DmkLWCxSuNLswFJGybTRd2SZIJvPnBqN9TaesoIoo4xAotqYqaceYAm6PCs+A
 iezASmpYA8xzU76hP9irIWYLO7Z5lOrpPu7QvJgzcBxmyfoF0uga23lzxoAM9AozXQWU
 m0Lr6nXgXVDNkQnLldtjiWAq32oaJqhFOye6/x/FrKJBhDM53+VOYdhkx+k8b5qAJLnW
 oE/AfjnwhgWAf1ADhH3qRu9dKHkEbWJPfyZo0deETED0R2T2Q50yObrX7DCcpESMm14C
 dbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713957741; x=1714562541;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KGw1bgsiJtHdHJ8FXfYkOXStjDOIlCkEdoI/wT8TtD0=;
 b=JF0y2ytIasiucM1Iaf/4ssuP2lwGusNPdT6XJTLrQBdBdOGvk5N09uKBsZoryIZP4e
 hkGdrP+jqzQmGdIppIKgLJqpmyJexMKHlGkwcM1U3ZJeSRT3YhhyuayMBe7QQJeEHsVa
 rfYMvVM6iOE7Xe7m6VhnoMNOzORkwwBcoe1wFCkTDH3V1FmZqAjkyjD/ie11xLmwyDiF
 cVCunfyB8KG8cKh+keOuxXi24MiDDdUETXli5GzHCGZe+1Lh9hQNAopYhE4PpHf/GxHw
 IxYAHjglux+AdL8lvnQ1rYkEUvEj3WiqCWZCEZEgvyB96neFOoSzF2WbehXBCPgZZeuB
 F/jg==
X-Gm-Message-State: AOJu0Ywogy9BH7F4Um79NgtKapneRv36IUDqISW9rfdjmxWgfqVz5kOR
 E86d+T9FCYS38Dsm5X4Q8HR/W0wzMrd762+C3CgqxsHwKz6TCxO9nffeId9f5atmYaoB46mrijq
 DPTgZyDr//lYGInGaLsa2mlk4O1n2ptr6
X-Google-Smtp-Source: AGHT+IFCYETmmqIP+HFOv53m1ySIRWHUGG+wcpzHFrpPkW5NTy/EAb3rX6aRhOHKSllrMABtMSf07b0xlY5w5IiHvSw=
X-Received: by 2002:a17:90a:8405:b0:2aa:c5a0:99a7 with SMTP id
 j5-20020a17090a840500b002aac5a099a7mr2132672pjn.12.1713957740860; Wed, 24 Apr
 2024 04:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAO9H7P_oqwoJoC_8mWNZVYZ-pxrYt9TrEt3t0LJsEvS32EorEg@mail.gmail.com>
 <4249c3b6-3b4e-4bd3-95e5-864158e5797f@samba.org>
 <CAO9H7P8Cttbg6v-Cn+rRR5cKc06K1pid9oQqsjPnHL49iCE=ig@mail.gmail.com>
 <17264f9a-2d6f-4bf4-a0e7-f28372a6f82a@samba.org>
 <CAO9H7P8jocp0J_8oFqnYCmheS0o83x6B7koFBMQa_Y2vwdETtw@mail.gmail.com>
 <928cdbd1-a1ed-4b5e-93e9-866ba5f8e504@samba.org>
In-Reply-To: <928cdbd1-a1ed-4b5e-93e9-866ba5f8e504@samba.org>
Date: Wed, 24 Apr 2024 13:22:09 +0200
Message-ID: <CAO9H7P9jncCW14O9=Tv9BNqHQ+L7E3Bia4YiSstyyJdoxudNGw@mail.gmail.com>
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

Hi Ralph,

On Mon, Apr 22, 2024 at 7:56=E2=80=AFPM Ralph Boehme <slow@samba.org> wrote=
:

> On 4/22/24 14:15, Xavi Hernandez wrote:
> > Yes. It makes a lot of sense. I still need to understand the details
> > better, but let me know if I can help with something.
>
> congrats! It's now your project and we will help. :)
>

I'm very new to Samba and there are many parts that I don't even know
exist, so I'm not sure if I'll be able to finish this project.

In any case, I've tried to rebase your branch. It wasn't straightforward,
but I hope the rebase is correct. Some commits were dropped because they
were already applied, or the modified code didn't exist anymore.

The latest version is here:
https://gitlab.com/xhernandez/samba/-/tree/impersonation

Is it possible to check that I haven't made any big mistake (unfortunately
the code is incomplete and doesn't compile, so I can't test it) ? I will
try to continue from here.

Best regards,

Xavi
