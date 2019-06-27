Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E78584AA
	for <lists+samba-technical@lfdr.de>; Thu, 27 Jun 2019 16:39:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Gjb/xdRAQztTtuogqnKjhrnKYevY3pMgi1pHeNUtsDA=; b=EaZThvI0MJK4Sljdqr18IctcVt
	k8mKg3dzwHieITGYijJlNH9szI5gp4gVWHuSBZEtVnm/TAK04lXw6fAfe+Lv/XQCM87rEjMCtHFGn
	lDaqDZcku/xZLTkwhM+R2h7kTDV5izDpapyEu3JgGN2GjcvjFbGqDGjspFf7MW2dEtVg7Pv+j+spc
	rf5ZZB97p0PyGcQg5T9kyn3VXxyu/XJnUtqaZ9vbKxgltDXjE54iAtvomKqErUWYD9vxvk+BIaYb7
	QrzUvWxtBohD6BjK/di4W27dRWSUtBUrdStJM3jM606h2BUr98xSwaynOodr3HEgX5ljYvFI99w4/
	7ZvZPsYg==;
Received: from localhost ([::1]:42770 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgVYF-002CRb-Ky; Thu, 27 Jun 2019 14:39:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30846) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgVYB-002CRU-Ru
 for samba-technical@lists.samba.org; Thu, 27 Jun 2019 14:39:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=Gjb/xdRAQztTtuogqnKjhrnKYevY3pMgi1pHeNUtsDA=; b=MR3exMdwPSC2wXR0C3dDl0wL23
 87pkD8OeKxt+egkSPKCEY/QJ72NR95bFZxaK/+3a72Mphz89f4YCH8gLRaApegXTJC4uEjlPNkPfv
 b3xKTHQNrpCVx/kNJiA3A+pD4dHTgXVXntMsTR+5/Fwl//XdxscffBBPud5OvbbkWOW8=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgVYB-0006Mg-Ad; Thu, 27 Jun 2019 14:38:59 +0000
Subject: Re: [HEADS-UP] Using stored immutable file birth time for SMB File-ID
To: David Disseldorp <ddiss@samba.org>
References: <20190626135745.lk7757wmy26pgy26@inti>
 <20190627162137.1077fdc4@samba.org>
Message-ID: <28fe2464-3992-84eb-fe14-cc16b41b665b@samba.org>
Date: Thu, 27 Jun 2019 16:38:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190627162137.1077fdc4@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi David,

On 6/27/19 4:21 PM, David Disseldorp wrote:
> Hi Ralph,
> 
> Another follow-up here, after looking at your patchset...
> 
> On Wed, 26 Jun 2019 15:57:46 +0200, Ralph Boehme via samba-technical wrote:
> 
>> As a file's creation time (or btime for birth-time) may be set by clients, this 
>> would result in changed File-IDs every time a client sets the btime. So we need 
>> to store an additional copy of a file's original btime. We store the btime as 
>> part of the DOS attributes xattr, we need an additional field in there, making 
>> for a new level 4 of the xattr info struct.
> 
> IIUC, Btrfs, XFS, ext4 and f2fs already expose an *immutable* btime via
> statx. See the discussion in https://patchwork.kernel.org/cover/10812257

thanks for bringing this up. These are interesting times... in the end
the kernel may pick up our user.DOSATTRIB... :)

> I'd also imagine that there are FSes out there that can offer their own
> immutable never-recycled File-ID.

Yes, HFS+, APFS, NTFS. :) Others?

> Ideally your patchset could cater to both cases by allowing for
> make_file_index_from_btime() / update_stat_ex_file_index() calls in the
> VFS stat handler

yes, that will work.

> and avoiding the extra dosmode games if the
> st_ex_file_index is already set.

oh, good point, I have to fix that. :)

> As a minor nit, I think it'd make sense to combine the new stat_ex bools
> into a single flags entry which includes calculated[_original]_birthtime
> etc.

Yeah, maybe, I'll take a look.

Thanks!
-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

