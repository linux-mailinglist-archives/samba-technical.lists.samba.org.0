Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A1470C2B5
	for <lists+samba-technical@lfdr.de>; Mon, 22 May 2023 17:51:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=zxUaB980WOtvrFMKkfA0+WjKHtuCKmFhDeQXit5QQn4=; b=NnPZ/5oa9I0dmtscpWLiOjMrrf
	g3lD8Z0E1PkKlLo4UPWxkMNXIpeIPTefBjYZ5C04VaPU6TuHyg5HgUGxz+OFGk3bHd9u/lO9lFHOT
	KIrZj0hqys/jokKtL9qzqE2IrcmIKXhr/5W8k09AiXON0ijyhNl7Vno5SthSMNX+ScKJ8+h1XYkTH
	Hql+ve1glFvqA0HiJ4sxuqh5lX1K58gKKGK8eyomVPeMC/JzXYNhdiHHCfUuspzIndgR3+VNJGkZo
	tjLMxnhXxQE3O2tSABPf2OoX1VYuEmGWhBcz3KDS5AsVaxV3xF+blxBh1Psx/hMLDEEfwvFHcfDxG
	NPbD9ZoA==;
Received: from ip6-localhost ([::1]:20104 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q17od-00BNJR-Mv; Mon, 22 May 2023 15:51:19 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:46520) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q17oZ-00BNJI-Cu
 for samba-technical@lists.samba.org; Mon, 22 May 2023 15:51:18 +0000
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2af1a7d2f6aso55782931fa.1
 for <samba-technical@lists.samba.org>; Mon, 22 May 2023 08:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684770674; x=1687362674;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=L7OQ5VUGr6ZMthcGqfJEuCKWPgqS3JHCiPUSiBKggHg=;
 b=qtHYe+xqUq3wwJ9wyJwxd+P390ItLlU4OHWQ7ckRPM1v/S6NFXXM+0GFGDBMCaF1ER
 tOQpkqAsuTfG0NX9k3Udv9sYp1/WvjNJ9DRB/eK5o9K+CSPA/dAeLdl+QAqTsZ7b9i/R
 +vsJkh8F68tYvKrUXyiM3pNtbcS8CgTlFdxMjM251oaHTFWfCdf0bsr2yi0LSarym6vB
 eioCSX02P+sM2E3PqZeXIGvqY98leiQ/8JyBuAIwaha9WMnW33kcAiBOOXTIjOO6MaAm
 byFnihgFs6pF70YGgPpe5wjsj376iyEnJlKiCVO5cCQ0drFSzzZAO8j6AVJOedTrs369
 QDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684770674; x=1687362674;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L7OQ5VUGr6ZMthcGqfJEuCKWPgqS3JHCiPUSiBKggHg=;
 b=UZumLEtISiV7JsK3PIQQLn8f90q3GX8nNlMXhKiM2rnmIvmpXwBU+4DWs572OPf8gX
 Z89o+ozNyfHf/6n77WPYcYS1sTzIeJ9LFB6TP8o+XiANo4ZMFQ3cxUY6UcHz8vD18IVZ
 BO9L4Nn14JSXt37ROIxw5qWoYvq6Ls7ugAw5ucQ4QNpWtcuGYIJMQuVqOmwB/8dUZdZ0
 RXDnmUSoiPCSF0VY6cBycEwWPGNJAhkN8sVXoKW0cRAmPCPqxQOWzaFVOpAPFttddvGR
 01ZMDELgHxIYc2iVJ1AkQAY5oy0erVggc2suI+uFm7M+oEeZq3NDK7eoZjFTXTUYKta8
 TSxQ==
X-Gm-Message-State: AC+VfDx5/sldODQ93OtxHh8+4sRUeu6izUoHEqvslck+RpyefACWeiwh
 PM04bSkt9H8Vtj/pJYNk7HuKBMQC/kzJMmvzUBA=
