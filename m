Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1406DCB2B6
	for <lists+samba-technical@lfdr.de>; Fri,  4 Oct 2019 02:22:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=DvWimnm16b3bqPmod3i89DpArW16zTxOuKvtcXsDPr4=; b=yJj6NYy1/QTYA4OE46CnonP9pp
	YOsG7qz9uI+ej8NxzLKDO6Dv6fHuYpodl6zkoh3X2gw7CTDby0sqc2PcVobaDMtLHP0a0Ev9RZVk6
	+Jq/QDVIpoaHPjdRzus27sJh+3dF6hWaZ/SzUglG6BLK+fEOWC0n+gAcp15kpax5urhlZ+Qsv/jUy
	csGaFf7XbSuBovcLYXidWLueXnziOhK+AQQxjXwlrxJJCZQoUPVTZmQG+CQgG55whEmxqOPo9VX6P
	TEkIIY1uNcWpFbxr+dMteZlGErbyQ1YH4GrYtr/fKxwUqSU09AOHhGeq6DwKM7fP3AqYPcIJa3Ki4
	4H2RXZoQ==;
Received: from localhost ([::1]:31528 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iGBMC-000xEF-9z; Fri, 04 Oct 2019 00:22:04 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:45563) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iGBM7-000xE4-BE
 for samba-technical@lists.samba.org; Fri, 04 Oct 2019 00:22:01 +0000
Received: by mail-lf1-x12a.google.com with SMTP id r134so3146406lff.12
 for <samba-technical@lists.samba.org>; Thu, 03 Oct 2019 17:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DvWimnm16b3bqPmod3i89DpArW16zTxOuKvtcXsDPr4=;
 b=imlmDu4RCjXhYCo04eJjsfiClmtoSkI0RACqdj6gw8ejAfpXeXioost/UKgVM3bgUD
 ZW0LOD4MWUN6s2UMW+Z0WjbS7QrqVT2IzYXrr2WG3HfL1fhQE5TppToGD/1mc6Zz5aUS
 4ct+E2s/HNwk+ha/mERN3xZf18Q/VIjJI5sTZDLMJ7IaPx1ivim3VByeJyxDQ0sM5bF7
 S2v/pM+wfg5ZOidArIyWPCGoerRPVKm1jUHmnrJKcPIa8+JwNBnbsz4U6hpbc6tayfwq
 MEESi8JLfktMb7rCha3rJP8/HLbv8Xk0UjOd5RsY6dvx6NKXJEozQh4UXiQ8UmOXalmu
 RKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DvWimnm16b3bqPmod3i89DpArW16zTxOuKvtcXsDPr4=;
 b=o3NO8g89IEIJfNkCytjZDn7ExUmH7gDwFal4WgC/3WWzX8+DHM0WGNEWX0J0Q3Vm3B
 Hl3DBvItwTwyUHrtqbTARpeThOHcq5MimCzddJKcjl/LA1ErGITlwH4pyw+hXpapNkGZ
 ZGohq7Bd2pNr19PP5j8Hc3Kl9jZN0SJGLAkzdr/T8VfbtGWUYRU2nH/uzTfv1bH3PFZ0
 HrElpxy3eqGba7hmL70WiDyzwS7xp3bRxtOjMpEKtd3Kdz5G5naXigjNqulSEiXVM1fN
 uOYYB4yvVApr1feyyB1/20D3w4SZYwHe2oa8pSuqkvOKAbqTmc48p4UzyTPBatZGxDcy
 raHQ==
X-Gm-Message-State: APjAAAX8lU/GzDHzNajU7ZSvvidz4on3MOiM4gOhURIM/p8RwkuJ0B4m
 QblJHK84n8AOwLDWAOg6SrYJRD8PWWk0SWnKAw==
X-Google-Smtp-Source: APXvYqxgNqrER0ObirqCA2yomjsELvfP0xpCwrHkURjot6U6htqjamv4DkU1bzYWd3u20NRMOV2yeMZ6wWDnwgiY5ZU=
X-Received: by 2002:a19:ae0d:: with SMTP id f13mr5630546lfc.36.1570148515981; 
 Thu, 03 Oct 2019 17:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvfb3nkdz8r8sAUXGJkx678XZkt4dn=4xiuq0UD2vxFrw@mail.gmail.com>
In-Reply-To: <CAH2r5mvfb3nkdz8r8sAUXGJkx678XZkt4dn=4xiuq0UD2vxFrw@mail.gmail.com>
Date: Thu, 3 Oct 2019 17:21:44 -0700
Message-ID: <CAKywueQ2rGannA7Mi-7j02E0aDN5KYGCLz5faHUDKhC+zp2ODA@mail.gmail.com>
Subject: Re: [PATCH] smbinfo dump encryption keys for using wireshark
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
Reply-To: Pavel Shilovsky <pavel.shilovsky@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Merged, thanks.
Best regards,
Pavel Shilovskiy

=D0=BF=D0=BD, 23 =D1=81=D0=B5=D0=BD=D1=82. 2019 =D0=B3. =D0=B2 21:51, Steve=
 French via samba-technical
<samba-technical@lists.samba.org>:
>
> Updated with feedback from Aurelien and Pavel
>
>
>
> --
> Thanks,
>
> Steve

