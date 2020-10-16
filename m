Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BA86528FE12
	for <lists+samba-technical@lfdr.de>; Fri, 16 Oct 2020 08:12:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=QRx5VA2jL04EprKBK7dDPa5Y1K8LOZnjXRlM9vGrDU0=; b=0YkyCOeXJjtqgl7LN+MjONyXDB
	EDModooL/doEKTm/qSBHTCn3qGYn2uO/fLVbXW1KquVOSVvxrbl2X19SDGxGQRtHJZUXoul1H+dxg
	jMKDGOXzELv6w7BsQ4cwS9EAW6YQMk+kPmWGKvS6hB4EpWfiCyT4z+MF4xUcqNI/4j2QB+51jYa+K
	uEeFUeQUrJtr8MXOcSjmmpH5PMUGv68fau6m/9YoVOPoEpv8zX6x7wcsyS/7kjfXG0wX9dXwsKlXq
	5QtCCHK8HZvrncYvoBu62kyK03b4j5HfP+i+OuHgVYGgut0xd3sw7Z0mK/ZyGDJVxUbCRr3XEXezU
	I0a/YTMg==;
Received: from ip6-localhost ([::1]:37730 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTIxb-00CNXU-Mh; Fri, 16 Oct 2020 06:11:27 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:34046) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTIxW-00CNXN-MB
 for samba-technical@lists.samba.org; Fri, 16 Oct 2020 06:11:25 +0000
Received: by mail-io1-xd33.google.com with SMTP id m17so2463971ioo.1
 for <samba-technical@lists.samba.org>; Thu, 15 Oct 2020 23:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QRx5VA2jL04EprKBK7dDPa5Y1K8LOZnjXRlM9vGrDU0=;
 b=plyBMoUIxXDi9hd5cVmLlsJ6wUZiaFgkegrQX5t+yXOLekilh3/e31NsHKEFwmRad0
 IcxKUi50udKZIw+/RKtqtG26d4HsMNiqjLqaPfWZurnQdnkkBsfWgwGn6sjDdNr1QDJQ
 WACTkaX1NUG0k0qiWaW2PjtJ6dLfJo/uFpZMXrWrfWc4HVXaS4dt7wAOdqTFOz2tUMAW
 Sh4jgDAbH8VqpoWazjlD1fPMiNXA3ezo1OR8Qb2Ldb10TbZRJRyKB5f8fsO2VyghWRRo
 DUN8vcbGvytIKpI3Li4Z4XYNxsUuVW/hq8Tm0/o14Nf6b8r5iP7ow01vGHFsr9oNiPxJ
 h4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QRx5VA2jL04EprKBK7dDPa5Y1K8LOZnjXRlM9vGrDU0=;
 b=pgeG4d5Lu2LViNU8y/hCsZmAQZDigYuTqms9MpQfkuMESzny+zoyFjo7iQGfc6EWkY
 BWZEPmcxx/DgA9hwyw8OYhbYreQEfytHI5yI2jxHZY7qy8g07biLjUyzjau9dlMnbJuK
 5MkZaCpqWqUo75O6Q7YNBDiye5LfSVI7bnZX6SQ6qpUrs8tvZL1hOUtytSFxxFK3M3S+
 t31Hv6szVqrtnNXF59/cBJ12fwSAwze5yWGlVn0/JT3YUD9Tz2sG766oIzPuN4hwbg/l
 vI8KPSi2RCBAu56wh9qJoBu+XOshiJilWCfvgKZg9LN7qwukq7AMDs/rak64Oq2DtB6V
 cXOA==
X-Gm-Message-State: AOAM530H90NlctzIYJmFhwyWRl+l+pxRHh+Rp6sCmzFUE1Qdw84858l+
 0WHsPWHKy2ComtAiuVgQR+U9RD2PtnjGPnC8hyQ=
X-Google-Smtp-Source: ABdhPJwx9DQtlrknp8fQtePyBlOfOTUJ3/YpxF1EZWCjT38iyIFV7v9JZF70uZBRQqI4LZUO+8kdyKcBXWdXybCNC+k=
X-Received: by 2002:a05:6638:974:: with SMTP id
 o20mr1551672jaj.37.1602828679902; 
 Thu, 15 Oct 2020 23:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mtwBHTk-Xoeuo+RbgNwiNw-cWTAhdy1YG5y+vXnNDSv4w@mail.gmail.com>
 <bd8f21ed-5fd4-0974-f15a-16d2f3ee607f@samba.org> <87r1q3hixr.fsf@suse.com>
 <827fd43f-40a9-9480-a6b9-aea1fa69090c@talpey.com>
 <CAH2r5mt3t=FHVd8RtCyrzY6TUKb+rGENENXbKJBgUdq4T4Qe6Q@mail.gmail.com>
 <CAH2r5mu72VSPFhiLjL3YUtStXc1=B5SBP86+A5vEWFhLFyOJBw@mail.gmail.com>
