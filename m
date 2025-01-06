Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 46137A0232F
	for <lists+samba-technical@lfdr.de>; Mon,  6 Jan 2025 11:37:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=/FQpU3zDFyELV13Dl3Q4+t6MTLPT/w67Kf8FOAPGSFQ=; b=3RGEbJd88STskdHKfWYRrA63CM
	haNwTZ8z30vo2wmcsSfjvRnhLIv1MAJ+wuJtTTg1XvaLawScbjdABa+gBFmJ78pa8kxLe2jyuhXe1
	5nS42M54hNv4tAb7/ISrQQWfV46dTD4toCxj6xlG0ARSFHI2yebA20gg7y2hxDwTUzmp5fvNUmJ57
	2ErZpSS6DqKy2j7bedDI4PMpq0X/EmyWVsGNPznkTp5ZmQHHg5RIwqP3rExCyUndI5fV6ijMoRtCU
	VTlECkZZ/ELPpUVQICEY3B+e91lic5oGBKymuTdeV/cytUHFZ2tNwJAGlZPWjbbFdbX2bCB/Lot8D
	N4GZ5M9Q==;
Received: from ip6-localhost ([::1]:46564 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tUkTc-007NcJ-Pm; Mon, 06 Jan 2025 10:36:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28450) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tUkTV-007Nbu-LT; Mon, 06 Jan 2025 10:36:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=/FQpU3zDFyELV13Dl3Q4+t6MTLPT/w67Kf8FOAPGSFQ=; b=oY+WqczSod05IVRNtmNtH9cG77
 +Prgq8jYC12V6onlAMzk1cOysVvx5ed29EtZDk2D/MnSkt4IMYXGLLuREhEMZk4HvWL1ys2gzaQCI
 DGO2scAGXlIHfJk9x7RJU/rpOMAKx3eY+Wr2yX/jJvYryU/PKobO05OmDm7e2LzZAFpQOy5Kbqx2U
 lczvG/F4wB9jDRaDpgyj/Hg7Zof8l5Cmj/C/j/Hdx1NMXPwfOIfBd629jH1hNOlcHQ3LUy5vmkzNS
 wIc4JtwD0qnhD+vZN/ntklOhXoJq9XscSNLAXxiJSarqJuClAkD65kw6ledxh534W9uG34o2wcRHk
 RIoe6X/ekVgU8Sy9HhLd4mjCzUHvfNRuzXoNgTp5F0AYa0Pn4N+R3No+yYkXRBuBaFhOC68XaU2Bk
 lfM1TldkDn997Azr9AN11PapyNoqvE9JX1XbLC+HpS+cnxnQRLZB5pT6v3dGZZkdfm0gmPCLrNkAb
 /Uk3bJqCaw3Pz+OkvUXoai07;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tUkTU-005W5U-2n; Mon, 06 Jan 2025 10:36:45 +0000
Date: Mon, 6 Jan 2025 21:36:43 +1100
To: Shwetha K Acharya <Shwetha.K.Acharya@ibm.com>
Subject: Re: Clarification on Benefits of vfs_ceph_snapshots Over
 vfs_shadow_copy2
Message-ID: <20250106213643.2e602e41.ddiss@samba.org>
In-Reply-To: <SA1PR15MB6417255B31BA4E306E1B5427AD102@SA1PR15MB6417.namprd15.prod.outlook.com>
References: <SA1PR15MB6417255B31BA4E306E1B5427AD102@SA1PR15MB6417.namprd15.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: "samba@lists.samba.org" <samba@lists.samba.org>,
 Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Shwetha,

On Mon, 6 Jan 2025 09:17:25 +0000, Shwetha K Acharya wrote:

> Hi all,
> I=E2=80=99m curious about the advantages that the vfs_ceph_snapshots<http=
s://www.samba.org/samba/docs/4.11/man-html/vfs_ceph_snapshots.8.html> modul=
e offers compared to the older vfs_shadow_copy2<https://www.samba.org/samba=
/docs/4.9/man-html/vfs_shadow_copy2.8.html> module. Does vfs_ceph_snapshots=
 address or handle any Ceph-specific challenges or issues more effectively?

It's been some time since I worked on vfs_ceph_snapshots, but my main
reason for adding a new module was to explicitly handle CephFS' snapshot
interface, in that snapshots can be created anywhere in the directory
tree and are recursively inherited by child directories. The module
makes use of the ceph.snap.btime xattr for obtaining the snapshot
creation time, so is not dependent on timestamped path names.
At one point I'd also expected to add CephFS .snap_create_fn hooks for
FSRVP, but AFAICT that sub-protocol doesn't appear to get much use.

Cheers, David


