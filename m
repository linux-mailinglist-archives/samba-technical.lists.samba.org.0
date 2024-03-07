Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9AB875835
	for <lists+samba-technical@lfdr.de>; Thu,  7 Mar 2024 21:23:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=6xbj6kfKYFycADPkyqjTomsxdR3myyejYOVqL9Ut/k0=; b=jITZqwdXypZn2msyO3LhnPTFne
	uj2EXm33Cw4rT4BoMwZgrYLvkriH7csqKsRwmiPXyyDn9J6UT5FP+S/lgqmNsmJxGJOXjUMErZfTb
	iOB9GqjnzNSXU34hgwxSec/4uetWkfMw8463g+zYLz+UDPyGZAWPQIv7HycbXyxt64eEr9A0Bcxwu
	8N1tnYe+5PyPcrw7N16ZqYyHAEYZNRgib591toxd8NPgro9tJ2xVnSeF7cW3Stg2NmgQuxCl0YBnJ
	Sih/vGDod+WfKdh76mlh07MTzF57iC65tTUFvyudU/EYjMGTGoGbliIB/jF7vflzKsm+KwMsC0K45
	qVpxe9Uw==;
Received: from ip6-localhost ([::1]:46720 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1riKGS-00C0f9-A9; Thu, 07 Mar 2024 20:22:52 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29]:56597) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1riKGN-00C0f2-PU
 for samba-technical@lists.samba.org; Thu, 07 Mar 2024 20:22:50 +0000
Received: by mail-vs1-xe29.google.com with SMTP id
 ada2fe7eead31-472a3dee161so323545137.1
 for <samba-technical@lists.samba.org>; Thu, 07 Mar 2024 12:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google; t=1709842965; x=1710447765; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6xbj6kfKYFycADPkyqjTomsxdR3myyejYOVqL9Ut/k0=;
 b=YREbnyEuSMgcfeE+YM6wdSjbEweQzeBDiF+i3EQY1fa5ZxFYgeesZR+KpcRrxSAmCL
 YMAROrn18fB42Lr0cHr73igfg4a0lmRCKnmPNLlg5wuIBFnptdBSGah9cl6uRBCpRRXJ
 qS+PLrtonUus/XBkNCTa0E5O21XFDGxy3rZakLLUuxsJwcmeOd7sGTKXfgmcQZGXmGjm
 Aag44t4cQnsmkJsYFLtYn3Bpmlj5VGMdIJnpvie57PhvKh01/PvcDbaQAIHuS1+3bbLW
 svDDOWNKJIwC5DeZ8kwC5g3MVZS4ZRjXirCQuhm9RthCv4GUFVCIW4HDqCemGYnkO2nP
 6M6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709842965; x=1710447765;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6xbj6kfKYFycADPkyqjTomsxdR3myyejYOVqL9Ut/k0=;
 b=bvtTIQnj7HoZufrGEzlx/WfeTzNAjSzBuTw3jpxNzFwjYMo1TQh+YCIy8c7f3v3HO2
 YaSilii+wtDoA44IaOJkEyUw87v31sx4xGoCV/7td2JtuqxBtzOwA3OI+vb2rPeRLKki
 7Bh4Bv329+/X/nh54o7EI/89oqyQtRrdPKi3EAEREkDWE1zyJd0TB/NuKLlcjJ7o4TgZ
 UIbylR9TBeqnPSckZ98IqvaBP/yEEb/ZHsimAfRE+0mfmU1JRiO4osDCa9JqBvActNuG
 M4loT3jrRRF6u3uDcYs2itlHzvBFMTKD+uL1+SIOgI01ZoGHG9Ym7ONborFqpaI9PeTq
 mVIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwI3KNgnaAWe2mhejx7nWLWNRVRty9KKTjPxpGwjG9MRSzdb15FRB2Nyc1LKe4Hyz/KUhL6bd3E4ePSQ6Qb1tVKBsO33mJ/76nuYdAV14k
X-Gm-Message-State: AOJu0YzrUeAzjknFDMDKPN0htOojoq3fYSVWjYfAEGiOhrer54Z0WL/e
 dJ21wBzTnycagMS06Wr23cCdLxkHY7V9YeF19q7Qqk5vUDdL2uC9HVFchg278XsqdQYj8Wq1Y3p
 bsAuvS7Cd2DqAdHBrdePcUWXrXiCDCuQ6p7HQ
