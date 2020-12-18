Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F462DE8FE
	for <lists+samba-technical@lfdr.de>; Fri, 18 Dec 2020 19:41:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Z7jR72gvgMysEEXgqv4JPyd7bohxMk2wY0hLM59Aeus=; b=M9lr2HtcPqmVT1Zsm2CSvu9IrT
	TJTfe4s6S44Dx1GstrU0+nUbYT0fuvfDtJrVDqasLeEF4cBBCpkgNZmYvR9axy7A8QNqTV7Sc9rQY
	PagOwA43+9/GG59Vg4cU78Lnxn+3scbxds4/HPXDnV/cdK7fAab8nI9WxQa7cbo3lyCrqA6AJgT3S
	7Fu5SSt4YycHVLgrFGHOBBzYBNZoTT+DyrfgFZxLINDsbrRRoKlu9f8hJD02VbLr3THM3CnniPXik
	XC3+XeXdCLRiz3fbn9urALazJV7PRH7dubupb6W/NH7vuIv4qBeAYCnCuKZM/mhqKKNdoGMJJHWob
	DtkDRlDw==;
Received: from ip6-localhost ([::1]:41890 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kqKg9-001zvk-7e; Fri, 18 Dec 2020 18:40:37 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:34790) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kqKg4-001zvd-5G
 for samba-technical@lists.samba.org; Fri, 18 Dec 2020 18:40:34 +0000
Received: by mail-yb1-xb30.google.com with SMTP id v67so2815697ybi.1
 for <samba-technical@lists.samba.org>; Fri, 18 Dec 2020 10:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z7jR72gvgMysEEXgqv4JPyd7bohxMk2wY0hLM59Aeus=;
 b=FbdHY15z3Rb6j6g4JE9QsSsUHjp04iGmeSA2XUtD/zSlOrxzA0WTS085aKrkesD2cM
 k1xONlEUTEHBpPOitWhRhFLKgFsd94UpbK1/tLqafJnk/Qam1eErX9UpCnMDR0fQA7nR
 DtRFjRL3HuYlImSZoTInMYeMtOD8tMo48iBdK4OlHV3gF9fZ/iRw/kVm2ZAVYD1IXRI5
 YLv8VIxudez75O9+1zj8Txu7pV4lTJvqqyD6LgeakopuhoygseBTHuYAklUQcYkBIXfT
 GRS777gR4TEHQvfsqaKlFV3SBgA7jxYg5R43klgLl7Sljif0Ix/J2cMsdYEO1RBHseLk
 m2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z7jR72gvgMysEEXgqv4JPyd7bohxMk2wY0hLM59Aeus=;
 b=Tpyo5dQQzCum1GnjzyHYXk8qpwP/41DDZZ4/WYVSH0RD5Pk8Bd78GiODGe3DnYKXxq
 f8w0BNBc4HpWVDfgUEf8JukHNBUH1hBLdl88x4n0xKdxwnrTu4lkcZ973As0sSB5VfW4
 RDy8nAs2+nJK7wW2bCDv64MAmQxryR7z1w/5K1gex4H3fKZFPRm7WgGheijp30co/VXH
 mrdnG8+v/BTdfW4M4g1S9kQzve4fxsSkopEH6TP+YviO1SDpYEItFVl2mI+lTNMfoWyG
 /MlLWUp5tCeK1RIVYc0ehAGQ5eqLa3woROc6kgfyrlEPO2MBvUppnZFpXPaSC50zF7KV
 cxTQ==
X-Gm-Message-State: AOAM531EOnVw80L+lLYyUAl0op0tzLZcgCUvdn7dMb/S9fn7yN7PR50p
 r3MEd4Gy8TVG8reH+BzymfHTo96PFrz6nrsiXKw=
X-Google-Smtp-Source: ABdhPJyGngw2SmFyfCwklV8KN7Go+Kfm/IAeF4ztQpcuxDt8oEGa/9Hh4/DnTneDjDRt/mMV0coX3qhSnTfpzwpVOHo=
X-Received: by 2002:a05:6902:602:: with SMTP id
 d2mr7418313ybt.205.1608316812748; 
 Fri, 18 Dec 2020 10:40:12 -0800 (PST)
MIME-Version: 1.0
References: <20201027204226.26906-1-pboris@amazon.com>
 <20201217205808.14756-1-pboris@amazon.com>
 <CANT5p=oMDGHSMOCgOrz6S9tuB3BmbL4mLqsC4vqSPod8pWsTaA@mail.gmail.com>
In-Reply-To: <CANT5p=oMDGHSMOCgOrz6S9tuB3BmbL4mLqsC4vqSPod8pWsTaA@mail.gmail.com>
Date: Fri, 18 Dec 2020 13:40:01 -0500
Message-ID: <CAHhKpQ4qKjZGboa=y=Yq8WAMtDE6UXDr-3vaRvtFJqbmnkXPCQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Add SMB 2 support for getting and setting SACLs
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
Cc: samjonas@amazon.com, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steven French <sfrench@samba.org>,
 Boris Protopopov <pboris@amazon.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

No objections on my part as far as adding 'if (info & SACL_SECINFO) return'.

I had originally those flags sent from the caller, but that was
confusing at the top level (e.g. in cifsacl.c), so I have opted to
passing only "extra" flags ("additional" was already taken).

-------------
...
> > --- a/fs/cifs/smb2ops.c
> > +++ b/fs/cifs/smb2ops.c
> > @@ -3315,9 +3315,9 @@ get_smb2_acl(struct cifs_sb_info *cifs_sb,
> >         struct cifs_ntsd *pntsd = NULL;
> >         struct cifsFileInfo *open_file = NULL;
> >
> > -       if (inode)
> > +       if (inode && !(info & SACL_SECINFO))
> >                 open_file = find_readable_file(CIFS_I(inode), true);
> > -       if (!open_file)
> > +       if (!open_file || (info & SACL_SECINFO))
> >                 return get_smb2_acl_by_path(cifs_sb, path, pacllen, info);
> >
> >         pntsd = get_smb2_acl_by_fid(cifs_sb, &open_file->fid, pacllen, info);
> Why not have an if (info & SACL_SECINFO) return
> get_smb2_acl_by_path... right at the beginning?
> Looks cleaner that way IMO.
>
...
> > diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
> > index 0aeb63694306..b207e1eb6803 100644
> > --- a/fs/cifs/smb2pdu.c
> > +++ b/fs/cifs/smb2pdu.c
> > @@ -3472,8 +3472,10 @@ SMB311_posix_query_info(const unsigned int xid, struct cifs_tcon *tcon,
> >  int
> >  SMB2_query_acl(const unsigned int xid, struct cifs_tcon *tcon,
> >                u64 persistent_fid, u64 volatile_fid,
> > -              void **data, u32 *plen, u32 additional_info)
> > +              void **data, u32 *plen, u32 extra_info)
> >  {
> > +       __u32 additional_info = OWNER_SECINFO | GROUP_SECINFO | DACL_SECINFO |
> > +                               extra_info;
> I still prefer having these flags set by the caller. That way, the
> caller has the flexibility to query only the subset needed.
> --
> -Shyam

