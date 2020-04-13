Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BE31A6A0A
	for <lists+samba-technical@lfdr.de>; Mon, 13 Apr 2020 18:39:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=5m0R0HH7xPMq9eV0wmAE5UEDNS7eZKBSnZWMR5kVcDw=; b=CLyzibdOK1jixGYyi7JAgUqSVt
	2SyfOBMoUXYWiezJxEBRbkhBxSk7xX5vglIBPGA2R5uWXZWGH9LUY+vIyqw97Fkf5cma++KAhPN/L
	IyIbDti4u/SKOW1M6jqMeG4Toa/CMuU9f4U8OVb0taLj7qRii4sdmfS9QQ32JGO/JSKhkhdMNjFrT
	fw39hp78O4IWWdt986V/EKwMpcpBueZqOZyJvUBejbRsAcxBtOylr7OKK9Q24VYU5HnM3+NAlY1Ji
	cUQnAH/SPIWEPZM3usd/+xTJonRm0QPHS8YBkgsa3myZS7gqSul6/ju681uY5Wg8ZoHWBboJNENn7
	eRMkOuCA==;
Received: from localhost ([::1]:48914 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jO25w-000ccq-Aa; Mon, 13 Apr 2020 16:38:00 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:36056) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jO25q-000ccj-4D
 for samba-technical@lists.samba.org; Mon, 13 Apr 2020 16:37:56 +0000
Received: by mail-lj1-x244.google.com with SMTP id u15so4838641ljd.3
 for <samba-technical@lists.samba.org>; Mon, 13 Apr 2020 09:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5m0R0HH7xPMq9eV0wmAE5UEDNS7eZKBSnZWMR5kVcDw=;
 b=gkp8FwXMYf5wvGgoKzptwHCycc7Ie2RYdjk6B0M83HhH/7yF6wQOB6lmwLhkWGXPFS
 3jFIkxEWYMSbRYovjFGWQWtFgRMV6GX5T0nttEM9mjdG2UdM5KwlRqDGRex1qy8IJtT8
 AixbzhT0O6by7knmIcP9NQFxzMo0X0V7MQllsWgpwhtfmcdHnBv7QCE6lPAj5DRVVlIh
 +3zUnM30fa2Eqs8pWZ9gRci0tYxna4mZOZtsg8e6spoAOBjuoMlirOgwJNNxUzZqv7Yh
 eTL5eDwfSSFf407pWo1BJ/ENmoQ9Chd/KPOTiG75kDg42ZCgWhSClyp++045164UqYYL
 WFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5m0R0HH7xPMq9eV0wmAE5UEDNS7eZKBSnZWMR5kVcDw=;
 b=h4zk8KhUW7R8KSMxpS/OtQZ/W7WTxQ7aHQbKGeUZiVViFvNkS8YVETuBsEYtBX+MNq
 N9o24RsWWwXsyBJzR/y4sb/ZopB6sN352evvmR+KhEsjUEg7wLNZ6BLir50IsvogdMG6
 qrsbUXGBToYeBlj0A7VZbo+hLHwg8XDCXZ2BBjjvWuNKwB0wJEaKV6Dy8XB+nZYjKNlG
 DnIfUEsQL55OR7ocR+PmkT6RGQl0Pf++QF+LZ+EQi+cLJzSQ5LQGUQOBq70C5d35ZZMk
 +4NzJhDzBG+y3r6JUmYtbb3dwsIisPaBfQ7zkRal2/fhlQTeio/ZtGXEIJrikltkoS8l
 9KqQ==
X-Gm-Message-State: AGi0PuZBny0IJG6St6Yz2yvAsWqzpT7hIy661b1re1Z9DsWAS4Vvxbv/
 2+Hs32watXmEeMhnbImk8nOckWyam6pPC3A1Og==
X-Google-Smtp-Source: APiQypKwJ7dCuFOX7Y93nrccvrccezhTEhgLknrZUISWmmHboFRRxHEMB6PMFWIu0dTkl7gqf/FfWgTspjJhsV2Eemg=
X-Received: by 2002:a2e:b53b:: with SMTP id z27mr2036328ljm.109.1586795870329; 
 Mon, 13 Apr 2020 09:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUGjKiLPQP9wp0AgLUvHgKBOe9We2a-RQaZ7cd7CvhnarwWiw@mail.gmail.com>
 <CAKywueT0Q9WkANNsg8cEDwGZSMaaE5c4LHuEeMhVDzJAzycroQ@mail.gmail.com>
 <CAEUGjKhSBNQboKOMFMgos9OQfxcLQZsXp8aBrUSFcaSe1saH2Q@mail.gmail.com>
In-Reply-To: <CAEUGjKhSBNQboKOMFMgos9OQfxcLQZsXp8aBrUSFcaSe1saH2Q@mail.gmail.com>
Date: Mon, 13 Apr 2020 09:37:38 -0700
Message-ID: <CAKywueTsaRfut9C4qj96Qc5VaeuRKO2WjahS==bz5kAqWB1KNQ@mail.gmail.com>
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
From: Pavel Shilovsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Shilovsky <piastryyy@gmail.com>
Cc: linux-cifs <linux-cifs@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Looks good, thanks!

Reviewed-by: Pavel Shilovsky <pshilov@microsoft.com>

--
Best regards,
Pavel Shilovsky

=D0=B2=D1=81, 12 =D0=B0=D0=BF=D1=80. 2020 =D0=B3. =D0=B2 19:23, Jones Syue =
<jonessyue@qnap.com>:
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