X-Google-Smtp-Source: ACHHUZ6QGvlNE2ioyMxZOfWZGnc/otT4TVYji9KC+T5m/ro86mq8uMJPIdDgyySPnQEG0HWfw4e+ii5ysZJzUrgHTOw=
X-Received: by 2002:a19:c519:0:b0:4f4:b864:1d96 with SMTP id
 w25-20020a19c519000000b004f4b8641d96mr39379lfe.32.1684770673745; Mon, 22 May
 2023 08:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mv8nAncg-f=Z5u8LkH4o7kfJLJdtoksYQgiguF7efKZkQ@mail.gmail.com>
 <CAN05THRKq9XPD11rBWXyTL_OGSh4pP6mQyufeW+xc+J3wvkMmw@mail.gmail.com>
 <CAH2r5mtJfSiQXBRUwv6zcR5rhG2Q-pCvjH+n+_SZmVQo1pMeVg@mail.gmail.com>
 <CAN05THQZFo+eD=+cBe9D2va0RchOBVunEAfbGaY1JGRSj=qGKQ@mail.gmail.com>
In-Reply-To: <CAN05THQZFo+eD=+cBe9D2va0RchOBVunEAfbGaY1JGRSj=qGKQ@mail.gmail.com>
Date: Mon, 22 May 2023 08:51:01 -0700
Message-ID: <CAH2r5ms_3XN59UUiWLr7-jdnBHGw39w6Mvj6__D=C4mxkzEc+w@mail.gmail.com>
Subject: Re: Displaying streams as xattrs
To: ronnie sahlberg <ronniesahlberg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

We do allow querying ads now from user space for cifs.ko. was wondering if
xattr emulation for them like macs apparently do would also help

On Mon, May 22, 2023, 07:42 ronnie sahlberg <ronniesahlberg@gmail.com>
wrote:

> We want to expose ADS to the applications?
> Maybe FCNTL is a better interface to do this than magix xattrs.
> An application could open a file, and then use fcntl to
> list/open/create/delete streams?
>
> We should talk to the NTFS maintainers too as this is an ntfs feature
> and they might alwo want to expose ADS to apps.
> So we get a solution that we can use across multiple filesystems.
>
> regards
> ronnie s
>
>
>
> On Mon, 22 May 2023 at 16:40, Steve French <smfrench@gmail.com> wrote:
> >
> > On Sun, May 21, 2023 at 11:33=E2=80=AFPM ronnie sahlberg
> > <ronniesahlberg@gmail.com> wrote:
> > >
> > > A problem  we have with xattrs today is that we use EAs and these are
> > > case insensitive.
> > > Even worse I think windows may also convert the names to uppercase :-=
(
> > > And there is no way to change it in the registry :-(
> >
> > But for alternate data streams if we allowed them to be retrieved via
> xattrs,
> > would case sensitivity matter?  Alternate data streams IIRC are already
> > case preserving.   Presumably the more common case is for a Linux user
> > to read (or backup) an existing alternate data stream (which are usuall=
y
> > created by Windows so case sensitivity would not be relevant).
> >
> > > On Mon, 22 May 2023 at 12:09, Steve French via samba-technical
> > > <samba-technical@lists.samba.org> wrote:
> > > >
> > > > Looking through code today (in fs/cifs/xattr.c) I noticed an old
> > > > reference to returning alternate data streams as pseudo-xattrs.
> > > > Although it is possible to list streams via "smbinfo filestreaminfo=
"
> > > > presumably it is not common (opening streams on remote files from
> > > > Linux is probably not done as commonly as it should be as well).
> > > >
> > > > Any thoughts about returning alternate data streams via
> pseudo-xattrs?
> > > > Macs apparently allow this (see e.g.
> > > >
> https://www.jankyrobotsecurity.com/2018/07/24/accessing-alternate-data-st=
reams-from-a-mac/
> )
> > > >
> > > >
> > > >
> > > >
> > > >
> > > > --
> > > > Thanks,
> > > >
> > > > Steve
> > > >
> >
> >
> >
> > --
> > Thanks,
> >
> > Steve
>
