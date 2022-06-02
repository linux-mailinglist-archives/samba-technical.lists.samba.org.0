Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 178CD53B244
	for <lists+samba-technical@lfdr.de>; Thu,  2 Jun 2022 05:51:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=IBdNYD60efGATnwpUuCo8jNHsQwHl2PtmLe075HGPb0=; b=kStkfVYj/JyThM8wRrfDvUGipN
	JrliABmbdFg7M0T6Kx+f8Ctf5yGDUjhPqZlGsWTlGT+TDC+73XWZiQ0K1vsWOnSDPnQxcQdZHMKuG
	UF0cuP4Rf0omWHXlDBhob0CtGjkZb/AA+URTRPBDQeHFqXAOWmU6NUZYu5tF5tlPrlqbfrkbkZ6An
	uSE9N5laNWn1Xld/qQXSmZKNETh9BUH2ivVGtytP35W44xqj3qm+Bb/E0nLjmJGNYI85qD1tTW6l6
	Ywi4uJxMSIYCW7Y+KHgveB7wL0BqlV04LXS4mFIoTU9frP1ZC+WXp8WF5FOQxT3uMFbY55Oe6rfJZ
	9WHmqsLA==;
Received: from ip6-localhost ([::1]:46236 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nwbrT-006U6m-Oa; Thu, 02 Jun 2022 03:51:03 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:37701) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nwbrP-006U6a-8u
 for samba-technical@lists.samba.org; Thu, 02 Jun 2022 03:51:01 +0000
Received: by mail-yb1-xb36.google.com with SMTP id h75so6263184ybg.4
 for <samba-technical@lists.samba.org>; Wed, 01 Jun 2022 20:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IBdNYD60efGATnwpUuCo8jNHsQwHl2PtmLe075HGPb0=;
 b=Pr49W4Xjh8gto8paMDyhQwa/LU689IVKzqSXy8dFqbzGFK53amCPZPGLPX6ShMLPy5
 jgOU8DLUteOd1fF9b5z07z0eUIa080Yod8816PFBvCHZuP86nUMwoJfP+x5JarEsgZ4d
 3lfLgB1q6O6ftEa3vM69SrA5CJ38ZH6raAPwg/RwUgNBCoExy5J0BZ14R9cMvIT51kfh
 F4xBBTCeLr8zFoJqayR5lt+zFj9+g53MvleMcuPCx7IXfJLW2J5FaeCLXDLPFlnJQ/g9
 GGmGw2xJsQiUmSCnAyhbXYDvj5AVbUb6NxTrie68vXkyIsFOhuqmBlAhW5aEiZ3XHLE2
 4lTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IBdNYD60efGATnwpUuCo8jNHsQwHl2PtmLe075HGPb0=;
 b=PFYWQ+DqKWifdNJBHruwvvbBacWnjvPnP61PjS3tG5ry9+56DqozqNfrjPys7V8+/Q
 BQep9gY7HFmGZ9Vsfwin3vSt5J+BcvGWFFge+U7npVgiHik1ubFbuiCG9Tuqa3Q/+N6w
 PAoI9CbWfAvdjFBjeS605G9XhcX6k1t3nZ4M9B+w3/p7yHsUIpErIIQL5ciL5X3lRPdT
 SMU4AnfCU2C5iuHvTIsK8UqwCXLCsNuJHBAO34S55eV6LVAARGdmhuYkC/Vyx/xiEg4l
 vYHFDIIVeBolksJK7qd6TF2J/MLVYCWsrpx1pCTYA3liiS81QSl+l0GayLOr2ybn8+jB
 LCPg==
X-Gm-Message-State: AOAM532cjymywHv3MwX0T6rPkZ+9jSs/Y7BiEc8bRlt9LFGBv4+KXyUI
 eyENGBuqyaDdJzFLCmnaeF+TS87UdxGIh3lz/40=
X-Google-Smtp-Source: ABdhPJzDB+OHYG9BwcCexRyKhjKP/8O8uLhNZEeYaPbqIeyKQGYCVqb4ZE8N9IfzdV9Zta4ZRV77q0S2S920LHuswn8=
X-Received: by 2002:a25:fe08:0:b0:655:85c6:af82 with SMTP id
 k8-20020a25fe08000000b0065585c6af82mr3153036ybe.150.1654141849171; Wed, 01
 Jun 2022 20:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mtUe2f0xi5zu0Np0bkyv7K9BKKgUkUJp2b25BteHBFjeg@mail.gmail.com>
 <CAH2r5mufZdKWrUGbp0Pha5C6YrYqUR-=vT2Pw8TixtzVaQuk0Q@mail.gmail.com>
In-Reply-To: <CAH2r5mufZdKWrUGbp0Pha5C6YrYqUR-=vT2Pw8TixtzVaQuk0Q@mail.gmail.com>
Date: Thu, 2 Jun 2022 13:50:37 +1000
Message-ID: <CAN05THSsPTYBfKyxvO7eO3mOViEi+KFG3a_V9qhwG0yu02OX3Q@mail.gmail.com>
Subject: Re: [PATCH][CIFS] Do not build smb1ops.c if legacy support is disabled
To: Steve French <smfrench@gmail.com>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

looks good   reviewed by me

On Thu, 2 Jun 2022 at 13:47, Steve French via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Another minor one to remove some unneeded SMB20 code when legacy is disabled
>
>
> On Wed, Jun 1, 2022 at 9:39 PM Steve French <smfrench@gmail.com> wrote:
> >
> > We should not be including unused SMB1/CIFS functions when legacy
> > support is disabled (CONFIG_CIFS_ALLOW_INSECURE_LEGACY turned
> > off), but especially obvious is not needing to build smb1ops.c
> > at all when legacy support is disabled. Over time we can move
> > more SMB1/CIFS and SMB2.0 legacy functions into ifdefs but this
> > is a good start (and shrinks the module size a few percent).
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

