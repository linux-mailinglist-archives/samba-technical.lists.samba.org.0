Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3BF243456
	for <lists+samba-technical@lfdr.de>; Thu, 13 Aug 2020 09:04:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=BZ08T4catj2WzCBp1UkLufZTWAPKL/lBhIzOPl4p654=; b=d8XK8Z1s6jItEKgz4lMtXyuaui
	SdoFTPJ8FmFCc6/3hxPuSl8igL6mNyavrIFOgIcFbnTtC9W0HXI/qhmXpc+JteUAklHoo6qA1+WAV
	he9PefbUX3nOm6GpJNprjFUlxHdTCLS13hW7v/ec0OLzk7mGD7k/4PtzvtAaIvgp628Quy66OPtiE
	uYMVanI99qwJTdDuRPZD+yTPQTmMsluiGFq19ZC3/EdWxzJkGJv7XMVLXta+q5gbZzN961oMgjf9Q
	bvPVRmCAS53CI5EVU27vwtMoky+sO0flr02QsTjCycc65RLX6f248Xp6Odhg3Kf3o0ESVJMa4DXVY
	DyKacUBg==;
Received: from localhost ([::1]:46160 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k67HZ-00DUWt-F7; Thu, 13 Aug 2020 07:04:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19486) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k67HR-00DUWm-7i
 for samba-technical@lists.samba.org; Thu, 13 Aug 2020 07:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=BZ08T4catj2WzCBp1UkLufZTWAPKL/lBhIzOPl4p654=; b=oYOPi8nclEEeMOrGd4SpS9JyX7
 oUpIC0jW59rIKVAeAGM0aNZzTvZVOroH2fDal8ldKkA8WoE91+cd+qYPc9KVXnzlqjULMC/M8x18T
 dwvFRPjGm51dFMNJSYsTjqYYbrewOcHS9Dl5o5Nfy5vrRDNBwuMuKyQaFDPSXoip/EjpB+zh82iDD
 o+KsS1PnzM/zgL0lCwNPx1t3H5ASgjL4msazipZ/yKwClfMNciiiuavvyN9PlFWXP67GLW5BhZ0WC
 kfmT/m5xKAwWG1JfBtnfkyLajqi08XEEKmPnsNKPlFYIGY5CJClbsoebZu0ejoA/DcD+xH0ZDFGhS
 o7zJB2fzyhHgoNxseoFsredjKLNhUBo5D3PRwy0xBFVImkwyh0zpkthzoHNbL1ZetnUU1MNMgw5Qn
 /zoJ8SUJcgMX261oaYNKNLKdapxGYNtMlnB4l7eY+3TFV1xe5ndVU8u3xt7Fghh+A3okUTOWqo46B
 vrsBNPpWBX2sfJimSEbw4Kj8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k67HQ-0006Ym-RX
 for samba-technical@lists.samba.org; Thu, 13 Aug 2020 07:04:04 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.12] Samba 4.12.7
Organization: Samba Team
Message-ID: <3b9c2cce-2197-3012-a9c4-d3861b88c909@samba.org>
Date: Thu, 13 Aug 2020 09:04:04 +0200
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

Samba 4.12.7 is scheduled for Thursday, October 1st.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.12
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

