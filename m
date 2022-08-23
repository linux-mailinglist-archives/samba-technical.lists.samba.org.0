Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC9059E569
	for <lists+samba-technical@lfdr.de>; Tue, 23 Aug 2022 16:56:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=csxDZUnjTsbsViSjeikS51nnDWPuURy3wjjnJk9xyAQ=; b=n81cT4BBzGLj+hpHBHWLJ6sFPX
	HcN5MHrVCEiH7mvmCagpYjAx3n+NeXXr9x1kyfh8M2nPhbf7PNtiqykdLKbHJVQmAkg9eOk/BrfMF
	I2UBuBrQWpGAfS/wGhf3Cv5q8JNKN5a/mXASSxqeqAPUkYDDQvtF2ZxR/Bs5cR1/OKg6+WK6ulq6h
	giSq0JC+GulbP6+62FA7/Q3eYTFOrcXLftEMWe+kA4+brCFr7JwPaaree58W+UY20+B36zqZqnR5T
	2SQL3cfXub64yxxzL0di3Y1czIf4XYEQTk5Hw2JYHZ8m0Yu2KG+QWdUxWMvc9hOAvmEnPYL9ROnhL
	RsYzwS0w==;
Received: from ip6-localhost ([::1]:49408 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oQVKS-0024Ob-Kw; Tue, 23 Aug 2022 14:56:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17818) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oQVKM-0024NK-BE
 for samba-technical@lists.samba.org; Tue, 23 Aug 2022 14:56:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=csxDZUnjTsbsViSjeikS51nnDWPuURy3wjjnJk9xyAQ=; b=RAhQjaQLbKKFK8HI4Q42GMeg31
 y/w47DryCisJTl1AccvjpJj+KKo6+nURt4GwAiKSS0RwvGqznize/9+jK0Y7Zip31W1oXK2AMABxq
 5lYFYLQSy9Toyku1kNPGEIGuZ6fcw4dxxAsTO2FSRAYR4lEhibWM7MyI9QzxjWGrjX0k/zqWoJ3ld
 waABLJgmgL4mBq+eCToJqRPZvCp4vVaryk7p24jb+zHPVYvcu73HRND4M72hzOqH8/+0ap8SJNUMl
 1tjHrdzTHPot6OyX64CigvpmohkTN8Z9JVUwSuALxVxJKocWzDcjz15dNwQ/ZY2li13eJ6q7LL1pG
 8qE1EVx45s1XcZRHP8M4p0upn9PUtuSHkg7BJujZecVmXPMtkk/a0hYzhQMD8ctG0XYqp7i5s9Amj
 nFfPSKGK6lYUiebgxpaCe0u0NFRwZyB+tH0arW05wzi6LqxbxqFzjvexp85SW5gfjcIMhNrIiW73R
 b8mBwubm+akRfMR25ZVYnlsN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oQVKM-001Qdw-5W
 for samba-technical@lists.samba.org; Tue, 23 Aug 2022 14:56:26 +0000
Message-ID: <6393a012-a15d-a38d-f9dd-82cf33a48623@samba.org>
Date: Tue, 23 Aug 2022 16:56:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.17] Samba 4.17.0rc4
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

Samba 4.17.0rc4 is scheduled for Tuesday, August 30 2022.


https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.17
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team      https://samba.org
SerNet Samba Team               https://sernet.de


