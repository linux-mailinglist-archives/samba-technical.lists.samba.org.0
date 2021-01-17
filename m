Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C292F95B2
	for <lists+samba-technical@lfdr.de>; Sun, 17 Jan 2021 23:00:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Z4HhEek/Tw4oVixmxh9pmK2rVtkzaVm9nEVNhWaLiyw=; b=QuzvcBThitx0SU6dUyDcUXSsMx
	ArPdgyoH6hneE9SBm9hnDvdfocf+6mZROM9aCeGlwfZM2Phfp+/z1Ad4seDuSHfZBBl5wYdIqUsUf
	CvZ3a/7kxHEEVfBmfn2KO7qzQNqoQeNqDhbi9OZecYx9dQqUu8NAP8t6OrjMeG9Wto64QXr44XJ2f
	BaRgBWaYbDevoSk4p9/IaldEksQbfySFkXVlKGgNoVSmkMIwPKpYMp+bpawgrhUvp0smzlnLU+5DC
	H7ZlB9cB+ye2Ns9IPHoUTd0dsINO3d7uqdOTDaD9F802gaW1C4iB0CQWMObw6rezcXO55W3pqJp+m
	65L29asQ==;
Received: from ip6-localhost ([::1]:28842 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l1G4i-005zp0-Jq; Sun, 17 Jan 2021 21:59:08 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:39016) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l1G4X-005zos-Cq
 for samba-technical@lists.samba.org; Sun, 17 Jan 2021 21:59:04 +0000
Received: by mail-lj1-x22d.google.com with SMTP id b10so16241784ljp.6
 for <samba-technical@lists.samba.org>; Sun, 17 Jan 2021 13:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Z4HhEek/Tw4oVixmxh9pmK2rVtkzaVm9nEVNhWaLiyw=;
 b=jDmj8Lh2X7IY7EvLIy/ippLSvG+u36PR8Mf4KjMpj6sEGJkVJWqrIV/dJgdtpHChPt
 x5dfS7+Gf3Clr0jy4FS6yY2j27zVS6+WI0JFwy9B8QXwfS6Kq1R4X7QuGbGfQWwyez2t
 7k6k7gt0cn2wPjkg5wMKMKZqie8lQL7auL2I5u09vbokUqRB/FOSU3a7lDKC9Z/U3YY6
 u51JXUm6vBmOOaAdzNbHiBwREMPhDErI1geeDdtyg6LERBhlG/w0vZwDtW4426RcAv4/
 eJXUKn0oOlOyug7Xg7ir1mYhcr+MxAfJCvf+qBfYXQ7QzfMqIIyIIc5HhAt2k2WOlyE7
 7RHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Z4HhEek/Tw4oVixmxh9pmK2rVtkzaVm9nEVNhWaLiyw=;
 b=Z8PwOOSpx+2e96irMGcFUuJgTVH7iwRTSzpJokup/cACJGxpEuLf47NmE/6+DZT4ly
 9eCk3GJrfo7XlfI0PsGaSSon25BwD0Ny4ZseNLG0sfwISqEWTf6KWcfjAC2x0dllW41P
 X59G+7uGo+J0r0Wkx1GptUDkrYAZUK3ltcUZ7P+o+I1aTy2WafWzw9Wqo6LX9qCwxCvs
 Yl2xNpWNNQlT+WHLoWqhRYBiCyM1RlD6Dxi85njstGYcQNS9sIl/6HFCll218c1xhDr0
 Kr2FLl2eqrmvKTow3mOJaqCqEyZ4bR9ZSEJAencjl8QVfmFfDJMyp5MaNHKCG8C2nwQ1
 Vodg==
X-Gm-Message-State: AOAM533Owu5lraFKNlrZHfCGWRwXqywQ6rRYhfboBTv3dDfVOYaijSL1
 dfQqikmNZjSwiw/8Eo4DeXymgGfcvWMP7Lqgekk=
X-Google-Smtp-Source: ABdhPJwokbA6/W6R0raE8C9n2bMjc3KswnhdTLzWgy9AEQ+TqpOAELHUGy8q111zgCEdK7WbqrhT3M/2TzPzNcYcDGk=
X-Received: by 2002:a2e:9250:: with SMTP id v16mr9459481ljg.256.1610920714945; 
 Sun, 17 Jan 2021 13:58:34 -0800 (PST)
MIME-Version: 1.0
References: <1610615171-68296-1-git-send-email-abaci-bugfix@linux.alibaba.com>
 <87czy7lvjy.fsf@suse.com>
In-Reply-To: <87czy7lvjy.fsf@suse.com>
Date: Sun, 17 Jan 2021 15:58:23 -0600
Message-ID: <CAH2r5mvjDAgB6-kE=AOAwrETVk+R79z6Gd8gMnOTWqG-6Mnybw@mail.gmail.com>
Subject: Re: [PATCH] fs/cifs: Replace one-element array with flexible-array
 member.
To: =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
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
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Jiapeng,
Aurelien is correct, you should respin this patch and correct for
where it breaks the sizeof calculation.  For example your change:

struct smb2_lock_rsp {
@@ -1434,7 +1434,7 @@ struct smb2_query_directory_req {
        __le16 FileNameOffset;
        __le16 FileNameLength;
        __le32 OutputBufferLength;
-       __u8   Buffer[1];
+       __u8   Buffer[];
 } __packed;

would have the side effect of making the file name off by one:

smb2pdu.c-4654- req->FileNameOffset =3D
smb2pdu.c:4655:         cpu_to_le16(sizeof(struct
smb2_query_directory_req) - 1);

On Thu, Jan 14, 2021 at 3:26 AM Aur=C3=A9lien Aptel via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Hi Jiapeng,
>
> This will change the size returned by sizeof(). Have you checked that
> this doesn't introduce off-by-one errors in all the sizeof() usage?
>
> Cheers,
> --
> Aur=C3=A9lien Aptel / SUSE Labs Samba Team
> GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
> SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg,=
 DE
> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=
=BCnchen)
>
>


--=20
Thanks,

Steve

