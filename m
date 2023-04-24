Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C486EC372
	for <lists+samba-technical@lfdr.de>; Mon, 24 Apr 2023 03:42:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=V/zosqmwqAornYsPu6NG74fTzJKSuyEo9PCyi1si498=; b=PvldvBQrSWL/FYlu2VsY2O1jL4
	G+7S0qil936ay9iuyPL8yqSiNloNktmY5P0QSzunLTp8n8p1tvoFHkYLV45Dc4I8cve2LsC3hyc6h
	RZLsdv5IsbolgRpCI102u8iBFNvQngO2o8dBPWbqFPTgtQDgTSiTfXXfSYRpFhRKWxgzvot2JKpm7
	59OJH5N8oJ36oBQx5O3aFnaO1xgx68uWbRktboKVC1hSVCdnsRMHSEmq3UrhIX80dDkbStT1k3T+I
	nu6KF62Lh21cYpxt4SLUIBNmjd+PZse/pZUSPTM3eIGmF7mYyQqO+BXo5zGGsAOxmJv//fiIBphS4
	bCgASL1Q==;
Received: from ip6-localhost ([::1]:58108 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pqlDp-003ns6-MR; Mon, 24 Apr 2023 01:42:29 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:57351) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pqlDk-003nrq-Nx
 for samba-technical@lists.samba.org; Mon, 24 Apr 2023 01:42:27 +0000
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-38ea3f8e413so1030466b6e.2
 for <samba-technical@lists.samba.org>; Sun, 23 Apr 2023 18:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682300542; x=1684892542;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V/zosqmwqAornYsPu6NG74fTzJKSuyEo9PCyi1si498=;
 b=cn/RurF94W7n4YbswgHknBfXfe9KxhxePbUEwozKR2PqXnxq1nA1GQT7c+ZMJ/4WDu
 kgMvyH/GHqkaXXxdiz4u4ctKjnSGX7OCZpegZNCp6Ipgi4cszJ8tdLFeGpT3XRai1M3N
 wEJCs85lipVet3lMdHkXeefEIMyoA7EDcy2T4DW+JAl5hE8Lp7IF9twETLOGpdB6uOOv
 pkuELI4rS65NbnDSYXZ67oWEiPsNcElN0L/61+e0f2EX29RHtRPmCopiFsnmEdtPlTVB
 RoYUnmXF4Rmm2/LC704GvYhWmgk4fGF169+Hi/VcyMPgiuF7ogSKv4KfZW6XjS6g11AB
 Ozgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682300542; x=1684892542;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V/zosqmwqAornYsPu6NG74fTzJKSuyEo9PCyi1si498=;
 b=kM/839PJzAYpBTvx3hIWLM0MDT1PoBeJMyWBgWnWonzGj9DisZbt2KYMlObPD95o5k
 e1+me7vxu0S0459Ub/d7uwMxHS91fIlnmIKlRt2MOX5MzzOGPTOKvLCF+Y626TFT826g
 etfTbKNxIN6NAD1nt3JQAAu5qSFaCB25DtX8dABphKwdWc35FVqIEYGo9wTFsGtE3wZD
 i5GWwZVc70JR9CKTaoMYtDUc63zWhKIHh91t1jkjxnl3pWs1b2Z7BqzbBoHtozJ1hG1o
 V+2ReKaGUdbVPg8Pw17XujQ+E7ORtyuVRMMo++zGfTeYDFj6Iz2fMDmJ0CqVbiYCqV99
 1JTA==
X-Gm-Message-State: AAQBX9fvXRXlh4ShtS194o2Rha7u2OnLe2Qv3SWSo6au9PnTjR9Utigx
 dHK2ultXR/vmcCrFEMM3kqKFO+J72CDL9ZiF/9LZf+W9
X-Google-Smtp-Source: AKy350ZzA/GFUZOLaVhS/6z78Uwl6I7h89/d36a3gPrAFZh6csRh+Y0UGYucGW+SrGpg5aExbZJ1GOoi9ZMUMX5nUCg=
X-Received: by 2002:aca:b984:0:b0:389:6b33:fe9e with SMTP id
 j126-20020acab984000000b003896b33fe9emr5745289oif.58.1682300542410; Sun, 23
 Apr 2023 18:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <5087dd7c-cf73-1aa1-6a3f-883bd9d9af23@samba.org>
