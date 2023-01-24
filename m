Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B47B679A92
	for <lists+samba-technical@lfdr.de>; Tue, 24 Jan 2023 14:51:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=G664Oa9E7tgCDrjDcRfXXtUoQ2gBUe0+aLCIqxLL0A8=; b=ao+U1tKJnLr4FkJ5SK2lKEZ/md
	0WaTJefE2AACJA8uyfQPyc9eV+XieV6mL1LzvytHOtfspGx75VaM7DRc7GppX82sUlVdUTI03waar
	FPao8rUyPdgJPZPhhlmHUvXG8WFMI75csUW2ChsBsnjF0f1xO4zzI8hT1CAYBYvhvLxxJG5yU2hvs
	+/xjsIo9iW08kyPk5JXF6/8ze5Pp3Ftsw1QYAWKRKD722YSMTgMqAgRWGWH3qo+0JyjI+HIPoO4Er
	/A5nHwdQE5/whSIBddHpCc42rBKXYd+4gOumBOIE4BmtOZLh8BxdLnwdbgOAkPhSC1LoQ0+JLba8k
	DEVf9GXg==;
Received: from ip6-localhost ([::1]:20944 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pKJhI-0027Bx-3J; Tue, 24 Jan 2023 13:50:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32054) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pKJhC-0027Bo-Aq
 for samba-technical@lists.samba.org; Tue, 24 Jan 2023 13:50:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=G664Oa9E7tgCDrjDcRfXXtUoQ2gBUe0+aLCIqxLL0A8=; b=X8VU0GCyMGGnbra6F33NL3SLwz
 2cPZnPbzsY/0/xHuJL5uG85jzcSPM1xHsiY3vo8hr5UZGq+9ttfY/LYyNco5Kdr8N//UhRcMIsRme
 FkqJtFUEicRYreiFMKknMAROX8YgjBQc4AJ/Yrv3/hie4+M3kZK5rVAoBXgsgHTbRbUwUiXfT0Qta
 5DVcBaLG/9E+yubPg3cEUuupFiOD4Ao5/tGvZV4r7/Rw1kkCHFaux5bPtbMFduilXROVg5pJJlmvb
 fst5SsiXaOMG68b1T4K/3PpOlU9oDs56uol9wDwcHTHbbeYy0WSCjNlP4dY6FiN58LzCNct6CaHV1
 66Yy8JfcG9HYN2O/6ytwd4V0ix1A4zFqtQ/fudmCUsOmRPVqodAp8Oo23vPdlfN4dsKC5mDivlaNz
 k58rrQb6lQLWsDziP/CMD4pMdoJN3omkmFCh5byJtC+PECGOlGyzppfLJdl89WnzdTNL4j0QHY0Zh
 U82F6WmP4n66fcW1pc3WvPGi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pKJh8-00A68M-Vg; Tue, 24 Jan 2023 13:50:39 +0000
To: samba-technical@lists.samba.org, Stefan Metzmacher <metze@samba.org>
Subject: Re: [SCM] Samba Shared Repository - branch master updated
Date: Tue, 24 Jan 2023 14:50:37 +0100
Message-ID: <1869592.tdWV9SEqCh@magrathea>
In-Reply-To: <c08b0b3f-8ef5-1063-5412-18e96a1809e9@samba.org>
References: <E1pKFPN-006HUv-Jj@hrx0.samba.org>
 <c08b0b3f-8ef5-1063-5412-18e96a1809e9@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 24 January 2023 13:31:57 CET Stefan Metzmacher via samba-technical 
