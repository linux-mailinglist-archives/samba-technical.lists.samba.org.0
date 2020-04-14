Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D44B61A8BBB
	for <lists+samba-technical@lfdr.de>; Tue, 14 Apr 2020 21:59:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=GNxgPPM4n2ujMawZGS0HyHorgM1gpVp/anc4VzVl3U8=; b=3lK4HL6IkoqSsn4ssGMPGtZb9g
	cT9xtyOsR9QWHh6LhaY/WVllYAQrEARirPjC3AlZJIjXVNmJKQ3FJnzU00YLOeoGK8xgUmy/+RZgr
	dMkYJ2BmMabhXkHyjEmr3Xq+wH0wMbthmJ1Rja20hjzZNL/Ld8d/yoNBv0QiZ7x8c11RkxrcdnOYj
	WpNNIeQyQCF2iKENrgq6Xicgy7uWsjySs0+ICOmgmDJp/l+gX+2o4IU4oy1O5og4dLX/iD05c3qlr
	zwl0DKLxuJ09zI8xpYINAmmDvwgubxZ4UkNybLCuatjSsv8xFnmOVRJl7HRipOXJSDIlKWIeJtl75
	Wn+oy4Cg==;
Received: from localhost ([::1]:35742 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jORhs-000juk-Ch; Tue, 14 Apr 2020 19:58:52 +0000
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:42589) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jORhm-000jud-Qd
 for samba-technical@lists.samba.org; Tue, 14 Apr 2020 19:58:49 +0000
Received: by mail-yb1-xb44.google.com with SMTP id c13so7868011ybp.9
 for <samba-technical@lists.samba.org>; Tue, 14 Apr 2020 12:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GNxgPPM4n2ujMawZGS0HyHorgM1gpVp/anc4VzVl3U8=;
 b=mUXhWcLskvqOcwmIDaztUH/RxMxbg4sS/9GYSD08uGIEVyl0iz5WH10Ounm4jH3bP6
 Bc+znuOupuZWbV2UIvNrxIE69HdFLORK6/IbFspNMefhoC2TrA/gpeaAkIVydH+WCACW
 oAjJLeKQqhAxADjapWPVoHTp6dmMIZpYPHA4C012WPe/YHLabmYx9OHJHydOfJmoF1BG
 RUglQAsacRDOUfVOmrH11aj/m0+0ozDIsEqa2ZK8l5T3Tdi34fw9mAS6JZ8RkB/i8cV0
 uCmcemCp8Ri92TqFucj4fEHTZAAd3abOlg53bHe8Ge8qhRNjdwRMR6FK/GvwsnXbh8bd
 nDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GNxgPPM4n2ujMawZGS0HyHorgM1gpVp/anc4VzVl3U8=;
 b=fp/uxGjYLafahTgEU6ghLrKvIpyEmHglwHIhAZACpDl76eja2nmiamapNGQe/aa5ay
 uanOXWvLMaPvhMTxSi4mgC8XJVCVIuBK6A0o0aDtgXkAEX3l7Pu2vTUA93+TmUiJq5I8
 0Y0F8NEgGVYXaJlHQUdSPL4x+QSf1xmXvGWT/v6mvzWy/b8CudzYTp0A1OTbcgbxlILX
 Apc+klDnpD/+6GDv9Z1X2sXuZPGSRi54+N9sgETPEsbFXXjft8YW4JZZZZ4fz7h4a943
 wJtbEYbip/YW7NlSZfzks3YbBciDLc8AXVnhJFQXt2xraZIrGObW2isHSy+UToU8So7e
 ZE8A==
X-Gm-Message-State: AGi0PuZs9z0jOm2F24TASjG0DCVIzvpm3H+H8JueezliFosOVwv8+Te6
 3IUiY8mEaSiWcr7t8ss1YZ5QMgCLQ4ZSMiPUORs=
X-Google-Smtp-Source: APiQypJN5cWKfU4KSqHxDKZJHAGcb3fPrJTJAFfYVdg0wvrOrwPXCVsAsVoQ1s1vQir2tqnSureNzNJq3rjM6EsKb4Q=
X-Received: by 2002:a25:b78b:: with SMTP id n11mr3040477ybh.376.1586894324869; 
 Tue, 14 Apr 2020 12:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUGjKiLPQP9wp0AgLUvHgKBOe9We2a-RQaZ7cd7CvhnarwWiw@mail.gmail.com>
 <CAKywueT0Q9WkANNsg8cEDwGZSMaaE5c4LHuEeMhVDzJAzycroQ@mail.gmail.com>
 <CAEUGjKhSBNQboKOMFMgos9OQfxcLQZsXp8aBrUSFcaSe1saH2Q@mail.gmail.com>
In-Reply-To: <CAEUGjKhSBNQboKOMFMgos9OQfxcLQZsXp8aBrUSFcaSe1saH2Q@mail.gmail.com>
Date: Tue, 14 Apr 2020 14:58:33 -0500
Message-ID: <CAH2r5mt1k5t8rSH1KizeSrcLaN1Fn3GWeMvDPwT2Kfq43UAWaQ@mail.gmail.com>
Subject: Re: [PATCH] cifs: improve read performance for page size 64KB &
 cache=strict & vers=2.1+
To: Jones Syue <jonessyue@qnap.com>
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
Cc: linux-cifs <linux-cifs@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Did you also test (at least briefly) with vers=3D1.0 since some of your
code affects that code path too?

And if anyone figures out how to configure an x86_64 Linux to use
PAGE_SIZE of 64K or larger let me know...

On Sun, Apr 12, 2020 at 9:24 PM Jones Syue via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Hello Pavel
>
> Thanks for kindly reviewing!
> Please find the attached v2.patch.
>
> --
> Regards,
> Jones Syue | =E8=96=9B=E6=87=B7=E5=AE=97
> QNAP Systems, Inc.
>
>
> On Sat, Apr 11, 2020 at 2:25 AM Pavel Shilovsky <piastryyy@gmail.com> wro=
te:
> >
> > Hi Jones,
> >
> > Thanks for the patch!
> >
> > It will work although it is probably a little bit cleaner to
> > initialize server->max_read to server->maxBuf for SMB1 and use the
> > server->max_read in the readpages condition check instead.
> >
> > @Others, thoughts?
> >
> > --
> > Best regards,
> > Pavel Shilovsky



--=20
Thanks,

Steve

