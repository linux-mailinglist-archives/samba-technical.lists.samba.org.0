Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 094701A7076
	for <lists+samba-technical@lfdr.de>; Tue, 14 Apr 2020 03:15:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=2sFM4m+/5d21PqXw6kWTfIsYI0G/LoNNZv0ieGfL4mY=; b=PzxyMHQHlxCyzUtsu1K+39OvhL
	Vs83aGmW33byXEeV5iGWdLfmtCgv9BLuCZQ1d0BEGykDAvd/AWExyjzTnwWibeyWUlbU9j1L3bxmK
	T6znhLEmb8UuOjAY6rqdVRAFYghPTAbSg/sZ9pok0Nlk65osKTbMUPcr5SiFoIvIsZLjh+nsUF3qD
	s9Vq0oHkoISzVqJMAvf0cLmW8thftPFuheJB3cazT4GQhnlTrX8Y9W87mbI4hKBkxepD2P1VHHfdu
	Zsh9unr0sgdTKr5a6UkvM/UXucfdc6TPxNysApXRuqxA5Ni4Eiy6D6QsT/6to3lbrVBduDvwEhTfb
	wpHTuIDw==;
Received: from localhost ([::1]:55620 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jOA9B-000eFE-P3; Tue, 14 Apr 2020 01:13:53 +0000
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:36149) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jOA95-000eF7-4n
 for samba-technical@lists.samba.org; Tue, 14 Apr 2020 01:13:49 +0000
Received: by mail-yb1-xb44.google.com with SMTP id n188so5740096ybc.3
 for <samba-technical@lists.samba.org>; Mon, 13 Apr 2020 18:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2sFM4m+/5d21PqXw6kWTfIsYI0G/LoNNZv0ieGfL4mY=;
 b=fmR7HTlFN8bGdgVEuVFhcrWDbj6/YppDbyyN1mukit2yis/44I+arnJOqNlnimdoNM
 ldNi1L6NHj9Mc93EwF76K3W3Fw/R1It1LhVbLGjAupuzpwhjFdzknMpjOB6713LOHl2/
 HcAuhVo57ujEqqMjbM3CSmBvX+8DAMjlQbEIkL6iMf3EiDXINCqLyv76wzM5hPYsLhhC
 rJepqxkg9AjLLcRLKRycDDh5sks4o7r9liuYZlvRIR7KCoGAnS8M3YBuUQsKxzbkjl6G
 885j+DnhsY3coLPx27US9GZlz35DY4FbvfO54ht1IYJL9Zp/WgfqQ8D6lLaPlH1gjXod
 wgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2sFM4m+/5d21PqXw6kWTfIsYI0G/LoNNZv0ieGfL4mY=;
 b=izTs2MezDf0l4yCvmR2fHRjd9GG4Cs4JeRrIHmaYdxC70ZW3uWQ8Td0yCjG0KBFz5P
 UPsBh70V2BeSOBV3wEuikEFMaluGEHujDUsHHNO7ZlZwwJBJXoHqVIrihPbMTHrgdNmS
 8KworTuAB8HDBG4/omX33i8ozmclRUaJsqBCmMFzEIXelMxEu+070qcHZZzc6YNo3fBi
 IQlYgezG0ixoNYsR5TtuMv1GkKBN5CDC6tX18wuP5dzLKfpu0FTFb6VnuM+ZGKnJfW6J
 OaJ2+mHXYgSeYz2zgvMRMlgIiqya7QCbzseKlxizHv7n+TPgPDMXefNTwf0eFJ7s/KgM
 cgOQ==
X-Gm-Message-State: AGi0PubizIefFCRZdwnZjeuqL6ETIv9lXAGPtr5rHqtW4JMX6XKA7NBw
 yimG67tOLIxWL44HJf7urvhuukOyizsJon21xEE=
X-Google-Smtp-Source: APiQypIRYMTbUeX+KJRP1eOtVtG/KITpkD0lHYLP/DV/y5FEmDRT58Z7li7yhzS//x4ix2pavP/YpuAas7Yhp/BuvNc=
X-Received: by 2002:a5b:443:: with SMTP id s3mr31274381ybp.14.1586826823528;
 Mon, 13 Apr 2020 18:13:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUGjKiLPQP9wp0AgLUvHgKBOe9We2a-RQaZ7cd7CvhnarwWiw@mail.gmail.com>
 <CAKywueT0Q9WkANNsg8cEDwGZSMaaE5c4LHuEeMhVDzJAzycroQ@mail.gmail.com>
 <CAEUGjKhSBNQboKOMFMgos9OQfxcLQZsXp8aBrUSFcaSe1saH2Q@mail.gmail.com>
 <CAKywueTsaRfut9C4qj96Qc5VaeuRKO2WjahS==bz5kAqWB1KNQ@mail.gmail.com>
In-Reply-To: <CAKywueTsaRfut9C4qj96Qc5VaeuRKO2WjahS==bz5kAqWB1KNQ@mail.gmail.com>
Date: Mon, 13 Apr 2020 20:13:32 -0500
Message-ID: <CAH2r5msxaB5tC=09Kz3AoFb2e6x55V_HHWoqpYPAa4-pXhP71g@mail.gmail.com>
Subject: Re: [PATCH] cifs: improve read performance for page size 64KB &
 cache=strict & vers=2.1+
To: Pavel Shilovsky <piastryyy@gmail.com>
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

merged into cifs-2.6.git for-next pending testing

On Mon, Apr 13, 2020 at 11:39 AM Pavel Shilovsky via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Looks good, thanks!
>
> Reviewed-by: Pavel Shilovsky <pshilov@microsoft.com>
>
> --
> Best regards,
> Pavel Shilovsky
>
> =D0=B2=D1=81, 12 =D0=B0=D0=BF=D1=80. 2020 =D0=B3. =D0=B2 19:23, Jones Syu=
e <jonessyue@qnap.com>:
> >
> > Hello Pavel
> >
> > Thanks for kindly reviewing!
> > Please find the attached v2.patch.
> >
> > --
> > Regards,
> > Jones Syue | =E8=96=9B=E6=87=B7=E5=AE=97
> > QNAP Systems, Inc.
> >
> >
> > On Sat, Apr 11, 2020 at 2:25 AM Pavel Shilovsky <piastryyy@gmail.com> w=
rote:
> > >
> > > Hi Jones,
> > >
> > > Thanks for the patch!
> > >
> > > It will work although it is probably a little bit cleaner to
> > > initialize server->max_read to server->maxBuf for SMB1 and use the
> > > server->max_read in the readpages condition check instead.
> > >
> > > @Others, thoughts?
> > >
> > > --
> > > Best regards,
> > > Pavel Shilovsky
>


--=20
Thanks,

Steve

