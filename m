Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D25C270C454
	for <lists+samba-technical@lfdr.de>; Mon, 22 May 2023 19:34:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Slu3gux4GuUHwh68X0h4hh6LgeEzWMQzZomXLQPnCh0=; b=wjw/iItTUJVyHuHIcOAet7JYIv
	Mk6+1hnGt/D2VKlbM9YVVbEY6fs2eSzn/XNQxlaAWzd/CcD6BMRvRCi0vIsq/gdAaY4UsepqgrKja
	L59oGxl7MZSmkowxyLsWtsnSz6uuWcxBoDii6+ZAN+hwkG852C96kLKLhQq5P9Y6ao6dbt085pJ4z
	gZKroFZbQSlPXtQDi30XWXl4Z8dRBifR7bnttQb53x4k4epY2k+fdtIYjtXJ9Gr2dXnXNJyQ1TO4s
	1i+f6lEdGvSvxr8w1+cTM4iG+QU9QrVAjYpFXVNqFN45zwkvjXKjI3GiPBiey1HZCW800oA6ET323
	dNzo454g==;
Received: from ip6-localhost ([::1]:50802 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q19Pu-00BP1I-KB; Mon, 22 May 2023 17:33:54 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:44542) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q19Pq-00BP0v-GH
 for samba-technical@lists.samba.org; Mon, 22 May 2023 17:33:52 +0000
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-96f7377c86aso677144466b.1
 for <samba-technical@lists.samba.org>; Mon, 22 May 2023 10:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1684776829; x=1687368829;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Slu3gux4GuUHwh68X0h4hh6LgeEzWMQzZomXLQPnCh0=;
 b=Ljg4LOy0fHrVHwQrC6CFPRl2RBlB71H4nfxmtrAN37UAHfFvzivakgEuSCbqDA1N+4
 i9+SneFGnaWeVgwnYb9dbnOzwq8hgg370KB87G8X/9Pg+cm8yutJsa3CPJ4QGUp1mYpD
 A3AKz+Vz4rkoke6nYDDwagdl3BNnF6xBH56y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684776829; x=1687368829;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Slu3gux4GuUHwh68X0h4hh6LgeEzWMQzZomXLQPnCh0=;
 b=d1INAeyYULhePPFzyspw4iwkNdd17wuhPfkW6IDHB7sxb3GL2K0sJ/8It4Voz0APFf
 8ghD46lOBWRHvSmEhKKsGmrBUCLYN5fqUFXPqbiICRPbTGcCPwjnm7Jc3ceiEajt8jWZ
 3xDHlvBRQpKoPfmg3JGGPUTSPatdExo4LLNMIEikSwg/FhrHW9Uof7lJyiHtTpkEjCsp
 7hhkZ1EYA8FLnRoDSEs+jV6B9nIEOdPvoPp/m5SIbORgU/86K2RTEW6dZLgByyR+NAGL
 Povhhue62lfX5jccqzFauDMx7//axHw3hfL5383uBx6VuNV3Pcy9dOdd2Lq5jG/vmR/3
 lDcA==
X-Gm-Message-State: AC+VfDxC/wkHFIEoN+sr/kLAS01KFRM0umChT1Fs93V/SWiYizvKKSm6
 8akc6eMNfv/+RIFS8sS9vJ8+LyMd8zgz7fCdezBNbQ==
X-Google-Smtp-Source: ACHHUZ5r+sUohlax6Uk8VJYNJH5xVdqGHB9mwTQSK6OMQLEuHjQXKjTSbqjZ2mSWIqVLdPVjl+NDlA==
X-Received: by 2002:a17:907:9807:b0:96f:e317:aeb7 with SMTP id
 ji7-20020a170907980700b0096fe317aeb7mr4215422ejc.54.1684776829308; 
 Mon, 22 May 2023 10:33:49 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com.
 [209.85.218.42]) by smtp.gmail.com with ESMTPSA id
 gt24-20020a170906f21800b0096f6a910ab7sm3329420ejb.190.2023.05.22.10.33.48
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 10:33:48 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-96f0678de80so1184035966b.3
 for <samba-technical@lists.samba.org>; Mon, 22 May 2023 10:33:48 -0700 (PDT)
X-Received: by 2002:a17:907:2d23:b0:96a:928c:d382 with SMTP id
 gs35-20020a1709072d2300b0096a928cd382mr11676946ejc.48.1684776828268; Mon, 22
 May 2023 10:33:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5msVBGuRbv2tEuZWLR6_pSNNaoeihx=CjvgZ7NxwCNqZvA@mail.gmail.com>
In-Reply-To: <CAH2r5msVBGuRbv2tEuZWLR6_pSNNaoeihx=CjvgZ7NxwCNqZvA@mail.gmail.com>
Date: Mon, 22 May 2023 10:33:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjuNDG-nu6eAv1vwPuZp=6FtRpK_izmH7aBkc4Cic-uGQ@mail.gmail.com>
Message-ID: <CAHk-=wjuNDG-nu6eAv1vwPuZp=6FtRpK_izmH7aBkc4Cic-uGQ@mail.gmail.com>
Subject: Re: patches to move ksmbd and cifs under new subdirectory
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
From: Linus Torvalds via samba-technical <samba-technical@lists.samba.org>
Reply-To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Namjae Jeon <linkinjeon@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, May 22, 2023 at 9:33=E2=80=AFAM Steve French <smfrench@gmail.com> w=
rote:
>
> Following up on the email thread suggestion to move fs/ksmbd and
> fs/cifs and fs/smbfs_common all under a common directory fs/smb, here
> is an updated patchset for that (added one small patch).

Looks fine to me.

I wouldn't have noticed the typo that Tom Talpey mentioned (misspelled
"common" in the commit message of the first patch), and that
SMB_CLIENT config variable is odd.

I'm actually surprised that Kconfig didn't complain about the

        select SMB_CLIENT

when there is no actual declaration of that Kconfig variable, just a random=
 use.

That thing seems confusing and confused, and isn't related to the
renaming, so please drop the new random SMB_CLIENT config variable. If
you want to introduce a new Kconfig variable later for some reason,
that's fine, but please don't mix those kinds of changes up with pure
renames..

                Linus

