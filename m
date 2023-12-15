Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FB7814FFA
	for <lists+samba-technical@lfdr.de>; Fri, 15 Dec 2023 20:07:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=wZiemOCqIAwL6vSP+5Lr+1+2ZvP7z6fHhPxugDj9rZs=; b=fLYuGxlhm6EsFfrotygwOtu3qI
	TM8hzlsJMq9KMARlJJwEiOKzjMTjC4p2KEHhYGJJ3Fi8wuPdml4TWg62LRzwyNmmzzPRiUVcpYQkW
	CVuO/EwODJbu/01hBpbuvDvVLmvNeSbtH+vYDyrnv4ZeF7SHdtVuU/9q44L8+YCf6zCF66elrlcBm
	OeG3TiMqsMdqpeN75etH7VDj5F/0EOieHs5qww0lkjqxGqQRZ77P04fdc42/0D5iysF5NPHPQHfiR
	uU40X8njji/mlLo2vP9o2yeviVXa+KlAnXqynKxPac/n55q7Cq2Djk1rC7tyaNQ0W/AyjwMumCyjX
	/14j3Q9A==;
Received: from ip6-localhost ([::1]:39534 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rEDWZ-007asS-L7; Fri, 15 Dec 2023 19:07:03 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:47128) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1rEDWV-007asJ-FH
 for samba-technical@lists.samba.org; Fri, 15 Dec 2023 19:07:02 +0000
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2cc3647bf06so11024961fa.2
 for <samba-technical@lists.samba.org>; Fri, 15 Dec 2023 11:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702667217; x=1703272017; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wZiemOCqIAwL6vSP+5Lr+1+2ZvP7z6fHhPxugDj9rZs=;
 b=TPhg5c+0A/oDHAcKDR0hiWKJoWnpZotKse0LE5tGoH/2Xc/z2mj+F3+og8zATNYAU9
 7UhpTxXdxlvG/9Hv45V3ziJ8aBQ/dhebmbG99MPVvJCFMB7Zb3MXp1Lymctw1pE73J+M
 quXSUGCgwwOCldeJbT+zwM/s7uUrFSzrKUb/GM3Ia8sMwwmqAtLQEjDAAt48MObRL7dt
 VMGw1FaSL3Qos93LNc7yms2QfItJMtBWbut9Nb0/rhAGhA4W6OHRo9Chq43JR6FB7YiJ
 1ERsbUlD37jYlCk+xRH1Nko2ft7o9Ha5LxrJLo0HQC3Ccjr/LyDlCmL0daxyLplgkD/q
 JJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702667217; x=1703272017;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wZiemOCqIAwL6vSP+5Lr+1+2ZvP7z6fHhPxugDj9rZs=;
 b=ioOtcBJ5ABjIKM2O0XA67EM2GqtXHzBKZNCN+BgMGXAvYoYvWAHKnJrgYer8q29L2w
 3MXusyi9M8tpeEdxraXShitavas5unlF6+Tuy0A79GDt1j55iQ8680sV/65Ccso1iY+8
 tuAoG9n2HLq3oy0jWZamkJJgduDfig/8CITRTwD7eJKn84yza8kZLoLA6HouVE7zFuvm
 qtlqQgKvdh2eN/DdmTQB75NBBahtS8UybU18YkWLqo0sIDLzhFl7dY4BLP7cwlQB59X+
 z+IKnaeInq89ptpNwVgLli8RnPk8RBDgbi8b6DA61BnY8r4F47U31tEt4uynC5d0E7mq
 5K3g==
X-Gm-Message-State: AOJu0YzNPkQEcuLKTXR8wfNMZpyEuu9hjduWFm5APIyzTfMYac0IxMT+
 rQtMB9Nfwpd6r9p1lQxl1iXrBfWfDMuZ5kqJVNs=
X-Google-Smtp-Source: AGHT+IF2wNpAER0WpDsH3q0TuEGCpEEWF23/+69BC3tBNoUC8s2ix2t9byz8yyQZSonHihhcLhVRQN1DDKiBiMd3Qpw=
X-Received: by 2002:a2e:5c01:0:b0:2cb:2bd1:e984 with SMTP id
 q1-20020a2e5c01000000b002cb2bd1e984mr3500943ljb.17.1702667216649; Fri, 15 Dec
 2023 11:06:56 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mtZW18Wq=mnU9MKH0eL-1wCKXTRGt00E-X32_dJ_H1F9w@mail.gmail.com>
In-Reply-To: <CAH2r5mtZW18Wq=mnU9MKH0eL-1wCKXTRGt00E-X32_dJ_H1F9w@mail.gmail.com>
Date: Fri, 15 Dec 2023 13:06:45 -0600
Message-ID: <CAH2r5mv1gQstP23XWMpGBWKaAgSj1r9fcv=MUsTDj7dL4RH=JA@mail.gmail.com>
Subject: Re: [PATCH v2] smb3: allow files to be created with backslash in name
To: CIFS <linux-cifs@vger.kernel.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Xiaoli Feng <xifeng@redhat.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I noticed that this patch got missed.  Do you remember if any problems with=
 it?

(I noticed it while deleting some old branches).

To avoid this happening in the future, I have created a
"for-next-next" in cifs-2.6.git for-next (similar to what we do with
ksmbd and have a "ksmbd-for-next" and a "ksmbd-for-next-next").  I
will add this patch to the for-next-next unless anyone has any
objections (pending more testing and review)

Since we basically have two types of patches - those that are for the
next RC (in this case rc6) vs. those that are for the next release (ie
6.8 merge window), I want to make sure we don't lose any of the latter
anymore.

On Sat, Feb 27, 2021 at 2:12=E2=80=AFAM Steve French <smfrench@gmail.com> w=
rote:
>
> Backslash is reserved in Windows (and SMB2/SMB3 by default) but
> allowed in POSIX so must be remapped when POSIX extensions are
> not enabled.
>
> The default mapping for SMB3 mounts ("SFM") allows mapping backslash
> (ie 0x5C in UTF8) to 0xF026 in UCS-2 (using the Unicode remapping
> range reserved for these characters), but this was not mapped by
> cifs.ko (unlike asterisk, greater than, question mark etc).  This patch
> fixes that to allow creating files and directories with backslash
> in the file or directory name.
>
> Before this patch:
>    touch "/mnt2/subdir/filewith\slash"
> would return
>    touch: setting times of '/mnt2/subdir/filewith\slash': Invalid argumen=
t
>
> With the patch tReported-by: Xiaoli Feng <xifeng@redhat.com>ouch and
> mkdir with the backslash in the name works.
>
> Version two of the patch works with files in subdirectories not just
> the root of the share.
>
> This problem was found while debugging xfstest generic/453
>     https://bugzilla.kernel.org/show_bug.cgi?id=3D210961
>
> Reported-by: Xiaoli Feng <xifeng@redhat.com>
>
> --
> Thanks,
>
> Steve



--=20
Thanks,

Steve

