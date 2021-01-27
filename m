Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9C43064C5
	for <lists+samba-technical@lfdr.de>; Wed, 27 Jan 2021 21:08:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=utfDUjtdjHjTujx1CHcCUf2s+LRx4DnyWHRSzeIi7No=; b=zo6zTDAoGiRWsvYM43aTnPK75e
	mODBk758O1FF8QrY0R0HH1BEBAkpVJpyCbsOkkDuKHEds3jx/59z/kYwOxucVMzf5S6AI+Hs4cdS4
	5Li2q3ZYHG2y5am20EChPje4dMJADVBB36bX3DOQIlR7ydHUvCYsYK/Wn2xwJn5BywPgqSMIfLv3t
	woiAW7gbS6XIi1n3v26MrSCERsbG4uoJxm+MZGYg5I0y3tmiqi2OJ269kNNmTZQaPRhdigJfkeB0O
	DZ2YaFQRGLt/+1jJ+6uLbmpS2D2GYVCisDUQYjM3Bf2PKt05c249ih7QfizPC7jRB3hzebXFO/wni
	b8GwvamA==;
Received: from ip6-localhost ([::1]:55734 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l4r5q-007S4i-MW; Wed, 27 Jan 2021 20:07:10 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:39188) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l4r5j-007S4V-9b
 for samba-technical@lists.samba.org; Wed, 27 Jan 2021 20:07:08 +0000
Received: by mail-lj1-x236.google.com with SMTP id u4so2075208ljh.6
 for <samba-technical@lists.samba.org>; Wed, 27 Jan 2021 12:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vmltZQudBtArpBrz6GIvH4dml+U2IodXiaPO7q8xpF0=;
 b=MqPKJTjXaAhZMhGJIPErePBfqEAJ6pJU9hWsEw9+ZPMUNJje9HeHGZf2YHqDYA/756
 hMzYiOEsqvRuyuOZQor9sSsPaM1aTNlKNwFPLu0TrpqlApbg/gY7JRcw9pjTBOKZPHCQ
 9KvoL7gm/byALaJ+zrKCo5KW2FbNT19/yVY5p19f0YXX4tkJOrwUyvD/nC1YiEXYgvW4
 YSJ8eBxw2fzN7Vk64P5vSqcB4DNow3XOuUIq/XJLF55UghgWHROxKBBHG819KtWrmkAE
 reGnvH7Oy7N0bi+JLuhkKQj7AKMx/lbUWh3PNCpRrfITt/fSMcqBLX3yQ41AcF3ViHEO
 ccIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vmltZQudBtArpBrz6GIvH4dml+U2IodXiaPO7q8xpF0=;
 b=lHRn+QqONQoHrYSFV1+haSdZdNlsthrvINsyavTHVj7ebBf0wDL9c0Tpc7OmBJ8Uly
 yWM8I41ozCyI/kmiykgNNDI4gG7Av7OJwg8eX+xn8owfeIF2domIc9AjRpdLZexGf6Tr
 wENVu1iQjzbE77WamMC5KcEo8gcOzL0emmHltkhag4F1Zu3WwKKVIZu095kxlxNY/Cod
 FeK/0y1hXD2HbJhAC1AZaxF9ieC9C6FVzm4T8Y/k4gURfLuDTnCZebGDx/orV5CtfysQ
 7Ai3rQO77jBArtj5j7cRiIzbUZJ77Bzjz8QNTCcIv5s1bhYAa374NQbHr0XlkadY8+MX
 6G0A==
X-Gm-Message-State: AOAM532fP3bx0XfI9fC+9KhDi14xmRETKfHjJbUDGWMW0HjnUN+j/q0U
 LyXGGLxTq0WGXeu2Huz2yCQAhl20dbcYIHfVV1c=
X-Google-Smtp-Source: ABdhPJyTUm5lg3N0rXvWrWv/ta+If/wP4YCP4zcu6jhQLqQSvAwwDEU6Ew+2AwvKhKoD6UY5xms4U3Xz7JMzyGbYr5o=
X-Received: by 2002:a2e:8007:: with SMTP id j7mr6427139ljg.406.1611778002664; 
 Wed, 27 Jan 2021 12:06:42 -0800 (PST)
MIME-Version: 1.0
References: <20210127071020.18052-1-adam@adamharvey.name>
 <87lfceabsg.fsf@suse.com>
In-Reply-To: <87lfceabsg.fsf@suse.com>
Date: Wed, 27 Jan 2021 14:06:32 -0600
Message-ID: <CAH2r5mtWa8JyWXHvnWKB5N-8qfGO+G_mmu5m3+QfuhxgWX14sg@mail.gmail.com>
Subject: Re: [PATCH] cifs: ignore the noauto option if it is provided
To: =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Adam Harvey <adam@adamharvey.name>, Steve French <sfrench@samba.org>,
 samba-technical@lists.samba.org, linux-cifs@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I didn't see anything logged in dmesg (when I tried it on 5.11-rc today)
indicating it was a problem (it still tried the mount).Maybe it is stripped
out by user space?

In any case can't hurt to to ignore noauto exlpicitly as we do in 5.10 and
earlier

On Wed, Jan 27, 2021, 04:57 Aur=C3=A9lien Aptel via samba-technical <
samba-technical@lists.samba.org> wrote:

> Hi Adam,
>
> Adam Harvey <adam@adamharvey.name> writes:
> > In 24e0a1eff9e2, the noauto option was missed when migrating to the new
> > mount API. As a result, users with noauto in their fstab mount options
> > are now unable to mount cifs filesystems, as they'll receive an "Unknow=
n
> > parameter" error.
> >
> > This restores the old behaviour of ignoring noauto if it's given.
>
> I was looking at other fs code and it seems no one explicitely parses
> auto/noauto. Any idea why? This looks like it could be handled somewhere
> else.
>
> Also I would have expected fsparam_flag_no("auto", Opt_ignore) to allow
> for both auto and noauto.
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
>
