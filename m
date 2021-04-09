Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2B73593B9
	for <lists+samba-technical@lfdr.de>; Fri,  9 Apr 2021 06:23:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=bX3oaJ8LOdDLHPl6Ky49TEfmBDk/aP5kfaNiD1lV2Bs=; b=4HAhUVXJ+/QZxHg2HLGEGNa7mu
	jul5ZmeMt0HTVtfeksLKBcQgxcsYRefU/xyUGTyT1FCjZyAiMu5Mll/1C8UZjHAsbItWB2JP8gykz
	60QDSfLNAdAlLDoUiX0nzlJVoFhZmfLYDtYvA8CdsjFmIHgO2vc7V+LciHyb4vSgOHDAsHDrvBuPU
	dvjfUVhTyew9fd6dhp7nokBUleAKc0nBA40mEWBIoRO4eQMh766kdt91AX9RfC3t8xbU2U5SYDL8x
	HKs7DynAqBvfDxOK017zHxdEfmLy8gkOKU288bZj5IsT62lzBke3H1uIkUzdTcYLSP4tJxAryHJ9J
	KBSKiHBQ==;
Received: from ip6-localhost ([::1]:50598 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lUig0-00Abkx-Qf; Fri, 09 Apr 2021 04:23:24 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:45920) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lUifv-00Abkq-Re
 for samba-technical@lists.samba.org; Fri, 09 Apr 2021 04:23:21 +0000
Received: by mail-lf1-x12c.google.com with SMTP id g8so7536139lfv.12
 for <samba-technical@lists.samba.org>; Thu, 08 Apr 2021 21:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bX3oaJ8LOdDLHPl6Ky49TEfmBDk/aP5kfaNiD1lV2Bs=;
 b=e2uOKIHVS4Io8+rzZfRjbyH4lqsjSTjcIj0ltd00TmX/Y08bCY3klGQ51GceAyOp70
 FItNxZTUVejbaztCS3LLd7g3QBaTD3mTZdvmCvtWtMruYkiUr9pe4eC4w2z8PGkMfJfh
 d8AaiZnksq/aWJwB8qL5YCSYuWdQeGP6Ydufr570uY/MxFF1wywfkfTB+7KXbPeqbtSo
 DFZL/e6VH8AkcYIU5vwO+Edq7HSjTzj/qCsGIzoSJqKY0aGxi0Dm/XLhbKmzF+/Kgiod
 3HopKWzVbsNdOSkCTDek78Tg8rgPqgwK4AqOR+ROtyNYbQjUchPE62+F6ye4pVg1+wgs
 w3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bX3oaJ8LOdDLHPl6Ky49TEfmBDk/aP5kfaNiD1lV2Bs=;
 b=swPr0zvRKOOjEYvQ/+AokdE0u0yRuyr+uBn8yFGjV6GJ7ivWa3BvDu3w6FwOjNJKty
 bTmyw3kWdqeXgHkQLDtGzuZzC+pmo1gYVHlndAX05b29eUEMNYRjlsEMGFy2Jz7ksR8p
 przXCK6wfMHX32DfS5xFr1IsNogteUJDQZvA0xb+iDh56fmAnJym3m02wByKrPfw7F4p
 yMx161h9pca1S8gpv5XjmP8tq9ZWKo7SXS3aI/rVJzTVA5dnd3RtKTQG5oiFn65SlBYM
 1/n4WUwqnnF+WEBzMEogjBUJKRNPu7Mkva76QzzFOOEXaVwKHmvR03QtH2x9NUXpO6bs
 niCw==
X-Gm-Message-State: AOAM531nJNHmvc+6Sa9bDmuN+HQRtsMRxlgcLTkITgbU07u06IdlsN76
 emAf8AvTplvnVtzi49dc66MJD+ahWYJtAidYMmcnq4Ow4n0=
X-Google-Smtp-Source: ABdhPJzERF9ruKl1jj/2gVjN0YXKkA1XPOF7uGD4teqtgIyApxGL2BzysvXQzVtdMvRcI98GidIgJPfjUL+DmVBaKDM=
X-Received: by 2002:a05:6512:1322:: with SMTP id
 x34mr8827582lfu.133.1617942197748; 
 Thu, 08 Apr 2021 21:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210326011117.GA46303@embeddedor> <877dltrjue.fsf@suse.com>
 <4def044f-4529-9e73-6d01-1a9751f6b09a@embeddedor.com>
In-Reply-To: <4def044f-4529-9e73-6d01-1a9751f6b09a@embeddedor.com>
Date: Thu, 8 Apr 2021 23:23:06 -0500
Message-ID: <CAH2r5muf-y5XDyickz9mEw7kTVSjKvK+4AspSPsySbY9ucix8w@mail.gmail.com>
Subject: Re: [PATCH][next] cifs: cifspdu.h: Replace one-element array with
 flexible-array member
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 linux-hardening@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Fri, Mar 26, 2021 at 12:02 PM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
>
>
> On 3/26/21 10:54, Aur=C3=A9lien Aptel wrote:
> > "Gustavo A. R. Silva" <gustavoars@kernel.org> writes:
> >> There is a regular need in the kernel to provide a way to declare havi=
ng
> >> a dynamically sized set of trailing elements in a structure. Kernel co=
de
> >> should always use =E2=80=9Cflexible array members=E2=80=9D[1] for thes=
e cases. The older
> >> style of one-element or zero-length arrays should no longer be used[2]=
.
> >
> > I've checked the usages of the struct, looks OK (we don't allocate it
> > directly, we use memory from the small/big buff pools).
>
> Awesome. :)
>
> > Reviewed-by: Aurelien Aptel <aaptel@suse.com>
>
> Thank you, Aurelien.
> --
> Gustavo



--=20
Thanks,

Steve

