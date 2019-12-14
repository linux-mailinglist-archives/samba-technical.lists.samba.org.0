Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4AE11F15D
	for <lists+samba-technical@lfdr.de>; Sat, 14 Dec 2019 11:23:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=pdpFLurXrLbALpTmHTSXdhN9Q8/MmtMaaUW9ZyGZcDk=; b=IFwbKRsLM48vEgBa29+OYiJ3gz
	XmabbFNMq7m63jFjUNucPMu5C5LESU4PSgN9fPDygCsXSGmF3KZFrf4VSJRjn9hDmPhzITjbLFRss
	tPdReYf3uSOqKQJdZ4y/cZzlHlMCe465CwduL4tMqDV6Wfrq+KXtwinZJuaBaenrSrymKe1UNAZIX
	qRC0YvBPFAuHrMSHRHWXEG86PpNHwYZpAVT97/WIekS+nwdfzf1NFe7WHOv4pVGsF2dSSXhXsUU7T
	69HM1/lKh/Smdr013vbWVlN3wiTnDsnp35IZw9NnSFveCTL9YugRrtWy8yrMSDy/+/qwo3oKDfsoV
	OUrR+rlA==;
Received: from localhost ([::1]:39374 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ig4ZW-007HQF-4F; Sat, 14 Dec 2019 10:22:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31920) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ig4ZR-007HQ8-QE
 for samba-technical@lists.samba.org; Sat, 14 Dec 2019 10:22:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:Cc:To:From;
 bh=pdpFLurXrLbALpTmHTSXdhN9Q8/MmtMaaUW9ZyGZcDk=; b=f3DtTv0bm0rYgYvr1IpyGEvgME
 YM4zDPS8bynv9VzWgdBIVkD5B/YJ1M6FurLsai2mvfe3hPG73Do8jOK9TJTJN716IX/RF7T0+TESu
 Co5sYRdOPWNzKzMw6JKvJa0oMgTdmc+OE9UEnwLil6h/KX1Qnih47RU0UGxXt9FoufbC3A/J58GCD
 kx/H9rn7fAdWGpJAb0y7bgdPaK9gVAFtrLkqCGGldH8Wyttqng7+PoyKRqVmxXfG3BJImGAI48MFM
 k5BMGm7/jXdUrJccVBvedNlbI9182YVdR5m8gvqaU9qChG4ac5eVzP20bMzFucWZ0D76XdbWdcVhy
 mUMi9nCSQnSxgt6wrLI4TkggNu3KiQRqmxnYNRtva9VhSuP5vn6wMHi9fAYSiBERMj7O6ITh1KD0c
 IeFPE2qBHyLFe3CyMUY8lhvtLxK6m7ejD1RhTif0auVrdNSkqgssDDR3vEo5DkxXnqXLBSwRVV7H7
 dd8rQX+ZubD8oS88goKoiO7i;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ig4ZO-0004iv-Vg; Sat, 14 Dec 2019 10:22:43 +0000
Subject: Re: parse_dos_attribute_blob() inconsistent file_id through
 make_file_id_from_itime()
To: Krasimir Ganchev <ganchev@fixity.net>
References: <BYAPR08MB4872E120915FF5A02939D29CC8550@BYAPR08MB4872.namprd08.prod.outlook.com>
 <117698c8-f1a1-5c0d-8fa5-8a0afb4745b1@samba.org>
 <BYAPR08MB487223100DE8B50DFA0EDB6AC8570@BYAPR08MB4872.namprd08.prod.outlook.com>
Message-ID: <d1fa0fc3-72b9-e1cd-b139-18d5fe1e5e09@samba.org>
Date: Sat, 14 Dec 2019 11:22:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <BYAPR08MB487223100DE8B50DFA0EDB6AC8570@BYAPR08MB4872.namprd08.prod.outlook.com>
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 12/14/19 um 6:11 AM schrieb Krasimir Ganchev:
> On Friday, December 13, 2019 12:59 AM, Ralph Boehme wrote:
>> this is a recent Samba change to overcome the problematic use of inode numbers for the file-ids. The assumption was that with nsec filesystem timestamp granularity, the itime, which stands for invented time and is basically an immutable birthtime, will alway be unique.
>>
>> Can you share a network trace of a minimal reproducer?
> 
> I am attaching a minimal packet capture at the time the directory was browsed.

sorry if that wasn't clear, but we also need the capture to cover when
the files were created.

What's strange is that the capture shows that for files where the
file-id is the same, the creation-dates are different, so I would expect
the itime to be different as well which should result in unique file-ids.

Go figure, we definitely need a network trace with *parallel* log level
10. smb.conf as well.


> You can clearly see that the fileids returned are the same for files with the same timestamp (find response packet 53 from the capture).
>
> Within the attachment there is also a text file containing some part of the client debug log, stat of the shared directory contents, and samba-tool ntacl getdosinfo of each file in the directory.

Unfortunately the output is only with seconds granularity.

> You mentioned the change was needed due to problematic use of inode numbers. I suppose this might be an issue with filesystems without inode table. Can you please elaborate?

inode numbers are reused by the kernel, so they're not unique identifiers.

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46



