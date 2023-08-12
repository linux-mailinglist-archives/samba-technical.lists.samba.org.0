Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CF30777A371
	for <lists+samba-technical@lfdr.de>; Sun, 13 Aug 2023 00:01:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=WhR3LwhQ87L1+/zU8qBrgioAESpv3zU7ACpWoBW+xbM=; b=CcfASCoBw1fX4vIQ2aXDketQc4
	gB3nnmjtNMGxvoJ8Q2oYpNRJSHsqOGFXvGnDLL8dFKOXnlaOOrTV5CoExy6rTQxukKlUqn67/4jSI
	thGBJ6kcP6Oq02UcghhLBzyAk4bb0Bu542sLDItU3OY5vWL/1VMRmCjv8ER3UPcTMf1wpL2YjWC3C
	PMf2u2073k84f9GQkV8q2mXfq0oDUjgKxeBg9O+3YHT42bm8m4myvEmThjtp6EwFMsZrNccfRmgJa
	WpaevfEH5dXSi14R93G1B0qk6Odo2upzKy9IGPaXgFbYvF5VYVrqeBI+Ex/M7u41H6TITQ+5SY80k
	EEhnmL9A==;
Received: from ip6-localhost ([::1]:62836 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qUweW-00C52g-Qs; Sat, 12 Aug 2023 22:00:08 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:60638) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qUweP-00C52X-ID
 for samba-technical@lists.samba.org; Sat, 12 Aug 2023 22:00:04 +0000
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1c4d8eaa8ebso189036fac.0
 for <samba-technical@lists.samba.org>; Sat, 12 Aug 2023 15:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691877597; x=1692482397;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WhR3LwhQ87L1+/zU8qBrgioAESpv3zU7ACpWoBW+xbM=;
 b=aYvyatfPEWOEvEbTjKSqC6lOb5R87INRTBJjWsLLP4D9Am5AUMErodP2G3nwJt2ttF
 7WxzNSW3MRxTkxvr7PelGEJbTSXAfeDjW802ItAjVucokVqCLY9kKTFS++fZ3f/hYyKW
 tfrrrscr5l3GX9ubM3uL1aCP3qZwoz62IXlE/D5iTvE2azLDokrL0glkWTp/YEUrPXtT
 yUvGvE6jSNdMrpTejkXFkwhrFb+ye49V0ZdxBzbRikS6dDKTQlvHTDHc6MzutqRg/sHL
 zX7FCmjyhtV0NxatvwnBFRv3b+NlVeGoSf/rndTQX1ozFsACyLpcFYvZs/atSncSQd8W
 rTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691877597; x=1692482397;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WhR3LwhQ87L1+/zU8qBrgioAESpv3zU7ACpWoBW+xbM=;
 b=HQLtGcpHDiFQfMdkSpe2zadpkJRIG3PmiTZ/6Pr2TdHQiICw1+5VPnR7HEg/H758Sx
 1/h6JCwLWz5Qa7IAbMSl2qkI1qgL+psMY7Z+igy93ffI/g1qbe35ZcW7j+imTnqsn1KW
 7CWiUxoKbPFonWD3GFuh1S8mbp+dUkv5Ih8jpUBy3e1/6c/HsrC0otzfKCvNqNQ/YKWy
 b7mXL6PLyVuT5r4Fhqj8yeI6NxDPU0nPoTUY/+e/+9BviGehIA4UXfLGPirYHgavjsEq
 rPG+ZwoAojv38M5rOLvPWnmQxOyP8f0+8DWiyl4I9SICHh76WKyrDHIbmN33Yx27XVKT
 XHCA==
X-Gm-Message-State: AOJu0YzDAuA6FZSfZco3fn+wJ8DIenZlqldHsjugKnHVVCrhHigbf52+
 h7SIbh4Uu3RUOWlUw6zip2PbF90urEaktwJgNcvIickV
X-Google-Smtp-Source: AGHT+IGxseY27bzW29+qWYFxuMskiJqZAiPSZkgIZwq5ijgYbY/CyEGJxyc0EwGRCpORBJGraVhYaxUgHCblHslDsxI=
X-Received: by 2002:a05:6870:9722:b0:1b7:4168:e2db with SMTP id
 n34-20020a056870972200b001b74168e2dbmr6683997oaq.43.1691877597061; Sat, 12
 Aug 2023 14:59:57 -0700 (PDT)
MIME-Version: 1.0
References: <1430d5ec-f2fb-7021-0aa2-2a759a0dbefc@samba.org>
In-Reply-To: <1430d5ec-f2fb-7021-0aa2-2a759a0dbefc@samba.org>
Date: Sat, 12 Aug 2023 17:59:46 -0400
Message-ID: <CAOCN9rxbcN85rbz4YcP4815-YYLFDAmpsOjxwgspVHtHsjnzsg@mail.gmail.com>
Subject: Re: [Release Planning 4.19] Samba 4.19.0rc1
To: samba-technical@lists.samba.org
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
From: Nico Kadel-Garcia via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Kadel-Garcia <nkadel@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Jul 24, 2023 at 8:29=E2=80=AFAM Jule Anger via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Hi,
>
> Samba 4.19.0rc1 is scheduled for Friday, July 28 2023.

I've taken a shot at bringing this over to Amazon Linux 2023, along
with my RHEL 8 and 9 tools over at
https://github.com/nkadel/samba4repo/ . Unfortunately, the bits of
missing dependency get out of hand *really* fast. so I'm going to have
to set it aside until and unless Amazon decides to port a *lot* more
of the Fedora release they branched from. It's not the first time I've
run into the problem. If anyone else wants to take a shot, I'm happy
to post my notes.

