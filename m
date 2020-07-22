Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B806228F89
	for <lists+samba-technical@lfdr.de>; Wed, 22 Jul 2020 07:09:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=70yCi0FEAOU3112o2JYk+gRGnM2935HzsnfIsc/CW2g=; b=fFhQj2ELadVTyHKKJMOFh28FhH
	qGFgQCE0abLKsTaSSxsbKvy+MVggg47zEChUDglK2cd/aeHoMtqmy717o0Wzec1UvkuRh2WDBVWQr
	VmWu3GCflJwfEvhyH2kklAkggfSPdckCWNi6uM+qmXLFqPI99exNPYwZ2dUa/acgOJ9DnGmfJQMnr
	SCFUvJ0One1Ln/gIjq/qz2EhOk1qH4nFDge6g/2n87+33+zW9pCnod22MQgLnWhfLbJ4UsbV8UvWH
	FIzcO4VrJOP96KbD9FUMHwgiRBqH47BBDlAN82i/N//j+dTaSU5qXkaxSg8f8Mybor9MhkBIX5x1R
	I6/nJHCg==;
Received: from localhost ([::1]:47030 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jy6zL-0096ZH-5Z; Wed, 22 Jul 2020 05:08:19 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:33963) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jy6z8-0096ZA-Os
 for samba-technical@lists.samba.org; Wed, 22 Jul 2020 05:08:15 +0000
Received: by mail-qk1-x743.google.com with SMTP id x69so892963qkb.1
 for <samba-technical@lists.samba.org>; Tue, 21 Jul 2020 22:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=70yCi0FEAOU3112o2JYk+gRGnM2935HzsnfIsc/CW2g=;
 b=VEMpVKuF+PUHyBSnTnBwmOnqeB4PdcJAfKaqMd4vephBU8n7/iKcpn7Pm99LWByLoo
 XxMS7Tgu6YAQFecaIItsID+lVkuC2B/qyrgD5o3lTegWkSqNdfe+6qUvB0r0C/hibHUz
 tTq8GMl/jz53Isyee4nx85iZ9g99EOF81H/WCUlgL+bjJtgtFpI2sT/ZyEbLQFN8w5TI
 F0BNo16pWxKzptEiHqSlnZMIOrEJfZU9FKd2XseW+o9lKDOzhCC0JsJAJCvT8/I0CXPx
 DrVG7zL1+okY4DgyZs+7mpAf6Lw9IwUNC/nNY8yTSNwtTDL8YeP0VOC3XPDawkDgF+9R
 CHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=70yCi0FEAOU3112o2JYk+gRGnM2935HzsnfIsc/CW2g=;
 b=qR5pqza4QrREsgaj7Sy2pWdT9tvOxdYoD/5FlTez3OEJQSQBYgsA3cAeCtBq+fKfbW
 ZZQJkh+eU+AKVHnuBWNsVTjbLRZLdRABf1NUgC2roAbvGXITYQs+bKt0PuZdv2mM8jlc
 XOZLB2wftalo9hYTmSB5giBvBlcEqV7y6UK2qcH8ak9VD1qQzNRcvg+WWjFBEsKnCDb+
 8Wn1cqkVaF5GJYVknrg0bYR8Y/IsDQ2H4AsxVLJdum/NQdVaRI6k3fRrRIddpKT5FxwR
 875vaWqLU1pgQyiD4nol1IGATG6GWMVX+WvNt2cBN59QQmQxtHKIDkOYrtuz0++Oizkb
 yVrw==
X-Gm-Message-State: AOAM531Y4ScWIP4CkDlmsjv0SWiou4V2ZM36oIo5eM6uj21DBbX7szku
 RZjYWulT08Z3/SYzRWqFDEmUjEwQlFYAVvHOBPI=
X-Google-Smtp-Source: ABdhPJzMLTpHBB4E7yPvmVdYX7CNwpb/ef29ix+UdNlIXxTdw59iQviYgpfD7phZRf9/hbTIzo+R9XsfQAZtShXGFXk=
X-Received: by 2002:a37:458f:: with SMTP id
 s137mr22712420qka.129.1595394478825; 
 Tue, 21 Jul 2020 22:07:58 -0700 (PDT)
MIME-Version: 1.0
References: <b14432a4-bb8c-7a0f-4339-b7e6ddec9b4a@arrl.org>
 <CAH2r5msj3KMMonyhjDeyAweHEBezOHFkJwCUXpJ4Gv59Q=S9bQ@mail.gmail.com>
 <752d5d05-7b91-b119-b5a6-7fcdeb1f0ced@arrl.org>
 <CAH2r5muNtwm3V-0GpaRBXmrptGDO9w1vDSWN9Wrf_eebuevg6A@mail.gmail.com>
 <61450b64-ed70-6b8f-2beb-57267ddcb8c5@arrl.org>
 <CAH2r5mu-g-RrR9Q4ghmqjkd-mbXbfeJE=HgVSaEEosCyBNoO8Q@mail.gmail.com>
 <119a0298-4099-c65e-30db-746814e36cce@arrl.org>
In-Reply-To: <119a0298-4099-c65e-30db-746814e36cce@arrl.org>
Date: Wed, 22 Jul 2020 07:07:47 +0200
Message-ID: <CAC-fF8TB7C2TOv9-mT68teA7hJJ0jY5YG0vW6A2OcnD_wmqTpQ@mail.gmail.com>
Subject: Re: issue -- cifs automounts stopped working
To: "Michael Keane, K1MK" <mkeane@arrl.org>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Shyam Prasad N <nspmangalore@gmail.com>, Steve French <smfrench@gmail.com>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jul 22, 2020 at 5:48 AM Michael Keane, K1MK <mkeane@arrl.org> wrote:
>
> Tried setting KRB5_CCNAME to KEYRING:persistent:1000 with no change
> (Also tried KRB5CCNAME  as well, as that's the environment variable

Indeed KRB5CCNAME is the right variable name, you can also run the
upcall with KRB5_TRACE=/logfile to get more insights what the krb5
libs are doing.