wrote:
> Am 24.01.23 um 10:16 schrieb Volker Lendecke:
> > The branch, master has been updated
> > 
> >         via  f7b50bc059d smbd: Use smbXsrv_open_global_parse_record() in
> >         .._verify_record() via  132b83d0659 smbd: Simplify
> >         smbXsrv_open_global_parse_record() via  2f6776741dc smbd: Move
> >         smbXsrv_open_global_parse_record() up in smbXsrv_open.c via 
> >         3c779de8cf9 smbd: Simplify smbXsrv_open_global_verify_record()
> >         via  f1a66267bcf smbd: Save a few lines in
> >         smb2srv_open_lookup_replay_cache() via  35a32171b50 smbd: Fix a
> >         typo
> >        
> >        from  253891032ee python: Don't use deprecated escape sequences
> > 
> > https://git.samba.org/?p=samba.git;a=shortlog;h=master
> > 
> > 
> > - Log -----------------------------------------------------------------
> > commit f7b50bc059d1b5c7e40cdc4e88ef5ee16f7db670
> > Author: Volker Lendecke <vl@samba.org>
> > Date:   Thu Jan 19 12:29:20 2023 +0100
> > 
> >      smbd: Use smbXsrv_open_global_parse_record() in .._verify_record()
> >      
> >      Signed-off-by: Volker Lendecke <vl@samba.org>
> >      
> >      Autobuild-User(master): Volker Lendecke <vl@samba.org>
> >      Autobuild-Date(master): Tue Jan 24 09:15:26 UTC 2023 on atb-devel-224
> > 
> > commit 132b83d0659ddc25a96327edc1c7dd23b17a56fd
> > Author: Volker Lendecke <vl@samba.org>
> > Date:   Thu Jan 19 12:25:21 2023 +0100
> > 
> >      smbd: Simplify smbXsrv_open_global_parse_record()
> >      
> >      It does not need a db_record.
> >      
> >      Signed-off-by: Volker Lendecke <vl@samba.org>
> > 
> > commit 2f6776741dc6469d78b94da22d75f26cccca5fc9
> > Author: Volker Lendecke <vl@samba.org>
> > Date:   Thu Jan 19 12:22:33 2023 +0100
> > 
> >      smbd: Move smbXsrv_open_global_parse_record() up in smbXsrv_open.c
> >      
> >      Avoid a prototype in the next patches
> >      
> >      Signed-off-by: Volker Lendecke <vl@samba.org>
> > 
> > commit 3c779de8cf99d0936956a12484fd726d5be46c7e
> > Author: Volker Lendecke <vl@samba.org>
> > Date:   Fri Jan 6 16:25:03 2023 +0100
> > 
> >      smbd: Simplify smbXsrv_open_global_verify_record()
> >      
> >      Don't depend on the record to be passed in, return NTSTATUS. The two
> >      flags were a bit confusing to me, now NT_STATUS_OK means "found a
> >      valid record with a live process", and NT_STATUS_FATAL_APP_EXIT means
> >      we found a stale record from a crashed smbd
> >      
> >      Signed-off-by: Volker Lendecke <vl@samba.org>
> > 
> > commit f1a66267bcfcd48f3c7ca2ada3f62d40209163e3
> > Author: Volker Lendecke <vl@samba.org>
> > Date:   Wed Jan 11 11:44:29 2023 +0100
> > 
> >      smbd: Save a few lines in smb2srv_open_lookup_replay_cache()
> >      
> >      Directly initialize variables, don't leave dangling pointers in
> >      TDB_DATA
> >      
> >      Signed-off-by: Volker Lendecke <vl@samba.org>
> > 
> > commit 35a32171b5067d5b80acffc99f8d43cdc7f5f9a7
> > Author: Volker Lendecke <vl@samba.org>
> > Date:   Wed Jan 11 08:18:35 2023 +0100
> > 
> >      smbd: Fix a typo
> >      
> >      Signed-off-by: Volker Lendecke <vl@samba.org>
> >      Reviewed-by: Stefan Metzmacher <metze@samba.org>
> 
> These were all reviewd by me...
> 
> metze

I suggest to use my `git review+` tool :-)

https://git.cryptomilk.org/users/asn/dotfiles.git/tree/git/bin/git-review+

same for signoff:
https://git.cryptomilk.org/users/asn/dotfiles.git/tree/git/bin/git-signoff+


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



