Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DDA6EF08E
	for <lists+samba-technical@lfdr.de>; Wed, 26 Apr 2023 10:58:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=GGsw9PeRlz1OBs6Nbn7QRR2JMFQ07C7kRZPVSF8wYbs=; b=Y8yzQfaalQ/iup8akXW+B0VPGm
	8ySwt0QYbmLuainoaAcHPU9w8FKNtYlJFN0WcGc8QsBzWRT2JcZ/xWWrRPkVmG6TskKX0Iq+SpeMG
	m6H7wqoSGlwTts085rLbGx2wroWVh7XiwN3sW5OJDUDX9tWnrXJvp1KrCcHqOdakc3YGLS1+A/God
	JtP2y25HQmyM8BefGts1N8yXIvhx1AGhpVasc+bP1PRZBhFdVXtxldfB8T3HqYmxH0/eyUIK+hT6j
	McDTY/XEiqHpp1VBsUeCLQ8VQik49FiUyjj/0trfUyhKdF2UvqArKZXIP4NJk7o3i2gNbD5wys4x9
	Hkxee22w==;
Received: from ip6-localhost ([::1]:50288 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1prayb-004PKE-8w; Wed, 26 Apr 2023 08:58:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47104) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1prayW-004PK5-K3
 for samba-technical@lists.samba.org; Wed, 26 Apr 2023 08:58:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=GGsw9PeRlz1OBs6Nbn7QRR2JMFQ07C7kRZPVSF8wYbs=; b=SOWcYRVVePS4ut89mwcbTfzb33
 FzwFziW16gpXDfiapPStcALwk7voCUHDhTRxTvS3XEQxyQ0JKzbs9Js9mCqi5gfa/mEfyQGTf1jw3
 DVhB6aU3RjPUo8rtx7cNsQ6o2lz3ibShFGPwJul5qKr9DjxKHCw4+8Dtv+aO2OO7oVoC3nzaXk5dl
 2OTqluyDzGM9J2Okzjjz89xg8Q+F+Y8C85vlt6CxhF/ItZ/toU5Ln47xdcmTlUtaGuHuzqEZ/sTvo
 FvDDfkktN++D/hMT+pSzSwII7APlTxFubpZ6JLvTaeVcrW92r/o/eRtyoXiVJb6xpO2Shj8uWb/fP
 FWAuJsiNLLi+dfBZb7F6cFGlhWKa8boVK1CwCP5HHdt8hXdUchvhQq6rHYSgCSd7Pt8s6zmY8ynFm
 7EhtZ3z6EmxxoLKq1KX8ack9O9HyWXk/JJRgAltbN5VWmaB4K6XI2O5c5mObyFTvSWckeQn3K3rQD
 J5HzP0cX1WPID2RA5j1rSusI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1prayV-003rKS-OT
 for samba-technical@lists.samba.org; Wed, 26 Apr 2023 08:58:07 +0000
Message-ID: <72f5f3df-a986-8faa-f65b-cf46b0896f3c@samba.org>
Date: Wed, 26 Apr 2023 10:58:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: samba-technical@lists.samba.org
Subject: including local groups in WINBINDD_LIST_GROUPS (QueryGroupList)
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: =?utf-8?q?Pavel_Filipensk=C3=BD_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Pavel_Filipensk=c3=bd?= <pfilipensky@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi all,

I would like to discuss this commit 
https://gitlab.com/samba-team/samba/-/merge_requests/3025/diffs?commit_id=c2dbb6886118515ffc6236497d478ec814df344d

Please see also comment from metze: 
https://gitlab.com/samba-team/samba/-/merge_requests/3025#note_1360642698

Background:

I was fixing a bug in nss_wrapper - it was not correctly implementing 
the GETGROUPLIST(3) - list of groups that user belongs to.
With the nss_wrapper fix the test_membership_user (local.nss.membership) 
fails. It compares memberships of a user obtained via:

1) GETGROUPLIST()   ... group BUILTIN/users is newly showing up
2) GETGRENT   ... group BUILTIN/users is not listed for ROLE_DOMAIN_MEMBER

* Do we want such change as a new default?
* Or should be configurable? With what default?
* Or we want to keep the old behavior and only change the failing test?


Thanks,
Pavel


