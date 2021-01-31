Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E377309F39
	for <lists+samba-technical@lfdr.de>; Sun, 31 Jan 2021 23:29:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=9+gBl09TWOX1lR25lFtvCv4DRrfNQbsribgJAoYyOxY=; b=DkCRzAQ64DyC/Yx/k7aY6IJO4R
	F1eSDNVCyuGHGHaB/VeD/RsgmH6UB4Cb6Ow3UnRPOOBWe0MuQEpHwHlHsWH02ZFpQpSaaOEIUFT56
	Bb2PPbQIsf9Qb3zsitvIgSSC9d2Crw5kYYMOAxy5G7JA8itme1ZkAaHglrUUyXrOs+OSj+G7NxHNZ
	vLc+mhKqxAzgtQc9LIm+nl7JtI9AtqJvfO0V1WpXBg7LA299HpnYO05stKtAggrWyWN2HInZXmB+h
	Yq88XB83IFeA9oaBJmpOPPZ7VQRqXo95/4s2xRrCovdTa5fitXG2e2k4lFjyAjJVBzLsYdjHV+KOp
	YG3rzgvw==;
Received: from ip6-localhost ([::1]:59818 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l6LCd-008AV2-FQ; Sun, 31 Jan 2021 22:28:19 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:46465) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l6LCW-008AUv-6F
 for samba-technical@lists.samba.org; Sun, 31 Jan 2021 22:28:14 +0000
Received: by mail-lf1-x136.google.com with SMTP id e15so16269lft.13
 for <samba-technical@lists.samba.org>; Sun, 31 Jan 2021 14:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9+gBl09TWOX1lR25lFtvCv4DRrfNQbsribgJAoYyOxY=;
 b=VSyDPOP+5RmFeAIcpbQVZF1A4zAWoyP42Ojxix5L68KFXI/Bj/srcPYLZGGTd+9kH1
 xMVBj4+JOudiaqwSv4DtoQ0mDV4Eto/zfeXQhCdY/WamrsYkzbCjegDVZxQ0wfVFMJgK
 tHcu/1bWtTJ6M5fJTNOxP1AzkSNQjkU1v5RsFZxmpBtkJZC98UpUWLI+uEO6woFU3EWn
 8cflfGGC/UY9AGmsnz6rd/Dl5Vy78QITRuhH1MqQ5Vl8877F7dldkQKlvKPrj6qy0PBk
 vTxMBNqlmHEd9Rf0EWUJ1OqRmRs2rYYoN4qKaOL6Gr5xqLzWred0X5fmnV+OXQ8eaJOV
 F6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9+gBl09TWOX1lR25lFtvCv4DRrfNQbsribgJAoYyOxY=;
 b=MLdmCKOelF6LEyTc3oaXqW9bZJILJyHVWX74Z7E/qDw3dpia5HGDApcOOnuqTMmJNO
 bDbQYFpEFcAQqixMTbBaSCWxdxaZy8UTXuHGXev5jUYYEsC4C42rCm4uqVY7R23Kaijn
 sqmlWIaqpzX23iqPnQ5iBHX3smMKlzgMwuvMECBwc94xpZ8zIw5CtKZ4ravixgJ/e9m7
 ZHMWFeNtcri8huJeqEdSGggHxdNqHDCBUgdnSm9TXQbE27ILULwgHaZoJqpX9I5GuQAB
 2ctfGwwTjfX3Qv80S0DRYlK3LU1MkdvRFDpExSLfhSVUxjrnZr31/X7p6Q39XGZuXKon
 QkIA==
X-Gm-Message-State: AOAM533UFOVuBdLlK/5FLJMSuoy4D8EAcJn1ZbcpLUdOMUyggdrjG6Aw
 00FVKs51tWmZcEGv6/YU85RPjyu8pt71ZxTZXg4=
X-Google-Smtp-Source: ABdhPJxyafNPKuaxO26KbyodAHdHYBIwzdTHfcqZGFuBs8L6hTZBCNSyBbeLlUNIZkqgrso7fL7x0T+EbjX1NF6vyEU=
X-Received: by 2002:a05:6512:31c1:: with SMTP id
 j1mr7402493lfe.313.1612132089767; 
 Sun, 31 Jan 2021 14:28:09 -0800 (PST)
MIME-Version: 1.0
References: <CGME20210126023109epcas1p257c4128a9d8673cb44f81dca636da39a@epcas1p2.samsung.com>
 <20210126022335.27311-1-namjae.jeon@samsung.com>
 <09887b1a-3303-9ac6-1d29-c53951be5324@samba.org>
 <CAKYAXd-rfk26A4SOeqvhMkBV2FcvpE0goj415HX7T4fBim1zQA@mail.gmail.com>
In-Reply-To: <CAKYAXd-rfk26A4SOeqvhMkBV2FcvpE0goj415HX7T4fBim1zQA@mail.gmail.com>
Date: Sun, 31 Jan 2021 16:27:58 -0600
Message-ID: <CAH2r5mutwPP570YbwxDWikwM6e+gdD7m2iwMJ5xNEcvqpkVrNg@mail.gmail.com>
Subject: Re: [Linux-cifsd-devel] [PATCH] cifsd: make xattr format of ksmbd
 compatible with samba's one
To: Namjae Jeon <linkinjeon@kernel.org>
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
Cc: Stefan Metzmacher <metze@samba.org>, Namjae Jeon <namjae.jeon@samsung.com>,
 Samba Technical <samba-technical@lists.samba.org>,
 linux-cifsd-devel@lists.sourceforge.net
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

FYI - I have rebased the cifsd-for-next branch onto 5.11-rc6

https://github.com/smfrench/smb3-kernel.git

On Tue, Jan 26, 2021 at 4:46 PM Namjae Jeon via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> 2021-01-26 23:36 GMT+09:00, Stefan Metzmacher via samba-technical
> <samba-technical@lists.samba.org>:
> > Hi Namjae,
> Hi Metze,
> >
> >> Samba team request that ksmbd should make xattr format of ksmbd
> >> compatible
> >> with samba's one. When user replace samba with ksmbd or replace ksmbd
> >> with samba, The written attribute and ACLs of xattr in file should be
> >> used
> >> on both server. This patch work the following ones.
> >>  1. make xattr prefix compaible.
> >>     - rename creation.time and file.attribute to DOSATTRIB.
> >>     - rename stream. to DosStream.
> >>     - rename sd. to NTACL.
> >>  2. use same dos attribute and ntacl structure compaible with samba.
> >>  3. create read/write encoding of ndr functions in ndr.c to store ndr
> >>     encoded metadata to xattr.
> >
> > Thanks a lot!
> >
> > Do you also have this a git commit in some repository?
> Yes, You can check github.com/cifsd-team/cifsd
> tree(https://github.com/cifsd-team/cifsd/commit/0dc106786d40457e276f50412ecc67f11422dd1e).
> And there is a cifsd-for-next branch in
> github.com/smfrench/smb3-kernel for upstream.
> I have made a patch for that git tree, but I haven't fully tested it yet...
> I'm planning to send a pull request to Steve this week after doing it.
> >
> > I played with ksmbd a bit in the last days.
> Cool.
> >
> > I can also test this commit and check if the resulting
> > data is compatible with samba.
> Great!  Let me know your opinion if there is something wrong:)
> Thank you so much for your help!
> >
> > metze
> >
> >
>


-- 
Thanks,

Steve

