Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5711F8573D7
	for <lists+samba-technical@lfdr.de>; Fri, 16 Feb 2024 03:55:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=hivLGoohBi9jxN+iXA1gU/EMsAbGNah9+ljlZTWvHBw=; b=RMqovBzEQjncHrqyK4uZgPJ/cQ
	ZVzWz61/GJ3UUqJbt1FzZgZn845XuY6OTVdNpAngG2gsiqcQ+82jB4C9hRSknz2Opce6VnnFxwvy/
	CehBhxY3+G7m6L+86EFNpdV1hdfKZ1itvTJmKlPb/+uxhkWLHX/6VE2gu5O7MSLT50DesJAjlPDn0
	uOM5HiNgsVRCHkAE1ZTodwV+aCOl/TloI2G37iRFndXmujv73OKCRcy4ZMUWraMzsrOVvYfXS8/r5
	CwcNSJHGweZwXw4P3HaY3oSAX5DG+vjCRgbOAVh1VkealdM/oTvLftQEwOI9pwEkLQlveRGfj2g/J
	RoqgYnAQ==;
Received: from ip6-localhost ([::1]:37520 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1raoMz-008eLF-Ik; Fri, 16 Feb 2024 02:54:33 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:60814) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1raoMu-008eL8-Ue
 for samba-technical@lists.samba.org; Fri, 16 Feb 2024 02:54:31 +0000
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-511acd26befso1994287e87.1
 for <samba-technical@lists.samba.org>; Thu, 15 Feb 2024 18:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708052068; x=1708656868; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QDrPJa6LvzA2dvfkyydTb5utmbW9CEWoR/VE7noEqac=;
 b=gheh9dUZ2S9rOHBCdJwhr4BU8o8Su+ydIPNz+UojxvGGhJ4gS9hrdICSktlUSiOMCg
 oxxyl5AGJ3zF6Ydvvm8Iw7Ob54d9c0IP14IXgABUdYVIkQOYJ4YmBfaSfRmqOcpvgxbX
 U0KB9uRt+kdis3MfvqY2mph/t1bIXRUJmalyL0N9Wk7NkENJrvgyyV2esad7nOcrdljy
 oUvFF6x75JXh6HyQFiNCOTg+wuzmnVaCF2lLCd25WFc9cfzhz4rPojTHUd2htWr2yVV+
 SaKqAt0Zn9RlpI6ERdstG/2dVH3cqIbUbSoSkvJTFgVr0w02313/GOgDDQhji7mdG3wE
 /1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708052068; x=1708656868;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QDrPJa6LvzA2dvfkyydTb5utmbW9CEWoR/VE7noEqac=;
 b=ZbryslcxWBLVRU/50c/ugkSb36MTGZ/xVTDIER/41P73cYpWzWha0W5mjx7QDvIivh
 EOI1yXY42Tgez7Pow4ViZn+EvjDMuu0RDVtW/uf8pmg5N1kK7atv1jIbaY8tvqAwREBu
 7envBzywELPdJ+Djk/s3CRik2dmYksDGS5GbrZPmKotK2zghLjRK24WEQPXmQLFXnAAK
 epgg2prdKGO/F5DWIsmlakWJr416Pg36+0u1M/Vj66Y/szCmoOwM/zHaV/qc5aeZa3Bx
 K5LkVWTLwnDJihkC417susLVgY6Hmr82lurOXWBdV4ArrKsG1h1pJhLCCVzYt8l1ntrF
 10UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjRdlTZMZ2PG1UiGkUKvJafMWOgPFs+ygL2SXe1okgThd3Pl/rR+uKmHGIUYf3EZ2BfYuZbdqff+sT38ChfGuLf/TO9ROnl7ZmolCU7yRi
