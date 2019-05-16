Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id A958F21078
	for <lists+samba-technical@lfdr.de>; Fri, 17 May 2019 00:19:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=72zzSbWjQQ/p5HFzrzDr/kicYEYCiMu0aQAWyNlgNA4=; b=c7/MUvoUAe/DbxZKgpqnbovtzi
	tF4FT3RDljn5pLBbdo4BQJIE15f8EVVYBKdaSUIb10nzT5Q1b+/ko6M02ASvgLCcEXuAzhB9bmyzk
	Fw92wupBzuXm1+Qk+gPHj46tZtIHogbrMzjQ5a3iYngPAWOHcbsOT6784yS9rZKsgSTyf2KKzFHsa
	uS/ZgUQyeoAfF4RoowybqhbsEba3XZcAiR4zOreI9pd+qNu/JHDPgN4/gBztuF6UYZngFHOuNhOhZ
	7qZ36KP4mUwtEJTaKUpCCQR04HtkQq8+6sU+lcCAbQtswPaNCBkGnvSdDMdgNCfJZZeqYU2FYAyGN
	ZejQT14Q==;
Received: from localhost ([::1]:55148 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hROiI-000BV3-HJ; Thu, 16 May 2019 22:18:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:54690) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hROiE-000BUv-Gb
 for samba-technical@lists.samba.org; Thu, 16 May 2019 22:18:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=72zzSbWjQQ/p5HFzrzDr/kicYEYCiMu0aQAWyNlgNA4=; b=GA2HtW4Qi+XwyiWBAA6iU5VIXT
 ZlxbNmfBQO5YeVeeU8nM3vvX9IMII3FhWVCu2mTHhchc5OtHr2pjdy1RYT8SUQaQCjP6gtrIa8LNy
 LJnzon9aXO2G04zbW7HNu2gx7AtNzkgMjYERH2BR2sKkWMUZF/9XIxlSXSGSuSdUeu08=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hROiD-0001mi-KR; Thu, 16 May 2019 22:18:53 +0000
Date: Thu, 16 May 2019 15:18:51 -0700
To: Andrew Walker <awalker@ixsystems.com>
Subject: Re: [PATCH] zfsacl: Fix ACL behavior issues with vfs_zfsacl
Message-ID: <20190516221851.GC176914@jra4>
References: <CAB5c7xr4d8oiKoeL3wYCcH860RTP3LY_FYTsBGC--ukGRiTa5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB5c7xr4d8oiKoeL3wYCcH860RTP3LY_FYTsBGC--ukGRiTa5A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, May 11, 2019 at 03:19:48PM -0400, Andrew Walker via samba-technical wrote:
> This patch addresses two problems that we've seen with ZFS / samba users
> for a while.
> 1) It's not possible in Windows explorer to disable inheritance. I've
> introduced a new zfsacl parameter "zfsacl:map_dacl_protected" to allow this.
> 
> 2) If admins remove all special aces (owner@, group@, everyone@), then ZFS
> will automatically append them to the ACL of newly created subdirectories /
> files. In this case, it's just default ZFS inheritance behavior in the
> absence of inheritable special entries. I've introduced a new parameter
> "zfsacl:block_zfs_acl_chmod" to block this behavior. It does so by adding /
> maintaining a hidden empty inheriting everyone@ ACL entry "everyone@
> ::fd:allow".
> 
> I believe they are both necessary to avoid POLA violations for Windows
> admins, but have made them default to off (so that we don't affect existing
> install base). I'm happy to make any changes you suggest.

Hi Andrew,

Thanks for this patch. I'm out for a week or so, but I'll
try and get to this once I'm back. In the meantime, feel
free to bug Ralph :-).

Cheers,

	Jeremy.

