Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 638BB1E5A93
	for <lists+samba-technical@lfdr.de>; Thu, 28 May 2020 10:17:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=5ULzhBzyjbIlvfE2EwkPmHXGh/UgEkOe6P/LHzRoNEY=; b=qb5KTQzlEggPmvAVcT4AJmA9jJ
	5QWKR5GDD+SupwTaghFDcgRjhcv7Rx6rBHFkI7Xl1OZ0D8vQoO0u3Jsw4GAeEiN6+PdIY1CNdERdf
	MFRk/DnmmC/msmBWiHc39P+1Q1zZsO52+ZiKn/MrDugUkiI/b074e/RZplUEZ79/wKeDSKasohqSS
	huCnObh+Z6+z6Jcvhle1jSEJIaVxOK42eKWf94GH9XEuyUARWXo4eJ5gn/8aKplH2FUxPr1szmJGV
	lAZfX4v98Lo83zQHctmCdPS2P7IOq5NdiuM5IJRk2tc9a42W5wfqgm8DaNbWgO7egoDvHRsHCvw4t
	2x3wK9Jw==;
Received: from localhost ([::1]:41748 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jeDiT-0069Q6-0h; Thu, 28 May 2020 08:16:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50566) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jeDiO-0069Pz-L7
 for samba-technical@lists.samba.org; Thu, 28 May 2020 08:16:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=5ULzhBzyjbIlvfE2EwkPmHXGh/UgEkOe6P/LHzRoNEY=; b=rQX5t1wMgBiCNnZ7Lnb6P1dxHI
 TFGA++zwgXEH49JPi2dMUsjPuMHpMRYmHF3zI4fzojedlkiJaBjWUC3iZt+5mk2x7P1ZaR/fqJYqH
 49CI9Zv0ps90Vel/+kNC2QG32KfPseUpKkwmA524tokYZpgfdPcrhWupHkNNNvcT7xdWw04WELw99
 T887or2q+0v0palI1dxtZSOCsXWHGQPkmav0wTwHwmya8YT2pG7eRMEn389FnV651UrP/Lj/Pi8Pk
 jcJ4qRwbJ3UTNBmXEfOc9qeO4K/X9PaKC9kMAiCvE1b/K95eSGwkFBsoKHRrc2+wtxLHUhqZj6aIS
 oKyekljs9pFtMUbDVVHLaTd66i2pRoLktaMGKa125Gt67sEiGg3Wg+Uh2XNAEJfvl1WgTxKj3utVV
 SHPeIP3ue63VdMDovlebfX0NnKNnozyXBQsyYJoneXts0mdaA6sCkSUgEi5PNGqOvP/tNr57aeoq+
 z2v/wszhb9aAfvBOWcKgyRQh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jeDiO-00007j-41; Thu, 28 May 2020 08:16:36 +0000
Subject: Re: Samba user quota implementation question
To: Krishna Harathi <krishna.harathi@storagecraft.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
References: <4D14BB46-74F3-4EB7-A3F4-0C290A464D16@contoso.com>
Message-ID: <1af2ea27-dcf3-6401-acde-c4b5021f2d03@samba.org>
Date: Thu, 28 May 2020 11:16:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <4D14BB46-74F3-4EB7-A3F4-0C290A464D16@contoso.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 5/27/20 10:42 PM, Krishna Harathi via samba-technical wrote:
> Our OneXafe FS  supports share/fs level quota using smb.conf “set quota command” and “get quota command”.
> 
> We are currently extending support to user-level quotas using the same interface, when Samba smbd is an AD DC member.
> 
> Setting user quota from a windows client is working as expected. But once quota is set, none of the users are listed in the quota’s pop-up window, so cannot delete or modify quota properties. Moreover, creating a new quota entry for the same user is generating a “quota entry already exists for this user” error.
> 
> By tracing get/set requests to our file server, I see that our FS server is receiving a get request for Samba for every user entry in the local password file, but none for the UID of the DC member user. But I do see a default quota get request for the group GID.
> 
> The problem seems to be that the get/set command interface does not obviously support a “list” user quota api to the hosting FS.
> 
> Questions on this –  We can post and manage user entry (host-local uid/gid) corresponding to the DC user sid/gid whenever a “set user quota” is received. I did verify that when an entry is made manually, windows user quota workflow behaves as expected. Is the problem assumption correct and is this a way to implement? Is there a better way, given the constraints?
> 
> We are using Samba 4.7.11 patched with https://bugzilla.samba.org/show_bug.cgi?id=13553#c17 fix for 4.7.
> 
> Any help is this issue is much appreciated in advance.
> 
> Regards.
> Krishna Harathi
> 

Hi!

I believe Samba's quota implementation is lacking in that regard. I
guess none has ever taken the time to implement it properly, and the
current implementation of enumerating quota entries is at POC state
(meaning that it understands the SMB protocol but the backend is not
implemented fully).

The correct way to enumerate  quota settings on <something> (be it a
disk, a share, a folder, ...) is to look at the <something> and see what
quota settings are there. Typically we won't find many quota settings -
maybe one per group, at most one per user which actually using the
<something>.

Samba on the other hand, tries to enumerate all users, and check for
each user whether there are quota setting for it. This approach doesn't
scale well in an AD domain which has many more users than users of the
<something> in question. If it was up to me, we'd remove the ability of
winbindd to enumerate all domain users (we actually tried that once but
got a backlash and reverted the change).

So what I'd do is come up with a new VFS API call to enumerate quota
entries, have the default implementation extend the
sys_get_quota()/sys_set_quota() functions with a sys_list_quotas() or
something similar, and then write a VFS module for my custom file system
(or a VFS module that calls a script if I was worried about GPL).

I hope that helps,
Uri.

