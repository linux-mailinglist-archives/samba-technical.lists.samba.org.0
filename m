Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E175F5023
	for <lists+samba-technical@lfdr.de>; Wed,  5 Oct 2022 09:05:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=8aT3ZVpi5WeAj43kYZJ6xwt+SqgOLzhjx0HSFYp6E1U=; b=BHTOkSQaOJuGc4k1r+i1cpxnxZ
	ex3sysmKlRyUXDxW8JKQ24nCxud+m6PxR7j+cmODHGNe7+nx2GTrJ+ibbPDW63jkeCc5z8Z8JXCem
	P8ZiP4QBYTfmPAsjT3wTZf3Y2WH8un6E/XczVZIwqznC1exilheTbG+FqXpCsBywWp0tso32Hk9xA
	mHpoAtreRcN3l1RlshAh+7i2aj6PtjyRdj4QNq6TmwHuFFCm9AoJvZX605+YVo9Wjpx2O4uNglhi9
	t31wgPPR1uOB7VCZA6dbnb67muGIMOA99xGq2TW6hoHeJqKHLIv89jKGyCVNIDy1KvJnDtdhLPjKZ
	ZW7epshQ==;
Received: from ip6-localhost ([::1]:30772 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ofyT5-0001nI-OT; Wed, 05 Oct 2022 07:05:23 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b]:42774) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ofySy-0001n9-1h
 for samba-technical@lists.samba.org; Wed, 05 Oct 2022 07:05:18 +0000
Received: by mail-ua1-x92b.google.com with SMTP id i17so6086776uaq.9
 for <samba-technical@lists.samba.org>; Wed, 05 Oct 2022 00:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=8aT3ZVpi5WeAj43kYZJ6xwt+SqgOLzhjx0HSFYp6E1U=;
 b=Qgf5yxKs8Ufa3XvUUjpFVmVaScX6P5zg0PaPZfg2UkFPKzQMy9+ebsYVcIuo5j3XVN
 YdrAhsNlWvZruFT09ZwO+YlB3OoWPnTe5eN0tUyamBmkVZYabg2q+Y/IHQmpI/Ggtznu
 kc8AV2u0DVeaFB4W2ak1l/2hmJnv5228EYgcAotyzKHMSfsISM7ns4xUu8OTpFjeFsdQ
 0qRKnFyzHqAYPn56bej8b9HgEihss94SCwi+pY3Kzufupbqc5hCU+FsiWaq4kohkvd3e
 Wyr8+QeUo9wvTalZEkq9B77Jak0EigB6XKBzMDQLToBZnzyh3548iJI1smucYO/Pl0GE
 sC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=8aT3ZVpi5WeAj43kYZJ6xwt+SqgOLzhjx0HSFYp6E1U=;
 b=HtEsC0kkFj6cPxCHeZgmGghn1c7/1qMx1jBYX7u9WCN0PVGcX5mNZdNQblXza6N/gw
 gsI8TsK3T2uzBdEGe10GRAdz2LhA9Ca4ymlVE01BbbUQuoijFmeED2pwpcLT32itIbBb
 ndb3a/l83UO17EL2w+6AzHSdOm1u2CEie8OrJaiGvUEk8aLm2KqgkAfVx3rqF+vJ+rpV
 Ug0V64AW12wn9PlQ+XVqzy6bkGQXAyjXzPtdlcUC/Jikr02oMCPb8jYf8RZLj6QELPev
 8kwz00fX0FDndTZPaS7C48RGwmXmpAUIiyPigJwJCBjkfAXjpLAUGq5fMu+TpFPFrwfY
 n1Hg==
X-Gm-Message-State: ACrzQf0H7rniUN2LzKi1hNCbK4oCh+AAgFmBKzVqYMzBAPFAZF/JRfJV
 OtSdaH+DYLMtdQInmGGXzqKZCRpUT/Szkqtm7MU=
X-Google-Smtp-Source: AMsMyM6KJdauMwanSUvHPSoa4YkBRKhlgG89W21dmwlM5F57Hud76dok8V9eod/8ydcKlGMaNup60GQ/R+vy6oAniJk=
X-Received: by 2002:ab0:6494:0:b0:3da:7cac:c48d with SMTP id
 p20-20020ab06494000000b003da7cacc48dmr3458773uam.96.1664953513845; Wed, 05
 Oct 2022 00:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221004062333.416225-1-usama.anjum@collabora.com>
 <87o7ur4dp0.fsf@cjr.nz>
In-Reply-To: <87o7ur4dp0.fsf@cjr.nz>
Date: Wed, 5 Oct 2022 02:05:03 -0500
Message-ID: <CAH2r5mu5p4f3XqscGNPjXa7L+rrcfKHzhg4F7Zf=S_cFdbWTjA@mail.gmail.com>
Subject: Re: [PATCH 1/2] cifs: remove initialization value
To: Paulo Alcantara <pc@cjr.nz>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 kernel@collabora.com, Muhammad Usama Anjum <usama.anjum@collabora.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Tue, Oct 4, 2022 at 2:09 PM Paulo Alcantara <pc@cjr.nz> wrote:
>
> Muhammad Usama Anjum <usama.anjum@collabora.com> writes:
>
> > Don't initialize the rc as its value is being overwritten before its
> > use.
> >
> > Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> > ---
> >  fs/cifs/smb2pdu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Reviewed-by: Paulo Alcantara (SUSE) <pc@cjr.nz>



-- 
Thanks,

Steve