X-Google-Smtp-Source: AGHT+IFronwxMMHkcckLT9rFBLjnZhvZHnpYrjZvP+dDG/QrNH6L26ofm9YjWXE2n0J7F43BCIlvZW8mc35ZPNBPzAA=
X-Received: by 2002:a05:6102:242f:b0:473:886:5616 with SMTP id
 l15-20020a056102242f00b0047308865616mr1518189vsi.5.1709842965693; Thu, 07 Mar
 2024 12:22:45 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mutAn2G3eC7yRByF5YeCMokzo=Br0AdVRrre0AqRRmTEQ@mail.gmail.com>
 <CAOQ4uxg8YbaYVU1ns5BMtbW8b0Wd8_k=eFWj7o36SkZ5Lokhpg@mail.gmail.com>
 <CAH2r5msvgB19yQsxJtTCeZN+1np3TGkSPnQvgu_C=VyyhT=_6Q@mail.gmail.com>
 <nbqjigckee7m3b5btquetn3wfj3bzcirm75jwnbmhjyxyqximr@ouyqocmrjmfa>
 <CAH2r5mt_FY=9Dg6_K1+gYMAKuyPAPO0yRZ9hKcLkyypmUjxQZA@mail.gmail.com>
In-Reply-To: <CAH2r5mt_FY=9Dg6_K1+gYMAKuyPAPO0yRZ9hKcLkyypmUjxQZA@mail.gmail.com>
Date: Thu, 7 Mar 2024 12:22:32 -0800
Message-ID: <CAB5c7xrnE=egCK3iD1=OSNTaAvRqQRJK_wWXdogfGN5TDCHq_Q@mail.gmail.com>
Subject: Re: [LSF/MM/BPF TOPIC] statx attributes
To: Steve French <smfrench@gmail.com>
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: CIFS <linux-cifs@vger.kernel.org>, Christian Brauner <brauner@kernel.org>,
 Amir Goldstein <amir73il@gmail.com>, Jan Kara <jack@suse.cz>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 samba-technical <samba-technical@lists.samba.org>,
 David Howells <dhowells@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 lsf-pc <lsf-pc@lists.linux-foundation.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Mar 7, 2024 at 2:04=E2=80=AFPM Steve French <smfrench@gmail.com> wr=
ote:
>
> On Thu, Mar 7, 2024 at 11:45=E2=80=AFAM Kent Overstreet
> <kent.overstreet@linux.dev> wrote:
> >
> > On Thu, Mar 07, 2024 at 10:37:13AM -0600, Steve French wrote:
> > > > Which API is used in other OS to query the offline bit?
> > > > Do they use SMB specific API, as Windows does?
> > >
> > > No it is not smb specific - a local fs can also report this.  It is
> > > included in the attribute bits for files and directories, it also
> > > includes a few additional bits that are used by HSM software on local
> > > drives (e.g. FILE_ATTRIBUTE_PINNED when the file may not be taken
> > > offline by HSM software)
> > > ATTRIBUTE_HIDDEN
> > > ATTRIBUTE_SYSTEM
> > > ATTRIBUTE_DIRECTORY
> > > ATTRIGBUTE_ARCHIVE
> > > ATTRIBUTE_TEMPORARY
> > > ATTRIBUTE_SPARSE_FILE
> > > ATTRIBUTE_REPARE_POINT
> > > ATTRIBUTE_COMPRESSED
> > > ATTRIBUTE_NOT_CONTENT_INDEXED
> > > ATTRIBUTE_ENCRYPTED
> > > ATTRIBUTE_OFFLINE
> >
> > we've already got some of these as inode flags available with the
> > getflags ioctl (compressed, also perhaps encrypted?) - but statx does
> > seem a better place for them.
> >
> > statx can also report when they're supported, which does make sense for
> > these.
> >
> > ATTRIBUTE_DIRECTORY, though?
> >
> > we also need to try to define the semantics for these and not just dump
> > them in as just a bunch of identifiers if we want them to be used by
> > other things - and we do.
>
> They are all pretty clearly defined, but many are already in Linux,
> and a few are not relevant (e.g. ATTRIBUTE_DIRECTORY is handled in
> mode bits).  I suspect that Macs have equivalents of most of these
> too.

MacOS and FreeBSD return many of these in stat(2) output via st_flags.
Current set of supported flags are documented in chflags(2) manpage on both
platforms.