In-Reply-To: <5087dd7c-cf73-1aa1-6a3f-883bd9d9af23@samba.org>
Date: Sun, 23 Apr 2023 21:42:10 -0400
Message-ID: <CAOCN9rwFUkpqnBAPGPc49N1s0bHQAUx+9o4as7dq+YcLn3P9Fg@mail.gmail.com>
Subject: Re: [Announce] Samba 4.18.2 Available for Download
To: samba-technical@lists.samba.org
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
From: Nico Kadel-Garcia via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Kadel-Garcia <nkadel@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I've updated my RHEL 8 and RHEL 9 RPM building tools for this 4.18.2
release, at:

   https://github.com/nkadel/samba4repo

On Wed, Apr 19, 2023 at 6:34=E2=80=AFAM Jule Anger via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Release Announcements
> ---------------------
>
> This is the latest stable release of the Samba 4.18 release series.
>
>
> Changes since 4.18.1
> --------------------
>
> o  Jeremy Allison <jra@samba.org>
>     * BUG 15302: Log flood: smbd_calculate_access_mask_fsp: Access denied=
:
>       message level should be lower.
>     * BUG 15306: Floating point exception (FPE) via cli_pull_send at
>       source3/libsmb/clireadwrite.c.
>
> o  Andrew Bartlett <abartlet@samba.org>
>     * BUG 15328: test_tstream_more_tcp_user_timeout_spin fails
> intermittently on
>       Rackspace GitLab runners.
>     * BUG 15329: Reduce flapping of ridalloc test.
>     * BUG 15351: large_ldap test is unreliable.
>
> o  Ralph Boehme <slow@samba.org>
>     * BUG 15143: New filename parser doesn't check veto files smb.conf
> parameter.
>     * BUG 15354: mdssvc may crash when initializing.
>
> o  Volker Lendecke <vl@samba.org>
>     * BUG 15313: large directory optimization broken for non-lcomp path
> elements.
>     * BUG 15357: streams_depot fails to create streams.
>     * BUG 15358: shadow_copy2 and streams_depot don't play well together.
>
> o  Rob van der Linde <rob@catalyst.net.nz>
>     * BUG 15316: Flapping tests in samba_tool_drs_show_repl.py.
>
> o  Stefan Metzmacher <metze@samba.org>
>     * BUG 15317: winbindd idmap child contacts the domain controller
> without a
>       need.
>     * BUG 15318: idmap_autorid may fail to map sids of trusted domains
> for the
>       first time.
>     * BUG 15319: idmap_hash doesn't use ID_TYPE_BOTH for reverse mappings=
.
>     * BUG 15323: net ads search -P doesn't work against servers in other
> domains.
>     * BUG 15353: Temporary smbXsrv_tcon_global.tdb can't be parsed.
>
> o  Joseph Sutton <josephsutton@catalyst.net.nz>
>     * BUG 15316: Flapping tests in samba_tool_drs_show_repl.py.
>     * BUG 15343: Tests use depricated and removed methods like
>       assertRegexpMatches.
>
>
> #######################################
> Reporting bugs & Development Discussion
> #######################################
>
> Please discuss this release on the samba-technical mailing list or by
> joining the #samba-technical:matrix.org matrix room, or
> #samba-technical IRC channel on irc.libera.chat.
>
> If you do report problems then please try to send high quality
> feedback. If you don't provide vital information to help us track down
> the problem then you will probably be ignored.  All bug reports should
> be filed under the Samba 4.1 and newer product in the project's Bugzilla
> database (https://bugzilla.samba.org/).
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D Our Code, Our Bugs, Our Responsibility.
> =3D=3D The Samba Team
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Download Details
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> The uncompressed tarballs and patch files have been signed
> using GnuPG (ID AA99442FB680B620).  The source code can be downloaded
> from:
>
>          https://download.samba.org/pub/samba/stable/
>
> The release notes are available online at:
>
>          https://www.samba.org/samba/history/samba-4.18.2.html
>
> Our Code, Our Bugs, Our Responsibility.
> (https://bugzilla.samba.org/)
>
>                          --Enjoy
>                          The Samba Team
>
>

