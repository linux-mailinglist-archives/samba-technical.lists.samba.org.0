Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F358A536ECE
	for <lists+samba-technical@lfdr.de>; Sun, 29 May 2022 01:32:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ZHkspVi7hYgWPjrkicA2Ka1cNGl3qopvOnZQ16mob5o=; b=Qd7y2+f61i4xrh4+JRva6pGPlP
	DDpU6JoD7STShQjOlMTdC8hVZE830fMZRRaM8guOxyvBqELZzGfCOnkAoD3NFcZdcmURbnFPPXqeu
	6TQhbKe9huJTQShXClbm+2LRjkf2WuDoIK+oBQhkxxGsVJgoh8cQR0HHWHpKjEmfdM+Fd79NCnWbf
	D2dUirEAocptkwZyy4+dHpwRae+l5We9my/3K+e4gZNMnqA/rgjr53tmEc3Sh1/qaUU9O32soq+Ut
	9gJBeSL2sTQFIk7C/IKDx0kor7pX0cSAl9gHMlumhpCA2D+EGDDjb0x7jcrUUD5/BjX3t+zPK5fu4
	2xpurKYw==;
Received: from ip6-localhost ([::1]:54174 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nv5uO-003fSj-2N; Sat, 28 May 2022 23:31:48 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31]:35389) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nv5uJ-003fSa-9z
 for samba-technical@lists.samba.org; Sat, 28 May 2022 23:31:45 +0000
Received: by mail-vs1-xe31.google.com with SMTP id 67so7584193vsh.2
 for <samba-technical@lists.samba.org>; Sat, 28 May 2022 16:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZHkspVi7hYgWPjrkicA2Ka1cNGl3qopvOnZQ16mob5o=;
 b=Gg3IQ+lg74QPdhRPZFKypPilx6JqlFfPJ+wKJjuWc7dfiDeqz7Ej4ejDTuBIvmfY8K
 hOPfs9pNrSleU0crFRqa6VRLjFrpYl9twi0nfDuxYmDDujG/2/5YXwGWAjuH8NoAXpxO
 4KwH2a3MSZ8Oy4R4BPM9eeIVbbVnkOYgnWq5DycK3dnUzRosv8FiZBFGZhP7eatjkt1N
 Lh8kNIipt6Smw86Rqn42AIjJVfoxqkE024CI1V3uE2nYTV284vfqkAU+yx1kvh2R2KPh
 TyVQMuWvodkAsmpi/mx3igk3w0kIrCQP0XviVaAwqzUtZHJOv94NUnqWo3/gvHpaLGXf
 R4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZHkspVi7hYgWPjrkicA2Ka1cNGl3qopvOnZQ16mob5o=;
 b=R5BgkMK6ehpqpiIsIvyEqaHHChgPGmSKz/yK9TL2c+3rCFtoVofnT2vLAcHofYyJX9
 D/5w05HB7GhH09uhlTEQk4cZkTX6XfrZcgBfK4dDXxM1XfcR7wnd6EVrWYZfz1RtWtK6
 CD7EquiySMbFvWy+Q7HJs8UhUS7NWof0bnV4T7WEbL6SSWasDJa+CXFs8rhpCBAepat+
 LUFXDYduqatibpfkpLchqXcr2IdOAEzqyFmzOAfhNW3Dx9inEgeGYS72WPUA71ePD5bk
 1z5j22eL6azGeRGG1gWn90ZLJFvCAkmbAXj45Df0JtfGRl784ZdIgY3s45I09bdIxZqW
 1Sjg==
X-Gm-Message-State: AOAM530CM46r6u2MW8tEsdJa0UWlP6mtqAOZqG/CIM3ORlEbGriBfRjZ
 TOXiSLubwFdbSGnurE60NLrtDAh4nW0ZZwmLzow=
X-Google-Smtp-Source: ABdhPJy0Acb1c3xSDsjiqAa+wurlHniC7DTliHnSjCHwZc1KOpXXeNt8sWJjTYXpw40/HtDl5zk/Uq4lxuGzoAoQ188=
X-Received: by 2002:a67:b607:0:b0:337:b5b7:adc9 with SMTP id
 d7-20020a67b607000000b00337b5b7adc9mr13395803vsm.17.1653780701218; Sat, 28
 May 2022 16:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220526140226.2648689-1-trix@redhat.com>
 <CAKwvOdmPZXiMZRKyMfZVMmw-95XVocSZn3VVi3yJh0Bx1ONbJQ@mail.gmail.com>
In-Reply-To: <CAKwvOdmPZXiMZRKyMfZVMmw-95XVocSZn3VVi3yJh0Bx1ONbJQ@mail.gmail.com>
Date: Sat, 28 May 2022 18:31:30 -0500
Message-ID: <CAH2r5mumSyxP8XUJjKwv9exh__NkCtG2HSiO-USqGo_7ZTb0yQ@mail.gmail.com>
Subject: Re: [PATCH] cifs: set length when cifs_copy_pages_to_iter is
 successful
To: Nick Desaulniers <ndesaulniers@google.com>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>, CIFS <linux-cifs@vger.kernel.org>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Steve French <sfrench@samba.org>, Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Presumably this was in Dave Howell's patch set which we took out of
for-next to restructure in some of Al's feedback and some things found
during testing. So nothing to fix in current mainline or for-next ...
right?

On Sat, May 28, 2022 at 3:40 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> + Steve's @microsoft.com email addr.
>
> On Thu, May 26, 2022 at 7:02 AM Tom Rix <trix@redhat.com> wrote:
> >
> > clang build fails with
> > fs/cifs/smb2ops.c:4984:7: error: variable 'length' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
> >   if (rdata->result != 0) {
> >       ^~~~~~~~~~~~~~~~~~
> >
> > handle_read_data() returns the number of bytes handled by setting the length variable.
> > This only happens in the copy_to_iter() branch, it needs to also happen in the
> > cifs_copy_pages_to_iter() branch.  When cifs_copy_pages_to_iter() is successful,
> > its parameter data_len is how many bytes were handled, so set length to data_len.
> >
> > Fixes: 67fd8cff2b0f ("cifs: Change the I/O paths to use an iterator rather than a page list")
> > Signed-off-by: Tom Rix <trix@redhat.com>
> > ---
> >  fs/cifs/smb2ops.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
> > index 3630e132781f..bfad482ec186 100644
> > --- a/fs/cifs/smb2ops.c
> > +++ b/fs/cifs/smb2ops.c
> > @@ -4988,7 +4988,7 @@ handle_read_data(struct TCP_Server_Info *server, struct mid_q_entry *mid,
> >                                 dequeue_mid(mid, rdata->result);
> >                         return 0;
> >                 }
> > -               rdata->got_bytes = pages_len;
> > +               length = rdata->got_bytes = pages_len;
> >
> >         } else if (buf_len >= data_offset + data_len) {
> >                 /* read response payload is in buf */
> > --
> > 2.27.0
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Thanks,

Steve

