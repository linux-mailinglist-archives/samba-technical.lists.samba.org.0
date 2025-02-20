Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B95FA3DB0B
	for <lists+samba-technical@lfdr.de>; Thu, 20 Feb 2025 14:16:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Dun+rhylnV+VQsd8gLjZLnaNOrsSuxMWhj/uILT3RpI=; b=urywNcpClOYOS/hAKguR07Rs7W
	UYKLyAvMeKJPfO0g5uLpQJrM6gxsXh2j1VBUPDfqauBpY5KLB255jgrVx2ygq1WN67cmOkaICVyTo
	vMZcA5gGiEd/oWu8kNvIVzBRFB3jxjTgiWiEGEn8rr6WhZtwGVg06fup9U1i6w43povdMETgj5Ews
	HlgtHdWLl2sLQ9LNkyoTZ8cKYlAJGZ7wPEDi6su2slwR6k5j9CsxE6Rx3ngQrO5obkoKwrEp8nAZS
	mxf7V2v71kPmoSm/fKdozS+TIk6frTJH5Rr62zJCjdcAlCVdBH2Ldggjv7m+MYZFOAXJp7G0fCl/+
	La9QT0fQ==;
Received: from ip6-localhost ([::1]:48756 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tl6P9-00Cypb-Pw; Thu, 20 Feb 2025 13:15:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62248) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tl6Oq-00CynT-Ka
 for samba-technical@lists.samba.org; Thu, 20 Feb 2025 13:15:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=Dun+rhylnV+VQsd8gLjZLnaNOrsSuxMWhj/uILT3RpI=; b=wlSqv33C5VG4bGolCsQ9JTl9he
 CS1KNDopskxXE/7BWny9nEy+DgJawSD3gq40p7ulFzrbVtGxg+drHCQJ+3MAmWleKMrEQD7UBYa2m
 +MNu1c61hnuk7IZmRqXJDzxEk2YqDPonbVG5A1P1mUa6xYEpU5kztsTtykvUlVIMtFLbQRkUBvo1t
 wPYTG85NqlYTYaFd+EO/tTYtM2F7hk3ET/f6tLhDHCkCjKWGviWU/gz5/nTgUV+kchlExcIZUvXni
 hwYdmIS8l6yqP/BA3EPCjr/LYqCeRR8ncQcGggwjxPrLQRfJB23l8iSq9htGZGSOaFT9JNugRAIuq
 RrCNPKXS2USoPB8F23ezWmHqIHoIo9AE3E5sqNGAU54VduQWy9Sp+Sva30fvaovkdlx+CWk+r0/xA
 yCxknMvPE4eUoXpEIiX0lU49Wt1c3wOTL7iGAT1M6ybZR8Kz/ZzzqZgM74JpHOW31x8y/ypDj6c3I
 qlGddswzDa7lvvVol8qpXW4m;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tl6Od-001HsU-2x for samba-technical@lists.samba.org;
 Thu, 20 Feb 2025 13:15:20 +0000
Message-ID: <0a1d1256-12c4-42db-97ef-24e3c6d8988e@samba.org>
Date: Thu, 20 Feb 2025 14:15:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE, en-US
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.22] Samba 4.22.0rc4
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

Samba 4.22.0rc4 is scheduled for Thursday, February 27 2025.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.22
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


