Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7660717AD76
	for <lists+samba-technical@lfdr.de>; Thu,  5 Mar 2020 18:42:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=agt7Rki66ENijSQkAU/qXXAReXmokeScygGDKMEcCYc=; b=JhHZitkD84TTbpnolNSNcgWh9t
	+zoQ5TjEU/uv3aHsUn+0tDPvPZrfkc5e9steh+N8xGDmarC02+K2J1KyW6KhcqZhxxuPZ7FbbHHAo
	aYXM2Aq9WD0jJQj61QJ39cF6cVuVN04UJKE1kj2K2rOY2LyNb6AaBhC8aEkeNN+ReampYnPO1LJxD
	Kr6ofRG6ETeVa3RMRmkbnGTUqo0RgII8wV0uZAdo9SHNNpbLlZ52PNin7ljLzh+f8qxLX0ay4ykc7
	wmsXHiiqPVl4AuWoxqEZhdtZp41IDssOn28Kduv1PFa33wDI+T8x5wdTfCDbDcuIFca7/wVR36cno
	HFotW1hA==;
Received: from localhost ([::1]:35842 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j9uW3-00FANO-Dr; Thu, 05 Mar 2020 17:42:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57630) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j9uVy-00FANH-BY
 for samba-technical@lists.samba.org; Thu, 05 Mar 2020 17:42:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=agt7Rki66ENijSQkAU/qXXAReXmokeScygGDKMEcCYc=; b=TRvVIcFNHYeXl3EFgytWo1F54g
 AeTn0/09RHtZVrnPb3eER/UuFxzcC79s+SdeydJk5edp6WH7tlJ4fd4aYBML2S0YMtXYfbXSoyEFp
 hCkbrhQrLg59Z+MWWNBDwecT2CRmnQyao0syRhBaMiVawHtxBHoAO0RBWk3fC377vKorJp7ywm0ac
 b/pLJSermuJQeml9K7SorvLdgaSFl2Gjc6aLwVFzltDAKqP0quOUVaJQP2SADf0Js3LvA6RCEa7Cd
 Xb9MZvRV/NtZfO77Svo090UcSoXS3Mg5qboQTZqyndvnaxpz9nTc3cMvSN3kbzMM05m0f7MGafsdx
 VVSJh3Qo+TQnQjxbVaH+myfqYOVKnUcJrKecho9C78ypyxRfhfO9sAkUWdCJwuNCf/FBMXtX+6GhI
 aFRCknkuouyuKhiuEqnMRPr5D4Djm5I/7BZyGaQhGSYDk8AoAdOXd/YfklRmRVLVJlkiUc2dZRXtc
 lhcb//ITDI3ljr71n2Tn51/Q;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j9uVx-0005yk-CM
 for samba-technical@lists.samba.org; Thu, 05 Mar 2020 17:42:30 +0000
Message-ID: <6800dbbcf9913acd1a8d002b3bef578a61757f96.camel@samba.org>
Subject: s3-libads: use dns name to open a ldap session
To: samba-technical@lists.samba.org
Date: Fri, 06 Mar 2020 06:42:26 +1300
In-Reply-To: <20200305123003.2E8381402BF@sn.samba.org>
References: <20200305123003.2E8381402BF@sn.samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2020-03-05 at 12:30 +0000, Björn Baumbach wrote:
> The branch, master has been updated
>        via  e45e0912d99 s3-libads: use dns name to open a ldap session
>       from  4d784590a9c [s4] possible memleak in torture vfs-fruit
> 
> https://git.samba.org/?p=samba.git;a=shortlog;h=master
> 
> 
> - Log -----------------------------------------------------------------
> commit e45e0912d99335f4feec7f937180ea21f7f62a72
> Author: Björn Baumbach <bb@sernet.de>
> Date:   Mon Feb 10 19:19:44 2020 +0100
> 
>     s3-libads: use dns name to open a ldap session
>     
>     Required for working certificate verification.
>     
>     Bug: https://bugzilla.samba.org/show_bug.cgi?id=13124
>     Signed-off-by: Björn Baumbach <bb@sernet.de>
>     Reviewed-by: Bjoern Jacke <bjacke@samba.org>
>     
>     Autobuild-User(master): Björn Baumbach <bb@sernet.de>
>     Autobuild-Date(master): Thu Mar  5 12:29:26 UTC 2020 on sn-devel-184

I gave feedback on the MR, and had assumed this as going nowhere per
https://gitlab.com/samba-team/samba/-/merge_requests/1135#note_299564233 so what changed?

Thanks,

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



