Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F22044DE82
	for <lists+samba-technical@lfdr.de>; Fri, 12 Nov 2021 00:31:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=+tl87o2jVN/C82+Lw/gbybzHN2e6EMAQwvH07MFSJF4=; b=S7qjJ690oS535MP/pswH9E5ume
	N9OJcZ31BQKRxKggQmFKETxnrOZUlDKY/qTNy3q1LIHRojcjbTeNsz9wzMS30F3xgLLQon+y22+sI
	NBE9yUBugLJk5lHlDZMnq/Snd2EXz1l+FYogIOYBKY/JH0ef9Zg3dACfs4xszeISkSsXn3VzG49kM
	AlBdIWxv2KHDZTrNH/1TOkilv8l8NelC5hmbc0mvdYGpMOwUo6AFDuvfbYl8pJeN9z9NbciPb2lPx
	WTRsYWVyQYCPo90c7Y/+4z6UT2mIXs2GsBYM6Z/u7+EH3dpVx4T6nEdGwpOEkADG4VUtHS2jAUksX
	I0RkHtsA==;
Received: from ip6-localhost ([::1]:53734 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mlJWA-000jKt-Hm; Thu, 11 Nov 2021 23:30:06 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:44978) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mlJW4-000jKh-TI
 for samba-technical@lists.samba.org; Thu, 11 Nov 2021 23:30:04 +0000
Received: by mail-ed1-x52e.google.com with SMTP id z10so3911984edc.11
 for <samba-technical@lists.samba.org>; Thu, 11 Nov 2021 15:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=+tl87o2jVN/C82+Lw/gbybzHN2e6EMAQwvH07MFSJF4=;
 b=EAlf3AYAXzHykiJ7sTN/bS4wBgm89OTKRStvFF1ijqvhBfALq2/HOV7okPQF42dx6+
 +DzLzCFZvVTsYtMwr1Z6DYyMfD1+OoaRpGRw4nZh0o44nkn8OaZGphxX3Aoz+Sh8Bp1b
 uiR7kEanYVXTH06tr3WYmJHy0iNGnvsXjNdKt1WOvCX4H2uKABg1VH4KBQkCyw/rP8k6
 XtOF/AKjSfIS38WvSz2VW0LiO2LaBnQkembdtfCGMY6K877PBskpt0iOgKaltFqAcOBw
 PGhYX0u1Af+cSbRPMgucga1zO4NqZ9Wyn7Y2L83GwpUUhXlbzGnhWKGt9RAMeQ3kdk7x
 0oNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=+tl87o2jVN/C82+Lw/gbybzHN2e6EMAQwvH07MFSJF4=;
 b=ivasFUAsG1TAIPUhClg9u/JCVR50gp6zhhvit+4x7Alw3adyb6/Kt8a/PtvsBC919r
 YukkkXWN3cgyUwq3En8WYVgX7EsKPzjUUgAe2Fnzg0dblnR4W7rlR3pNd0VDtdm6t38D
 KoLqKrXfOpFvoDVPBLIq2fdexIs1CBQz+D7ygBrfybYhCvGr9PoyboL9JlaYH/fm8JL8
 5sOH9vIrjO1yimDXBJfqG+R1TAAum20832kTqegrkhu/E5+qkfhxKiaqRlvYjVKUAsxp
 rZgvEIm1f8Ctd8o9Fd5jM32xFF2zzJ7JtIOHAARuY69icPVoj1lRahm6bPVdiqjDw3vw
 ViWw==
X-Gm-Message-State: AOAM533r262mNQyUeCinaj++AOhWTrU9TTSEKm4D7GWK+ZsLVAzA4nTg
 1sPF6fVqUYUlous6wKV5ifOWrxMnXk9LXsTNswUSav3u
X-Google-Smtp-Source: ABdhPJxOAnPvBZ6/encmpvdkuoEfC1J5EYRdcx22nPFTdOEA3jI+frF1KjMu5mpCjtIUfPidhARgigmoHF7WFEp0noY=
X-Received: by 2002:a17:907:2d0e:: with SMTP id
 gs14mr14362459ejc.249.1636673395908; 
 Thu, 11 Nov 2021 15:29:55 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 11 Nov 2021 15:26:17 -0800
Message-ID: <CACyXjPyEEtjHNpVxR9zbRwK8k3SofMbmiSRujGZ=OyxKZii_vQ@mail.gmail.com>
Subject: Deadlock problems in netlogon_creds_cli_lock in a CTDB environment
 when a winbindd dies holding the g_lock_lock
To: samba-technical <samba-technical@lists.samba.org>
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
From: Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Richard Sharpe <realrichardsharpe@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi folks,

We are seeing an issue at one customer that occurs once around once a
month. winbindd processes start to pile up and they all seems to be
stuck in cli_rpc_pipe_open_schannel_with_creds (there is more to the
stack than that, but they all get there) and they are trying to take
the lock but are stuck.

It looks like the original lock holder has died without calling g_lock_unlo=
ck.

Now, this is with 4.7.1 but because I am moving us to 4.15.1 I looked
in that code base and it seems to be similar in that it now calls
netlogon_creds_cli_lck and the lock is released in the destructor.

What is to prevent the lock being held forever if the process dies? Is
there some code elsewhere that detects a process has died holding the
lock and releases it?

I am looking for an interim solution while we get 4.15.2, out it the field?

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

