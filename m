Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8001C9005BF
	for <lists+samba-technical@lfdr.de>; Fri,  7 Jun 2024 15:55:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=gGJCGcFfqrgZ/bQhtT2eU9HyYHOieYW43wuo5bks3W4=; b=xwbF2ko7PX65kuTciDFEaIe7Ij
	oLvn+GDP3LmQmU3LXIaH9QPzyXY5+Qa5KhyH+QrS9/laLOJKj/XasyVAt7lfMpvm4HWmonm8EzvKB
	NmJx60gT0DaNvK3DLi0B60eNuUwq1kqSq/nSnlr5hscvsk+ZU2VHdThMPT8XR3D1+Y3iBOJfWccCB
	dFtpl16o8Lsmk5PA3DI07xvsZRG5vvkKwQ1AEvuESB++Z38A/r2omzb7NFhdKWLIIUIUHwJnZLuMU
	6UIHFJWN71ETGMj9YyjH7iH8QoVfMiNSB97PrgKLWIWw2jjyUsr2ESdV4eIjXOd2sMd6kYf+vjy2E
	nFA01KoQ==;
Received: from ip6-localhost ([::1]:25274 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sFa3u-00D4Ww-FP; Fri, 07 Jun 2024 13:55:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59138) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sFa3q-00D4Wp-5g
 for samba-technical@lists.samba.org; Fri, 07 Jun 2024 13:55:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=gGJCGcFfqrgZ/bQhtT2eU9HyYHOieYW43wuo5bks3W4=; b=bF0RK/cCXs4I0PeDeUGzPFqPcL
 nDryR74JT/4YyOGNnhZSLsh8ZXY75VldKkMPTCDWuJKP5GZii5XomhHbDG9C8HcPQOHNvpBcx0Ckv
 x+bKI2E5eFm1Vvo3fCN2JivvnvxgDuL5OkJZozJWRxcfNYJY+PYfNJinnxkogQruevYkxtk4tnjcE
 pllkdIK+pn+6Zs6gpfHpMt3wiU964iGLrhwPB0f7tUODTS8KdJ4cT3Xmkxq1uXlFturrsHtVOm934
 vbZrd3tcFw0hGWDx7y+qG9ihL5wM/PhBY5wETEyTXfpqs3XDgRg0g3Tve5/RTrxf1Ulqfgz145FFf
 CoCNFE1PhdOIuzA7Ab7N26jCJJguou2nuYiW9yeIzvAuUOhY9RATYzDOm1QWYPZfB8fXt6Lpqcqgv
 Dfmu83d8FnOMxrHxQjua+vNZtN9pQggIfHLQr47xz47lQH2rvEICcjGHIWTo3etZHcIm4vaUMcUJ4
 NnuT8vASRvhM3q7WuM/87GfQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sFa3n-00FXMK-0t; Fri, 07 Jun 2024 13:55:15 +0000
Message-ID: <ebf3fb98-7c76-42ff-9716-818da62cca46@samba.org>
Date: Fri, 7 Jun 2024 15:55:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: Jeremy Allison <jra@samba.org>
Subject: SMB_VFS_PARENT_PATHNAME
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Jeremy,

I'm currently looking at shadow_copy2_parent_pathname()
and don't really understand why we have it.

All it seems to do is to call 'parent->twrp = 0' in the case
the path is already converted by any other shadow_copy2_* function.

I guess it's done in order to avoid recursion if the result of
SMB_VFS_PARENT_PATHNAME() is passed into the vfs stack again.

The changes went in via https://gitlab.com/samba-team/samba/-/merge_requests/1992,
but there are no reproducer tests nor any descriptor what the problem is.

There's only a hint to snapdirseverywhere...

Do you remember the details? I'd like to write a test for it
and then see if a different fix would also fix the problem.

I guess in all places we call shadow_copy2_convert (or shadow_copy2_do_convert())
to replace smb_filename->base_name, we also set smb_filename->twrap to 0.
With that shadow_copy2_parent_pathname() should no longer be needed.

But with removing shadow_copy2_parent_pathname() without any other change

   make -j test TESTS='samba3.blackbox.*.shadow_copy'

still passes, so there's no test for the problem.

Maybe it only triggers in some combination with other
vfs modules which call SMB_VFS_PARENT_PATHNAME() either direct or via
parent_pathref() in a recursive way.

acl_common_remove_object() for acl_xattr is one place where it potentially
matters.

stat_with_cap_dac_override() for nfs4 acls ignores parent->twrp,
so it's unrelated.

ad_convert_delete_adfile() will be used in vfs_fruit with
'fruit:convert_adouble = yes' (which is the default).
That passes parent_fname->fsp to SMB_VFS_NEXT_UNLINKAT(),
so it might also be affected...

It would be great if you have any hints :-)

Thanks!
metze

