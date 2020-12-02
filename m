Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B3B2CBAD5
	for <lists+samba-technical@lfdr.de>; Wed,  2 Dec 2020 11:44:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=9DFjZAdrwyZk2YQ7OkLyRHwrSQpCncG9hZ9zBWhHgDs=; b=2kBLTe2LkQ7wgFVK4GAS91QXrz
	FqMK4SZ/Us8fN2T40GBhg5yq13Lsqp1+NMi4hS3nuY4TIbUotx0RsZCShYIhwMjb1o1D/LztBuoRP
	PMyeUkyTPUOWEfhyLwX0vSYkvX/H8q1isV5OYflQhr/AG28yMM37o0HVGIAIAPweRaHmJVc0xwucT
	SfbvyMy1px28nixT+R3BFQg8KYvMV/oyw/Yieszz+QC++fmP728PKob4b079fBBz1m8hZj/qR9o/w
	xrC99g+VyiFKTYxNBhzHASuHRxlS+0mP2eVwTI7HWcqoejkxaU9f2SBrkuR/CULwf58styEeRRUqd
	h83xHyZw==;
Received: from ip6-localhost ([::1]:57802 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kkPc7-00068T-VP; Wed, 02 Dec 2020 10:44:00 +0000
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:34042) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kkPc0-00066H-Dq
 for samba-technical@lists.samba.org; Wed, 02 Dec 2020 10:43:56 +0000
Received: by mail-yb1-xb43.google.com with SMTP id e81so1192471ybc.1
 for <samba-technical@lists.samba.org>; Wed, 02 Dec 2020 02:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9DFjZAdrwyZk2YQ7OkLyRHwrSQpCncG9hZ9zBWhHgDs=;
 b=QIAwqiQ3gUySWZAon+96z2Ae9kQK44KBS3BjTABbfgEKg/sDjKNpA6BZKS6Ps1WjA9
 KQsZJ4nFJo7+1yhSL2zBmjWLVE/QF87ObQCKkj6XXKLuXn37YeKfgyL0nIJ66nsmEqlm
 HgFqjYKCDA/RWTgjnvckXczJGJVmPWSBLtItAsaOyw7mUyKOHD4DbuKzzr7kL1xyOyYx
 maaB430hfG+3FClPEQ/xI6UGw9YzRdcFL3HQrrItcmP/PSlv++yKqIQ5ZaCPJnR9HjVs
 UUuSywkxsAZ0OoA+sf13P9ie45F45Z6Q8vrMD+dAxfGmOiV8nDkM485Gy4PwPtryW1zb
 rmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9DFjZAdrwyZk2YQ7OkLyRHwrSQpCncG9hZ9zBWhHgDs=;
 b=hBdKXsFJ5flDxr0OUs7/40jGTJNh1xM17xpX31/0LPkfPkBeiAsfUJRUXYwzaLA3SM
 nXUgxDk7hKHuCyrQv+qXJZ2nonqmZQFUVTPZhUZYvIGMOTyiFDyPtIP8dQJdihgWg2PN
 N1cgUunjHlNxnYiTfHbdGl1YfEuu47jvA4oZxLeboyQN8PSejLvNpXE3XhTPgbP6NDNy
 g/V4Jsh5YK+BOghVP8dQWAz8AK5fbfzfyj9DshDfaRMUUAre4hYZbebMZMKHbREd24oD
 QqzgNF24MCDWUi2KXFGgr0o8zTFtqCNLmGLxnFkm1ZdNkiZ9ZdVMo7nvIH4Jtc//VchR
 B99w==
X-Gm-Message-State: AOAM533dYFLvvLjDQtDhqIQuyiSeP/AJJ6D+r01kRKhPC0Xt87GAu9n9
 sDxNbJPDznDObmAj3YXRut3j8LHvK/uldKqrvu8=
X-Google-Smtp-Source: ABdhPJz8v6Ej1xn7oEpvOSGtJ0kNYG3CoGEc8UoAwv1aFk2K7PXt92btzvd9mqyFZfcZkr9mx0yrlLEw6aVO3eOXjpk=
X-Received: by 2002:a5b:149:: with SMTP id c9mr2369419ybp.3.1606905830376;
 Wed, 02 Dec 2020 02:43:50 -0800 (PST)
MIME-Version: 1.0
References: <20201027204226.26906-1-pboris@amazon.com>
 <CAHhKpQ7v_nPwBx2czk7rVXK3ZrmsZrAkcxDFOgq0ABTOVc7iSA@mail.gmail.com>
In-Reply-To: <CAHhKpQ7v_nPwBx2czk7rVXK3ZrmsZrAkcxDFOgq0ABTOVc7iSA@mail.gmail.com>
Date: Wed, 2 Dec 2020 16:13:39 +0530
Message-ID: <CANT5p=q2YvkEOEa4bS=-nbPOc9Xwa=4gnc09csCcszMmMjYSPg@mail.gmail.com>
Subject: Re: [PATCH] Add support for getting and setting SACLs
To: Boris Protopopov <boris.v.protopopov@gmail.com>
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Boris Protopopov <pboris@amazon.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Boris,

At a high level, the changes look good to me. Will go through the
changes in more detail tomorrow morning.

On a related note, we may need more test coverage in this area.
Can you please share your testing output against your changes?
Or even better, if you can contribute some xfstests for this use case:
https://wiki.samba.org/index.php/Xfstesting-cifs

Regards,
Shyam

On Wed, Dec 2, 2020 at 12:24 AM Boris Protopopov
<boris.v.protopopov@gmail.com> wrote:
>
> Hello,
> I am checking in to see if anyone had a chance to take a look at this
> patch. I would appreciate any feedback.
> Thanks!
>
> On Tue, Oct 27, 2020 at 5:01 PM Boris Protopopov via samba-technical
> <samba-technical@lists.samba.org> wrote:
> >
> > Add SYSTEM_SECURITY access flag and use with smb2 when opening
> > files for getting/setting SACLs. Add "system.cifs_ntsd_full"
> > extended attribute to allow user-space access to the functionality.
> > Avoid multiple server calls when setting owner, DACL, and SACL.
> >
> > Signed-off-by: Boris Protopopov <pboris@amazon.com>
> > ---
> ...



-- 
-Shyam

