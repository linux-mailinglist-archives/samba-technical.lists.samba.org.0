Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0177D2FC36
	for <lists+samba-technical@lfdr.de>; Thu, 30 May 2019 15:24:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=m12hNea4K/tqSaOmbQZHmLzgLEFlGEuR7meHafqDpzo=; b=RtNoep66Txm8h90Wzevzp+GXso
	MQZvyMoSQx21xehjlvYz7K/nTV7XEAjPtISK8zy5YxSS+8b7X/iHaghrIdVbSCqDfPVOW9p0ijqd8
	umfuKgQSqhR7QgyAvacx3VG7Lf/MdXi9ResXKD/2ezO5JkMgtJCvxNvFFS8aNUBxunekwMjnrJon9
	HtrmkuPHj3c12yv/+gvANSruSJZDFF9ys9AgaJN9SVeNdwPrkaW6sPGL+UWygdUDYdg3hDoHQGDsy
	5mk1XXIYnO7UIhii7IfM0mRa3vLZWzfdHWdQfIXn+JmBITfqcNyLhsM5wzhIGU1lV2W/uEziTE4tc
	EBVqivPA==;
Received: from localhost ([::1]:26434 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hWL23-002cG0-A4; Thu, 30 May 2019 13:23:47 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:42792) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hWL1z-002cFt-MC
 for samba-technical@lists.samba.org; Thu, 30 May 2019 13:23:46 +0000
Received: by mail-lj1-x241.google.com with SMTP id y15so2820032ljd.9
 for <samba-technical@lists.samba.org>; Thu, 30 May 2019 06:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m12hNea4K/tqSaOmbQZHmLzgLEFlGEuR7meHafqDpzo=;
 b=A8/UW1QhBz7PxJtpIsxS/S1mUBUHZmO9jxbYR62pTwrV5HEaPuY7+u+ny3UD1exSdy
 WYPcpKYBDYqOOCgn5c8dS0R/+h3h5I/d653ts/ChFYAzdoSTxS/6+O69cKIC25QkN96u
 BSCnCdOBT4+X1vHQCsHlqRs/dRf/8NjeqXEPIs1CP9vAV6mdCVrpJipqbyQSswcPXbwg
 naq4Dj6dDhRyZLc6oGYsCFrhlQg5EfEVMJ0rMYSqKeeua7zwXdePZY5SRLsr/n8ksrmp
 VAMgsBS99Ym3z4o4ppDZP4gT97eSTBKsCIvMCHtFbn5q+CnOv1Kse2h69SRmq8M3ZpkY
 j8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m12hNea4K/tqSaOmbQZHmLzgLEFlGEuR7meHafqDpzo=;
 b=twCe7QwdZk08GZamL4+qlwoRJ+VmZXJ+RnEqhOerwTYMhlnomsxiDLAzNYhUbPpH5R
 ex4sfPYJq1XYGZMydeT6H6rMmZxTTs1jFMYJjDwDwZ6ZSkpMXLDobT73R9lDYDs5D1ZC
 /HCRcW7HSUZCZXWEJGId4AztGd00EwpTb7f7nGAFvqX572jSJdKY+k270namA/lUYJG8
 mnR2TOhbifjPAsIoeBOCnjd66r+4UQVWh10E+s/iuga1go6Dg1i2A/FrOtG3dLhK48Yx
 +sGhBLjPRQIXyQD29Ntkov2o7NAjYHYLbOxP87NrJLlGjAhTEGJXrn00fkbGsd7NVGqH
 0fNg==
X-Gm-Message-State: APjAAAV8B1fW/qChznZuVQxotGHRkakOroElMoKZT/UDdPsejKoZMWXh
 K/iqrL5BlpIfpj2QrudCqaS8or19WRByAwU03Ok=
X-Google-Smtp-Source: APXvYqxWFo+1CHwBkOoqH6WTPVP1NzsW+F6iyO0sTLBLgReZdResSanC5Y9+EbcdTwtYLyGhbMmIHuG37xYhjm9XQQ8=
X-Received: by 2002:a2e:9742:: with SMTP id f2mr2210188ljj.184.1559222622662; 
 Thu, 30 May 2019 06:23:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAC-fF8RUTx4Zvj3m_bc_tG7gMzbTy7iHyMLVnFur=6b83+pTtw@mail.gmail.com>
 <CAC-fF8SAdgU992P8tsKyGSLfi0iwcjH7vdWrw8ObqqrcZsdycA@mail.gmail.com>
 <2736033.mZseHfHTOk@krikkit>
 <CAC-fF8Qt3TH-1h0dGjGVWnROOoXMAoeL0GF6Z1dSizd0FWnkbQ@mail.gmail.com>
 <1559167973.29502.39.camel@samba.org>
 <CAC-fF8S=SMej5czuj6VY3yb7xjB_y7ULm5ebWT--JsVxu_2E2A@mail.gmail.com>
 <0d4bfa30-7501-b462-5599-9ec403058b9a@samba.org>
In-Reply-To: <0d4bfa30-7501-b462-5599-9ec403058b9a@samba.org>
Date: Thu, 30 May 2019 15:23:21 +0200
Message-ID: <CAC-fF8QH1PF_NaDqfRympLsQcNaS28orb43S-ec+cFj-cNg6Bg@mail.gmail.com>
Subject: Re: [PATCH] pac-glue: fix delegation info blob
To: Stefan Metzmacher <metze@samba.org>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Stefan!

FYI, here are some thoughts on these bugs.

On Thu, May 30, 2019 at 9:30 AM Stefan Metzmacher <metze@samba.org> wrote:
>
> As reference here are the open bugs:
>
> S4U2Proxy requests with encrypted authorization-data are rejected by a
> Samba KDC
> https://bugzilla.samba.org/show_bug.cgi?id=13131

Not sure I hit exactly this, but in MIT I had to filter out client
provided authorization data to make things work.

> The content of the S4U_DELEGATION_INFO PAC element is filled wrong by a
> Samba KDC
> https://bugzilla.samba.org/show_bug.cgi?id=13133

As mentioned, when chasing rbcd referrals it looks like Windows KDC
trust partner would process this blob and make sure S4U2proxyTarget
field is the same as the currently requested server. On the other
hand, it looks like it doesn't care about S4UTransitedServices too
much, as I could send an irrelevant list and it worked fine.
Also, in these cases (constrained delegation referral chasing) the KDC
does *not* increment the TransitedListSize field, unlike what's stated
in MS-SFU 3.2.5.2.2 (I think the doc is wrong, as the list should not
grow since the impersonator does not change).

> Padding/alignment of PAC elements is done wrong on Samba KDCs
> https://bugzilla.samba.org/show_bug.cgi?id=13134

Do you know of any impact of this?

> S4U2Proxy tickets from a Samba KDC don't pass PAC verification checks
> (authtime mismatch)
> https://bugzilla.samba.org/show_bug.cgi?id=13137

So if I get this right, it should reproduce if the evidence ticket and
the constrained delegation ticket are not acquired with the same TGT,
like:
$ kinit
$ kgetcred --out-cache=out --impersonate=user intermediate_service
$ kinit
$ kgetcred --delegation-credential-cache=out proxy_target_service

BTW, I think MIT would be fine in this regards.

Thanks,
Isaac

