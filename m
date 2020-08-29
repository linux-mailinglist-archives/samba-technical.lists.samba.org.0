Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4A62563AA
	for <lists+samba-technical@lfdr.de>; Sat, 29 Aug 2020 02:23:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=blv3u39kAYdDV+NRLpDFwdDCNcqPLkP49KKrHMk0a8U=; b=vXcirSG/ZoR5xyn9AKE/6T/Ew/
	cUWccN/bYBXMhRHoLy8W4Xlq/bXOwmXJGECU7Ra5n1vFYcFq+nKDzvp7AvimQZTeCNScwoOqpVYqv
	21nzaqB827PiFyJCblW/GATWuUfbLacv54Q/MokyUbhmWk3otPYVcBp8K61i20kSRhqkUDymJ2XOg
	pYGaAJTzmqOfwCRDMwtfmqb4opKkEVf9C/659842/aIuQ5CXi8wsCisIYuyMpZJ2p55rK6+phS7lY
	MC1sA9kTRUaq1dGnUazkMS4s9C9O6NSL00midnBMgKl+PleTHv/jY6KT1KhDFx51LI3RPIejcbFOi
	4JFboVfg==;
Received: from localhost ([::1]:22988 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kBoda-001AwA-1Z; Sat, 29 Aug 2020 00:22:30 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:33928) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBodV-001Aw2-C0
 for samba-technical@lists.samba.org; Sat, 29 Aug 2020 00:22:27 +0000
Received: by mail-ej1-x635.google.com with SMTP id d26so1377453ejr.1
 for <samba-technical@lists.samba.org>; Fri, 28 Aug 2020 17:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=blv3u39kAYdDV+NRLpDFwdDCNcqPLkP49KKrHMk0a8U=;
 b=pPEwf6jDTFTrDET6YDEAHtgrFIaC7wXEr1/KtxiadkttoVsg8VSmtxaROgGLu5eKIj
 14T1eafNCwukX0SmPLFnVRkQeXGWh7N0Agnbiop1pqCU5ZsYy15zoRPzyXeoG6FwRCp3
 AQhBJxDvee9oFU0NH9mIvBT55mA6hPkNymEoJW6vagWqTAFoBWNj7CVWgRQUmBe6/FB0
 TPvYPDgtUZpl7kfg45+n9iiv8Yh+TWlEes/v4xR+a0orVSIQBmA6r9+frE2XSt1Q77Bb
 gMzKwxg6xRXM/A5mNiFtPgZz7ngcvBxb9OL9B2TD49WY4/eVEORFPxc10Hr7CIEa0pCj
 asKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=blv3u39kAYdDV+NRLpDFwdDCNcqPLkP49KKrHMk0a8U=;
 b=YgwCRF85FmF26f16RbBJwTcnWiDfU8gpqgfwWVzh/BKlvMlVSoDf2ErRNsSgbwVZYP
 NPkuMsQZZ6yGDDLJPDSkD+1BeIViRrpsFXKmHN7JBMKxrQp1+wMxxpr2zmfqpxEqRX1c
 2nvmTWw14F+hUJYI/z7JGTLtCjfg+Aeg/PvRJ7tkY4/vmD7DmB/CcGyJ+z6GPSJCTK78
 WfWZD/wu+kmVQ35yTjia3LGZFF1fb65/Tz3cObIGWMU8GusSXf42eoJ1PihJd+nJy70C
 j2M/p2YUaHsXJdBJHBn6cmP+wr10l8u8TPl0gfDrrIPrxhfQcFlfFCvLOrapCinR6lTs
 kqKw==
X-Gm-Message-State: AOAM530UHJhnarH6M7K8bh58vFZMo61pdUVDPCdIqdQrWBUSiWYTkVrN
 R8wG7KZaTDCqdLjc3/33LQVcUlCrJrX2iCMM+BG4yAQ=
X-Google-Smtp-Source: ABdhPJxyckjXJSSORjVT0so83744Ysr7O2Q9SytaNbXnq+tUpuw1WoGegstRANc/ddExYYHCk3J1iRNCQ8M5auSpXo4=
X-Received: by 2002:a17:906:e907:: with SMTP id
 ju7mr1251249ejb.341.1598660544376; 
 Fri, 28 Aug 2020 17:22:24 -0700 (PDT)
MIME-Version: 1.0
References: <92faad42-2c69-a906-8da9-14a9f6404b83@rosalinux.ru>
 <baa6ba65-efe7-0d1f-f93e-b893eb8b2f26@rosalinux.ru>
In-Reply-To: <baa6ba65-efe7-0d1f-f93e-b893eb8b2f26@rosalinux.ru>
Date: Fri, 28 Aug 2020 17:22:13 -0700
Message-ID: <CAKywueQZNZL6RuT2eQ83DCXZLio6nvY713P44_aPoULmL-KzAw@mail.gmail.com>
Subject: Re: [PATH 2/2] cifs-utils: Don't create symlinks for mans if mans are
 disabled
To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
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
Cc: samba-technical <samba-technical@lists.samba.org>,
 Pavel Shilovsky <pshilov@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Merged. Thanks!
--
Best regards,
Pavel Shilovsky

=D0=BF=D1=82, 24 =D1=8F=D0=BD=D0=B2. 2020 =D0=B3. =D0=B2 14:12, Mikhail Nov=
osyolov via samba-technical
<samba-technical@lists.samba.org>:
>
>
> ---
>  Makefile.am | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile.am b/Makefile.am
> index 09ef293..39ef1c2 100644
> --- a/Makefile.am
> +++ b/Makefile.am
> @@ -122,7 +122,9 @@ install-exec-hook:
>      (cd $(DESTDIR)$(ROOTSBINDIR) && ln -sf mount.cifs mount.smb3)
>
>  install-data-hook:
> -    (cd $(DESTDIR)$(man8dir) && ln -sf mount.cifs.8 mount.smb3.8)
> +if CONFIG_MAN
> +    ( cd $(DESTDIR)$(man8dir) && ln -sf mount.cifs.8 mount.smb3.8)
> +endif
>
>  uninstall-hook:
>      (cd $(DESTDIR)$(ROOTSBINDIR) && rm -f $(ROOTSBINDIR)/mount.smb3)
>
>

