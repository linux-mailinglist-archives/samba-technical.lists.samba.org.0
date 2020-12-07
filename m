Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB372D14A2
	for <lists+samba-technical@lfdr.de>; Mon,  7 Dec 2020 16:29:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=phc99HuuYD9VXJ3x5GtiGwc8Fm58CjNcdWxCONF1lr4=; b=x0WAop8HnQp9Rl+3bLiWdoRKeg
	ttvynSeNp7weFfJ+lraGND41oj3fL5RjEFQq+jqmaScK1gX6cuJenJm5CCAlD9fzKvz4eG3FnZZlw
	1MHiMkChrvsZyJpnDIJFmVetEz1qi8nuVBRkwnpXwwQtOCGxMrOD+/g45GVmraiW0Wm2zWV1GL4nO
	Pe4oeniGXmft4QNv8hTaKyzdBIXmTJJ4fA1JLij3ZQ/ArKqLOPIOk+AloF2m8bueUnKyEwvLIQYEP
	dUEIWagRIDShS+4yZf/YJLEHa9EhB9/oDY+aakI9gRzGsYcph3rknuaTSrodsDgUWA/VBTqx3ZSSa
	R4C1AeZQ==;
Received: from ip6-localhost ([::1]:42920 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kmIQu-0005RU-10; Mon, 07 Dec 2020 15:28:12 +0000
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:34006) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kmIQk-0005RJ-8m
 for samba-technical@lists.samba.org; Mon, 07 Dec 2020 15:28:09 +0000
Received: by mail-yb1-xb41.google.com with SMTP id v67so858822ybi.1
 for <samba-technical@lists.samba.org>; Mon, 07 Dec 2020 07:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=phc99HuuYD9VXJ3x5GtiGwc8Fm58CjNcdWxCONF1lr4=;
 b=W1sx0xc5Oyx9rInMyuvkllJOMoJ/K2uQESx8VLM9hcYq20EfXPbtKNkoEG1UEJJKn1
 jWoB/gpBoOvhCsp7xX5K/YJ25C7EfNSlpyw4QHRg37EKJCetQMRUdzVKHyldTlT5+Pcn
 0PX9ojzZJoRpucQDXdqVxCHi2/jqbqMNljxuM7OFp/rGTVgFNpkIAU+T319FqvPHqQws
 ggzjj7oK5S+Z0Eo+fNq+LDaxrJFDjzO8ELkoYlRpsdHJ6RYiOW/iKxNudYKmlsdybqh8
 uggdF/lszY2WP5tpD2eTEu1Bdl0qIv5VGoRXMxprHytrsDICL/KWPShVF4nLbLEj3/kw
 fRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=phc99HuuYD9VXJ3x5GtiGwc8Fm58CjNcdWxCONF1lr4=;
 b=kuEO8iODCOHmXKYvW3A+H9eXeO937eYii8sch2f5kL8JK2z5vDclQwdMgQrDVAhtSj
 3XdY/7hmXaSxNgZTbcqXaxo0S3B/stQUdr1bmpqGb5xvyq5zxehCMTcfv3XoldbA60sB
 6x2ZR8sKgCG7I59fB2XAqMUQWC1AkdtmsOcP4mOeccFnBWxIvJET6/mQz9Srdxg+iZ9h
 vOLkLa2cKRIq076KGcUHCbhWXZmxb9SUQ16BsN41zecOohHlja3BcBfnnUvIpN1cKzDn
 gPvcDqkyUDO84CZblkFJCaMnNwCmbN7ahsoGAysSq4T99MY0gLe3ZYUP6/K0CHRz3hjh
 Nzgw==
X-Gm-Message-State: AOAM533VCkn9CVnzZ29Ks+kyokyPRpVbCADu7mUP7XlOuIOWdVFyVcQj
 dLiwb2mBHibRxac5b4pi4qVs001wQUJVp73/IdY=
X-Google-Smtp-Source: ABdhPJz3Ywtpw3noy4z1jp1OoPuIHl/rJhw4cgAY2X6IKQ9w8OIaenSGx7PQIbvT4pYrAZcAwUG48NAi5XbLczQnqvo=
X-Received: by 2002:a25:c68c:: with SMTP id
 k134mr24345206ybf.451.1607354861831; 
 Mon, 07 Dec 2020 07:27:41 -0800 (PST)
MIME-Version: 1.0
References: <20201027204226.26906-1-pboris@amazon.com>
 <CAHhKpQ7v_nPwBx2czk7rVXK3ZrmsZrAkcxDFOgq0ABTOVc7iSA@mail.gmail.com>
 <CANT5p=q2YvkEOEa4bS=-nbPOc9Xwa=4gnc09csCcszMmMjYSPg@mail.gmail.com>
In-Reply-To: <CANT5p=q2YvkEOEa4bS=-nbPOc9Xwa=4gnc09csCcszMmMjYSPg@mail.gmail.com>
Date: Mon, 7 Dec 2020 10:27:31 -0500
Message-ID: <CAHhKpQ7PwgDysS3nUAA0ALLdMZqnzG6q6wL1tmn3aqOPwZbyyg@mail.gmail.com>
Subject: Re: [PATCH] Add support for getting and setting SACLs
To: Shyam Prasad N <nspmangalore@gmail.com>
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
From: Boris Protopopov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Boris Protopopov <boris.v.protopopov@gmail.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Boris Protopopov <pboris@amazon.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello, Shyam,

sorry for the delayed reply and thanks for looking at this patch. Yes,
the testing was done using the extended versions of
getcifsacl/setcifsacl (added setting owner and SACL support), the
patch for that posted recently via samba-technical (message ID
<20201120214918.12517-1-pboris@amazon.com>). I have tested
setting/getting the owner, DACL, and SACL, for all the DACL/SACL flags
(-a, -D, -M, -S), SACL type SYSTEM_AUDIT. This testing was done
against 5.10.0-rc1 and 4.14.203 (the latter required porting the
user-space patch). I believe this testing has fully exercised the code
changes in question.

I will look at contributing to the fsxtesting-cifs code, but I think
the setcifsacl/getcifsact patch that enables easy access to the
descriptor components is a pre-requisite for such contributions.

Thanks!


On Wed, Dec 2, 2020 at 5:43 AM Shyam Prasad N <nspmangalore@gmail.com> wrote:
>
> Hi Boris,
>
> At a high level, the changes look good to me. Will go through the
> changes in more detail tomorrow morning.
>
> On a related note, we may need more test coverage in this area.
> Can you please share your testing output against your changes?
> Or even better, if you can contribute some xfstests for this use case:
> https://wiki.samba.org/index.php/Xfstesting-cifs
>
> Regards,
> Shyam
>
> On Wed, Dec 2, 2020 at 12:24 AM Boris Protopopov
> <boris.v.protopopov@gmail.com> wrote:
> >
> > Hello,
> > I am checking in to see if anyone had a chance to take a look at this
> > patch. I would appreciate any feedback.
> > Thanks!
> >
> > On Tue, Oct 27, 2020 at 5:01 PM Boris Protopopov via samba-technical
> > <samba-technical@lists.samba.org> wrote:
> > >
> > > Add SYSTEM_SECURITY access flag and use with smb2 when opening
> > > files for getting/setting SACLs. Add "system.cifs_ntsd_full"
> > > extended attribute to allow user-space access to the functionality.
> > > Avoid multiple server calls when setting owner, DACL, and SACL.
> > >
> > > Signed-off-by: Boris Protopopov <pboris@amazon.com>
> > > ---
> > ...
>
>
>
> --
> -Shyam

