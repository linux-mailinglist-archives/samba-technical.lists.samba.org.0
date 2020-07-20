Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3F5225660
	for <lists+samba-technical@lfdr.de>; Mon, 20 Jul 2020 06:02:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=06FB5woN06uiD3GvLoqoO/p4B+0/TRLVi1n7WwNJWW4=; b=0EwS9tgbbhN8glVdLBF00jMtE8
	wqz92rK1aS++Jlz3YiydqdmBKg04eLNvQA8CwF8BwJX3f91qyMKzAPsqqRAlRC3aOYJ49ZOXRJnHj
	S/ZDQtbCPgvWfXdAWAQH//dXAtqnsdoQNGf1eRITsV8zYoSto6R3QBtpvSc/apA81eD0ntpelijkR
	1zKl8rgVL79s9nE0aqbfUwSoWUmDK9iI5TrwRxUjPVi+TdLrF3AKPkl0vDza3EuZT3Pw0hQGu2oHT
	KCArxXCkflEK3q6gIWEtmtzsPlIKKG/pr4Y3phwr6tekF6Yu/l9XlrX7r0W7aEXW0/3WMWfKP0grn
	btDwbKBQ==;
Received: from localhost ([::1]:63284 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jxMzc-008jyU-3b; Mon, 20 Jul 2020 04:01:32 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:47061) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jxMzU-008jyN-7u
 for samba-technical@lists.samba.org; Mon, 20 Jul 2020 04:01:27 +0000
Received: by mail-io1-xd44.google.com with SMTP id a12so16127272ion.13
 for <samba-technical@lists.samba.org>; Sun, 19 Jul 2020 21:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=06FB5woN06uiD3GvLoqoO/p4B+0/TRLVi1n7WwNJWW4=;
 b=on1+bAOdCGMblOPS50ks9XVUNV/Pv71/nJg7UHPlRQlJ7zuDhAgO7rCEVd3USaY3Mt
 IgRp2NqdUc1Wj6R15cpQvh1XfiKAY7z6hN2GtCy1Y1bRtAzG0E3cWRAVJeEUuxqRwsML
 9sIww+QZdyIwZKeRBu07fLXx00Rc5Mew8zrCta+ElkHnG2jDkeqyd8Q2AOrIBQeAbpSi
 O7uvX8SD1YJVM3FnYumZDNcZmUcLjkPC86VRexGDux8PO6f053qJnc6IWzdZmNHxeSWU
 sK0/Xt9+oXdDXdH6npB3/vxC1h0ccmI2u+WSHf8qGPDwUp+TWQUfRFn+9zs5BmYJF7jq
 acHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=06FB5woN06uiD3GvLoqoO/p4B+0/TRLVi1n7WwNJWW4=;
 b=alfTZhYVcrqKdg7M0SRY7wbGKEBuB81uvQV8yKBXaJseePchTN4gROa1Gk37bEPZLC
 7OX6HeeaPMTIOHuDYjVN4L9AFLE/I0rWxEYuHXasa/+SiTgSTiJ5BL+tgkMkV2qhyXIH
 k03uN2cWTHbVNtHjG0eUrdyH3mvU7JLFtXq5oc6OkMn9A0lsiEWoYjCdiihJr93u3gJr
 WLHNu7bRNAfj6uuu6O/+MadQccXGox6IEMu+Xo5EFJ2b3NPBDEHlBCDPC9oxZj38i9C6
 oxADg8EQ6V7/aExr0IfbTKjSm5WrZ01T41q217o5EHxjANUYpvmyO6amFMiLth6RRG+r
 LDTQ==
X-Gm-Message-State: AOAM530OLpHig9O6HyiilKFeCgVUQhB1984H0sm5A0E0KMZ+XrRp8Bb4
 X81J+JWn3sd0C/NLNDj/ZTKtsGf4omJXLWP8mWo=
X-Google-Smtp-Source: ABdhPJyDXRT3U/LawJJ68RJgwLHdTTjyNzrLuB+TjtT4/3mDARYFNZ5G3AYZa83I8wYKg6g4GnxCpLIllnnREJHmOm8=
X-Received: by 2002:a05:6638:1414:: with SMTP id
 k20mr15068626jad.76.1595217681967; 
 Sun, 19 Jul 2020 21:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200720001316.22854-1-rdunlap@infradead.org>
In-Reply-To: <20200720001316.22854-1-rdunlap@infradead.org>
Date: Sun, 19 Jul 2020 23:01:11 -0500
Message-ID: <CAH2r5mtaN8kOJ7WRZFxs3W7AUVO=N58G_ai5r6UVqpMhX4j2CA@mail.gmail.com>
Subject: Re: [PATCH] cifs: delete duplicated words in header files
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Merged into cifs-2.6.git for-next

On Sun, Jul 19, 2020 at 7:14 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Drop repeated words in multiple comments.
> (be, use, the, See)
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Steve French <sfrench@samba.org>
> Cc: linux-cifs@vger.kernel.org
> Cc: samba-technical@lists.samba.org
> ---
>  fs/cifs/cifsacl.h  |    4 ++--
>  fs/cifs/cifsglob.h |    2 +-
>  fs/cifs/smb2pdu.h  |    2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> --- linux-next-20200717.orig/fs/cifs/cifsacl.h
> +++ linux-next-20200717/fs/cifs/cifsacl.h
> @@ -132,7 +132,7 @@ struct cifs_ace {
>  /*
>   * The current SMB3 form of security descriptor is similar to what was used for
>   * cifs (see above) but some fields are split, and fields in the struct below
> - * matches names of fields to the the spec, MS-DTYP (see sections 2.4.5 and
> + * matches names of fields to the spec, MS-DTYP (see sections 2.4.5 and
>   * 2.4.6). Note that "CamelCase" fields are used in this struct in order to
>   * match the MS-DTYP and MS-SMB2 specs which define the wire format.
>   */
> @@ -178,7 +178,7 @@ struct smb3_acl {
>
>  /*
>   * Used to store the special 'NFS SIDs' used to persist the POSIX uid and gid
> - * See See http://technet.microsoft.com/en-us/library/hh509017(v=ws.10).aspx
> + * See http://technet.microsoft.com/en-us/library/hh509017(v=ws.10).aspx
>   */
>  struct owner_sid {
>         u8 Revision;
> --- linux-next-20200717.orig/fs/cifs/cifsglob.h
> +++ linux-next-20200717/fs/cifs/cifsglob.h
> @@ -1466,7 +1466,7 @@ struct cifsInodeInfo {
>         struct list_head llist; /* locks helb by this inode */
>         /*
>          * NOTE: Some code paths call down_read(lock_sem) twice, so
> -        * we must always use use cifs_down_write() instead of down_write()
> +        * we must always use cifs_down_write() instead of down_write()
>          * for this semaphore to avoid deadlocks.
>          */
>         struct rw_semaphore lock_sem;   /* protect the fields above */
> --- linux-next-20200717.orig/fs/cifs/smb2pdu.h
> +++ linux-next-20200717/fs/cifs/smb2pdu.h
> @@ -31,7 +31,7 @@
>   * Note that, due to trying to use names similar to the protocol specifications,
>   * there are many mixed case field names in the structures below.  Although
>   * this does not match typical Linux kernel style, it is necessary to be
> - * be able to match against the protocol specfication.
> + * able to match against the protocol specfication.
>   *
>   * SMB2 commands
>   * Some commands have minimal (wct=0,bcc=0), or uninteresting, responses



-- 
Thanks,

Steve

