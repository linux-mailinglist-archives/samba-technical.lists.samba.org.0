Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD4412417E
	for <lists+samba-technical@lfdr.de>; Wed, 18 Dec 2019 09:21:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=PfRPwQX6fD2z+QBSEtd107H3lI6iNbCjNcWznx3Tkak=; b=L3o7GCnMRgaIE9gYUkFskhmgFj
	gOpRZLVMqLxr4hKaBLKRILm/j7iQhhe5eBOmD0J+CrAyv2+jKz36xJpU2TTSZyPU7D1To0Yh8RQft
	0Wy3VktHLdXLqLMyvagiLJTfFTFDaDASSG70tRcEjCspSG2vyQY5DuhhEeJoDIIAXVLYvXvm6Pnf5
	AOQ1um9G7aRue8d6OI1uUBgkc64+W+KTa/DmXhKcnmYhOH4IDDWz9wu6hiL0Y+TnfLcK0u7vmFTZT
	sPQIQgM2C8e4aiOFtsnZHru7362mwXEW5B2nnVV0Gljy1Wwc3dEW2FCdH4/okE/8B1CNi3ZwxQNC5
	kgDvQ5og==;
Received: from localhost ([::1]:32756 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ihUZG-007a7Y-4m; Wed, 18 Dec 2019 08:20:26 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:41860) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ihUZB-007a7R-4i
 for samba-technical@lists.samba.org; Wed, 18 Dec 2019 08:20:23 +0000
Received: by mail-lf1-x12d.google.com with SMTP id m30so1010263lfp.8
 for <samba-technical@lists.samba.org>; Wed, 18 Dec 2019 00:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PfRPwQX6fD2z+QBSEtd107H3lI6iNbCjNcWznx3Tkak=;
 b=T7leguKuuo3WUTFCWvRY8Cc3/JQtqa5gL8Zoj6k3pn8ynRWDsEaWDTyl+o2cLQjaOg
 R2mQvy2LxbCByWJ78HK2qpk2yMVpYzRGw8PJ+ZjkSN7jb5YSQk4DkRHZW9IOJJF7TueV
 lhgxHoQElbnJkIIv7SVwiYQ40mWbed+78zzITnIB4DNfdZSQd7e2UrtdbZCPEk2oiP4g
 gC8eSGk1R/uBPpmpGKGOFjsgSQ0FlR+UNjwEDKvdiwrQhWCfKE8+if+aFz9SojsVbyyA
 cq5qevADX58zlkrJogFtBpKdENURe9omoIzxsqPBck4HM5Wt3pqvRQBk4mrsIsu7M3kS
 FlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PfRPwQX6fD2z+QBSEtd107H3lI6iNbCjNcWznx3Tkak=;
 b=LxtxpAEbyuik+ocSOn2Ev2h+IzoaAd24caknqyn7K2s3drXUnd3yU824vmJxYWc4my
 maXwwmLVuQ5kGEiF9GKhV6wTXkVCezIbBbXBk6wFhMtYww+Am/Vs7XNqy9FjcYCAmD4f
 fkPPMyC7Dz1vtXXO/d7eIiaQdHJvc6PbHwkBBHfhZbTm/SqOAnxu7mKvdanjeCMJMOk5
 dYSTgIbuC5PftYHtp4i6EYUkc4uOLvF1Ulfu70CO+5syQEil8vsk6kjfwDX7yGCimvWM
 mFpFoD5YaaR/dh+ST8KL7zWWBo34ops9jj/9mXvljQcpStsk6f/8DJVvb40LjGbmF2X8
 VgaQ==
X-Gm-Message-State: APjAAAWQliLm6E1z6aA2CmpBZAkIENrmT8DscFnWVTFp08UskiR7C6V0
 59obVkbu3l6LlwWvDiMegdYBfGo6xdkvfif2Pus=
X-Google-Smtp-Source: APXvYqxvzZAdV3Y78TzgnExr0kldEVTPwkMhRgSBMUxIEDuHMBUuNLPGCMZP+EdhZ1Cz1vlJZ4R/7pT+Mveoi179JME=
X-Received: by 2002:a19:f811:: with SMTP id a17mr928154lff.182.1576657220083; 
 Wed, 18 Dec 2019 00:20:20 -0800 (PST)
MIME-Version: 1.0
References: <CAC-fF8Q+ZE00XWe2=VohrYvLHWv96HX+VR-CFp_os3X4BoPEXg@mail.gmail.com>
 <20191217160440.GC1458792@onega.vda.li>
 <20191217161644.GD1458792@onega.vda.li>
 <CAFJ-+QucfFCP9Zaxta1h0Lwmd-Bb_RyGa-DFJbbQ5uKYV2FdWQ@mail.gmail.com>
In-Reply-To: <CAFJ-+QucfFCP9Zaxta1h0Lwmd-Bb_RyGa-DFJbbQ5uKYV2FdWQ@mail.gmail.com>
Date: Wed, 18 Dec 2019 09:20:08 +0100
Message-ID: <CAC-fF8R3K9Y+8gkEha_TGjqAb-HeceeZs=cg+qctZT=ijTd0Og@mail.gmail.com>
Subject: Re: ldb: LANG=tr_TR.UTF-8 make test - fails
To: Caglar Ulkuderner <caglar@ulkuderner.net>
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
Cc: Alexander Bokovoy <ab@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Dec 17, 2019 at 8:28 PM Caglar Ulkuderner <caglar@ulkuderner.net> wrote:
>
> Alexander pointed correct problem. Comparison is a big problem for i dotless and I abovedot.

Thanks indeed for all the hints.

> So it causes problem on comparisons. I was plan to work on patch for winbind.
>
> I can able to help for this patch and tests.

That would be great :)

