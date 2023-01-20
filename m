Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B3C6758C7
	for <lists+samba-technical@lfdr.de>; Fri, 20 Jan 2023 16:36:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=QU37sk+WMncK5jpxh7tMhgut5lNOq1cGcIZWaXlkkaI=; b=SkDUCut0wW9WWBEuJYp2r299An
	Rj7FxmwFb+9u7eRqgVAUUAsj/0gb1tiucNxvTRd5sC3Godo1pkE5rNv28weEQ612OLAJ/dG6/NEnf
	hpZJCm2UZRP6ovonL5U0ETDPKz1EEo9iKbhIkoXaf6oeW8Vnt6axgc4XJoQrSH0v83E1Ph8NE03Qd
	8jqcUGG8B0d+Om/hA75v6f8HSCwhMv9x9dBtWFGuJOVLoKcQLH4pg5IfHJMMCiTHQ3jszi/e+Dtig
	eFGdFu3ubh8MvMQ1BnMb9A9U1Rr+0Pz6aE7T6ZfCYrO5Yfh3hVsrNaH9WEqri4D0z9NTX0VZLzo9s
	2DpvBGiQ==;
Received: from ip6-localhost ([::1]:20724 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pItQU-001Dc7-PR; Fri, 20 Jan 2023 15:35:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49510) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pItQO-001Dby-MU
 for samba-technical@lists.samba.org; Fri, 20 Jan 2023 15:35:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=X3jeAwgFCZSh3pnlK+9GV5mEh1912VMDwEVzIMIFEjM=; b=jp17FwZV+TtS1C/MfSVS6cF6hR
 qlAhO8yisW8+uwq6Y6EGuu2dwV+w0L+tWiOKOYPH+RtILlkwDTpt0MZqHTJQ0HiPm8grTmTcaO8SA
 TTXFeTXJz03+2zAigcnwm5EjNWFSplKz1v7Uet3HrJFGZaYwSYZeeSbhhX+24f7Z9XCTNDLkPfTzJ
 FOQwARNyE56sVU/F2fMvNqUS2Oz0pgVdh1VkWdlU0QwcL98G3muIaA15+hsRWOLRqTBVBiGmu8l11
 HTZO99n1w4LlqZgRlfTdgaQofWB61hYZdZLEyZm9M5nXZRJdweBpe4gVPDJ1bccmOQtTvXWD9s9HO
 Ny6jZ9i+vrfA420pqJuoSurD0qtQu9+Iw/qoOveTTTEyDZQESZ9sx2KawWE/HPTrvuFMHwrctyHok
 tRvBCLPgzRsXffafdvrqfEV4URBQTEk9PvBP/Dogbp05dleKFidpsg46LFIXDo0HnJr3MPINJYcNX
 JSDae6h47c/8K1mZ4LzXNhDV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pItQN-009aBJ-EJ
 for samba-technical@lists.samba.org; Fri, 20 Jan 2023 15:35:27 +0000
Message-ID: <edf7d9b2-5e81-2022-54a8-c480854ee1be@samba.org>
Date: Fri, 20 Jan 2023 16:35:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: de-DE, en-US
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.18] Samba 4.18.0rc2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

Samba 4.18.0rc2 is scheduled for Wednesday, February 1 2023.


https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.18
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Teamhttps://samba.org
SerNet Samba Teamhttps://sernet.de
