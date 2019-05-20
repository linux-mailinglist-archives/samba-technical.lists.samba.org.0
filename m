Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CD1231E4
	for <lists+samba-technical@lfdr.de>; Mon, 20 May 2019 13:01:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=JPn3R9Ddr1wYrEKLD61fGYNMudQWcjgVfBZX6RlAQFk=; b=XIUrn/6VkMnQPayuZt6qYQxdEr
	uCOVka81VvA5vEMgHCjmma+cqrrkvBr6hUgdcCr6L/OjK0l0TE0IFlwk3dLlSAe5mbXnCWM5bF/al
	9yhpGFzY3N/6yd43MzwNNER2oAhrO2ZO9TyyNDzNSQURUZrwF9PTzyIDos/HZ2y8ZBLcvuxXTzffh
	k0ik8uIO4B1bDXKsz0bzjPR4ncveO6HWaZzUk/wM2uTHJ3IAMlQ0NQlycNQalMC0OdSuqW04/4pi4
	NiZ9Ga6eVYSo4HtN+zuwL4tGEXifCb6IjUZU7RGrzEXJVKw/PMLkwr7/I6vAkng6LJ6EJSQS0p49j
	7x2m9k1g==;
Received: from localhost ([::1]:30188 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hSg2R-000eV1-T3; Mon, 20 May 2019 11:01:03 +0000
Received: from mail-yw1-xc2a.google.com ([2607:f8b0:4864:20::c2a]:42533) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hSg2M-000eUu-CF
 for samba-technical@lists.samba.org; Mon, 20 May 2019 11:01:01 +0000
Received: by mail-yw1-xc2a.google.com with SMTP id s5so5670046ywd.9
 for <samba-technical@lists.samba.org>; Mon, 20 May 2019 04:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Dcfsn32qaAF2j2h0jKMdNBQrbgI9sxNiINf2OwPZgMU=;
 b=aQpCj41LsACuCi7yiGCXF5qxRznqmdvkjGJadjR6PtgZJkE8CXbnxKAaPqJfkFldop
 x/w1jOP3I6H796iKRx92Lvbn27iPdyPxAqGYvb4dt2cShH3GfZWfLpgrQ1w+OcVaOZJx
 CbOPeeseG9d6ExPFtCEIOf9FxJgXMipmkW+WTM+jRXMcWNjDSkPxyXPrkVPaAbud2rwO
 kX5TDbldpRmWa1pb9xxHuEhxYVHck6aRR2VtCHQMpmJBNOvqttuA891bpfA7B/frWdBt
 ddjztTNs5wR7oTVa64/HX46d64UB4KTwrwsF/70L0qWG4xnoTrTNU2UZ5YaBvLAYJCLS
 10Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Dcfsn32qaAF2j2h0jKMdNBQrbgI9sxNiINf2OwPZgMU=;
 b=N7n9lprUci/GIXrQjyuoQXP1sqfp/fmB71maBuOIehMkzNnwvrywSVJhkVghZu+iZP
 k5Tnp+z/weMwdGuX720P81uW19mBQl7S3jmiNGtxW31xg+DG8ww/dYsgTHUDSLlvO73h
 IFvbxLVmkzHI472PvVe8I0ql4I5YOn7t38QgSnvp/2G6ngzt6WXRNujw8yqMsdsVHVg7
 NxXoToJ/SxQcp45h6wLAMF78sjQYjXl3s7ZFGkotXHjWobx7cKVpvUk0esLP+AtCLkyC
 RT2d+ulE+km4LtDPPxG3JzgsaeX9WGAHtIGjuieg2LIoLujV+P7v0LPQe6QGML4dpihX
 E1fw==
X-Gm-Message-State: APjAAAVZ/HevNHQPKufnKSPhNazQQ4H+lxToJGkEvCHk1PJOLtTWY+n2
 Ivjw3EIDkVOTh/Kj2ut/67LcK6xBBTgpkVX0eKDcJruP
X-Google-Smtp-Source: APXvYqzN2Sp4d/ZFmaztzIyeRQRY7O6BqFobz8mCRXY4BbNdglgdmG3qIgOtnP4I+Y+NhKA5QIOxA0Ti0Mq8NaG56FI=
X-Received: by 2002:a81:4b8e:: with SMTP id
 y136mr22238821ywa.253.1558350056331; 
 Mon, 20 May 2019 04:00:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAB5c7xr4d8oiKoeL3wYCcH860RTP3LY_FYTsBGC--ukGRiTa5A@mail.gmail.com>
 <20190517054426.aoyovsk4cwsse2li@inti>
In-Reply-To: <20190517054426.aoyovsk4cwsse2li@inti>
Date: Mon, 20 May 2019 07:00:45 -0400
Message-ID: <CAB5c7xofY0NQMrf_UX36JHDucoN5f-N-HdPvXis3PXMRbSEQpw@mail.gmail.com>
Subject: Re: [PATCH] zfsacl: Fix ACL behavior issues with vfs_zfsacl
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> - commit message is all in one line
>
> - this is a hot code path and parmetric options are expensive, can you
> please use a
>   configuration object, the existing parametric option denymissingspecial
> should
>   be converted to the config object option while at it. Cf other VFS
> modules on how
>   to do it, eg gpfs or fruit
>
> - please check mixed space/tabs indentation
>
> - please check trailing space
>
> - pleaseuse common struct initializer:
>
>   SMB_ACE4PROP_T hidden_ace;
>   if (S_ISDIR(fsp->fsp_name->st.st_ex_mode)) {
>           hidden_ace.flags = SMB_ACE4_ID_SPECIAL;
>           hidden_ace.who.id = SMB_ACE4_WHO_EVERYONE;
>           hidden_ace.aceType = SMB_ACE4_ACCESS_ALLOWED_ACE_TYPE;
>           hidden_ace.aceFlags =
> (SMB_ACE4_FILE_INHERIT_ACE|SMB_ACE4_DIRECTORY_INHERIT_ACE);
>           hidden_ace.aceMask = 0;
>           DBG_DEBUG("zfsacl: setting empty everyone@ ace on dir  %s \n",
> fsp->fsp_name->base_name);
>   } else {
>           hidden_ace.flags = SMB_ACE4_ID_SPECIAL;
>           hidden_ace.who.id = SMB_ACE4_WHO_EVERYONE;
>           hidden_ace.aceType = SMB_ACE4_ACCESS_ALLOWED_ACE_TYPE;
>           hidden_ace.aceFlags = 0;
>           hidden_ace.aceMask = 0;
>           DBG_DEBUG("zfsacl: setting empty everyone@ ace on file  %s \n",
> fsp->fsp_name->base_name);
>   }
>
>   rewrite as:
>
>   SMB_ACE4PROP_T hidden_ace = (SMB_ACE4PROP_T) {
>           hidden_ace.flags = SMB_ACE4_ID_SPECIAL;
>           hidden_ace.who.id = SMB_ACE4_WHO_EVERYONE;
>           hidden_ace.aceType = SMB_ACE4_ACCESS_ALLOWED_ACE_TYPE;
>   };
>
>   if (S_ISDIR(fsp->fsp_name->st.st_ex_mode)) {
>           hidden_ace.aceFlags =
> (SMB_ACE4_FILE_INHERIT_ACE|SMB_ACE4_DIRECTORY_INHERIT_ACE);
>   }
>   DBG_DEBUG("zfsacl: setting empty everyone@ ace on file  %s \n",
> fsp->fsp_name->base_name);
>
> - please split the patch in two patches, each just adding one option
>
> - please add the new options to the manpage
>
> - I don't understand the mechanics of setting the SEC_DESC_DACL_PROTECTED
> flag
>   when no inheritable ACEs are present. If ZFS does support the flag, why
> not
>   just map the flag from the wire like gpfs? I might be missing
> something...
>
> - the option name block_zfs_acl_chmod seems a bit misleading. Can we come
> up
>   with something else that better describes the intended semantics? Eg
>   "ignore_empty_mode".
>
> Thanks!
> -slow
>
> --
> Ralph Boehme, Samba Team                https://samba.org/
> Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
> GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46
>
Hi Ralph,

Thanks for the feedback and suggestions. I'll try to get this done this
week or next week. You are correct that ZFS has the  NFSv4.1 ACL flags, but
FreeBSD does not currently implement NFSv4.1 ACL inheritance. The
suggestion of just mapping what we receive over the wire is a good one. I
could probably do this for the case of Solaris and Illumos.

One possible alternative is that I could move this logic/lies to libsunacl
(the library that maps ZFS ACLs to FreeBSD ACLs) so that there won't be a
FreeBSD-specific parameter for vfs_zfsacl. In this case the only thing I
would need to add to fix disabling inheritance in samba is mapping the
NFSv4.1 ACL flags to control flags like gpfs does.

Let me know if you prefer the second approach.

Andrew
