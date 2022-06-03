Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BA92153C19A
	for <lists+samba-technical@lfdr.de>; Fri,  3 Jun 2022 03:27:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=p9iH7wtgv1cNM9gumnTLowj/6zQXhnsv8M3PwDG3cJY=; b=G+h1qoaSgb9k/uwE2sisAnap89
	7V6F4DqnSBkGtwZJgYeqMwHwmaYHaO2a6rxV/BjAhfZ/jy/Bnt983eL5AnGY7MnxdTwIsie9AKdqi
	aE4V16GzxTxZ+gARUP/WcA3MTJ2Lie++bOo6zpbJ6sP+v/BCF0vLt9Ip7h+9sA2AAg/Xk4Ba7hJUm
	lTBCJyDD5O0e+kBW1T4KUtgg0wF5Rir2qKL1k79Q4iaZ+wKK+PRByl/88/5dBHpymXZ4HLZ6KnI3P
	xoDjZyPJa1aRrDuoJapXmWsRox6IQN9cLEMQOoG22VlQXaumELcPEbsmLYBTsIs+1ZG3Qmcjjdv3t
	/wtowJUQ==;
Received: from ip6-localhost ([::1]:29370 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nww5c-006kId-NJ; Fri, 03 Jun 2022 01:27:00 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e]:39619) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nww5Y-006kIU-Or
 for samba-technical@lists.samba.org; Fri, 03 Jun 2022 01:26:58 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id j11so2880111vka.6
 for <samba-technical@lists.samba.org>; Thu, 02 Jun 2022 18:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=p9iH7wtgv1cNM9gumnTLowj/6zQXhnsv8M3PwDG3cJY=;
 b=qHY+Yxzyh8ydpQxFq0i41yjrhRAlynBi9u8u8/f6r2VcWnr10fpISivudoKCxIMlVN
 iEM5/O0nTQ4yUMQAIbzATEmvToPxFAPkI8L828b48JIe+j6GYPB/wopUC5L+wM9TTSIY
 LdAKwVXcYOlxv7zy16DAEbV2C8IfIcJEvXnqwQoeYdsoB2797sP8y0YTwD890CK7LkYd
 J2KDWo9xdcgih5NcoSLw/y15xV8iXdILDo5QDkBYaJTz9rG+k4FaC/V3Pyo8U6oBF1Gg
 UU3d7llox2fx5pC/ns2UqwrFlZUfeBWeMSFRt4ydF/1IJ42nUxxbYN6uMPrTV0a/jYlS
 Nudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=p9iH7wtgv1cNM9gumnTLowj/6zQXhnsv8M3PwDG3cJY=;
 b=jdKfsS0A/nLpzOwjFhJ0x7/6c5dl/G9LkeeKhlguzzRC/vJjtv/gdYqjB3rIj295bk
 n1L1bnMGSL3frzmPPkI2QqQtSmP5tLZ4azGST1eQ3/FYX2pmjRYy/hzhYtfQR+7bxp+y
 /gYw4g9o7UHlu1yD+PI6UHiA/aSrgBUdWQAT2fteAjASQvvMoHdzC661gMRGlGfyG7cJ
 o57JutGmp2hF2JohDnOL9NpAuxmrjeVJIIqr3YNU2XKgMZplyOb+AiOdxKbNBcdGfSKn
 Ascp+sD0C5ePURwMdGgrVbBpQjt3T6SuRyIMRRE12nG5S6WE9u6GzB2XGA/7iUJBwQF7
 aJdg==
X-Gm-Message-State: AOAM530gxxkWI4ZPKUMtmeSoVbgYyNnFoGIecKmISkyPcAo4fSiXRYP0
 eZCV9a7SIpVEUyMnhN4aUZvwVtVdz5iQ3DKV/qU=