In-Reply-To: <CAH2r5mu72VSPFhiLjL3YUtStXc1=B5SBP86+A5vEWFhLFyOJBw@mail.gmail.com>
Date: Fri, 16 Oct 2020 16:11:08 +1000
Message-ID: <CAN05THRAZnea1NUW7-h5jHsQ+yUpvxO-5KHGaFgKB87JxmWBqg@mail.gmail.com>
Subject: Re: [PATCH][SMB3.1.1] Add defines for new signing context
To: Steve French <smfrench@gmail.com>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: Tom Talpey <tom@talpey.com>, Stefan Metzmacher <metze@samba.org>,
 samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Looks good, but I think Tom's point is we should not put this in
upstream until the feature is officially launched.
In  wireshark, we can add these things immediately since any capture
files with these parameters will continue to exist forever.
See wireshark still supports pre-RFS versions of iSCSI.
But for cifs.ko we might want to wait sending to Linus until it is
officially released in a consumer version of windows.

Lets just look at SMB2.PDF and all the bitfields/flags that specify a
feature with description and then the comment that it is not used,
clients should set it to 0 and servers must ignore the flag. Things
can change until official release.



On Fri, Oct 16, 2020 at 3:50 PM Steve French via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Here is a patch to add a module load parm that is turned off by
> default to allow users to enable it for experimentation
>
> # ls /sys/module/cifs/parameters/
> CIFSMaxBufSize    cifs_min_small           enable_oplocks
> cifs_max_pending  disable_legacy_dialects  enable_signing_negcontext
> cifs_min_rcv      enable_gcm_256           require_gcm_256
>
> # cat /sys/module/cifs/parameters/enable_signing_negcontext
> N
>
> On Thu, Oct 15, 2020 at 11:50 PM Steve French <smfrench@gmail.com> wrote:
> >
> > > suggest wrapping this context and the integrity algs in some kind of =
conditional
> >
> > I have a couple patches to send the context (which I haven't merged
> > yet, because, similar to what you suggested, I wanted to make sure
> > they were disabled by default).
> >
> > Tentative plan was to have them disabled by default, and sending the
> > new context can be enabled for testing by a module parameter (e.g.
> > "echo 1 >  /sys/modules/cifs/parameters/enable_signing_context"  or
> > some similar config variable name)
> >
> > On Thu, Oct 15, 2020 at 1:15 PM Tom Talpey <tom@talpey.com> wrote:
> > >
> > > On 10/12/2020 5:50 AM, Aur=C3=A9lien Aptel wrote:
> > > > Patch LGTM
> > > >
> > > > Reviewed-by: Aurelien Aptel <aaptel@suse.com>
> > > >
> > > > Stefan Metzmacher via samba-technical <samba-technical@lists.samba.=
org>
> > > >> This isn't in MS-SMB2 yet.
> > > >>
> > > >> Is this AES_128?
> > > >
> > > > This is returned in latest Windows Server Insider builds but it's n=
ot
> > > > documented yet.
> > > >
> > > > https://www.microsoft.com/en-us/software-download/windowsinsiderpre=
viewserver
> > > >
> > > > I've asked dochelp about it during the SDC plugfest and they gave m=
e
> > > > this:
> > > >
> > > >      The new ContextType is:
> > > >      SMB2_SIGNING_CAPABILITIES 0x0008
> > > >      The Data field contains a list of signing algorithms.
> > > >      =E2=80=A2    It adds a new negotiate context, which enables SM=
B to decouple signing algorithms from dialects. E.g. if both client and ser=
ver supports it, a session may use HMAC-SHA256 with SMB 3.1.1.
> > > >      =E2=80=A2    It adds the AES-GMAC algorithm.
> > > >
> > > >      SigningAlgorithmCount (2 bytes): Count of signing algorithms
> > > >      SigningAlgorithms (variable): An array of SigningAlgorithmCoun=
t 16-bit integer IDs specifying the supported signing algorithms.
> > > >
> > > >      The following IDs are assigned:
> > > >      0 =3D HMAC-SHA256
> > > >      1 =3D AES-CMAC
> > > >      2 =3D AES-GMAC
> > > >
> > > >
> > > > I've been CCed in a Microsoft email thread later on and it seems to=
 be
> > > > unclear why this was missed/wasn't documented. Maybe this is subjec=
t to
> > > > change so take with a grain of salt.
> > >
> > > Just curious if you've heard back on this. Insider builds will someti=
mes
> > > support things that don't make it to the release. Even Preview docs c=
an
> > > change. However, AES_GMAC has been on the radar since 2015 (*) so
> > > perhaps the time has come!
> > >
> > > I'd suggest wrapping this context and the integrity algs in some kind=
 of
> > > conditional, in case this is delayed...
> > >
> > > Tom.
> > >
> > > (*) slide 29+
> > > https://www.snia.org/sites/default/files/SDC15_presentations/smb/Greg=
Kramer_%20SMB_3-1-1_rev.pdf
> >
> >
> >
> > --
> > Thanks,
> >
> > Steve
>
>
>
> --
> Thanks,
>
> Steve

