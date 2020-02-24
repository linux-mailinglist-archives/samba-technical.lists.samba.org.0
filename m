Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7BD169E1A
	for <lists+samba-technical@lfdr.de>; Mon, 24 Feb 2020 06:59:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=8ufJMM0QaLOMhL1j2geAiG59L13NPUluVWRQu2saPmA=; b=Hwzr12C8F+VD+PMCmo/eIDDRjG
	SDw22yKH3HNBgVWPO6Y1LlkaJCec3ye5NgFTM9xxgzwNRZOE3HR+BwUjIxbkmLefiMo65ocgSxvpd
	a0KdvoS4k7sUj7rdDJP2PVToyqWDM0VJq0uD2rrAX0fsz/t5P7yYI6TqzUCScs+4tD0na5iSY6GDo
	p0HFUconjTcGGvoYiRO3rjEkFzgFX5YY0gvqZaph7IjQsmUVaifp9/+Hcatz1KA5TDA6B1tmeElvz
	9/lW6ftkqYHPQVtDmS8EsSwLCXCzMRaQ9eOLvcPuxDbEFWZtHhwU6UHsKddtRJTWGzVjX3ckwlH/J
	v43hb14w==;
Received: from localhost ([::1]:52600 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j66lM-00BIM4-Pu; Mon, 24 Feb 2020 05:58:40 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:45338) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j66lG-00BILx-Tk
 for samba-technical@lists.samba.org; Mon, 24 Feb 2020 05:58:37 +0000
Received: by mail-io1-xd44.google.com with SMTP id i11so8980656ioi.12
 for <samba-technical@lists.samba.org>; Sun, 23 Feb 2020 21:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8ufJMM0QaLOMhL1j2geAiG59L13NPUluVWRQu2saPmA=;
 b=kjU2dmUQprPvO5BuHONcUrTw+r2bwi8N/4v6dpmlgf7PZlUjaOSy5i88yoTNx4VoDO
 T4bBH+XtDa3Ehnvlq0Q4HO+3JO2GGal8IteiOjHBSeEtohWaaDLBIPijc6GYQjE7VS/x
 ei4scHKsinbjiISvPp4i6Qk+koKe//0ASQ1ZgIeht3r3epOyIkZ226YGoY1oVu7qLa3y
 F5vkV5ni7op42bdBiN2GotTVtJzeASQB7jcVig4XYcKQpUQEbN47gNnXN8pU4oz75ZtM
 KIIsFAOlRjZIVSUXR3QH0WQyw6znD0vUY7kGMqkh9wZ0joCpDaHw3fMEbX/ktBFnIins
 /e/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8ufJMM0QaLOMhL1j2geAiG59L13NPUluVWRQu2saPmA=;
 b=f6HcQh4t3ubHDWCMdd+CDwiot6dW8851029oMv5kXAhdAeMMRPsisOGOcKlq4n7KHN
 92N8peKEhbgejZpVx365tWkY4TmHKhBboUVhIankKKo5iiuvxoGinAVUMFHg33R/gV4E
 gc0YxMdESd1jHj0s4ECpnf88w4oLQfZK8BMIyxB+R24A7LwPteQyY/xjmk1Nxswtq921
 BuKT9RaYzDRkBIK44dki0X9eGpJ0UzjoElyJ4+6GkKu6LQZRF8UD968FCsBfIvVfjixr
 tLTtxReh/5f6jSPHjoildlCquMbwUj1+zPchIKvgTpCsf8A9o09hwuCv9/LPlSJPb08c
 fMNg==
X-Gm-Message-State: APjAAAVDmBhZFCRPRHc8o76ILzgoU9wnk8WJaiOfz+zTwXxcvRnREivR
 4kYbn/GzqVpQxXDYJ4orFUJE4tWnW6C05k4QTFM=
X-Google-Smtp-Source: APXvYqzKexOhclDi2/RZ4ID7g8MfwAu7yEfMxwHnYyNLNkqkCMxWF9NUshT2rIjgYTMdr3rdEl4ttpI36enUo59JfQA=
X-Received: by 2002:a6b:cd0e:: with SMTP id d14mr47185867iog.272.1582523911931; 
 Sun, 23 Feb 2020 21:58:31 -0800 (PST)
MIME-Version: 1.0
References: <862518f826b35cd010a2e46f64f6f4cfa0d44582.camel@perches.com>
 <87eeuo5a2y.fsf@suse.com>
In-Reply-To: <87eeuo5a2y.fsf@suse.com>
Date: Sun, 23 Feb 2020 23:58:21 -0600
Message-ID: <CAH2r5mtvkVk4RiZB2pu5aymv0mv-ioV8jc4mhwuF4c3XRpxhJQ@mail.gmail.com>
Subject: Re: [trivial PATCH] cifs: Use #define in cifs_dbg
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
Cc: Joe Perches <joe@perches.com>, Steve French <sfrench@samba.org>,
 samba-technical <samba-technical@lists.samba.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Seems like a plausible debug (VFS not FYI) msg.   If delete is not
pending, it is a little strange if nlink is 0. merged into
cifs-2.6.git for-next


On Fri, Feb 21, 2020 at 7:46 AM Aur=C3=A9lien Aptel <aaptel@suse.com> wrote=
:
>
> Joe Perches <joe@perches.com> writes:
> > +                     cifs_dbg(VFS, "bogus file nlink value %u\n",
> > +                              fattr->cf_nlink);
>
> Good catch :)
> I realize that 1 is VFS but this should probably be FYI.
>
> Cheers,
> --
> Aur=C3=A9lien Aptel / SUSE Labs Samba Team
> GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
> SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg,=
 DE
> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=
=BCnchen)



--=20
Thanks,

Steve

