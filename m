Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0B22513BD
	for <lists+samba-technical@lfdr.de>; Tue, 25 Aug 2020 09:59:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=DasA2oxOj4+oT6mt5JHA//fYzFBBbq18H9qaVXpP460=; b=uT1oogYkRwQjhbdMkpq0TW55Bl
	LWC/Ue8MygEaQb+3bjEMLptUMHCVE0hz73XF3VOTfIFmbhGpZaYmyyqk0/2FAu/FsbSw0ZkbS/JI9
	zLSg7tn+yjzZdGC6LHq+1v+ClOWLMYUz9qm1utrCiqIiFy7Du6tl+Z1z7GKRmhrvnTeTZ0LMKNOla
	x8niBaMCePhNXuauuIfoTjDqRwLLFPaeWAYrzJEFkP6CMcAdKcDpN8z3l3kmBmMz1cqxd+PyTz3Tw
	bTLH0r6BFp/HbLPZhVCe6JuniiFoAFdbY5J5cxuV90LXMVpeh8h9k5sQ7/PGZjYk/xLHqgWKqjiZL
	Ow5OMYAw==;
Received: from localhost ([::1]:47252 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kATrf-000ODI-OM; Tue, 25 Aug 2020 07:59:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44798) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kATrZ-000ODB-KE
 for samba-technical@lists.samba.org; Tue, 25 Aug 2020 07:59:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=DasA2oxOj4+oT6mt5JHA//fYzFBBbq18H9qaVXpP460=; b=EI80tiSGb0kgyRQhY3sCAaUBEQ
 LBZredMjB9qfZExncZFe2C4tiuCwLi19tmHjlcYdfH+3aQF0VPMeYbXxzYZPVw4FlpvSXPpYR5TIQ
 UTcDWy7dFsnAeJkjvlv9ZJ4CSAtHY1A1FiFo07DUhuu7YgwFeM+EqiKoDAU1VFgkp7Qn8qwfle9bG
 ci8GubMYLLqF2788kGB4iX13xa7DpW0MHTiNYVEMQOSUekmTKLMKgij6XxKNeUAKTCTH2vuyGpjme
 Wccm5ON1KTvGlVatfSJjW1Fzink443ksaVIsBmQroxM9/wt0ORvHTx06udDeXtrGfCejxjh+SfpB3
 THnCZKQ26I6MXM9zxT0bjQO0cxwq4xy5rSQ3ZD4YDI14YAISgxemvZib1SOy4UQ+4sxPYpplV5Ccd
 vllPgbNCOGfbbzwGKyHqvGmbKMHgtSKDM5FsLvV2gmvIseKY/l3L36z2WmcykU3ORhR+JMDnIFD9/
 1fOJGHWxdzuhlCDl1r1u3miU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kATrY-0001Qs-Ut
 for samba-technical@lists.samba.org; Tue, 25 Aug 2020 07:59:25 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.11] Samba 4.11.13
Organization: Samba Team
Message-ID: <4aeaffb1-223b-51cf-3def-1c4f4e2fe641@samba.org>
Date: Tue, 25 Aug 2020 09:59:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.11.13 is scheduled for Tuesday, October 27 2020.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.11
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

