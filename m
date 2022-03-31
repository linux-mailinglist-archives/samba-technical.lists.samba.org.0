Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6134EE48B
	for <lists+samba-technical@lfdr.de>; Fri,  1 Apr 2022 01:13:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=KvJXahkHc6TiQC2hsGgCt3btDQ/pJ53LIo3yqoeBs3U=; b=GM7dRzCKmq13jhPF+qbQIVvGgd
	U4dniiPO4hRMK67eKFszwmMfP5GYF5cVcD2PJ6QXxxt/kiv5tAXiCTT+/pVAovgX/zEiexcJmwqSt
	bJ559UQ8cSR4t+q9veuFBjKkZLQHnV1wpKBrZ48G6TJhxd6LlOTvmCBrAXvqP3TeaeIu8gkfjhYie
	735Y8rlwq8QS0LRZHg+d8BLrwtU3v3Ghqf2yySY2MEELw+EfXJsGu/fMnP4OC1f+XystoWxOWUz2U
	tniBf+aTTQUSQ8pGM1nxTWrXyDUdPlK0movrCtIdj0QmOJm9ptr02mhDwI95W+6sMYpzteE7fdZG5
	Vd/cPpZQ==;
Received: from ip6-localhost ([::1]:55764 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1na3yH-007HSO-Cj; Thu, 31 Mar 2022 23:12:53 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:41864) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1na3yC-007HSF-1f
 for samba-technical@lists.samba.org; Thu, 31 Mar 2022 23:12:50 +0000
Received: by mail-ej1-x62b.google.com with SMTP id bh17so2327771ejb.8
 for <samba-technical@lists.samba.org>; Thu, 31 Mar 2022 16:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KvJXahkHc6TiQC2hsGgCt3btDQ/pJ53LIo3yqoeBs3U=;
 b=OOq8p1M+aVdTpex338Ucle4wEDjRYo/wJhkJ9bG7oSbkMiRgZ7WQAAM9fAf8kEsnfn
 ykI/3SUEdgct8NT/XeO7EoHOv87HP9Ss8hoyeZXRWfj1vRcPucXI1Fre768c0Ql3E5c6
 +A56uY59k8s1zgm39smfttwRlD3ULTszTR6KJ+N9Vg5UBGBXQH3r65WMrNu0HrbJThfg
 AuHd+HxI/2eHvQrNj1NbnqpQMWmW2WHUtgsEYv1Bf9X5xJv+4ztpBPx8nij6rPoUU/h9
 z3XltRRev2O79XnxCfhEsreQaooAz8byqWMx6KRLgk/x0Oc9MJhr4wzWtheQR6Go5DQx
 vtDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KvJXahkHc6TiQC2hsGgCt3btDQ/pJ53LIo3yqoeBs3U=;
 b=ewrlV6BxLl++z1QKMnyV9gQHQe3ziiN3A6rTOs9DnoKqY2pm9SOmSa8GDR0hOSUUw8
 3b25aOEfz4yDm7my7RNViiKgmicCDntoliKzzRFiu2hUA/LoY5UJm4tbSD3vBs8LVZ9E
 6xOhyvovna22McXnSBhYY6uUTh6ndZo0VDRStgHwVW626Tbf7CGXp7b8MVIwtFq9QX36
 /O301FbhT/MYzXlroknMe4/QvOPUE1udLL6L4nGlzSaxxOdY9xK3RkNG6afRG0sD5As5
 NXuZzALzKu2Esz+fT18FKnF2YWLJfuCKs9T4J6HP9KrCft1woN6vSGXiHmDYFP9HLoI/
 QRlA==
X-Gm-Message-State: AOAM533ws5QpvV9XWxj0NG9D3tudPV8ROK41gRiAA3rc8IT3m+BVX9L1
 78h73ZtbQpy+nlKunGKyfHjehD+9M+9zr+9bnXELc3E=
X-Google-Smtp-Source: ABdhPJzzQuWHezKJ+vW3dlPUvowxqI9kqMpZwdSr2Z5186nhJQrsOPgKucEMwHIfUdGw67hN1vWbjzNR5mHx/lV/fA8=
X-Received: by 2002:a17:907:1ca7:b0:6e0:346:ca6 with SMTP id
 nb39-20020a1709071ca700b006e003460ca6mr6759744ejc.311.1648768367121; Thu, 31
 Mar 2022 16:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAAQNcwukKj0fXtbFW7A3nm4QOiVG-H4L7kHG30mGkyX_eJBz8A@mail.gmail.com>
 <YiFgXtz5W26CZRbm@jeremy-acer>
 <CAAQNcwtc1SbYNxRRf6_F50sg8cYgFc4bBjxaVFxsPP+JOdU=jA@mail.gmail.com>
 <YiKZYnFjAm0fbMX2@jeremy-acer>
In-Reply-To: <YiKZYnFjAm0fbMX2@jeremy-acer>
Date: Thu, 31 Mar 2022 16:12:36 -0700
Message-ID: <CAKywueRDRwg_eyVjFDfFZhxCwC00aAELMa432Z-PLHtWDtjkZA@mail.gmail.com>
Subject: Re: [PATCHv2] cifs-utils: work around missing krb5_free_string in
 Heimdal
To: Jeremy Allison <jra@samba.org>
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
Cc: atheik <atteh.mailbox@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks for the patch! Merged.

--
Best regards,
Pavel Shilovsky

=D0=BF=D1=82, 4 =D0=BC=D0=B0=D1=80. 2022 =D0=B3. =D0=B2 14:58, Jeremy Allis=
on via samba-technical
<samba-technical@lists.samba.org>:
>
> On Sat, Mar 05, 2022 at 12:51:43AM +0200, atheik wrote:
> >On 3/4/22, Jeremy Allison <jra@samba.org> wrote:
> >> Does cifs-utils have a libreplace equivalent ?
> >
> >I have no idea about libreplace but cifs.upcall.c of
> >cifs-utils already has a lot of these #ifdefs for
> >compatibility between MIT and Heimdal KRB5.
> >
> >> Wouldn't it be easier to test for the existence of
> >> krb5_free_string() and write a libreplace wrapper
> >> function so krb5_free_string() can be called from
> >> all code without #ifdefs in the main code ?
> >
> >This patch adds just another #ifdef to cifs.upcall.c
> >so that cifs-utils builds against Heimdal again.
> >
> >I have attached a new patch that doesn't place the
> >#ifdefs in the function body.
>
> That looks cleaner to me, thanks !
>

