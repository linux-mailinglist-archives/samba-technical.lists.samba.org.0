Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A0198205B5D
	for <lists+samba-technical@lfdr.de>; Tue, 23 Jun 2020 21:02:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=6bTjlis/JQxZZYEX63I+IFlfqIZ3AlM1gGPkUH9Y0xY=; b=QRunkOMHqDmC69qrjCCsNiBSCX
	t8IS0xQjvFa8h28oX8kd5+0aaVwhdgYdvUqheguhJPRNTtQVeO+bQ+bHc4gl4EygbT7nDRyuAs3VZ
	SiHZyEUHNCxfJRqbR8OQpoAL4Vf+CA6gV27nuh0G0AWN3OmeyIFK1ShADmw+YHBHjrCIaEvAwUWS7
	2BGTHUlS2z3y9o80EH0nJlReoeHSCEOE9/eh3HwYdmx/fGVXMgNxhdpVHzW5/PNwgakneZhIzBXMR
	pLMseZTvalBqHChdZWoM4ToMyVRzsUnUM1iNr5Yb1xY5lKq0YBlqqqJKURndElxmBRtcTlPJ+pLIP
	8V4U2AIQ==;
Received: from localhost ([::1]:21630 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jnoBL-0023Qg-RC; Tue, 23 Jun 2020 19:02:07 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:35100) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jnoBF-0023Pu-27
 for samba-technical@lists.samba.org; Tue, 23 Jun 2020 19:02:03 +0000
Received: by mail-ej1-x642.google.com with SMTP id rk21so6333432ejb.2
 for <samba-technical@lists.samba.org>; Tue, 23 Jun 2020 12:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6bTjlis/JQxZZYEX63I+IFlfqIZ3AlM1gGPkUH9Y0xY=;
 b=LeJIgsSTyhtxyRT7ufDl18n/squxHPhhWXtI+KsbA+nXXFFNm7YdMBZfv9noe/fViT
 PCWcybK0LmOioHKb7iE4b3YIoEw88BNZu0dSP+4J62yJi1NFdA0/MP24STsVNLI4yyyh
 20ORv/+74i+18JqLHGnKQtq4OQeCvzmHGOf+zIxmQ4px9iM3qgCz65XdOEr+YR8JKYv3
 vpKI3FKMaiL5KzjGO9dl81+Cj06t7UtR0MvsnvIIrnGwiL/BG9ftaB4/br/akY4hvv+5
 +Su0ghjshvTU9D/UkXwk3o6szB45AdKzbq5Th+gDJ5AztUu4WrUkevikmbarR6XVzY3U
 TlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6bTjlis/JQxZZYEX63I+IFlfqIZ3AlM1gGPkUH9Y0xY=;
 b=klPOlzWruQymDtRNHl6BQ9wWysm6+1Z/il6kvOvbBzPTXbYRjVfTOxzs11ytVkZJpI
 PGfl8dRLgLix/U0Zu2BsVopF9rtlXogfvJh35J+JI15MvGCHcpd2n6RImoZIqGT5dy1/
 vR5OCRprnscfc7FkHbPVqHMpA+WwPw30mKIMBUAsCwsln8L0ZtwBNdOOGBF6DAhN5Y8Q
 Jl5765nCHEjbSb6V5/MECFJM9rZWqsYvvMjyPbi7w9+coeJWDaptHE22+7GdyCHxRtM8
 0ApVPCQ2/saExrJ8C+3iPUzxwF06R5SzDf5nqPiDf96C1sxXPT4I95LN/q+Gj+FzAGHD
 EL2A==
X-Gm-Message-State: AOAM5308iFLCEdHliA0BKAEVvS/HeIHVnXCDFKLyXo9f54ZfOkafLHK8
 R/MlruULXv9bae1cSS8PXLOkbKT1T0UQpWU4Ig==
X-Google-Smtp-Source: ABdhPJwCSc6O5p71X4RctvdCXd5SGwSqeT8Kru9BCBBkm8WHi7UJodgV1B81sB9P4QDnZgA5D0YBZEQGt1OydMaXWMk=
X-Received: by 2002:a17:906:b748:: with SMTP id
 fx8mr781819ejb.341.1592938919478; 
 Tue, 23 Jun 2020 12:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200623113154.2629513-1-zhangxiaoxu5@huawei.com>
In-Reply-To: <20200623113154.2629513-1-zhangxiaoxu5@huawei.com>
Date: Tue, 23 Jun 2020 12:01:46 -0700
Message-ID: <CAKywueRq=kAVK86DSLQRRREvND7z8sQ1prv60Y_eTRp3Vd0J7g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] cifs: Fix data insonsistent when fallocate
To: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
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
Reply-To: Pavel Shilovsky <piastryyy@gmail.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

=D0=B2=D1=82, 23 =D0=B8=D1=8E=D0=BD. 2020 =D0=B3. =D0=B2 04:30, Zhang Xiaox=
u <zhangxiaoxu5@huawei.com>:
>
> *** BLURB HERE ***
> v1->v2:
>   1. add fixes and cc:stable
>   2. punch hole fix address xfstests generic/316 failed
>
> Zhang Xiaoxu (2):
>   cifs/smb3: Fix data inconsistent when punch hole
>   cifs/smb3: Fix data inconsistent when zero file range
>
>  fs/cifs/smb2ops.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> --
> 2.25.4
>

Thanks for fixing the punch hole code path too!

Reviewed-by: Pavel Shilovsky <pshilov@microsoft.com>

--
Best regards,
Pavel Shilovsky

