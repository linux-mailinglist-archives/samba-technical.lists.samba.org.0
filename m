Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD12178C42
	for <lists+samba-technical@lfdr.de>; Wed,  4 Mar 2020 09:09:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=KfJFyFSk2wamDB5xMC8LiByh0E4BM6qx2g/WkMV7Qos=; b=YkGkQ+IBrCcgBkXdz1KeHJNgos
	aYtdYmLCgZ0gGan5wPC0Ilr9p6xCrAKykJ8by5QivZrzr8bRgJA5ozqVCygdZ3Nwy7mJUUCVI8+AX
	SAvW8HxrObaI+kpHE9lzqRxiUDKd3i//+SaP2rWOQLQE1uJkM6959AEDnSQbmkPsGwgZ6D13qRjaQ
	eiWqoJwZKhN3bOJInnObQjPGjUTADxJgo2CPyVefPynVm+XyGRgth2/v7VUr2pqPZgMEhfhzZ8h53
	1ozXAjWdTwAJU2WVap9kqlEFeNoZEa6jceSfGjn4ftH3JMBpkFBSVo6DRKgmUo7HYV9QBknGWJ3fG
	Z2/k/TPg==;
Received: from localhost ([::1]:25584 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j9P55-00Et3k-Uh; Wed, 04 Mar 2020 08:08:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60730) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j9P51-00Et3d-DR
 for samba-technical@lists.samba.org; Wed, 04 Mar 2020 08:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=KfJFyFSk2wamDB5xMC8LiByh0E4BM6qx2g/WkMV7Qos=; b=xCxGxRtBFzhKsxSZUB6HW9qGEa
 gYApqcbQoqda4fdpdSizyHcPRx1/vlvmChjPufRShS5OJHmmNeAdWO0uAJL5dU36GlWr/BWpyc9Eb
 WCSJLG4Pw+mnuuRZ0EK7G8su89uuKrPW+9NdEWOQMmbKggeUtpREBmqcJMR8yS2RVQe9I/atUM5rH
 0XIBc9saiYIa62pQfOQ1SReVcmZmM+akfE4+hbqIup8KDqOL/om2A82ZbwABZUihmiggOA1+unuZv
 m9KVCAZvWS9OrVTw1oK34WrbPDn+usxRAtz4S+pjlGCmOQNdsxG41/VMB0NMaemOB5lLDeOr4R4AZ
 CCWksOom2qvRCfgCEGm7HSOx7uebIV903oZwOFf16i1Pmy2o0hpyLPi0klEe/Ap0neodjNfX7rxSr
 qZODIdqy/xd9a5G/aAY4q4Yq+iLgqQDS+d9VVTQ7OWj9uMM60suBYYTmcB82T6HovxEqPuzt70a5x
 evLhXy9hMUIYMSJDhRw4807G;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j9P50-0005kM-Ok
 for samba-technical@lists.samba.org; Wed, 04 Mar 2020 08:08:34 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: [Release Planning] Supported release branches, Planning 4.12.1
Organization: Samba Team
Message-ID: <5dfd4058-02a5-056c-1b7d-51535042af9a@samba.org>
Date: Wed, 4 Mar 2020 09:08:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

with yesterday's release of Samba 4.12.0 (current stable release branch),
o Samba 4.11 release series has been turned into the maintenance mode,
o Samba 4.10 release series has been turned into the security releases
only mode and
o Samba 4.9 has reached its end of life.

For more details on the release modes etc., please see
https://wiki.samba.org/index.php/Samba_Release_Planning

Samba 4.12.1 is scheduled for Tuesday, April 7 2020.
https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.12
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

