Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A550657022
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jun 2019 19:59:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=kV6CsJ49+3oD8T9cc8TDo6ffDDBy5GtxCr5H/+8ysPQ=; b=kOcGKHS7p/YZOdxG9pQjQj5YV9
	TwpIchGoGpYn05VwSAMljaT1njQ0vOj/RghmgAsY2ngGAMxOeM8RnUXt+Z1U1zuVxV9okJuOaF9cO
	ItjIBE6pBI5JlhxLLeYhfxuDx0JVqidNfRjcMpvmojTU6tu62Uuegafl94xGz2eVrQVDIBAp/qkkj
	Ec4jKnlnrQBYBRswUnh8aKm8NCjAI6CfqRlQYVs0Pb4J2drLv5rbgBZfiVCN133+0prLG09l2wDIl
	WawG5NVx1k/SEGeb6gqxPCVvquMiBZruTfi+0UHT3UOwlUYUTxN1u5fjRZdLF30ADFp9nrX/IHG6W
	8WLMh3kw==;
Received: from localhost ([::1]:57484 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgCCR-001yhv-6I; Wed, 26 Jun 2019 17:59:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38074) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgCCM-001yg6-HJ
 for samba-technical@lists.samba.org; Wed, 26 Jun 2019 17:59:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=kV6CsJ49+3oD8T9cc8TDo6ffDDBy5GtxCr5H/+8ysPQ=; b=FfoeeeLIGewyGNTdhnlJdQU2Fm
 g75S/epdaXSKV2ty7VRoVYZMcsftmtuLCz8HsCfZV862+2ABQ6kJI6iU40fW1JsU9o/NMcuaVb0Gx
 k37JBYBvSTY8efzzTJLGUYsT+5nIiq0GDcMWSkRkTaVzT1DHkJRFFVtBZtB6kogKXfbY=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgCCL-0003Nm-Ef; Wed, 26 Jun 2019 17:59:09 +0000
Subject: Re: [HEADS-UP] Using stored immutable file birth time for SMB File-ID
To: David Disseldorp <ddiss@samba.org>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
References: <20190626135745.lk7757wmy26pgy26@inti>
 <20190626181233.4fc61c42@samba.org>
Message-ID: <c37b59f5-8a89-eeb2-8f92-7db2c7524efd@samba.org>
Date: Wed, 26 Jun 2019 19:59:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190626181233.4fc61c42@samba.org>
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
Cc: Stefan Metzmacher <metze@samba.org>,
 Volker Lendecke <Volker.Lendecke@SerNet.DE>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 6/26/19 6:12 PM, David Disseldorp wrote:
> On Wed, 26 Jun 2019 15:57:46 +0200, Ralph Boehme via samba-technical wrote:
> 
>> Questions? Remarks? Thoughts?
> 
> Thanks for the write-up, Ralph. I have a few of questions:
> - how will this change be affected by filesystems with low resolution
>   birth times?

that's a good point. The problem, it's impossible to detect resolution
in a sane manner at runtime. And we would need a runtime check for
*every* file access to cover the submount cases.

Maybe we need an option to cover this, so the admin has to tell us "yes,
this filesystem supports nanosecond resolution" so we can safely use
File-IDs based on the btime.

My current strategy is to defend against resolution being as low as a
second. In that case (ie when tv_nsec is zero), I or the file's inode
number into the File-ID.

> - given that this issue is Apple client specific, is there a need for
>   this new logic to be implemented outside of vfs_fruit?

yes, I think our current semantics based on inodes is dumb and we need a
general fix.

Thinking about it, I will go and ask MS what their client uses the
server provided File-IDs for, if at all.


> - what should we do for snapshots, which may have identical btime (and
>   inode) values shared with the snapshot source?

I guess that's ok. Fwiw, macOS clients don't support snapshots anyway.

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

