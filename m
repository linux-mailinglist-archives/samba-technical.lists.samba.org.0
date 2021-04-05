Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE4535482A
	for <lists+samba-technical@lfdr.de>; Mon,  5 Apr 2021 23:32:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=34NFUBk25VvjYcWfoAtVI1m5zfwXqsP9qgra7lNibf4=; b=TktktHtqbGHMdB9lunB9fulySI
	wpd7C73KeBXraE8w8A77bjzXpQWsd55Tmf6ezj4xGnSDGEZD98HTu5p8HKc+RNehEfWF+EFM1tDp6
	DmYwCZCG45fxlWAFltlQB2YCoWnRgMyhoBFL6LgQiGyfgO4mBQvHrH0rfjEotkMTbgGkBX3rEzsLI
	FF7TGQgq23DHWJQXG6L3iDMoPv9MQNo6omfrJEOTY+oPDPUZCgWgHtEPoDvvzABaqvn9dvVQu/nyO
	cnhzG1ONV6mtukfP4NXCaJCfYk5p0cOWpBtRWU27KujyUu8X7Rf8rCor/JC17oaENjhlakaIC7XDz
	P0wY3nQQ==;
Received: from ip6-localhost ([::1]:62386 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lTWob-00A6dP-FJ; Mon, 05 Apr 2021 21:31:21 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:43807) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lTWoV-00A6ay-KG
 for samba-technical@lists.samba.org; Mon, 05 Apr 2021 21:31:19 +0000
Received: by mail-ej1-x633.google.com with SMTP id l4so18672781ejc.10
 for <samba-technical@lists.samba.org>; Mon, 05 Apr 2021 14:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=34NFUBk25VvjYcWfoAtVI1m5zfwXqsP9qgra7lNibf4=;
 b=LLrG/jNsRoOR2DH4sCa8kseJgoYa2QTuwzrjT6oobivDbrt7RJLSBBNtKsEz9VP5UX
 pRg38FyhJOh1zA9LszAJqPzCO5+FMZ6dbiMo3YF3XfTBEq8hIiT34ReI9deJUZEg0Bb5
 VFQopJzRoTwUsLHpTHGFxLlNvd58NbcVcLy5pGrI0nhqTUNnNdQzLS7QMiofwdBLrcG2
 PEDIzxrAU/IgqvslSohsFTHExNnsZr8+Eq5zQeKi4SfdR5gZ1Z7mxXxZOYdD1/XtJWRL
 XL4LGVIRj673GGG+z0ibOM8m+Y0xbUZ/HaTZfVdRil3DuOGyXq7PIrH2NVnHnhFwbb6f
 sGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=34NFUBk25VvjYcWfoAtVI1m5zfwXqsP9qgra7lNibf4=;
 b=IG0HJSUVdPlB493Csjdzt6zzzlEMq9FypN/0bL/c3ux125BP6NOj14GcBja76/1CW0
 IW55t/kmGwPG43wRT7UnMqxaYohmPi4z6UeEqKboNlGWb/ukFOdU8/i8Y/ncEPMPYp5/
 i/lM9E4oj42lqTI+0kuPMnlcpPOJmAAjfxbqL+BBDIBCPvIxWydWStNW/P6kt8YWeRVY
 kx3SrsLe0T1ZkiUIAeU1XqG6Yi0bfyrTX2/uNuDhGpyw5fj8VfbzWmj4BTbEM4t8aOW3
 XoKJE4V6HujzbSvNzspuzSqesHj3Rq/5Ev1xKUTyK4h5Rzce1LyYinHfP3G5a4KujxuP
 SkPg==
X-Gm-Message-State: AOAM530grRK7TwTg2zKTpLg6oEpZmj2Zq2PfMnyhVFVkbwBuyLR1VpDg
 BR+RkakgXVMRgDPI1/HC25dD32y4d9KUm4VkEw==
X-Google-Smtp-Source: ABdhPJzrSggt0mGvMxuKzU7ILHmDzivWyIbZq9+YXnQiaTCRuzprZ4t+1CUqHSw+8CSEN3+vFpvxq4m6RFdqACusUOs=
X-Received: by 2002:a17:906:6dc9:: with SMTP id
 j9mr12863755ejt.188.1617658257333; 
 Mon, 05 Apr 2021 14:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvhUQEqXQmrz5KKbTCFaeS5ejZBGysaeQVC_ESSc-snuw@mail.gmail.com>
In-Reply-To: <CAH2r5mvhUQEqXQmrz5KKbTCFaeS5ejZBGysaeQVC_ESSc-snuw@mail.gmail.com>
Date: Mon, 5 Apr 2021 14:30:46 -0700
Message-ID: <CAKywueQ8NZWhrau94JNurYYgtq3kN-avcdgLOpb3wMmMLgSDQw@mail.gmail.com>
Subject: Re: [PATCH][CIFS] Insert and Collapse range
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
From: Pavel Shilovsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Shilovsky <piastryyy@gmail.com>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Great progress!
--
Best regards,
Pavel Shilovsky

=D1=87=D1=82, 1 =D0=B0=D0=BF=D1=80. 2021 =D0=B3. =D0=B2 11:31, Steve French=
 via samba-technical
<samba-technical@lists.samba.org>:
>
> Updated version of Ronnie's patch for FALLOC_FL_INSERT_RANGE and
> FALLOC_FL_COLLAPSE_RANGE attached (cleaned up the two redundant length
> checks noticed out by Aurelien, and fixed the endian check warnings
> pointed out by sparse).
>
> They fix at least six xfstests (but still more xfstests to work
> through that seem to have other new feature dependencies beyond
> fcollapse)
>
> # ./check -cifs generic/072 generic/145 generic/147 generic/153
> generic/351 generic/458
> FSTYP         -- cifs
> PLATFORM      -- Linux/x86_64 smfrench-Virtual-Machine
> 5.12.0-051200rc4-generic #202103212230 SMP Sun Mar 21 22:33:27 UTC
> 2021
>
> generic/072 7s ...  6s
> generic/145 0s ...  1s
> generic/147 1s ...  0s
> generic/153 0s ...  1s
> generic/351 5s ...  3s
> generic/458 1s ...  1s
> Ran: generic/072 generic/145 generic/147 generic/153 generic/351 generic/=
458
> Passed all 6 tests
> --
> Thanks,
>
> Steve

