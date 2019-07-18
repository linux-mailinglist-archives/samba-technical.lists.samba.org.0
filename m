Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 426886D42A
	for <lists+samba-technical@lfdr.de>; Thu, 18 Jul 2019 20:47:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=a81tnllsz/90Yb8Rycdj4UdxuaOMAOvQxDmlz6GL7WU=; b=zl7mKyEJB4b9rL51FebhL2bMUa
	496zXWHJq6c7fs9noTVVsFgOiL5KOpOQ6kPIZ+vbG764Vj5j5D7R3Ft+5lhoqPZIxv0C+sLStL1XV
	crTXmYiAgQ6WUzcaTHzUQ1s2tQOC0STSfrKnOxtx+dvXHQfiF0/gLjpu4OwTwlHOygZwyYTxnOHED
	cYToCdIgZ3R5JaMlt85FerpzLQjVp1Y+yEJD6sRQDPyu7F0f3Ji6/U/ZO9HnNcekKU8lWw/mgG7fJ
	AnMrz3sOsC5cAHjDy79sHhZaWYLHnXvmywX0aL2yDk/LjjhHt72AuKl3skgV6Yuw2PYQBt13LkpDa
	c7YX/s4g==;
Received: from localhost ([::1]:56476 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hoBQV-000zge-SU; Thu, 18 Jul 2019 18:46:47 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:38343) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hoBQR-000zgX-OH
 for samba-technical@lists.samba.org; Thu, 18 Jul 2019 18:46:46 +0000
Received: by mail-pf1-x442.google.com with SMTP id y15so13025202pfn.5
 for <samba-technical@lists.samba.org>; Thu, 18 Jul 2019 11:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=a81tnllsz/90Yb8Rycdj4UdxuaOMAOvQxDmlz6GL7WU=;
 b=RVDqf8gnMge8dqm9Eag3LnSz7e+WZ62yIegnda03XIUmXsE5GukGaYeD0SkrmLeIto
 0Pz/sal5XsDzJDFBGDp2GI06Gf1ljDiOXTEgTe32aLI9T2KdiwCoL5IeexFnJMvzSv0t
 SX7HufAsHaNUhg9Gml3nXv42DTqBpBHeSmC1RjU9HS+NDK8NvcfrQiUpC7bE/xnqCNNb
 aar4zybvCgzZbgdkMTGsuFOF6FpfEQUgpMxKfWN+bXxGjfzbm7Iz7WLREZAi424qkrB4
 wSXhcA4fRVM/1sWcHwiXOgGvgMLGY1S9QT6B5Crts4APlA1+gPOuXqlttX7a01Q8fcP+
 5TFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a81tnllsz/90Yb8Rycdj4UdxuaOMAOvQxDmlz6GL7WU=;
 b=bBstbg6UkgIggp2XoMdiymsCkNeeiRBhU4iDNuN80WbwDlyBSRcWsRAV7RPWuPhKIZ
 vKGUKaMOe3bKhKYi+h0MwSITLMToVmxapP4EWk7dBRhYW0U0XQz4h/F4Fayj5cWL5/qO
 tXFck0Ob9O3v5JZ07cZWOLcCb2YcznT+pyvWkjsc/XdiaYplZdtA65UDpBxkwIvmA1O4
 r2cvPqW8RJWJy4YSY0EWjeOQSShU+M+HwxTZEefvgiqaMNcI1ipt+NeKP50ABvUieP20
 anN6+iphi2PSmwwU/LW2AnxBBj3yDpA7kUBTDG+icjtUEzqvY61+BMIl/nG2tZndcSTT
 bYog==
X-Gm-Message-State: APjAAAXaZy3zt3PGt5Z0iupyTADWLCaiIb70Dblf9jmSEkAlqi1UrkZF
 e2gZ4ZxZAxa37DmuVkaOFBuFd1QxnjDqvjo7PLY=
X-Google-Smtp-Source: APXvYqwu4fJPyXSPTJDzQNHVX8kksd5RiVf1Lm4PvKt3PjkkqMwdJymoZLGPpi2TP/YE+dEJkYoshqsjx+PtzSadn9o=
X-Received: by 2002:a63:d4c:: with SMTP id 12mr50202836pgn.30.1563475601301;
 Thu, 18 Jul 2019 11:46:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mtn5SyUao9Y3f-_ubqgSV8t3RSj2fzAR9bE5ZQQ5dFcRQ@mail.gmail.com>
 <CAKywueQEk84q-3PNNvGQNYLc9DXfygy+75LNBfyTKRo-iFvmGw@mail.gmail.com>
In-Reply-To: <CAKywueQEk84q-3PNNvGQNYLc9DXfygy+75LNBfyTKRo-iFvmGw@mail.gmail.com>
Date: Thu, 18 Jul 2019 13:46:29 -0500
Message-ID: <CAH2r5mu4y69J4ChFhbejFhG50P5CnKLwKRUAZZ+C+aMx09Qg2Q@mail.gmail.com>
Subject: Re: [SMB3][PATCH] Speed up open by skipping query
 FILE_INTERNAL_INFORMATION
To: Pavel Shilovsky <pavel.shilovsky@gmail.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Also fyi - did some experiments today.  Perf across the open vfs entry
point averaged about 20% better with the patch

On Thu, Jul 18, 2019 at 12:37 PM Pavel Shilovsky
<pavel.shilovsky@gmail.com> wrote:
>
> index 54bffb2a1786..e6a1fc72018f 100644
> --- a/fs/cifs/smb2file.c
> +++ b/fs/cifs/smb2file.c
> @@ -88,14 +88,20 @@ smb2_open_file(const unsigned int xid, struct
> cifs_open_parms *oparms,
>   }
>
>   if (buf) {
> - /* open response does not have IndexNumber field - get it */
> - rc =3D SMB2_get_srv_num(xid, oparms->tcon, fid->persistent_fid,
> + /* if open response does not have IndexNumber field - get it */
> + if (smb2_data->IndexNumber =3D=3D 0) {
>
> What's about a server returning 0 for the IndexNumber?
>
> - if (rsp->OplockLevel =3D=3D SMB2_OPLOCK_LEVEL_LEASE)
> - *oplock =3D smb2_parse_lease_state(server, rsp,
> - &oparms->fid->epoch,
> - oparms->fid->lease_key);
> - else
> +
> + *oplock =3D smb2_parse_contexts(server, rsp, &oparms->fid->epoch,
> +       oparms->fid->lease_key,
> +       buf);
> + if (*oplock =3D=3D 0) /* no lease open context found */
>   *oplock =3D rsp->OplockLevel;
>
> oplock being 0 here probably means that the lease state which is
> granted is NONE. You still need to keep if (rsp->OplockLevel =3D=3D
> SMB2_OPLOCK_LEVEL_LEASE) gate.
>
>  /* See MS-SMB2 2.2.14.2.9 */
>  struct on_disk_id {
>
> Please prefix the structure name with "create_".
>
> Best regards,
> Pavel Shilovskiy
>
> =D1=87=D1=82, 18 =D0=B8=D1=8E=D0=BB. 2019 =D0=B3. =D0=B2 00:43, Steve Fre=
nch via samba-technical
> <samba-technical@lists.samba.org>:
> >
> > Now that we have the qfid context returned on open we can cut 1/3 of
> > the traffic on open by not sending the query FILE_INTERNAL_INFORMATION
> >
> >
> >
> > --
> > Thanks,
> >
> > Steve



--=20
Thanks,

Steve