X-Gm-Message-State: AOJu0Yz6GM2UkqVsaWMcp16rDit7KrMc+yZ+8yuuEWibd7QpnvDjsIJF
 w31Y9CdT+p9RbFOf0GcMD+1fSmkL/utr4epP4B8S3k/AvkdQqS25ZlZ8Zhv4gg8Hm4/4TNp5/C5
 05HcAj0XJvEa0av1qoab6odbL1sg=
X-Google-Smtp-Source: AGHT+IFiVjAdoLMXp6A0tVlp08sAMFlHy2fNLeYde5rYHD0p3E6DS47GUE3aeZJ54ob1RfoJf3QzFg65NbWj6ZNsno8=
X-Received: by 2002:ac2:4189:0:b0:511:3460:925c with SMTP id
 z9-20020ac24189000000b005113460925cmr2415352lfh.65.1708052067341; Thu, 15 Feb
 2024 18:54:27 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mtUnLDtwbW7or=Uc+AXkzLpHsJoPuoLE7yyjPVYjvZCow@mail.gmail.com>
 <CANT5p=oNRF9BAgybCX7dE+KvYj=k2G3tERa+fMJOY6tsuZ00Hw@mail.gmail.com>
In-Reply-To: <CANT5p=oNRF9BAgybCX7dE+KvYj=k2G3tERa+fMJOY6tsuZ00Hw@mail.gmail.com>
Date: Thu, 15 Feb 2024 18:54:14 -0800
Message-ID: <CAH2r5mtcLQqfow0VdUY+BP8-9Sa0yfng8OzitZz6WhCK1VUv7w@mail.gmail.com>
Subject: Re: [WIP PATCH] allow changing the password on remount in some cases
To: Shyam Prasad N <nspmangalore@gmail.com>
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
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>,
 CIFS <linux-cifs@vger.kernel.org>, Bharath S M <bharathsm@microsoft.com>,
 samba-technical <samba-technical@lists.samba.org>,
 David Howells <dhowells@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I lean toward allowing password change on remount if network disconnected
even if there are cases where harmless because it should be non confusing
if reconnect fails with new password where case of allowing password change
in mount when session active could be very confusing if it took hours for
reconnect to ever happen (user might not associate it with an remount hours
or days earlier)

On Thu, Feb 15, 2024, 17:52 Shyam Prasad N <nspmangalore@gmail.com> wrote:

> On Tue, Feb 13, 2024 at 12:23=E2=80=AFPM Steve French <smfrench@gmail.com=
> wrote:
> >
> > cifs: Work-in-progress patch to allow changing password
> >  during remount
> >
> > There are cases where a session is disconnected but we can
> > not reconnect successfully since the user's password has changed
> > on the server (or expired) and this case currently can not be fixed
> > without unmount and mounting again which is not always realistic to do.
> > This patch allows remount to change the password when the session
> > is disconnected.
> >
> > This patch needs to be tested for cases where you have multiuser mounts
> > and to make sure that there are no cases where we are changing
> > passwords for a different user than the one for the master tcon's
> > session (cifs_sb->tcon->ses->username)
> >
> > Future patches should also allow us to setup the keyring (cifscreds)
> > to have an "alternate password" so we would be able to change
> > the password before the session drops (without the risk of races
> > between when the password changes and the disconnect occurs -
> > ie cases where the old password is still needed because the new
> > password has not fully rolled out to all servers yet).
> >
> > See attached patch
> >
> >
> > --
> > Thanks,
> >
> > Steve
>
> need_recon would also be true in other cases, for example when the
> network is temporarily disconnected. This patch will allow changing of
> password even then.
> We could setup a special flag when the server returns a
> STATUS_LOGON_FAILURE for SessionSetup. We can make the check for that
> flag and then allow password change on remount.
>
> Another option is to extend the multiuser keyring mechanism for single
> user use case as well, and use that for password update.
> Ideally, we should be able to setup multiple passwords in that keyring
> and iterate through them once to see if SessionSetup goes through.
> It'll be a bigger change than this though.
>
> --
> Regards,
> Shyam
>
