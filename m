Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C166551FB
	for <lists+samba-technical@lfdr.de>; Fri, 23 Dec 2022 16:20:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=v61T70B226BrX/xGZCTOU4S4LeTS1HbnMHsgChpVBSg=; b=aK4HiO1iKgVydyB9H0Qg4cSrdW
	jZFMKS3MOr0HpXBJh2ONmGv541gvUJhN96+XIogrY2/jZo2U9RafJl1HrrsIWq/OMnydp/guur8mO
	JPtI2sJQWN6F+ErDpuUfdlVS7AxGBUjxytvo+AValEqxvLwHPNEiFuT/4LbtrZmgRkxpwmkbKdtOB
	OvRARvTVZyOyLKLu7UecSwgqByGBofQ9EC4wm4fboaNZRErEtk2tPuOOuueAGXutIS0Age2upax3g
	vCZs9Ff2EZfqtUrfPSm7zWdimAAvcLuk3kDzSBU9Gk2evGTQKIwx5DG9mKJdayyUycgOJQl3cDKLp
	epGfrwGg==;
Received: from ip6-localhost ([::1]:56820 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1p8jqe-00B1ze-Pj; Fri, 23 Dec 2022 15:20:36 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:38630) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1p8jqW-00B1zU-9t
 for samba-technical@lists.samba.org; Fri, 23 Dec 2022 15:20:33 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 n10-20020a17090a73ca00b00225cbc4dfaeso786956pjk.3
 for <samba-technical@lists.samba.org>; Fri, 23 Dec 2022 07:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Xlc4s/Oazd3dXw5E0EQn91yhiuHoMU4+W/QK3hjtZG0=;
 b=QnxQHDRMawq4YhtVqoycNxtmtwdaSqtWddxo3vplRB3A4OqztPXuV8elSXRfnLtpjF
 VfZchDuWEPhGzY0beHFFAmgvUOt8pio5tZl4Nfen84NPcf6G3SqDP2V7Fd6vLjTTd0Jp
 Swrcua90MknwmSbDAjCiNSsYt7Oh90vP4mwCKFhaFxsSTSICUs3Ahs7uv2k679TMyIRa
 08ZrpdT1hFS5H1pRf2FwxyJaVrI/iK5BM30hSdnLXkgoYnVsFZw9Zj2zQRMBtUsLeOPq
 FONQgkkzeni0MNvjB17XmItsXFGQQYnCzwkLOOCWyLA/nrsoxUmxJLCDOg3LipD+lNMf
 2Tig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xlc4s/Oazd3dXw5E0EQn91yhiuHoMU4+W/QK3hjtZG0=;
 b=CfWv5UBQgRv/2pncYFb+Uima7aRk231rGfLZ9x+HoeJ2nVtCjF2O6EQd1BJlkj75ve
 ho4grbccZ6uCBG5ah4HCCWbLxDLfFgAiMPTwogDJa6tevdiC+Lor7s/DjkdA7CQAa885
 5x2HQeLsBVwTeWyDCIPwqEK5jXBrwFWju5AmEvcKvyLptLCv4pMjoueKzK927pMlE6ME
 vMbfcd6iTmAWU/TNhsS4IMkMNJSTnxYHno66nqQEadg9WIMsHJzTDCwF4PrhJSCi4WGa
 oEbUDhExAVqTVX6yFOCzfngWmOibgcg7A6cqkwISNbYy4ISmuuKrVYwMlopKymiCvuJL
 UNOg==
X-Gm-Message-State: AFqh2kq2Q+EwLBIiKKeOiLy+d/L2+Rf5JL5w9en+x9foMh5UNSPMxod3
 Wk6SKuRUgqqDhuzZ4LRQX4WHvaefIXIBkQxjbIBcjA==
X-Google-Smtp-Source: AMrXdXsVeHoqAyZfKI+wzRwst7fTU7r9vIGt4htgnmvPOj1TDs4mg8RWU9nawP1nfed8/Bbtt+hMQzkX8VQz6buJvbg=
X-Received: by 2002:a17:90a:be0c:b0:219:ef02:a5eb with SMTP id
 a12-20020a17090abe0c00b00219ef02a5ebmr975513pjs.84.1671808817375; Fri, 23 Dec
 2022 07:20:17 -0800 (PST)
MIME-Version: 1.0
References: <D3FFCE09-CD20-485D-9925-6EB995A8B6E5@karpukhin.com>
 <CAB5c7xqJ1DaJhCTVQn8H1RWGW_xi8kp=vZhciTAEVkHKyk1MJA@mail.gmail.com>
 <4452622.LvFx2qVVIh@magrathea>
In-Reply-To: <4452622.LvFx2qVVIh@magrathea>
Date: Fri, 23 Dec 2022 10:20:06 -0500
Message-ID: <CAB5c7xpsB2E_QrrpLFKsf3wmL91FWrJGeewwkM=VFjVYFanAeA@mail.gmail.com>
Subject: Re: "access based share enum" is broken since 4.16.0
To: Andreas Schneider <asn@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: Vyacheslav Karpukhin <vyacheslav@karpukhin.com>,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Dec 23, 2022 at 10:12 AM Andreas Schneider <asn@samba.org> wrote:

> On Monday, 19 December 2022 05:38:33 CET Andrew Walker via samba-technical
> wrote:
> > On Sun, Dec 18, 2022 at 10:40 PM Vyacheslav Karpukhin via
> samba-technical <
> >
> > samba-technical@lists.samba.org> wrote:
> > > Hi,
> > >
> > > It looks like the access-based share listing is broken in the recent
> > > versions: "smbclient -L" shows no shares if this option is used.
> Bisecting
> > > points at a7c65958a15149918415b7456d6f20ee8c9669d2. I rolled back to
> 4.15
> > > for now.
> > >
> > > Regards,
> > > Vyacheslav
> >
> > FWIW, I have MR with fix here:
> >
> https://gitlab.com/samba-team/devel/samba/-/commits/anodos325-fix-access-bas
> > ed-share-enum
>
> Hi Andrew,
>
> I'm sorry, but I don't see a MR with this fix. Also we need a bug for it
> and
> backport it to 4.17 and 4.16.
>
>
> Best regards
>
>
>         Andreas
>
>
> --
> Andreas Schneider                      asn@samba.org
> Samba Team                             www.samba.org
> GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
>
>
Fix has already been merged:
https://bugzilla.samba.org/show_bug.cgi?id=15265
