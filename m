Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C67AA33F6A
	for <lists+samba-technical@lfdr.de>; Thu, 13 Feb 2025 13:47:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=swB8IBYVKnfbV+hdzx7knGeL92F3/f9BLh5H/BnNMPs=; b=3hNE7yzsUl0yqHWM554v2PG1bV
	6D/kuN56+UB40dJECYQaZA+Xc/wrF/WuRqH9lD/0QQXfKvtAAlMCFqsdVqPMuKo/M+KHpxFiMlpiq
	bNOEiD6eCdv1bdH4yPjwpCiPib3632TsZhpSiXnBjoZ0CVoFkFtLwRWYSGmY4T9f3WZlYrg8fHgvw
	oGXglJYy090UmDlVO2EG0v41OMsBZEqIG/4gXm7GA14nxlyxrZn7JyX8yYTleySnvGh6GgDRN+e7U
	lIlWRFE1kGsbyPQUgLEr7nG9uXVQpZVffoA0G39fjK8VXM9c5BGSY2DOUkqvZAc0O/Xt4NgbR+r/U
	DrBEMmnA==;
Received: from ip6-localhost ([::1]:46304 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tiYcQ-00CJHA-25; Thu, 13 Feb 2025 12:47:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59646) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tiYcL-00CJH3-LL
 for samba-technical@lists.samba.org; Thu, 13 Feb 2025 12:47:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=swB8IBYVKnfbV+hdzx7knGeL92F3/f9BLh5H/BnNMPs=; b=MCtQ86Nr26QJOiA3TlnyBWbiLn
 qLoKYIP9FGi693Shhv6a7oHGTDpj516b8Qvxg+Xhq6TNdw28EBvlpvMMaQ7LCyc+5dwRfrbY0UAwh
 VQhDvJbSXXMDULeb190JNgwgzl8llLLVVOd84F+lFklOdlQP0c+w75ymrkhoslt1FjJHixugwBC+i
 D6VO3XJL5FvAS9AeRPRJAEfWMEjo1dav/q3IvIkB4txa5o1Zl854ER8tk6R5UyIAzllcP1Re9YfH+
 iE75mWvBfBxOunz7STafH8r9lCcOJa1b4zg+WLZjvP1PJ9bb2dGO/3v6yTV2u/khyxigDHw9qrby7
 7O3Q7fybW2wN8rJoGel9P6UOnE6I9NWmom3v1ruVpZMjOI5tvekuZsuNryZCmoKnD0uSvY8XYqDQV
 7CrV7eGH8Y7msJTCJXgNoaftRAwEnsvTZ3N2dHdlEujW6Qrnovz+Yx3cq25zz21cf1L0fERg1E4Hb
 ntyyARD1fOvOO5WhKE9wdxTX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tiYcL-0007aU-0g for samba-technical@lists.samba.org;
 Thu, 13 Feb 2025 12:46:57 +0000
Message-ID: <69990478-2f36-40ce-b620-c51dd787d239@samba.org>
Date: Thu, 13 Feb 2025 13:46:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE, en-US
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.22] Samba 4.22.0rc3
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.22.0rc3 is scheduled for Thursday, February 20 2025.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.22
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


