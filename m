Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D2517894EAB
	for <lists+samba-technical@lfdr.de>; Tue,  2 Apr 2024 11:27:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=mhnkTENGmAOKzTGmdz0BczXtZVb+A/0kSlPFDf/nnzo=; b=BzDySHEJF9sbC2RWQBwpFbzQ+k
	fY7Oke2lgK0pnFvhBQt1WOWdhuHZf7JAumILqdkY03pQWhSOTu9esF1RqqxqN1ogaQ/78kD7+L2cJ
	Ckxbx62p5zbXFNOOiB6I84F0zu+UITRzLH0QOe6VBLnC5osLNunkcBHoLPuBTYvMRGq3p8XacSB2n
	SV1LcStL6Cfzxz3jL8LDF9/QLWT+snHgIl2Qmru/Vgn9siANOFccsC5WUVbmur3953GuOMlc1LU59
	T90p0EslKGCykvxgVlxAHz4iK2tN9TEPLOkXasdQvCB5XJanLqczt0MyIAX47VRW5+mKtMP3t0e+I
	BR1pWj3w==;
Received: from ip6-localhost ([::1]:25898 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rraPa-003kQd-T6; Tue, 02 Apr 2024 09:26:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58108) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rraPW-003kQV-Up
 for samba-technical@lists.samba.org; Tue, 02 Apr 2024 09:26:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=mhnkTENGmAOKzTGmdz0BczXtZVb+A/0kSlPFDf/nnzo=; b=qWq1wB2jQz+2MGNUT57zuN+NQn
 Ze6UAxN1dUbft5JaBU8Kfi4p1zUm7z+Jnsx9JU3PH9Fos1clO8IHeTqWu4npV8SX0zqIA+eF9p5U1
 8sBFI/ZkLeq6AD+bnZXLuQscT2+MTUeEmmSx0U2ZU3YgZng9AdxGQ0tS3noKi2iTIYNf8tSpP+rPQ
 23LER5SImJ2H/fNiVJsXsuWXCDPpXY1fl7Jo32j3Dg3p4Eaz8lTLyfHQtMtVY8MLZdRzSMYTWUcee
 jcnnPNn/mlnPdj1e8mbWptTIwYaHfmswN4zfhPxVzf4nDnqmG3mxISqryWLN3M048h2xdbKaC5fK4
 aOvYf5dQSkAVFkRBCDymcuSiSVOR6hc01FWgWPj/qFqqt+ObH2J2jJeiRl+DHR2Bpn3DDN6XUgh7s
 AQsdp7EwKUR2arl0CDdI/co5upkwTnZUOJISpT1wWsoNVwpKDcCe+PGiRSrBSMSVeqwSufPezp/Yo
 qQSphCr47357o1jLbn40VWdO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rraPV-004EGZ-25; Tue, 02 Apr 2024 09:26:30 +0000
Date: Tue, 2 Apr 2024 20:26:21 +1100
To: Ralph Boehme <slow@samba.org>
Subject: Re: Simplify copy-reflink code
Message-ID: <20240402202621.2c234f13@echidna>
In-Reply-To: <2c5e4e5d-4115-49b5-9af5-a488cfc601a8@samba.org>
References: <2c5e4e5d-4115-49b5-9af5-a488cfc601a8@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Ralph!

On Tue, 2 Apr 2024 09:49:57 +0200, Ralph Boehme wrote:

> Hi David!
> 
> If you have the time, can you please take a look at
> 
> https://gitlab.com/samba-team/samba/-/merge_requests/3566 ?
> 
> I'm basically adding copy-reflink support to vfs_default alongside a new 
> option "filesystem reflinks" that sets FILE_SUPPORTS_BLOCK_REFCOUNTING 
> in the share capabilities if enabled..
> 
> This works on eg ZFS by just setting "filesystem reflinks = yes". 
> vfs_btrfs still sets FILE_SUPPORTS_BLOCK_REFCOUNTING if the module is 
> configured, so there's no behaviour change for btrfs. But for other 
> filesystems we have the choice of either setting 
> FILE_SUPPORTS_BLOCK_REFCOUNTING in the module or relying on the new option.
> 
> I had initially spotted a bug in vfs_btrfs and after fixing that [1], I 
> realized that requiring all VFS modules to explicitly code copy-reflink 
> support into them is not ideal and just moving it to vfs_default 
> simplifies the modules a lot. The branch still contains the commit and 
> its revert to demonstrate the problem.
> 
> tl;dr:
> 
> no change in behaviour, great simplification.

Sounds good to me, although I'll need a bit of time this week to take a
look (and do some testing). If it's passing the copy-chunk & dup-extent
torture tests on a btrfs-backed share, then I'm confident that it should
be fine. However, my confidence in the tests is reduced - I thought they
exercised the BTRFS_IOC_CLONE_RANGE fallback code-path, so should have
caught [1]. Perhaps it's just that nobody tests atop btrfs?

Cheers, David

> [1] 
> <https://gitlab.com/samba-team/samba/-/merge_requests/3566/diffs?commit_id=48d8b9c7ad528790b24de5b1ccbfd8b04a2622cf>


