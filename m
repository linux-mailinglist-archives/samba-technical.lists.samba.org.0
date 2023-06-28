Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF45740AF6
	for <lists+samba-technical@lfdr.de>; Wed, 28 Jun 2023 10:15:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=D+08iqvkBzpUXxUr1qH32/K89xQBQ42kLi5ZznmgeN8=; b=KvZYF2tH93k2poT/PmcCd/LQdh
	vLkfnq7Cw58POZjCnmrfy+jP57CDwrIYkdPi5eXEnaQhmmOvbshIVUuCY/z+qTMByNgr5uctmVopv
	haGS7vp9+t3sqm8oOApMejvWLs+HZ2XyzZJ3SIV681WDMRp1BoK23YcamrFufTdtAp5k6TaPWKg6D
	u5SrlYpcm1DAUPqrn6y0rPYHyMMDsCBnsy3ppfcm3WCYWv4Q3GHvuY5ThPE7z/mHO76LRXqeZ1BdZ
	w0kG9peN23ZRxXby7DjGQ2kppoZxGm/VE08beMy2EqA3UkhjfCTzakLaiTz1g9gGjViztp1v+O+dN
	UKsiwLyw==;
Received: from ip6-localhost ([::1]:33246 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qEQKs-004xhF-Tp; Wed, 28 Jun 2023 08:15:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23648) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qEQKm-004xgo-VY
 for samba-technical@lists.samba.org; Wed, 28 Jun 2023 08:15:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=D+08iqvkBzpUXxUr1qH32/K89xQBQ42kLi5ZznmgeN8=; b=N8ghONeqGtgRQKvuXj3NT7SL2I
 R8u4qilAdmQiUa2AzPuKKdSiVCaZvEgq96weh7Z8D0AHKD+5fnPMRLljXsjVabv/sX310+70SYGoW
 /CN92KTm/N3YXbwb18hddQCTwURftvdAzVVf9ztVy0X2lRxpTqjjw3xT2GC5i1XkCUjog2ygx5Ezx
 3+sOv6dwNbOdLXA1aXnNgddLceLAQlzfPHlNpoTsPqk2dydbPHJyJKzgQ4ZoTEnA8Ge1pqp/nUvAq
 Rx+LduSKlfo5vrqnQz5UFoV+uXsgglA7j5fHH2vsrJOK0nwxXTLxmoAetpejBi2S9OtDO6pz8Cvxl
 4MszOmOy2NTF7yHxaC+FLAI37qx1pxfOOuxQAE6N35kwt8x8SEh4BtrMjnj/ZlcSLSfpSlpSRCX9X
 ztfwiiyl1FlwvhX8Id+koz/JaSjojazXPM1GtiCIEJJ5ToVhKM+08Mq5rPSa2wcYYYuwnaMOZ6MtF
 rbcSnkcK23DplP8cGoCLhwdF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qEQKl-004w0E-0l; Wed, 28 Jun 2023 08:15:27 +0000
Message-ID: <c0d06c41-8513-8592-06dc-a9d7af46a412@samba.org>
Date: Wed, 28 Jun 2023 10:15:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Replication USN semantics around Azure AD Connect
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <21696bbbc739934d20fd4198682fd44b63b17d46.camel@samba.org>
Content-Language: en-US, de-DE
In-Reply-To: <21696bbbc739934d20fd4198682fd44b63b17d46.camel@samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andrew,

> I've been working to make Azure AD connect work with Samba.
> 
> This is working for small domains, but for larger domains we hit a
> problem.
> 
> Our USN handling in GetNCChanges can sometimes return the same
> tmp_hightest_usn, so we have this code:
> 
> 			/*
> 			 * We need to make sure that we never return the
> 			 * same highwatermark within the same replication
> 			 * cycle more than once. Otherwise we cannot detect
> 			 * when the client uses an unexptected highwatermark.
> 			 *
> 			 * This is a HACK which is needed because our
> 			 * object ordering is wrong and set tmp_highest_usn
> 			 * to a value that is higher than what we already
> 			 * sent to the client (destination dsa).
> 			 */
> 			r->out.ctr->ctr6.new_highwatermark.reserved_usn += 1;
> 
> 
> To make a new higher USN for this case.
> 
> However, Azure AD connect comes back only with the tmp_highest_usn, eg
> reserved_usn is always zero.  This means we declare the client-supplied
> highwatermark as being older, and start replication from scratch.
> 
> Starting from zero then means we give the same data, end in the same
> place and the client has an infinite loop against us.
> 
> Do you have any clues, other than a revamp of our replication logic, to
> fix this both sort-term and to remember for the longer term?
> 
> In the meantime I've suggested 'drs max objects sync = 100000' and 'drs
> max link sync = 100000' in the smb.conf to avoid multiple chunks.
> 
> Thanks for any clues,

I think I hit some similar when migrating large samba domains to
Windows 2008R2. But I don't remember it 100%.

Currently we're using these branches to avoid it:

https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=refs/heads/v4-10-drsuapi
https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=refs/heads/v4-13-drsuapi

They are also in https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=refs/heads/master-drsuapi,
as the top 16 commits, but that also contains a lot of unfinished unrelated stuff, e.g. implementing timed group memberships.

metze

