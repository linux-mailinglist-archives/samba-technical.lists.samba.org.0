Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 162FE56D3A0
	for <lists+samba-technical@lfdr.de>; Mon, 11 Jul 2022 06:09:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=fllguJpF5BnkzkEtoQdiaDv1n0MWRGtfi77Hkgiwu7w=; b=VBY3+cDX9udNmTKoIex0JSnGHq
	L9YuqFDJaeL86ue79ujBjkJKUTvmizBatAs/aPLJMsBqr3++WyoCCgbbgTqD7iSyrFQCU6vCM10KN
	zow3KgO5W0cUGSBbrpLp9R37Xb82C8EVrF7xkTaEqhwK+E4VEsm8BPsskg2DbBVEOcbilmT04DMDT
	wcGAlhnf967qJQZXqkJsrMeaEAMfbamI3ljkyPP2bfn1FW2zarFk1JFjjNR8CW3WwlADpVXl3Fqoc
	PPBT6l373jZBMlaSPi4I9rC8+ZhwsUl8Z4ptBSta/VjltC4Kki+ARVo/ucd2YarfOl8g6O0nHOH7X
	/bh+c9tA==;
Received: from ip6-localhost ([::1]:54478 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oAkix-00Gu5o-Id; Mon, 11 Jul 2022 04:08:43 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e]:36657) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oAkir-00Gu5e-JH
 for samba-technical@lists.samba.org; Mon, 11 Jul 2022 04:08:40 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id j65so3874703vsc.3
 for <samba-technical@lists.samba.org>; Sun, 10 Jul 2022 21:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fllguJpF5BnkzkEtoQdiaDv1n0MWRGtfi77Hkgiwu7w=;
 b=J0g3ViFEff4Py7WHG4RL4FSWzOVY8gx+z+C3KxUmstsBfH6cvz7QKPt2cRe0Sn+Yle
 GdA1pxlKrQuslgEkVfgSEyxOT6GDUcuzbV2PhRql8g3TaRFUGKEajXTwurqEByYRnY9i
 aqnAZcsw3I3rRlsHXYaRlcXzh+t6VNxh51h33YrZUt/dHQfLkCFQ0QxbYiTJZmq9rkiy
 QzVm0FjiLWuA1WXz/cHheGn0PkoMjnyP6ZzH5ZnjpF35DVW8YtoVldA7ccS/gboKa8uP
 DdNO3o5TtAQM8Cg2FZjlX8PqluHilQCjSpczyTzSe7SVgmjQMJ+wpYUDJDADetAuXVRw
 tprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fllguJpF5BnkzkEtoQdiaDv1n0MWRGtfi77Hkgiwu7w=;
 b=onNgQVTcoaRuOQHKDYZhC/Q6VQf74JrcFjGZcTRyWtZD3aFhXTq4W5qqvpeF6Akyca
 BwTncUOJL5SCeeL/BO8QFpkbFIVJIzVoFN7kM8/U7e+dGkbEU6zhN0AONgWcl7cQm9BQ
 QLONYM58Map/m/NweMfGiFumIKAR4pLiyXn56GX1megMCVfhDxpzxTGJML/oU55s1Ggo
 jfWhvG600swkiPnyD5QxjjUz8v+9IhKTCnxnSneqMLeaudGP0pkfWRR0oBvjjKRjzdNd
 hCvAwwqTmpMTvdiWbSW2l9bbiZ0aJFFGGJyX0FMHsTJVLKxueADskxQgs1sDZgch0NpO
 REDQ==
X-Gm-Message-State: AJIora8CDOVZxyydi2C3jYj3oyKZrhPD0r9khyRcg1HTv1vgd68Sw/xf
 a5UbIWzBkCfNGbKiRiA/bcw45jUWTxeFE3pCiPc=
X-Google-Smtp-Source: AGRyM1uX1bCiFSyBL4si1vDblPNKneQTJ3LnVUKFcoIbF3k0f/Xh+iDpdXh/5E5KrsRDaadVkConD+zaRe6mZ5VFS0k=
X-Received: by 2002:a67:ca82:0:b0:357:32b6:5f04 with SMTP id
 a2-20020a67ca82000000b0035732b65f04mr5405610vsl.60.1657512515219; Sun, 10 Jul
 2022 21:08:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAARpZ=_WCZhEZ2DzR3jRNLNLx28duH2iSn7WwRVezGKpjX0LDA@mail.gmail.com>
In-Reply-To: <CAARpZ=_WCZhEZ2DzR3jRNLNLx28duH2iSn7WwRVezGKpjX0LDA@mail.gmail.com>
Date: Sun, 10 Jul 2022 23:08:24 -0500
Message-ID: <CAH2r5mtYzhd9EpzJAFLH+AHvKB0CaUtVBTP+UP4PDgg686-SFA@mail.gmail.com>
Subject: Re: mount.cifs broken after update, advice?
To: Brian Caine <brian.d.caine@gmail.com>
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
Cc: "Stefan \(metze\) Metzmacher" <metze@samba.org>,
 CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This looks like the Samba server bug pointed out in an earlier email
thread by Metze (fixed by
https://git.samba.org/?p=samba.git;a=commitdiff;h=147dd9d58a429695a3b6c6e45c8b0eaafc67908a)

I had trouble reproducing it on my systems but it looks like (based on
Julian Sikorski's testing) when we fixed the netname context to not be
null in some multichannel cases, the reordering of the contexts
(putting netname context after the posix negotiate context) triggered
this bug in some versions of Samba (which was fixed earlier by the
Samba server commit above).

On Sun, Jul 10, 2022 at 10:35 PM Brian Caine <brian.d.caine@gmail.com> wrote:
>
> Hey all,
>
> So I recently updated my kernel and my previously-working CIFS
> mountpoints are broken. The server hasn't changed.
>
> I can successfully access it via smbclient. Only mount.cifs is broken.
>
> On the server:
>
> % /usr/local/sbin/smbd --version
> Version 4.12.15
>
> On the client:
>
> $ mount.cifs --version
> mount.cifs version: 6.15
>
> $ smbclient --version
> Version 4.16.2
>
> $ uname -r
> 5.18.9-arch1-1
>
> (I know it's not a vanilla kernel, so I wanted to ask for advice here
> before making a bug report.)
>
> As mentioned, smbclient still works:
>
> $ smbclient -U brian //192.168.1.131/backup -c ls
> Password for [WORKGROUP\brian]:
>   .                                   D        0  Sat Apr 24 16:01:23 2021
>   ..                                  D        0  Tue Dec  1 20:18:28 2020
>   brian                               D        0  Sat Apr 24 16:09:46 2021
>
> 15119769681 blocks of size 1024. 12418540722 blocks available
>
> This doesn't though:
>
> # mount.cifs --verbose --verbose -o username=brian
> //192.168.1.131/backup /tmp/foo
> Password for brian@//192.168.1.131/backup:
> mount error(22): Invalid argument
> Refer to the mount.cifs(8) manual page (e.g. man mount.cifs) and
> kernel log messages (dmesg)
>
> I attached my kernel output. Is there anything there that jumps out at
> anyone? Any easy fixes or should I look into opening a bug report?
> Anything else I can provide, just ask.
>
> Thanks,
> Brian



-- 
Thanks,

Steve

