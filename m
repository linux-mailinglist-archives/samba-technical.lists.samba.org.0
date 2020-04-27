Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A820A1BA426
	for <lists+samba-technical@lfdr.de>; Mon, 27 Apr 2020 15:00:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=5F2XIaJmeYuSdJIMz3F42AL3EzZemkraoEPCzhXwlW0=; b=A0bwXxh8tcQTPn3fqaDJw2LGJ+
	JEbr0tEIAjSz9X5jYWwajAK2r2K3Re7SMQ3rzLwMfR6JVEJV6KkM0S0sHQWPdidKdbVhWEulalqQy
	ZOZV+/HuTUzNGehG2u+rP4PjFQZrNfgmiLLBBb+wzwvumIECzLk5/L/06WiXuWgfQcNrTTD9r0QrI
	E+2AU27E0ofh0M9/LyD42BHFpqbcqsLQxq8pDkforpCiRojogXKR9XFkz+sRTtoToxk3/+K1+BI7F
	n1sgqKYWCg+eIZTGLDpArJumfjBsBn3QdJeAP36FCmfAr44CfHL0x6i6YwIYyd2ou6rEQz72ujR7H
	SDZhnluQ==;
Received: from localhost ([::1]:45374 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jT3MJ-002BZ3-Vn; Mon, 27 Apr 2020 12:59:40 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:40843) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jT3MC-002BYw-Lx
 for samba-technical@lists.samba.org; Mon, 27 Apr 2020 12:59:35 +0000
Received: by mail-yb1-xb30.google.com with SMTP id f13so9400460ybk.7
 for <samba-technical@lists.samba.org>; Mon, 27 Apr 2020 05:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Za2kA529/fM6AYQ6QfNVRxSXhsGaQtq7qkLq5u5VWEs=;
 b=V9GswdmYBDPEHbJ0KbifQQB1hj48jW3NzDb/f5MtO0kuMY6wM7V0dVPj/SIo10Plnw
 Q9b2Ps/XbCVLRPz2xVtf5uanWSNJ4J89j98FF1MNU4CG3YdWmC8m3o9XM4kv0wOBmJ7/
 xBHWqxmxglNYkIYH1pWtbNX7UV1dmcITsQMt1b1Y8RzdgBc7iVyn5aYIHaoMH7BLY64e
 eVfDBgSeo+D+ZT7bCNal2nDZpxmp8k/mGlO8hXNJ9CNwb38ZhBeKtjkgb3uiP3jwWls2
 z3uNnhUYCxIQKt7m9M2eXX7LNEADgfu+NcCrGzoN2S82cPEGlYvHomzL40nvEz51SHx/
 9a6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Za2kA529/fM6AYQ6QfNVRxSXhsGaQtq7qkLq5u5VWEs=;
 b=bp6d8a0ikxFklxOMfgKVf9UcvU5JKDAnVsFyrw7KrPHQScG1Fwuve/STQ1VnXbx5mC
 6J8l2rD/n8vbRYyf/7Lr1ddntXzRsYSIlh6kgMSTqHxgabMJCj0DBn+Bx9j2YTVIj8Mq
 6sJhuxbRz5SND+f44wRpCsoiw8DkuxUM/zCNEFcIx68ZqWPtOQ04w11QFG2KCbPlhrzN
 qbPDyj5gU7S0lJ6cBpwzUFDBvUR6c6SwqF429oZm5/W628I6U/TP2Uy3guNck+99Dnca
 tk+xs01CxBcFF5fHFDgV7rQ9MVFXj72GhBVyR63O5MwDp0uJunYGRA0nljVXF31pGmmn
 rS1Q==
X-Gm-Message-State: AGi0Pubalr9j4sZaofoMzFq9zTygoja31TyzYy0416jk/DpqoJ2iPWh6
 YgvILgHDQKDpHCmOeaZBfIVL7JLkB7GIyXCc/Cg=
X-Google-Smtp-Source: APiQypJbmtzfR4vZVfCPstpSdAK4HFROT4VA/3KLpYOPAy0pm3cuO7LOfap3HFSRLReent1crtOaonFFLRwEQI44Bko=
X-Received: by 2002:a25:f20a:: with SMTP id i10mr36349091ybe.193.1587992370878; 
 Mon, 27 Apr 2020 05:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <CANT5p=o8iFSrPscQiqpeX=Qb_JBqiAVGWHsQBh1g4kBBH_u1wA@mail.gmail.com>
 <87sggp87x2.fsf@suse.com>
In-Reply-To: <87sggp87x2.fsf@suse.com>
Date: Mon, 27 Apr 2020 18:29:19 +0530
Message-ID: <CANT5p=opvQ1e_B5y-NmMc8sibsdNmt6dcRDRZjUxC5Dts=5mhQ@mail.gmail.com>
Subject: Re: Debug logs in heimdal krb5
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks Aur=C3=A9lien,
This is good info. I'll check this and get back to you.

Regards,
Shyam

On Mon, Apr 27, 2020 at 5:20 PM Aur=C3=A9lien Aptel <aaptel@suse.com> wrote=
:

> Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
> writes:
>
> > Hi,
> >
> > I'm currently debugging a problem I'm facing with krb5 mount in cifs,
> and I
> > want to enable logging in the heimdal krb5 library. How do I enable all
> the
> > logs which are printed using _krb5_debug in the code?
>
> Try setting KRB5_TRACE env var.
>
>     KRB5_TRACE=3D/dev/stderr <prog>
>
> I have written some notes on using/debugging on the wiki. Maybe this can
> help :)
>
>
> https://wiki.samba.org/index.php/Cifs.ko-testing#Can_you_login_using_kerb=
eros.3F
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


--=20
-Shyam
