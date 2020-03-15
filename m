Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1C318605A
	for <lists+samba-technical@lfdr.de>; Mon, 16 Mar 2020 00:10:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=R2SS6FrZJe3tO26unNeweEHgIjlkku2FwfROK8gK5/Q=; b=gCjUPHL/y0mod1z8brqDJ9Pg+C
	xTJUJYrm/ijnvHZaVpdle47Emzmxi9VDnqvE+dUwphqH6hwDVQAcMC56ybWUBGsbKpRuA5WFtvwMO
	MworJ6y71LXRjpGDlSXNPZ4eY6026R1UD838QFz0mpi7eihJsE/0U2iu2Y/I7vqs5sv5y303tIhpr
	Tf6xH4WT7W3jfjZ2SQ+pyQ38CbfWpC53aV2KjXNHPlVbjrJIu8CGtSipXE8B6E2YgQDzln/Sih8Cb
	SKBvwXI9pDm243B3CMrfRTJqGDiLrPZpc6nqZ6zhOZX2pb+cxGji7S6GwQSVzecdlqqa8z9kuCzNn
	HyB9LJ/A==;
Received: from localhost ([::1]:31204 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jDcOi-0001wE-Io; Sun, 15 Mar 2020 23:10:20 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:36859) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jDcOZ-0001w7-Cm
 for samba-technical@lists.samba.org; Sun, 15 Mar 2020 23:10:14 +0000
Received: by mail-io1-xd30.google.com with SMTP id d15so15312836iog.3
 for <samba-technical@lists.samba.org>; Sun, 15 Mar 2020 16:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R2SS6FrZJe3tO26unNeweEHgIjlkku2FwfROK8gK5/Q=;
 b=Xv6hae6GQVv7ey7vHDlh+0Ux8FRdbMJ3t4Iyn0I/xq9+yCahd0xhMlZf4q2/xBXAQj
 LPetS6ml60SSK9+IsfIgA7aLDDcF9zNo4O+H4raxL8HpJcO5CME+okVeaDZhD3yYBOkb
 hVVrqxr19lRcbtVFEQ0w1NN7qG08vsJcQQ6Ft4PX0UZLH3gXEGXFas9fzWxC+RMAyjLS
 r3fHXbyJ5niYLYPh6Mb9KvoPSxaSoZpQBM3CZxyrwDyeS2McEN96ekAra+YjoeIHzrUZ
 F3sCKf3io57/ffCAmR7T30diifAWsx4fhChEq0QlWmWeSIY0qfOmlrJpKWP6D/KFNLHc
 WfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R2SS6FrZJe3tO26unNeweEHgIjlkku2FwfROK8gK5/Q=;
 b=mVXwSlrxjSTfsW5zUioOeTl8tV9dYJBG2CAF2QDCLYrs/T5y4b+wgfS37TOLG2KPDD
 NWso/N3F0Cc46CaaGFKd4RoGgkB4KcHberHje9tS6B7RAgygAAmC5zcVitIfxUpffheg
 faDyoKacyg2lyz6zaFH0d/YsciFZSPhHyZW4mnyJANWQEYfLHtrhUD8qPRBPmfUO826u
 KENOj4bd2TaVRzf5LBdRkDyGgPLNj0oOUhcQVfQNe3/F/2/R6iW8BqlmDd7j1xS9bwjp
 5IlJlQ702UeK+jawZ+bDnHDYQAfhac1wQOtWQPsBu5KpBXnT/OGvQVyesKfUpl3+715a
 fNEg==
X-Gm-Message-State: ANhLgQ1tZgcokh+9tESHv6Wn5ra/IdpsJsC+eS7SiPuSbgkPoku++Hfw
 HxBnQZwYyC7S1ITMh2yOCyiSo9/DAXh938nACUCltfZg
X-Google-Smtp-Source: ADFU+vu7juPjWjAl5CNLkH9wtAxY9dOc3eBt6WPUDcs7Ci2eWvn1po3hHno0EdftVfhsnTVYdQizKwj5LXO15hNQinY=
X-Received: by 2002:a02:340c:: with SMTP id x12mr23597047jae.20.1584313807473; 
 Sun, 15 Mar 2020 16:10:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5ms_oxqwHm56nzabM-x2XMR1Ni-WD1_LEYYxOW_NkswsOQ@mail.gmail.com>
 <CAH2r5mvN5ri_7x3dVah8tUft6Xxbjia9MSANZV04TkVwtqY9Tw@mail.gmail.com>
In-Reply-To: <CAH2r5mvN5ri_7x3dVah8tUft6Xxbjia9MSANZV04TkVwtqY9Tw@mail.gmail.com>
Date: Mon, 16 Mar 2020 09:09:56 +1000
Message-ID: <CAN05THSjfj2ZJCSEdgdEfiEcxG8=xd-e5zR6KrF8gR_O1Mxb7w@mail.gmail.com>
Subject: Re: [SMB3] New compression flags
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

Typo in
+    __le32    Repititions;

otherwise looks good.
Acked-by me for both.

On Mon, Mar 16, 2020 at 9:07 AM Steve French via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> And one more small set of structures for the updated transform header.
> See MS-SMB2 2.2.42.1 and 2.2.42.2
>
>
> On Sun, Mar 15, 2020 at 5:50 PM Steve French <smfrench@gmail.com> wrote:
> >
> > Some compression related flags I noticed were added in the latest MS-SMB2
> >
> >
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

