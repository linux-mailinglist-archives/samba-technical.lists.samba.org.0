Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B381453C199
	for <lists+samba-technical@lfdr.de>; Fri,  3 Jun 2022 03:25:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=d13G7wE4OSCDmDyeXeZZfhnFYmb3QzfthorE031251s=; b=X8WQJWPfdss1qiOhUm/Pc3z/1L
	o/IHb89fO2oC/r7h7pldJ9eboV63866Xdy/3hcjExBP302dXQzZSZpx6TC6jICX2W0lHud6zU6aQc
	l6A1vr6JlPkDyXD6C4vgX/rQg1vVBz10i0dR3aNn3KlvW/++ZmliLVp6+ByPbl/tFiU/I1IZ9fNEC
	fgCqVqGis2XPih2F8l0Rn2KSFnOfQvRr2AqHSmG+TURXQbxX9z6ilh2hCWv0JblqOz0HI5ByCeQx4
	vPMB3fXv2/ML3/d11HYFAsLrEwp7TPsrQJw8xgGNh7V+Vcm45wxRqVRp9hyuBb17uS/AEyRHmo2yO
	w/LuyB5A==;
Received: from ip6-localhost ([::1]:28710 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nww2r-006k0C-6d; Fri, 03 Jun 2022 01:24:09 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931]:33424) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nww2k-006k03-JG
 for samba-technical@lists.samba.org; Fri, 03 Jun 2022 01:24:07 +0000
Received: by mail-ua1-x931.google.com with SMTP id k13so2129018uad.0
 for <samba-technical@lists.samba.org>; Thu, 02 Jun 2022 18:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SNhnxDFh3mJHP1HT1U9ZtntkZRfn7vmZXhDXPgu5/Kg=;
 b=okYwMuia+BoPwNtjUuzJp+DMt8K/vb/XVQ00MQ+BJPt1v+Vis5Ildz4gCgQVJxQYEY
 e6lpn/s6ACTULkAIHtLvivT+XkyLunbdB5aiWkOfK0XdXYDkeEizQzfMp0LNsyoBRoVD
 y1m9ofnKjgJWMxDM0YFgpyjrNpMmbANH7X+fmUQoDDRpStlX36E74SCWhajSTbqw+2AF
 vRH40yMQ92wp8LN1ufXmgi5p7dFKBRf0BC2tE0rEBS5+hdeCOrE3OSRYYBxkFYBJdxAf
 9RHQi/Pv8QpjqIWr8gTRh4SSoijFpWjVTMX5tzbW3/hZIT9YeW1aiUP15dOczuzaA93o
 ORgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SNhnxDFh3mJHP1HT1U9ZtntkZRfn7vmZXhDXPgu5/Kg=;
 b=HCEOjy1pYlpJPlWUgdHMiNA60ssT9QBG9g651S3B4TBIRZyOjvgCfT83d98DwlARle
 OZL3a4MLFoyjMM/Pi3E9qeb2IoYg2Ruj5u3k0ZJ2S2FatR8eK6IeXwZvx5KAn7WlFBxb
 EwJ7YIzVQmiBSw35nU9mlUeQ1n7jRwrFEnL+X41McDmQ6e9gUIcncUNnHEwhFbrDw1Jc
 KBj737BwqwDwFm7EhB/hgIXT1YAf04o/Old1l1QXeW3D8ZKbGd2H7iSGBMzE02bymZq/
 i9qe7Uc8Ij7C0M4xJdQdWPr01jzi3yK5I82d63sLU9ymMcW2ZikECCMBeD2F2N4kEFQe
 Piyw==
X-Gm-Message-State: AOAM530X2x5iwITUmzBLMsACOwbTTdeyQKcevKzYJ9uZv1890DZwxUA5
 AK/mJvBBqJhu/qXmDhWeTVbIKHAM8Ae36fa6ej8=
X-Google-Smtp-Source: ABdhPJyz/0AwDSfTHgNsbeOE9yvkT01zfv4bPSgYsul2Uouv3r2m/Nf0PsS/TW5QQd6p3+WdnCzd5sAFXNFwg44gAmw=
X-Received: by 2002:a9f:354f:0:b0:368:c2c0:f2b5 with SMTP id
 o73-20020a9f354f000000b00368c2c0f2b5mr26621703uao.96.1654219432496; Thu, 02
 Jun 2022 18:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mtUe2f0xi5zu0Np0bkyv7K9BKKgUkUJp2b25BteHBFjeg@mail.gmail.com>
 <CAH2r5mufZdKWrUGbp0Pha5C6YrYqUR-=vT2Pw8TixtzVaQuk0Q@mail.gmail.com>
 <359a28c9-1d6e-6908-6502-ffb29bcadca4@talpey.com>
In-Reply-To: <359a28c9-1d6e-6908-6502-ffb29bcadca4@talpey.com>
Date: Thu, 2 Jun 2022 20:23:41 -0500
Message-ID: <CAH2r5musMTR_jEJ40mQAmzZs6wypVce3vjp_0EMgB9QNHJdL8g@mail.gmail.com>
Subject: Re: [PATCH][CIFS] Do not build smb1ops.c if legacy support is disabled
To: Tom Talpey <tom@talpey.com>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I was thinking about staging smb1 removal gradually over about a year and a
half (assuming that Samba has the SMB3.1.1 POSIX Extensions merged in from
jra's tree by then so no excuses functionally to removing smb1)
- marking the CONFIG_CIFS_ALLOW_INSECURE_LEGACY as recommended 'N' starting
in next release 5.20 and move some additional SMB1 code into the #ifdef
- in 5.21 pulling some of those smb1 specific pieces into a new helper
module (perhaps smb1.ko??)
- in 5.20 or 5.21 renaming fs/cifs directory to fs'smbfs_client (or
something similar)
- evaluate whether we can change the default module name to smb3.ko from
cifs.ko (we already have a module alias for cifs.ko of "smb3" and have for
years been able to "mount -t smb3" with cifs.ko)
- in 5.21 note that insecure legacy support is scheduled for removal
(perhaps a year later), and if anyone mounts with "vers=1.0" (or vers=2.0)
print a warning that it is scheduled for removal in a year.

Thoughts?


On Thu, Jun 2, 2022, 11:39 Tom Talpey <tom@talpey.com> wrote:

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
> > Another minor one to remove some unneeded SMB20 code when legacy is
> disabled
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
>
