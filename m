Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 733FE15A78
	for <lists+samba-technical@lfdr.de>; Tue,  7 May 2019 07:47:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=uqiIIxzAoiILnKW2WDXvUV+swFjTyQmX8vpgzwtmtZM=; b=WVJay0Ox05pUaMmhQqy/rLX0HS
	pN+R3edxpbYXaNO224tU+BUhOxK4AGLtz5oOroKE74dBUvqUiI3byhxst0iwgj1iXC85a1NHIs1cL
	i6IpcLHFqY9Xkag84ClMiLJP4hANS+WasNlodJ7+1RuUrXsAL3DsqulDI2nQtZucqGJ2p4EEf+OP9
	KLVfX+H500RqMeevhaLlX/CSsn6v4B1cFbUsz8zUae8Ty1W4AZc/rYJdNWRthi6eLg0ihulPUut7N
	ekXPNLzwZTNd1sbFLNqriEBeJD0B6jzLgybmFMwrlop2fQcF0q7DXmXYG34eIfMK/CZQmbPhQts5p
	cZ9FCAkQ==;
Received: from localhost ([::1]:50038 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hNsvq-002ppH-87; Tue, 07 May 2019 05:46:26 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46061) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hNsvm-002ppA-Ij
 for samba-technical@lists.samba.org; Tue, 07 May 2019 05:46:24 +0000
Received: by mail-ot1-x344.google.com with SMTP id a10so13734948otl.12
 for <samba-technical@lists.samba.org>; Mon, 06 May 2019 22:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uqiIIxzAoiILnKW2WDXvUV+swFjTyQmX8vpgzwtmtZM=;
 b=ATV5UgCz05BgeDfqX2IBX+1MvmhJueajbsd5oNzaCKmdIJ4a1II8ul4ju40OXhXDp2
 x6h9Q7HsQ030JPWdK67/WTP9oS+NTB6bG+GLbXT+JB8tZRE/qvdL/k1OS8F0FhK4stW3
 c0kKHOOhSUvJDYiCq9Bk4Vt+cnmsiIBu8OSdfaidBm38iviFejd0Eb3zF1D1AMZv6CNu
 6L9D3ZP2+e0GHyQYRsOFT5LZPT1/DThTcrLewZzHograUVGMHRzqqXe4tjX11hOhGJ8+
 +bqr1libvpToJK0SjGqmfvQUm6Uxza7PxR0pUe7f7tpBk1obFrZs3VwwY6fahhuAW1iJ
 cRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uqiIIxzAoiILnKW2WDXvUV+swFjTyQmX8vpgzwtmtZM=;
 b=EwOkpH546cv2SvTpe5z5kx3dkASia2tGZnM0kxRQqGi2qHnkTPaMRvPx7c0YvaeKwO
 H7JO5p4X1Q+c/pDsikAVL9KMtlZP2iDkykVY1GadfJWAGJYMTcP9lmg3t8fD4S2yCmpI
 Ob0FhrrubCG9v6URZfR+lIsZfT596Q+2yMKeGooH/RaEB7bMPuid/4HnJfAExUAM3Uy7
 ZX67st7ooktPHZQkmz3JbyHTszcweYsXwUwYbJunwACDqjPqQxC1MIey6/f9lncx9829
 JQzOSpCDZTALZAI9HYtOwp+RKHpJS/xZwbBIWsTTU0zgpVLw4WkOBm18uPMn/PAH4C/t
 /RnQ==
X-Gm-Message-State: APjAAAWyg4K3Qk754LISkopzXUT1RB2HB6W1OvwiR1evWop/5/IxN5bD
 Qg2u4tG+9MQt9Qbe6YAgflj9Ujarc1mCmjpOZ0MsHg==
X-Google-Smtp-Source: APXvYqx7xkio8lVwXXCXmZ7oX90phwoBAKkPVRp1VmTDkAXH/65C8Llde54OVhhkdsB6QX4hXZy5SekeRy1qrZ5ynVA=
X-Received: by 2002:a9d:2f0:: with SMTP id 103mr18949594otl.126.1557207978226; 
 Mon, 06 May 2019 22:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190502204929.58b02257@martins.ozlabs.org>
 <20190505122820.66c3c5ab@martins.ozlabs.org>
In-Reply-To: <20190505122820.66c3c5ab@martins.ozlabs.org>
Date: Tue, 7 May 2019 15:46:06 +1000
Message-ID: <CAJ+X7mTaF8kHF+m0fm5b9Sz9ibSN75Cka3k3TAdRtD3__cMyRA@mail.gmail.com>
Subject: Re: [PATCH] CTDB test fixes (BZ13924)
To: Martin Schwenke <martin@meltin.net>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, May 5, 2019 at 12:29 PM Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On Thu, 2 May 2019 20:49:29 +1000, Martin Schwenke via samba-technical
> <samba-technical@lists.samba.org> wrote:
>
> Please don't push this patch:
>
> > [PATCH 4/6] ctdb-tests: Wait to allow database attach/detach to take
> >  effect
>
> While it seems to be the right thing to do, I'm still seeing unexpected
> failures in the detach test.  :-(
>
> The rest are still good to go...

There is another bug in attach/detach code related to client_id.  This
will be fixed separately.

Pushing the test changes to autobuild.,

Amitay.