X-Google-Smtp-Source: ABdhPJxvCA+4kbYP9m3nFJ5c8ckOQvbaUvrvRWDuebExGjxWaikRwtdlCblQ5ZkyNCI+ocYuHf7SwLnVK+6S6m/285A=
X-Received: by 2002:a05:6122:2027:b0:35a:19c8:3ec7 with SMTP id
 l39-20020a056122202700b0035a19c83ec7mr14679376vkd.4.1654219614778; Thu, 02
 Jun 2022 18:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mtUe2f0xi5zu0Np0bkyv7K9BKKgUkUJp2b25BteHBFjeg@mail.gmail.com>
 <CAH2r5mufZdKWrUGbp0Pha5C6YrYqUR-=vT2Pw8TixtzVaQuk0Q@mail.gmail.com>
 <359a28c9-1d6e-6908-6502-ffb29bcadca4@talpey.com>
 <CAH2r5musMTR_jEJ40mQAmzZs6wypVce3vjp_0EMgB9QNHJdL8g@mail.gmail.com>
In-Reply-To: <CAH2r5musMTR_jEJ40mQAmzZs6wypVce3vjp_0EMgB9QNHJdL8g@mail.gmail.com>
Date: Thu, 2 Jun 2022 20:26:43 -0500
Message-ID: <CAH2r5mtMqsqq+wGf5oE3ZGE5JwZ+Ln2eENF2GxuG9MSDW5qRjw@mail.gmail.com>
Subject: Fwd: [PATCH][CIFS] Do not build smb1ops.c if legacy support is
 disabled
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

---------- Forwarded message ---------
From: Steve French <smfrench@gmail.com>
Date: Thu, Jun 2, 2022 at 8:23 PM
Subject: Re: [PATCH][CIFS] Do not build smb1ops.c if legacy support is disabled
To: Tom Talpey <tom@talpey.com>
Cc: CIFS <linux-cifs@vger.kernel.org>, samba-technical
<samba-technical@lists.samba.org>


I was thinking about staging smb1 removal gradually over about a year
and a half (assuming that Samba has the SMB3.1.1 POSIX Extensions
merged in from jra's tree by then so no excuses functionally to
removing smb1)
- marking the CONFIG_CIFS_ALLOW_INSECURE_LEGACY as recommended 'N'
starting in next release 5.20 and move some additional SMB1 code into
the #ifdef
- in 5.21 pulling some of those smb1 specific pieces into a new helper
module (perhaps smb1.ko??)
- in 5.20 or 5.21 renaming fs/cifs directory to fs'smbfs_client (or
something similar)
- evaluate whether we can change the default module name to smb3.ko
from cifs.ko (we already have a module alias for cifs.ko of "smb3" and
have for years been able to "mount -t smb3" with cifs.ko)
- in 5.21 note that insecure legacy support is scheduled for removal
(perhaps a year later), and if anyone mounts with "vers=1.0" (or
vers=2.0) print a warning that it is scheduled for removal in a year.

Thoughts?


On Thu, Jun 2, 2022, 11:39 Tom Talpey <tom@talpey.com> wrote:
>
> LGTM, but I had some additional suggestions that I found when
> researching how to yank the entire SMB1 code into a module.
> Which actually looks quite possible, but for another day.
>
> This patch doesn't actually stop building smb1ops.c and cifssmb.c
> however. Don't you want to deselect them in the kconfig?
>
> Feel free to add my
> Reviewed-by: Tom Talpey <tom@talpey.com>
>
>
> On 6/1/2022 11:45 PM, Steve French wrote:
> > Another minor one to remove some unneeded SMB20 code when legacy is disabled
> >
> >
> > On Wed, Jun 1, 2022 at 9:39 PM Steve French <smfrench@gmail.com> wrote:
> >>
> >> We should not be including unused SMB1/CIFS functions when legacy
> >> support is disabled (CONFIG_CIFS_ALLOW_INSECURE_LEGACY turned
> >> off), but especially obvious is not needing to build smb1ops.c
> >> at all when legacy support is disabled. Over time we can move
> >> more SMB1/CIFS and SMB2.0 legacy functions into ifdefs but this
> >> is a good start (and shrinks the module size a few percent).
> >>
> >> --
> >> Thanks,
> >>
> >> Steve
> >
> >
> >



-- 
Thanks,

Steve

