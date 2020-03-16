Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDD9186141
	for <lists+samba-technical@lfdr.de>; Mon, 16 Mar 2020 02:19:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=tdNus9zNxtSOm7qlUBtshsyO4JEC1pBu4ig8znf74kI=; b=YxP5sOaV0kn3V/rh0taUjz+761
	Xfug/tUiIsc5gHrBvWVi9fL3kZ5Gs7KHfGtuBezovXvo0mpRi1caKaebuGyJZo8zHDEU4Mxl5qZRX
	3s5UeRHPI8gt/DACluDmeMekbl0TkSMwb0E/k2UFO+CFHNg4bmC9xkQQR41l3juSHlJNrK8KDI3nE
	WQincqdkDKoHkPMqm99aykyQ4M5SJ+VjvrTQ3txdLzsmEegUNB6Fo6FCTq8xUi81FNfCUHtVBZO14
	9O71MDPNZIJv/74ZPZ0Lsf9WlLlqDNhKmvaQ3HaVquHY7SI5iLRV4BXfDXNTQab3owtjOg0tBRflJ
	dEyXjBnA==;
Received: from localhost ([::1]:36854 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jDePa-0002o3-HO; Mon, 16 Mar 2020 01:19:22 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:44890) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jDePW-0002nw-Ho
 for samba-technical@lists.samba.org; Mon, 16 Mar 2020 01:19:20 +0000
Received: by mail-qk1-x72e.google.com with SMTP id j4so6882839qkc.11
 for <samba-technical@lists.samba.org>; Sun, 15 Mar 2020 18:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tdNus9zNxtSOm7qlUBtshsyO4JEC1pBu4ig8znf74kI=;
 b=HLZx8I99a+P4axfDNAujOaj/sQ1oqWAkLLgslZHbQu3jOXcgPkidzv+SVdME8bPtHg
 SetElvl+jvyP8ArVe1imVQSMEAqraHsIHuO7It27JfTDq2shH5ZAqozXZfGuaKP3N1CI
 +RlGyyQFey82asFc2MLft70ftZNdw5QZllCoiOGR3l7TSkXuDaN62sQRFUYqsslaRb+f
 EvOtozGv6wxJHGalAc2mPYdOxZnhxQYkNijy6rsu8m9TMQmXPhJGWQPE5vCW1h9bapQ+
 zLn4wqFtX5DgonwWspODRTSHwSG1QRsHg9IO+RvJc+v3TTVTOwfI1cD4MBQRreyNxGHB
 FD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tdNus9zNxtSOm7qlUBtshsyO4JEC1pBu4ig8znf74kI=;
 b=ffX7qniDIxZv87dRkblxz/eGjoaPmyuwLF3MHpDsriUGd3y8hHPrlaoVyAKFxAwKBd
 Obkbw8X5AmgdzfuoYHuS1FwFVmax6uLFoqzHQrcxG/ev0hR6o77y6kOgwxtlGCgIv35O
 vpMJz42vntKqfR+kk1VxJm72x8tMlPbLPNQ0ftldN0MhNNpdPj+xDt+T3BvWXPbpozX5
 618K0TKgDpm+yCk3Bbqho7QWKDfW940Ux3L7jQzuzN4rWwPbp6d5ePhrjVidJMFX2XJ8
 TUF7ZnW38cA42DOA3A0n/2NQeqWZbzeU3wkqTwx+NJBGfGsTDMym+BQM7NgUfxvJ0ZU6
 kJbA==
X-Gm-Message-State: ANhLgQ3Ajln0S96+ClOS4i+YbrbruaeArOnWFLCSUV/DpNPDfRdwHwWp
 PMfFGYilJIvKwuyxxpMQsNhPzO2Y+2QYUEwDriU=
X-Google-Smtp-Source: ADFU+vvw/EgWwz9qn98zRlv/vkB/Ds3xaZkM10Q58FUN+jkPEolnt14MxubPuUTRaVB71Gb83IcXCHDVqcN0gHs8nAc=
X-Received: by 2002:a25:2554:: with SMTP id l81mr32492135ybl.375.1584321556736; 
 Sun, 15 Mar 2020 18:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5ms_oxqwHm56nzabM-x2XMR1Ni-WD1_LEYYxOW_NkswsOQ@mail.gmail.com>
 <CAH2r5mvN5ri_7x3dVah8tUft6Xxbjia9MSANZV04TkVwtqY9Tw@mail.gmail.com>
 <CAN05THSjfj2ZJCSEdgdEfiEcxG8=xd-e5zR6KrF8gR_O1Mxb7w@mail.gmail.com>
In-Reply-To: <CAN05THSjfj2ZJCSEdgdEfiEcxG8=xd-e5zR6KrF8gR_O1Mxb7w@mail.gmail.com>
Date: Sun, 15 Mar 2020 20:19:05 -0500
Message-ID: <CAH2r5mtO_dC88hNj-UAj61Oy2OA4XX+LKjftK_+jwwzXzdnwEw@mail.gmail.com>
Subject: Re: [SMB3] New compression flags
To: ronnie sahlberg <ronniesahlberg@gmail.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

fixed typo - thx

(and also added acked-by) and pushed to cifs-2.6.git for-next

On Sun, Mar 15, 2020 at 6:10 PM ronnie sahlberg
<ronniesahlberg@gmail.com> wrote:
>
> Typo in
> +    __le32    Repititions;
>
> otherwise looks good.
> Acked-by me for both.
>
> On Mon, Mar 16, 2020 at 9:07 AM Steve French via samba-technical
> <samba-technical@lists.samba.org> wrote:
> >
> > And one more small set of structures for the updated transform header.
> > See MS-SMB2 2.2.42.1 and 2.2.42.2
> >
> >
> > On Sun, Mar 15, 2020 at 5:50 PM Steve French <smfrench@gmail.com> wrote:
> > >
> > > Some compression related flags I noticed were added in the latest MS-SMB2
> > >
> > >
> > >
> > > --
> > > Thanks,
> > >
> > > Steve
> >
> >
> >
> > --
> > Thanks,
> >
> > Steve



-- 
Thanks,

Steve

