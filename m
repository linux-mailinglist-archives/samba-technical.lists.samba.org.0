Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DDB1448E2
	for <lists+samba-technical@lfdr.de>; Wed, 22 Jan 2020 01:26:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=4m772X36tBr4fuhxY0C/k9ViGcw/8CVNj/UQZUwSgeQ=; b=v17ObtWHk8ohh3oWRexp/0EpXF
	8tfyb81QjyKje5tjcNvloavMHjaD8OXGiM8jQUZy3qMJG9tc7i/tfcU8Uu8qEQpjsgeIRQV+Qw+1U
	q9uNmqsBTCuz5AePwqsbXOKo2wHrvrzgbkgeRSeIOYGBUFPdv0/jjEEYJ481HOc/KbqU8YmAzYAYS
	0dUo8zqgIDlTwBq3drSol+ZgpgsGmJP46AsGS0h/yuedrzEiF2qek5vcj5n9gDQ1V5kDLqipA/56q
	7xyq1IkaZPtbf7sZ35nA/zvXSUYyCGSqYVg+4p3d7XVv04ZYPNZ2teanV60lyjGFan1amZz+moBQQ
	yaqJpRZQ==;
Received: from localhost ([::1]:23370 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iu3r2-0049zD-8W; Wed, 22 Jan 2020 00:26:44 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:38544) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iu3qx-0049z6-IN
 for samba-technical@lists.samba.org; Wed, 22 Jan 2020 00:26:41 +0000
Received: by mail-lf1-x143.google.com with SMTP id r14so3894750lfm.5
 for <samba-technical@lists.samba.org>; Tue, 21 Jan 2020 16:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4m772X36tBr4fuhxY0C/k9ViGcw/8CVNj/UQZUwSgeQ=;
 b=oNlMToH73ZJVh7HCMmEyNcHI1vzBX6M7c2Wwc1/pVCrznPRLw7+abGTJfZ1MpLGrNO
 lEPl5VryXOXK3OzmQkQXfFzqhC/1/6fWQUtbOXJiSBvhzAYNBmvLj0rmEO0cmMtQcfBb
 8aKjOS1CsrOFd3hBh/RuKsR0G7AsmrQTiGWQB//tWcRhxmpi3AY1alYECSg1Y0WvDJcK
 2EsCA/rD70nTlFNamCjcdGz1zOHhWUIKdbNJkN4aREaTt3JKnMDiMl0pYptKP2I4b6pa
 /3qWwFAahdZqyIyAqizrOpz4BOVVBjOTrU532wcVFy+3SliY+74sfbWwwWziIAvdPtis
 BiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4m772X36tBr4fuhxY0C/k9ViGcw/8CVNj/UQZUwSgeQ=;
 b=cSTax91zuLbsenneMfesds9TR8yckPtApuTZlSgO9Zt4Na9+iIcbHhtLoepmSeg1E2
 ZqHxAOW8bDPD4x5hk4BYihVyL6sZCeuRwMoL/31F5nTQ9hbLCJkAQwxcFl4criMGHzb6
 DF3qByqt3kn+aP6jgWCXfGSVV/FD8+x4wKOU6uAOVTjhZQTCniso8Zrz/5Z1Jif+O1o4
 AjnRZmB/4SKtbG37wM8iPs4bLuPAKyAsX/8TXhRVsW54AMe1Tt6Mzm2MFeP9rUisRoOZ
 v5RwNKx5MXAxbo4JMr9Ouf631EXa6GaQARr9+HDuMgQDP0tvStMzAvHZ08gd1mTfHexF
 jKvg==
X-Gm-Message-State: APjAAAXItEuy4FOt6EMjB3/u4oxAGS/Jv9DTVKO13SSRVEPLTFfVbHBH
 w4fhUpj+fe2aWMvI7YB3uSIt1GjTPneXQ+QGuT1A7j4=
X-Google-Smtp-Source: APXvYqw0kQ1PlgK71tBSG1Y4WBK5KxMSHBcHgdFR/EcYGDIrsWrYdgTMgsxsCZYPtY6O5x7lrEYG1KTg1PXqpWjBAUw=
X-Received: by 2002:ac2:4c2b:: with SMTP id u11mr222742lfq.46.1579652797747;
 Tue, 21 Jan 2020 16:26:37 -0800 (PST)
MIME-Version: 1.0
References: <20200106163119.9083-1-boris.v.protopopov@gmail.com>
 <20200106163119.9083-2-boris.v.protopopov@gmail.com>
 <CAKywueSK-_zzF-K3_ehmLT3yje_hGaQU-1z-G3hYugMv3ZV-eA@mail.gmail.com>
 <CAHhKpQ7PCQXgvXkjTUuPtX2OHVxee9seGyRT=omJXvZLt3=ygg@mail.gmail.com>
 <CAKywueSXxYxZLDAXPwsHTyUSHyWV5WmssOwvo7xF-Wgf57XEsg@mail.gmail.com>
In-Reply-To: <CAKywueSXxYxZLDAXPwsHTyUSHyWV5WmssOwvo7xF-Wgf57XEsg@mail.gmail.com>
Date: Tue, 21 Jan 2020 16:26:26 -0800
Message-ID: <CAKywueS8_Vxn0YWQYXRdMadghSBc9V6=RquObmD03VeyL8BOSw@mail.gmail.com>
Subject: Re: [PATCH] Add support for setting owner and group in ntsd
To: Boris Protopopov <boris.v.protopopov@gmail.com>
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
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 sblbir@amazon.com, samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

=D1=87=D1=82, 9 =D1=8F=D0=BD=D0=B2. 2020 =D0=B3. =D0=B2 10:29, Pavel Shilov=
sky <piastryyy@gmail.com>:
>
> =D1=87=D1=82, 9 =D1=8F=D0=BD=D0=B2. 2020 =D0=B3. =D0=B2 08:07, Boris Prot=
opopov <boris.v.protopopov@gmail.com>:
> >
> > Yes, there is a patch that I have recently posted to linux-cifs and
> > linux-kernel list (subject line "Add support for setting owner info,
> > dos attributes, and create time") that enable setting owner/group in
> > ntsd, file native attributes, and file create time.
>
> Thanks for clarifying!
>
> We need to make sure that the appropriate error is returned for old
> version of the kernel that don't have the patch.
>
> --
> Best regards,
> Pavel Shilovsky


Merged into "next". Thanks!

--
Best regards,
Pavel Shilovsky

